package dk.hisimon.mmlgb;

import java.io.*;
import java.nio.file.*;
import java.util.List;

public class MMLGB {
	public static void main (String[] args) throws Exception {
		Path inpath = FileSystems.getDefault().getPath(args[0]);
		String input = new String(Files.readAllBytes(inpath));

		Path outpath = FileSystems.getDefault().getPath(args[1]);

		List<Lexer.Token> tokens = Lexer.lex(input);
		Parser parser = new Parser(tokens);
		Song song = parser.parse();

		song.setFileName(outpath.getFileName().toString());
		PrintWriter pw = new PrintWriter(outpath.toFile());
		pw.println(song);
		pw.flush();
		pw.close();
	}
}
