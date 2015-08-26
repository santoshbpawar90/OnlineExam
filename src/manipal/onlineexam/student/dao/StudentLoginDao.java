package manipal.onlineexam.student.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import manipal.onlineexam.student.entity.StudentLogin;
import manipal.onlineexam.util.HibernateUtil;


public class StudentLoginDao {



	/* This method Add the StudentLogin and return true if transaction is successful else return false */
	public boolean addStudentLogin(StudentLogin StudentLogin) {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.save(StudentLogin);
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
	
	/* This method delete the StudentLogin and return true if transaction is successful else return false */
	public boolean deleteStudentLogin(long id){
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx =session.getTransaction();
			tx.begin();
			StudentLogin StudentLogin = (StudentLogin) session.get(StudentLogin.class, id);
			if(id != 0)
				session.delete(StudentLogin);
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

	/* This method gives StudentLogin by id */
	public StudentLogin getStudentLoginById(int id){
		StudentLogin StudentLogin =null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			Query query = session.createQuery("from StudentLogin where id="+id);
			StudentLogin = (StudentLogin) query.uniqueResult();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return StudentLogin;
	}
	
	/* This method return list of all the StudentLogins*/
	@SuppressWarnings("unchecked")
	public List<StudentLogin > getAllStudentLogins(){
		List<StudentLogin> StudentLogins = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from StudentLogin");
			StudentLogins = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return StudentLogins;
	}
	
	/* This method return list of all the StudentLogins By Hospital Level Id*/
	@SuppressWarnings("unchecked")
	public List<StudentLogin > getAllStudentLoginsByUsername(String userName){
		List<StudentLogin> StudentLogins = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from StudentLogin where userName='"+userName+"'");
			StudentLogins = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return StudentLogins;
	}

	/* This method return true if StudentLogin is updated successful else return false */
	public boolean updateStudentLogin(StudentLogin StudentLogin){
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.update(StudentLogin);
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
	

	
	public boolean delAllStudent() {
		Session session=HibernateUtil.openSession();
		Transaction transaction=null;
		try {
			transaction=session.beginTransaction();
			session.createQuery("delete from StudentLogin").executeUpdate();
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
