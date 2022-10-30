package com;

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
		blogger.setHeadline("1 degree C temprature in Montreal 2:00 AM.");
		System.out.println(observer1.getState());
		System.out.println(observer2.getState());
		blogger.setHeadline("2 degree C temprature in Montreal 3:00 AM.");
		System.out.println(observer1.getState());
		System.out.println(observer3.getState());
	}
}
