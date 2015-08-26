package manipal.onlineexam.admin.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import manipal.onlineexam.admin.entity.User;
import manipal.onlineexam.util.HibernateUtil;



public class UserModel {
	
	
	@SuppressWarnings("unchecked")
	public List<User > getAllUsers(){
		List<User> Users = null; 
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("from User");
			Users = query.list();
			tx.commit();
		}catch(HibernateException e){
			if(tx !=null)
				tx.rollback();
			 e.printStackTrace();
			return null;
		}finally{
			session.close();
		}		
		return Users;
	}

	
	public boolean checkUser(String userName, String pass) 
	{
		
		List<User> users=getAllUsers();
		if(users!=null)
		for(User user:users)
		{
			
			if(userName.equals(user.getUserName()) && pass.equals(pass))
			{
				return true;
			}
		}
		
		return false;
	}
}
