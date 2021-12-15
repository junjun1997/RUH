package com.hk.ruh.daos;

import com.hk.ruh.dtos.UsersDto;

public interface IUsersDao {
	public UsersDto getLogin(String id, String pw);
	
	public String idChk(String id);
	
	public boolean Regist(UsersDto dto);
	
	public UsersDto viewlocation(String id);

	public boolean updatelocation(String id, String si, String gu);
}
