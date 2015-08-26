package manipal.onlineexam.admin.dao;

import java.util.List;



import manipal.onlineexam.admin.entity.TimeInterval;
import manipal.onlineexam.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TimeIntervalDao {
	
	
	public boolean addTimeInterval(TimeInterval timeInterval) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.save(timeInterval);
			transaction.commit();
		} catch (HibernateException e) {
			if(transaction!=null)
				transaction.rollback();
			e.printStackTrace();
			return false;
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return true;
	}

	
	/* This method return list of all the TimeIntervals*/
	@SuppressWarnings("unchecked")
	public List<TimeInterval > getAllTimeIntervals(){
		List<TimeInterval> timeIntervals = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from TimeInterval");
			timeIntervals = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return timeIntervals;
	}
	
	
	
	public List<TimeInterval > getAllTimeIntervalsByStudId(int id){
		List<TimeInterval> timeIntervals = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from TimeInterval where login_FK="+id);
			timeIntervals = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return timeIntervals;
	}
	
	public boolean delAllTimeInterval() {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.createQuery("delete from TimeInterval").executeUpdate();
			transaction.commit();
		} catch (HibernateException e) {
			if(transaction!=null)
				transaction.rollback();
			e.printStackTrace();
			return false;
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return true;
	}

}
