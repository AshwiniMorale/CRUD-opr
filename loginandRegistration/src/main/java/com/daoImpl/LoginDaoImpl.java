package com.daoImpl;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import com.bean.Register;
import com.dao.LoginDao;

@Service
public class LoginDaoImpl implements LoginDao{

	Session session;
	SessionFactory factory;
	Transaction tx;
	
	public void startTransaction() {
		factory=HibernateUtil.getSessionFactory();
		session=factory.openSession();
		tx=session.beginTransaction();
		System.out.println("begin transaction");
		
	}
	public int register(Register register,HttpServletRequest request) {
		System.out.println("register() call:: LoginDaoImpl");
		int id=0;
		try {
		startTransaction();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mob = request.getParameter("mob");
		
		register.setName(name);
		register.setEmail(email);
		//register.setPassword(PasswordSecurity.passwordSecurity("password"));
		register.setPassword(PasswordSecurity.passwordSecurity(password));
		register.setMob(mob);
		System.out.println("register() ::");
		id=(Integer) session.save(register);
		tx.commit();
		session.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}
	
	public boolean checkUser(String email)
	{
		System.out.println("checkUser() call:: LoginDaoImpl");
		startTransaction();
		Query q=session.createQuery("FROM Register WHERE EMAIL=?");
		q.setParameter(0, email);
		List<Register> list=q.list();
		tx.commit();
		session.close();
	
		Iterator<Register> itr= list.iterator();
		if(itr.hasNext())
			return true;
		else
			return false;
		
	}

	public List<Register> login(String email, String password) {
		
		System.out.println("login() call::logindaoImpl");
		startTransaction();
		
		List<Register> list=null;
		System.out.println(email+" "+password);

		Query query =session.createQuery("FROM Register WHERE EMAIL=? AND PASSWORD =?");
		query.setParameter(0, email);
		query.setParameter(1, password);
		System.out.println(email+" "+password);
		list=query.list();
		tx.commit();
		session.close();
		
		return list;
	}
	public void update(Register register) 
	{
		System.out.println("UserPersonalDetailsImpl::updateUserPersonalDetails() called.");

		startTransaction();
		
		System.out.println(register.getPassword());
		
		session.update(register);
		session.save(register);
		System.out.println(register.getPassword());

		tx.commit();
		session.close();
	}
	/*
	 * public Register update(Register register,HttpServletRequest request) {
	 * System.out.println("update() :: method call"); startTransaction(); String
	 * email = request.getParameter("email"); String password =
	 * request.getParameter("password"); Query query
	 * =session.createQuery("UPDATE REGISTER SET PASSWORD=? WHERE EMAIL=?");
	 * query.setParameter(0, password); query.setParameter(1, email);
	 * session.update(register); tx.commit(); session.close(); return register; }
	 */
}