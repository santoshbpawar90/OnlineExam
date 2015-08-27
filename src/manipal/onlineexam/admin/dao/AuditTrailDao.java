package manipal.onlineexam.admin.dao;

import java.util.List;

import manipal.onlineexam.admin.entity.AuditTrail;
import manipal.onlineexam.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AuditTrailDao {
	
	
	
	

	
	public boolean addAuditTrail(AuditTrail auditTrail) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.save(auditTrail);
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

	
	/* This method return list of all the AuditTrails*/
	@SuppressWarnings("unchecked")
	public List<AuditTrail> getAllAuditTrails(){
		List<AuditTrail> auditTrails = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from AuditTrail");
			auditTrails = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return auditTrails;
	}
	
	
	
	public List<AuditTrail > getAllAuditTrailsByStudId(int id){
		List<AuditTrail> AuditTrails = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from AuditTrail where login_FK="+id);
			AuditTrails = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return AuditTrails;
	}
	
	public boolean delAllAuditTrail() {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.createQuery("delete from AuditTrail").executeUpdate();
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
