package manipal.onlineexam.student.dao;

import java.util.List;

import manipal.onlineexam.student.entity.QPack;
import manipal.onlineexam.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class QPackDao {
	
	public boolean addQpack(QPack qPack) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.save(qPack);
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

	
	/* This method return list of all the QPacks*/
	@SuppressWarnings("unchecked")
	public List<QPack > getAllQPacks(){
		List<QPack> qPacks = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from QPack");
			qPacks = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return qPacks;
	}
	
	
	public boolean updateQPack(QPack qPack){
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.update(qPack);
			tx.commit();			
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return false;
		}finally{
			session.close();
		}		
		return true;
	}
	
	public QPack getQPackById(int id){
		QPack qPack =null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			Query query = session.createQuery("from QPack where id="+id);
			qPack = (QPack) query.uniqueResult();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return qPack;
	}
	
	
	public boolean delAllQpack() {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.createQuery("delete from QPack").executeUpdate();
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
