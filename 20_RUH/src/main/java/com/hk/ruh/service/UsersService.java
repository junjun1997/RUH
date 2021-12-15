package com.hk.ruh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.ruh.daos.IUsersDao;

import com.hk.ruh.dtos.UsersDto;

@Service
public class UsersService implements IUsersService {
	
	@Autowired
	private IUsersDao idao;
	
	@Override
	public UsersDto getLogin(String id, String pw) {
		// TODO Auto-generated method stub
		UsersDto dto= idao.getLogin(id, pw);
		
		return dto;
	}
	@Override
	public String idChk(String id) {
		String d=idao.idChk(id);
		return d;
	}
	@Override
	public boolean Regist(UsersDto dto) {
		boolean isS=idao.Regist(dto);
		return isS;
	}
	
	@Override
	public UsersDto viewlocation(String id) {
		// TODO Auto-generated method stub
		UsersDto dto= idao.viewlocation(id);
		
		return dto;
	}
	
	@Override
	public  boolean updatelocation(String id, String si, String gu) {
		boolean isS=idao.updatelocation(id,si,gu);
		
		return isS;
	}
}
