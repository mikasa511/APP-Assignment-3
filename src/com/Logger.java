package com;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Logger {
	public static Logger INSTANCE = new Logger();
	private static int currentLineNumber;
//	private Stack<String> callStack = new Stack<String>();
//	private Set<String> callLog = new HashSet<String>();
	private PrintWriter writer;

	public Logger() {
		currentLineNumber = 1;
		try {

			writer = new PrintWriter(new FileWriter("callgraph.dot"));
			writer.println("/*\n" + " * Description: This is an automatically generated .DOT file\n"
					+ " * representing a call graph.\n" + " * Author: \n" + " * Date: " + "\n" + " *\n" + " */\n"
					+ "digraph call-graph {\n" + " node [shape = oval];");

		} catch (IOException e) {
			throw new RuntimeException("Cannot open 'calls.txt' for writing.", e);
		}
	}

	public void log(String caller, String reciever, String functionName) {

//		String type = s.getDeclaringType().getName();
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
