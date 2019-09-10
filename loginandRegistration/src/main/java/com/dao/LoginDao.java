package com.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bean.Register;

public interface LoginDao {
	public int register(Register register,HttpServletRequest request);
	List<Register> login(String email,String password);
	public boolean checkUser(String email);
}
