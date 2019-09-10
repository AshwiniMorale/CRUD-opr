package com.controller;

import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Register;
import com.daoImpl.EmailSending;
import com.daoImpl.LoginDaoImpl;
import com.daoImpl.PasswordSecurity;

@Controller
public class LoginController {
	
	@Autowired
	LoginDaoImpl loginDaoImpl;
	
	
	@PostMapping("/register")
	public ModelAndView registration(@ModelAttribute("Register") Register register, HttpServletRequest 
			request,HttpServletResponse response) 
	{
		
		System.out.println("registration() :: logincontroller");
		String to=register.getEmail();

		if(loginDaoImpl.checkUser(register.getEmail()))
		{
			return new ModelAndView("register","message"," sorry email already present");

		}else {
		int id=loginDaoImpl.register(register, request);
		String from="info.cyberedu@gmail.com";
		 String password ="!ndian@123";
		 String sub="registration successfull";
		 String msg="welcome to gibsons";
		 
		 HttpSession session = request.getSession();
		 session.setAttribute("id", id);
		 EmailSending.send(from, password, to, sub, msg);
		return new ModelAndView("login","message","successfully register");
		}
		
	}

	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws NoSuchAlgorithmException, NoSuchProviderException
	{
		System.out.println("login():: loginControoler");
		boolean status=false;
		String email=request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(password);
		String name = null;
		List<Register> list=loginDaoImpl.login(email,PasswordSecurity.passwordSecurity(password));
		int id=0;
		
		for(Register register:list)
		{
			id=register.getId();
			name=register.getName();
			System.out.println("login controller login()::"+name);
			status=true;
		}
		
		if(status)
		{
			HttpSession httpSession = request.getSession();
			if (!httpSession.isNew()) {
				httpSession.invalidate();
				httpSession = request.getSession();
				httpSession.setMaxInactiveInterval(0);
			}
			httpSession.setAttribute("id", id);
			return new ModelAndView("userdetail","message","hello "+name);
		}
		return new ModelAndView("login","message","entered wrong password");
	}
	
	
	@PostMapping("/update")
	public ModelAndView update(
			@ModelAttribute("Register") Register register, HttpServletRequest req,
			HttpServletResponse res) {
		int id=0;
		System.out.println(":: updateUser() called:-->CompleteProfileController");
		HttpSession httpSession = req.getSession();
		id = (Integer) httpSession.getAttribute("id");
		register.setId(id);
		loginDaoImpl.update(register);
		return new ModelAndView("update", "message", "Your Personal Details have been saved successfully");
	}

}

