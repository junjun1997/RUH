package com.hk.ruh.service;


import com.hk.ruh.dtos.UsersDto;

public interface IUsersService {
	public UsersDto getLogin(String id, String pw);
	public String idChk(String id);
	boolean Regist(UsersDto dto);
	public UsersDto viewlocation(String id);
	public  boolean updatelocation(String id, String si, String gu);
}
