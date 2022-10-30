/**
 * Author: Umangkumar Maheshbhai Patel - 40228475, Raveena Choudhary - 40232370
 * Assignment 3- APP
 */
package com.aspect;

import java.io.IOException;

import org.aspectj.lang.JoinPoint;


public aspect Instrumentator{
	
	public static final void log(JoinPoint point,String... otherParas ) {
		try {
			Thread.sleep(10);
			} catch(InterruptedException e) {
			System.out.println("InterruptedException caught");
			}
//	System.out.println("-------------------");
//		System.out.println(point+" "+point.getSignature().getDeclaringTypeName()  );
//		System.out.println(point.getThis());
//		System.out.println(point.getTarget());
//		System.out.println(point.getSignature());
		if(otherParas.length>0)
			Logger.INSTANCE.setLifelineObject("observer "+Logger.INSTANCE.getCurrentInstanceNumber(), otherParas[0]);
		
		Logger.INSTANCE.log(
				point.getThis(),
				point.getTarget(),
				point.getSignature().toShortString() 
				);
		
//		
//		System.out.println("-------------------");
	}
	

	
	pointcut newBlogger() : call(public Blogger.new());
	before(): newBlogger(){
		
		Logger.INSTANCE.setLifelineObject("blogger",thisJoinPoint.getSignature().getDeclaringType().getSimpleName() );

	}
	
	pointcut addObserver(Observer observer) : call(void Subject.addObserver(Observer))&&  args(observer) && target(Subject);
	after(Observer observer): addObserver(observer){
		log(thisJoinPoint,observer.getClass().getSimpleName());
		
	}
	
	pointcut removeObserver(Observer observer) : execution(void Subject.removeObserver(Observer)) && args(observer);
	after(Observer observer): removeObserver(observer){
		log(thisJoinPoint);
		
	}
	

	
	pointcut setHeadline(String headline) : call(void Blogger.setHeadline(String))  && args(headline) && target(Blogger);
	before(String headline): setHeadline(headline){

		log(thisJoinPoint);
	}
	
	
	pointcut notifyObservers() : call(void Subject.notifyObservers()) && target(Subject);
	before(): notifyObservers(){

		log(thisJoinPoint);
	}
	


	pointcut update() : call(void Observer.update()) && target(Observer);
	before(): update(){

		log(thisJoinPoint);
	}
	
	pointcut getHeadline() : call(String Blogger.getHeadline()) && target(Blogger);
	after () returning: getHeadline(){
		log(thisJoinPoint);

	}
	
	pointcut getState() : execution(String *.getState()) && (target(Newsportal) || target(Newspaper) || target(MobileSubscriber)) ;
	after () returning: getState(){
		log(thisJoinPoint);

		
	}
	
	pointcut afterMain() : execution(void App.main(String[]));
	after(): afterMain(){
		try {
			Logger.INSTANCE.closeLogger();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
	


}