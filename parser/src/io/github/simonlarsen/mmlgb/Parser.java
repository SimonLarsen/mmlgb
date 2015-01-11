package io.github.simonlarsen.mmlgb;

import java.util.List;

public class Parser {
	private List<Lexer.Token> tokens;
	private Lexer.Token next;
	private int position;

	public Parser(List<Lexer.Token> tokens) {
		this.tokens = tokens;

		position = 0;
		next = tokens.get(position);
	}

	private void eat(Lexer.TokenType expected, String message) throws ParserException {
		if(next.type != expected) {
			throw new ParserException(
				String.format("Found token %s. %s", next.data, message)
			);
		}

		eat();
	}

	private void eat() {
		position++;
		next = tokens.get(position);
	}

	public Song parse() {
		Song song = new Song();

		while(next.type != Lexer.TokenType.EOF) {
			eat();
		}

		return song;
	}
}
