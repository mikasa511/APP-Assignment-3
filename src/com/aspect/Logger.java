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
	private int currentInstanceNumber;
	private PrintWriter writer;

	public Logger() {
		currentLineNumber = 1;
		Date date = new Date();
		currentInstanceNumber = 0;
		try {

			writer = new PrintWriter(new FileWriter("callgraph.dot"));
			writer.println("/*\n" + " * Description: This is an automatically generated .DOT file\n"
					+ " * representing a call graph.\n"
					+ " * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370\n" + " * Date: " +date+ "\n"
					+ "SequenceDiagram [frame=true framecolor=steelblue label=\"Observer Design PatternSequence Diagram\"]{");

		} catch (IOException e) {
			throw new RuntimeException("Cannot open 'callgraph.dot' for writing.", e);
		}
	}

	public int getCurrentInstanceNumber() {
		return currentInstanceNumber;
	}

	public void log(Object caller, Object reciever, String functionName) {
		String line = "";
		if (caller == null) {
			line = " -f-> ";
		} else {
			line += " " + caller.getClass().getName().substring(caller.getClass().getName().lastIndexOf('.') + 1)
					+ " --> ";
		}

		line += reciever.getClass().getName().substring(reciever.getClass().getName().lastIndexOf('.') + 1);
		line += " \"" + currentLineNumber + ". " + functionName.substring(functionName.indexOf('.') + 1) + "\"";

//		String line = " " + caller.substring(caller.lastIndexOf('.') + 1) + " -> "
//				+ reciever.substring(reciever.lastIndexOf('.') + 1);
//		line += "[ label = \"" + currentLineNumber + ". " + functionName + "\" ];";
		write(line);

	}

	public void setLifelineObject(String instanceName, String className) {
		writer.println(" lifeline \"" + className + ":" + instanceName + "\" as " + className);
		if (className != "Blogger")
			currentInstanceNumber++;
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
