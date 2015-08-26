package manipal.onlineexam.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionCounter
 *
 */

public class SessionCounterListener implements HttpSessionListener {

	
	private static int activeSessions = 0;
	private List sessions = new ArrayList();
    /**
     * Default constructor. 
     */
    public SessionCounterListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent event)  { 
    	   	
    	activeSessions++;
    	System.out.println("in listener create active users="+activeSessions);
    	
    	 HttpSession session = event.getSession();
         sessions.add(session.getId());
  
         session.setAttribute("counter", this);
         System.out.println("create session id="+session.getId()+" counter="+this);
         
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent event)  { 
    	 if(activeSessions > 0)
    		    activeSessions--;
    	 
    	 System.out.println("in listener destroy active users="+activeSessions);
    	 
    	 
    	
         
         HttpSession session = event.getSession();
         sessions.remove(session.getId());
  
         session.setAttribute("counter", this);
         System.out.println("des session id="+session.getId()+" counter="+this);
    }
	
    
    public static int getActiveSessions() {
    	   return activeSessions;
    	 }
    
    public int getActiveSessionNumber() {
        return sessions.size();
    }
}
