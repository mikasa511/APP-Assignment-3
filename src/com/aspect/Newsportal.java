/**
 * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370
 * Assignment 3- APP
 */
package com.aspect;

public class Newsportal implements Observer {
	private Blogger blogger;
	private String state;

	public Newsportal(Blogger blogger) {
		this.blogger = blogger;
		this.blogger.addObserver(this);
	}

	public void update() {
		this.state = blogger.getHeadline();
	}

	public String getState() {
		return "Newsportal: " + this.state;
	}
}