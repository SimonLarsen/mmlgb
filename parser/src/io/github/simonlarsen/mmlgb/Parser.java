package io.github.simonlarsen.mmlgb;

import java.util.List;

public class Parser {
	private List<Lexer.Token> tokens;
	private Lexer.Token next;

	private Song song;
	private int position;

	private static final String[] CHANNEL_NAMES = {"A","B","C","D"};
	private static final String[] NOTE_NAMES = {"c","cs","d","ds","e","f","fs","g","gs","a","as","b"};

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
			song.addData(i, Song.CMD.T_EOF.ordinal());
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

				int length = parseLength(false);

				// Emit data
				if(length == 0) {
					song.addData(active, note);
				} else {
					song.addData(active, note | 0x80);
					song.addData(active, length);
				}
			}
			else if(next.type == Lexer.TokenType.COMMAND) {
				if(next.data.equals("r")) {
					eat();

					int length = parseLength(false);

					// Emit data
					if(length == 0) {
						song.addData(active, Song.CMD.T_REST.ordinal());
					} else {
						song.addData(active, Song.CMD.T_REST.ordinal() | 0x80);
						song.addData(active, length);
					}
				}
				else if(next.data.equals("o")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Expected number after octave command.");
					}

					int octave = Integer.parseInt(next.data);
					eat();

					song.addData(active, Song.CMD.T_OCTAVE.ordinal());
					song.addData(active, octave);
				}
				else if(next.data.equals("<")) {
					eat();
					song.addData(active, Song.CMD.T_OCT_DOWN.ordinal());
				}
				else if(next.data.equals(">")) {
					eat();
					song.addData(active, Song.CMD.T_OCT_UP.ordinal());
				}
				else if(next.data.equals("l")) {
					eat();

					int length = parseLength(true);

					song.addData(active, Song.CMD.T_LENGTH.ordinal());
					song.addData(active, length);
				}
			}
			else {
				eat();
			}
		}
	}

	private int parseLength(boolean required) throws ParserException {
		int length = 0;
		// Length
		if(next.type == Lexer.TokenType.NUMBER) {
			length = Integer.parseInt(next.data);
			eat();
		} else if(required) {
			throw new ParserException("Expected note length.");
		}

		// TODO: Add dotted notes

		return length;
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
