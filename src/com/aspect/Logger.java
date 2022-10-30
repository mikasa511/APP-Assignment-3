/**
 * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370
 * Assignment 3- APP
 */
package com.aspect;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class Logger {
	public static Logger INSTANCE = new Logger();
	private static int currentLineNumber;
	private PrintWriter writer;

	public Logger() {
		currentLineNumber = 1;
		Date date = new Date();
		try {

			writer = new PrintWriter(new FileWriter("callgraph.dot"));
			writer.println("/*\n" + " * Description: This is an automatically generated .DOT file\n"
					+ " * representing a call graph.\n"
					+ " * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370\n" + " * Date: " +date+ "\n"
					+ " *\n" + " */\n" + "digraph callgraph {\n" + " node [shape = oval];");

		} catch (IOException e) {
			throw new RuntimeException("Cannot open 'calls.txt' for writing.", e);
		}
	}

	public void log(String caller, String reciever, String functionName) {

		String line = " " + caller.substring(caller.lastIndexOf('.') + 1) + " -> "
				+ reciever.substring(reciever.lastIndexOf('.') + 1);
		line += "[ label = \"" + currentLineNumber + ". " + functionName + "\" ];";
		write(line);

	}

	public void closeLogger() throws IOException {
		writer.println("}");
		writer.close();
	}

	private void write(String line) {
		try {
			writer.write(line + "\n");
			currentLineNumber++;
			writer.flush();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
