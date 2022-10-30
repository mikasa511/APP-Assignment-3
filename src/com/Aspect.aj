package com;

import java.io.IOException;

public aspect Aspect{
	
	

	pointcut addOb(Observer observer) : call(void Subject.addObserver(Observer)) && args(observer) && target(Subject);
	
	after(Observer observer): addOb(observer){
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
	
pointcut afterMain() : execution(void App.main(String[]));
	
	after(): afterMain(){
		try {
			Thread.sleep(10);
			Logger.INSTANCE.closeLogger();
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	


}