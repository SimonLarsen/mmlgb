package io.github.simonlarsen.mmlgb;

import java.util.List;

public class Parser {
	private List<Lexer.Token> tokens;
	private Lexer.Token next;

	private Song song;
	private int position;

	private static final String[] CHANNEL_NAMES = {"A","B","C","D"};
	private static final String[] NOTE_NAMES = {"c","cs","d","ds","e","f","fs","g","gs","a","as","b"};

	private enum E_CMD {
		T_C,
		T_Cs,
		T_D,
		T_Ds,
		T_E,
		T_F,
		T_Fs,
		T_G,
		T_Gs,
		T_A2,
		T_As,
		T_B,
		T_REST,
		T_LENGTH,
		T_OCTAVE,
		T_OCT_UP,
		T_OCT_DOWN,
		T_VOL,
		T_EOF
	};

	public Parser(List<Lexer.Token> tokens) {
		this.tokens = tokens;

		position = 0;
		next = tokens.get(position);
	}

	public Song parse() throws ParserException {
		song = new Song();

		while(next.type != Lexer.TokenType.EOF) {
			if(next.type == Lexer.TokenType.CHANNEL) {
				parseCommands();
			}
			else {
				eat();
			}
		}

		for(int i = 0; i < 4; ++i) {
			song.addData(i, E_CMD.T_EOF.ordinal());
		}

		return song;
	}

	private void parseCommands() throws ParserException {
		boolean active[] = new boolean[4];
		// Parse active channels
		while(next.type == Lexer.TokenType.CHANNEL) {
			for(int i = 0; i < 4; ++i) {
				if(next.data.equals(CHANNEL_NAMES[i])) {
					active[i] = true;
					break;
				}
			}
			eat();
		}
		// Parse commands
		while(next.type != Lexer.TokenType.NEWLINE) {
			if(next.type == Lexer.TokenType.NOTE) {
				int note = 0;

				// Read note
				for(int i = 0; i < 12; ++i) {
					if(next.data.equals(NOTE_NAMES[i])) {
						note = i;
						break;
					}
				}
				eat();

				// Sharp or flat
				if(next.type == Lexer.TokenType.SHARP) {
					note++;
					eat();
				}
				else if(next.type == Lexer.TokenType.FLAT) {
					note--;
					eat();
				}
				if(note == -1) note = 11;
				else if(note == 12) note = 0;

				int length = parseLength();

				// Emit data
				for(int i = 0; i < 4; ++i) {
					if(active[i]) {
						if(length == 0) {
							song.addData(i, note);
						} else {
							song.addData(i, note | 0x80);
							song.addData(i, length);
						}
					}
				}
			}
			else if(next.type == Lexer.TokenType.COMMAND) {
				if(next.data.equals("r")) {
					eat();

					int length = parseLength();

					// Emit data
					for(int i = 0; i < 4; ++i) {
						if(active[i]) {
							if(length == 0) {
								song.addData(i, E_CMD.T_REST.ordinal());
							} else {
								song.addData(i, E_CMD.T_REST.ordinal() | 0x80);
								song.addData(i, length);
							}
						}
					}
				}
			}
			else {
				eat();
			}
		}
	}

	private int parseLength() throws ParserException {
		int length = 0;
		// Length
		if(next.type == Lexer.TokenType.NUMBER) {
			length = Integer.parseInt(next.data);
			eat();
		}

		// TODO: Add dotted notes

		return 0;
	}

	private void eat(Lexer.TokenType expected, String message) throws ParserException {
		if(next.type != expected) {
			throw new ParserException(
				String.format("Found token %s. Expected %s.", next.data, message)
			);
		}

		eat();
	}

	private void eat() throws ParserException {
		position++;
		next = tokens.get(position);

		if(position >= tokens.size()) {
			throw new ParserException("End of file reached.");
		}
	}
}
