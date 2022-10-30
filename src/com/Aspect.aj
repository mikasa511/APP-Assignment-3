package com;

import java.io.IOException;

public aspect Aspect{
	
	

	pointcut addOb(Observer observer) : call(void Subject.addObserver(Observer)) && args(observer) && target(Subject);
	
	before(Observer observer): addOb(observer){

		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);

	}
	
	pointcut notifyObservers() : execution(void Subject.notifyObservers()) && target(Subject);
	
	before(): notifyObservers(){
		
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
	}
	


	pointcut update() : call(void Observer.update()) && target(Newspaper);
	
	before(): update(){
		
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
	}
	
	pointcut getHeadline() : call(String Blogger.getHeadline()) && target(Blogger);
	
	before(): getHeadline(){
		
		Logger.INSTANCE.log(
				thisJoinPoint.getThis().getClass().getName(),
				thisJoinPoint.getTarget().getClass().getName(),
				thisJoinPoint.getSignature().getName()
				);
		
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