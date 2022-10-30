/**
 * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370
 * Assignment 3- APP
 */
package com.aspect;

import java.io.IOException;

public aspect Aspect{
	
	
	//pointcut to add an observer
	pointcut addObserver(Observer observer) : call(void Subject.addObserver(Observer)) && args(observer) && target(Subject);
	
	after(Observer observer): addObserver(observer){
		try {
			Thread.sleep(10);
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);

	}
	
	//pointcut to notify observers
	pointcut notifyObservers() : call(void Subject.notifyObservers()) && target(Subject);
	
	before(): notifyObservers(){
		try {
			Thread.sleep(10);
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
	}
	
	//pointcut to update an observer
	pointcut update() : call(void Observer.update()) && target(Observer);
	
	before(): update(){
		try {
			Thread.sleep(10);
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
	}
	
	//pointcut to remove an observer
	pointcut removeObserver(Observer observer) : execution(void Subject.removeObserver(Observer)) && args(observer) && target(Subject);
	
	after(Observer observer): removeObserver(observer){
		try {
			Thread.sleep(10);
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
	}
	
	//pointcut to getHeadLines from Blogger
	pointcut getHeadline() : call(String Blogger.getHeadline()) && target(Blogger);
	
	before(): getHeadline(){
		try {
			Thread.sleep(10);
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
	}
	
pointcut callMain() : execution(public static void *.main(..));
	
	after(): callMain(){
		try {
			Thread.sleep(10);
			Logger.INSTANCE.closeLogger();
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}catch (IOException e) {
				e.printStackTrace();
			}
		
	}
	


}