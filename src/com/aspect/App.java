/**
 * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370
 * Assignment 3- APP
 */
package com.aspect;

public class App {
	public static void main(String[] args) {
		Blogger blogger = new Blogger();
		Newsportal observer1 = new Newsportal(blogger);
		Newspaper observer2 = new Newspaper(blogger);
		MobileSubscriber observer3 = new MobileSubscriber(blogger);
		blogger.setHeadline("0 degree C temprature in Montreal 1:00 AM.");
		System.out.println(observer1.getState());
		System.out.println(observer2.getState());
		System.out.println(observer3.getState());
		blogger.removeObserver(observer3);
		blogger.setHeadline("1 degree C temprature in Montreal 2:00 AM.");
		System.out.println(observer1.getState());
		System.out.println(observer2.getState());
		System.out.println(observer3.getState());
	}
}
