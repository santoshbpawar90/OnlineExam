package manipal.onlineexam.admin.dao;

import java.util.List;

import manipal.onlineexam.admin.entity.Trail;
import manipal.onlineexam.student.entity.StudentLogin;
import manipal.onlineexam.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TrailDao {
	
	public boolean addTrail(Trail trail) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.save(trail);
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
	
	
	@SuppressWarnings("unchecked")
	public List<Trail > getAllTrailByStudId(int studId){
		List<Trail> trails = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from Trail where stud_FK="+studId);
			trails = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return trails;
	}


	
	public boolean delAllTrail() {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.createQuery("delete from Trail").executeUpdate();
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
