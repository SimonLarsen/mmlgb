package io.github.simonlarsen.mmlgb;

import java.io.*;
import java.nio.file.*;
import java.util.List;

public class MMLGB {
	public static void main (String[] args) throws Exception {
		Path path = FileSystems.getDefault().getPath(args[0]);
		String input = new String(Files.readAllBytes(path));

		List<Lexer.Token> tokens = Lexer.lex(input);

		Parser parser = new Parser(tokens);
		Song song = parser.parse();

		for(Integer i : song.getData()) {
			System.out.println(i + "U,");
		}
	}
}
