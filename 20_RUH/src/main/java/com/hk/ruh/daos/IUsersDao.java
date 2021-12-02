package com.hk.ruh.daos;

import com.hk.ruh.dtos.AddressDto;
import com.hk.ruh.dtos.UsersDto;

public interface IUsersDao {
	public UsersDto getLogin(String id, String pw);
	
	public String idChk(String id);
	
	public boolean Regist(UsersDto dto);
}
