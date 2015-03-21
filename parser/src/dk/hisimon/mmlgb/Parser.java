package dk.hisimon.mmlgb;

import java.util.List;

public class Parser {
	private List<Lexer.Token> tokens;
	private Lexer.Token next;

	private Song song;
	private int position;

	private static final String[] CHANNEL_NAMES = {"A","B","C","D"};
	private static final String[] NOTE_NAMES = {"c","cs","d","ds","e","f","fs","g","gs","a","as","b"};

	private static final int MIN_OCTAVE = 2;
	private static final int MAX_OCTAVE = 8;

	private static final int BEAT_STEPS = 48; // Steps per beat
	private static final int TIMA_SPEED = 4096;

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
			else if(next.type == Lexer.TokenType.MACRO) {
				parseDefinition();
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

	private void parseDefinition() throws ParserException {
		if(next.data.equals("@wave")) {
			parseWaveData();
		}
	}

	private void parseWaveData() throws ParserException {
		eat();

		// Parse data id
		if(next.type != Lexer.TokenType.NUMBER) {
			throw new ParserException("Expected wave data id.", next);
		}
		int id = Integer.parseInt(next.data);
		eat();

		eat(Lexer.TokenType.ASSIGN, "=");
		eat(Lexer.TokenType.LCURLY, "{");

		// Parse samples
		int samples[] = new int[32];
		for(int i = 0; i < 32; ++i) {
			while(next.type == Lexer.TokenType.NEWLINE) eat();
			if(next.type != Lexer.TokenType.NUMBER) {
				throw new ParserException("Invalid wave sample. Expected number.", next);
			}
			int sample = Integer.parseInt(next.data);
			eat();
			if(sample < 0 || sample > 15) {
				throw new ParserException(String.format("Invalid wave sample %d. Expected 0-15.", sample), next);
			}
			samples[i] = sample;

			// Eat commas
			if(i < 31) {
				eat(Lexer.TokenType.COMMA, ",");
			}
			while(next.type == Lexer.TokenType.NEWLINE) eat();
		}

		eat(Lexer.TokenType.RCURLY, "}");
		eat(Lexer.TokenType.NEWLINE, "Line break");

		WaveData waveData = new WaveData(samples);
		song.addWaveData(id, waveData);
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
						throw new ParserException("Expected number after octave command.", next);
					}

					int octave = Integer.parseInt(next.data);
					if(octave < MIN_OCTAVE || octave > MAX_OCTAVE) {
						throw new ParserException(String.format("Invalid octave %d. Expected %d-%d.", octave, MIN_OCTAVE, MAX_OCTAVE), next);
					}
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
				else if(next.data.equals("v")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Invalid volume. Expected number.", next);
					}
					int volume = Integer.parseInt(next.data);
					eat();

					song.addData(active, Song.CMD.T_VOL.ordinal());
					song.addData(active, volume);
				}
				else if(next.data.equals("t")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Invalid tempo command. Expected number.", next);
					}
					int bpm = Integer.parseInt(next.data);
					eat();

					float ups = (float)bpm / 60.0f * (float)BEAT_STEPS;
					int mod = (int)Math.round((float)TIMA_SPEED / ups);
					song.addData(active, Song.CMD.T_TEMPO.ordinal());
					song.addData(active, 255 - mod);
				}
				else if(next.data.equals("y")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Invalid panning command. Expected number.", next);
					}

					int pan = Integer.parseInt(next.data);
					eat();
					int val;
					if(pan == -1) {
						val = 16; // 00010000
					} else if(pan == 0) {
						val = 17; // 00010001
					} else if(pan == 1) {
						val = 1; //  00000001
					} else {
						throw new ParserException("Invalid panning value. Expected -1, 0 or 1.", next);
					}

					song.addData(active, Song.CMD.T_PAN.ordinal());
					song.addData(active, val);
				}
			}
			else if(next.type == Lexer.TokenType.MACRO) {
				if(next.data.equals("@wave")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Expected wave data id.", next);
					}
					int id = Integer.parseInt(next.data);
					eat();

					song.addData(active, Song.CMD.T_WAVE.ordinal());
					song.addData(active, id);
				}
				else if(next.data.equals("@ve")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Invalid volume envelope. Expected number.", next);
					}
					int envelope = Integer.parseInt(next.data);
					eat();

					if(envelope < -7 || envelope > 7) {
						throw new ParserException("Invalid volume envelope. Expected values from -7 to 7.", next);
					}

					int value = Math.abs(envelope);
					if(envelope >= 0) {
						value = value | (1 << 3);
					}

					song.addData(active, Song.CMD.T_ENV.ordinal());
					song.addData(active, value);
				}
				else if(next.data.equals("@wd")) {
					eat();

					if(next.type != Lexer.TokenType.NUMBER) {
						throw new ParserException("Invalid wave duty. Expected number.", next);
					}
					int duty = Integer.parseInt(next.data);
					eat();

					if(duty < 0 || duty > 3) {
						throw new ParserException("Invalid wave duty. Expected values 0-3.", next);
					}

					song.addData(active, Song.CMD.T_WAVEDUTY.ordinal());
					song.addData(active, duty);
				}
			}
			else {
				throw new ParserException(String.format("Unexpected token %s.", next.data), next);
			}
		}
	}

	private int parseLength(boolean required) throws ParserException {
		int length = 0;
		// Length
		if(next.type == Lexer.TokenType.NUMBER) {
			length = Integer.parseInt(next.data);
			if(length < 1 || length > 32) {
				throw new ParserException(String.format("Invalid note length %d. Expected 1-32.", length), next);
			}
			eat();
		} else if(required) {
			throw new ParserException("Expected note length.", next);
		} else {
			return 0;
		}

		// Divide with note fraction.
		length = (4 * BEAT_STEPS) / length;

		// Add dots
		int dot = length / 2;
		while(next.type == Lexer.TokenType.DOT) {
			if(dot <= 0) {
				throw new ParserException("Too many dots in length. Not enough precision.", next);
			}
			eat();
			length += dot;
			dot = dot / 2;
		}

		return length;
	}

	private void eat(Lexer.TokenType expected, String message) throws ParserException {
		if(next.type != expected) {
			throw new ParserException(
				String.format("Found token %s. Expected %s.", next.data, message), next
			);
		}

		eat();
	}

	private void eat() throws ParserException {
		position++;
		next = tokens.get(position);

		if(position >= tokens.size()) {
			throw new ParserException("End of file reached.", next);
		}
	}
}
