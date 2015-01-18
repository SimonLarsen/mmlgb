package io.github.simonlarsen.mmlgb;

import java.util.List;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public  class Lexer {
	public static enum TokenType {
		COMMENT(";.*\\n?"),
		NUMBER("[0-9]+"),
		CHANNEL("[ABCD]"),
		NOTE("[cdefgab]"),
		SHARP("[\\#\\+]"),
		FLAT("-"),
		COMMAND("[ro<>lv]"),
		DOT("\\."),
		MACRO("(@w|@env)"),
		ASSIGN("="),
		LCURLY("\\{"),
		RCURLY("\\}"),
		COMMA(","),
		NEWLINE("\\n"),
		WHITESPACE("[ \\t\\f\\r]+"),
		EOF("");

		public final String pattern;

		private TokenType(String pattern) {
			this.pattern = pattern;
		}
	}

	public static class Token {
		public TokenType type;
		public String data;

		public Token(TokenType type, String data) {
			this.type = type;
			this.data = data;
		}

		public String toString() {
			return String.format("(%s, %s)", type.name(), data);
		}
	}

	public static List<Token> lex(String input) {
		List<Token> tokens = new ArrayList<Token>();

		StringBuilder patternsBuffer = new StringBuilder();
		for(TokenType tokenType : TokenType.values()) {
			patternsBuffer.append(String.format("|(?<%s>%s)", tokenType.name(), tokenType.pattern));
		}
		Pattern tokenPatterns = Pattern.compile(new String(patternsBuffer.substring(1)));

		Matcher matcher = tokenPatterns.matcher(input);
		while(matcher.find()) {
			if(matcher.group(TokenType.COMMENT.name()) != null) {
				continue;
			}
			else if(matcher.group(TokenType.NUMBER.name()) != null) {
				tokens.add(new Token(TokenType.NUMBER, matcher.group(TokenType.NUMBER.name())));
				continue;
			}
			else if(matcher.group(TokenType.CHANNEL.name()) != null) {
				tokens.add(new Token(TokenType.CHANNEL, matcher.group(TokenType.CHANNEL.name())));
				continue;
			}
			else if(matcher.group(TokenType.NOTE.name()) != null) {
				tokens.add(new Token(TokenType.NOTE, matcher.group(TokenType.NOTE.name())));
				continue;
			}
			else if(matcher.group(TokenType.SHARP.name()) != null) {
				tokens.add(new Token(TokenType.SHARP, matcher.group(TokenType.SHARP.name())));
				continue;
			}
			else if(matcher.group(TokenType.FLAT.name()) != null) {
				tokens.add(new Token(TokenType.FLAT, matcher.group(TokenType.FLAT.name())));
				continue;
			}
			else if(matcher.group(TokenType.COMMAND.name()) != null) {
				tokens.add(new Token(TokenType.COMMAND, matcher.group(TokenType.COMMAND.name())));
				continue;
			}
			else if(matcher.group(TokenType.DOT.name()) != null) {
				tokens.add(new Token(TokenType.DOT, matcher.group(TokenType.DOT.name())));
				continue;
			}
			else if(matcher.group(TokenType.MACRO.name()) != null) {
				tokens.add(new Token(TokenType.MACRO, matcher.group(TokenType.MACRO.name())));
				continue;
			}
			else if(matcher.group(TokenType.NEWLINE.name()) != null) {
				tokens.add(new Token(TokenType.NEWLINE, matcher.group(TokenType.NEWLINE.name())));
				continue;
			}
			else if(matcher.group(TokenType.ASSIGN.name()) != null) {
				tokens.add(new Token(TokenType.ASSIGN, matcher.group(TokenType.ASSIGN.name())));
				continue;
			}
			else if(matcher.group(TokenType.LCURLY.name()) != null) {
				tokens.add(new Token(TokenType.LCURLY, matcher.group(TokenType.LCURLY.name())));
				continue;
			}
			else if(matcher.group(TokenType.RCURLY.name()) != null) {
				tokens.add(new Token(TokenType.RCURLY, matcher.group(TokenType.RCURLY.name())));
				continue;
			}
			else if(matcher.group(TokenType.COMMA.name()) != null) {
				tokens.add(new Token(TokenType.COMMA, matcher.group(TokenType.COMMA.name())));
				continue;
			}
			else if(matcher.group(TokenType.WHITESPACE.name()) != null) {
				continue;
			}
		}

		tokens.add(new Token(TokenType.EOF, ""));

		return tokens;
	}
}
