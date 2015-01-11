package io.github.simonlarsen.mmlgb;

import java.io.*;
import java.nio.file.*;

public class MMLGB {
	public static void main (String[] args) throws Exception {
		Path path = FileSystems.getDefault().getPath(args[0]);
		String input = new String(Files.readAllBytes(path));
		for(Lexer.Token token : Lexer.lex(input)) {
			System.out.println(token);
		}
	}
}
