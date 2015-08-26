package manipal.onlineexam.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

import manipal.onlineexam.admin.dao.TimeIntervalDao;
import manipal.onlineexam.admin.entity.TimeInterval;
import manipal.onlineexam.student.dao.QPackDao;
import manipal.onlineexam.student.dao.StudentLoginDao;
import manipal.onlineexam.student.entity.QPack;
import manipal.onlineexam.student.entity.StudentLogin;

public class TimeIntervalFun extends Thread {
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		
		int seconds=60;
		if(SPConstants.getInstance().getSpProperty("refresh.time")!=null)
		{
			try
			{
			seconds=Integer.parseInt(SPConstants.getInstance().getSpProperty("refresh.time"));
			}
			catch(NumberFormatException exception)
			{
				exception.printStackTrace();
				seconds=60;
			}
		}
		
		long mili=seconds*1000;
		
		StudentLoginDao loginDao=new StudentLoginDao();
		List<StudentLogin> studentLogins=loginDao.getAllStudentLogins();
		
		TimeIntervalDao timeIntervalDao=new TimeIntervalDao();
		timeIntervalDao.delAllTimeInterval();
		
		QPackDao qPackDao=new QPackDao();
		List<QPack> qPacks=qPackDao.getAllQPacks();
		if(qPacks!=null)
		for(QPack qPack:qPacks)
		{
			qPack.setIntervalStatus("1");
			qPackDao.updateQPack(qPack);
		}
		
		
		mainLoop:
		 while(true)
		    {    
		       // Do your task
			 System.out.println("Start...while");
		        try{
		        	
		        	
		        	
					
					
					if(studentLogins!=null)
					{
						
						for(StudentLogin studentLogin: studentLogins)
						{
							 System.out.println("IP----->"+studentLogin.getIpAdd());
							
							TimeInterval timeInterval=new TimeInterval();
							timeInterval.setDate(new Date());
							timeInterval.setLogin(studentLogin);
							
							try {
							    InetAddress address = InetAddress.getByName(studentLogin.getIpAdd());
							   
							    if(address.isReachable(10000)){
							    	//active
							    	timeInterval.setActiveStatus("1");
							    	
							    }else{
							    	//inactive
							    	timeInterval.setActiveStatus("0");
							    } 
							    
							    
							    
							    
							  }
							  catch (UnknownHostException e) {
							    System.err.println("Unable to lookup web.mit.edu");
							  }
							  catch (IOException e) {
							    System.err.println("Unable to reach web.mit.edu");
							  }
							
							timeIntervalDao.addTimeInterval(timeInterval);
						}
					}
		        	
		        	
					
					 qPacks=qPackDao.getAllQPacks();
				        if(qPacks!=null)
				    		for(QPack qPack:qPacks)
				    		{
				    			if(qPack.getIntervalStatus()!=null && qPack.getIntervalStatus().equals("0"))
				    			{
				    				System.out.println("Breaking mainLoop.");
				    				break mainLoop;
				    				
				    			}
				    			
				    		}
					
		        	System.out.println("Waiting for "+seconds+" sec");
		            Thread.sleep(mili);
		        } catch(Exception e){

		        }
		        
		       

		    }
	}
	
}
