package com.hk.ruh.service;

import com.hk.ruh.dtos.AddressDto;
import com.hk.ruh.dtos.UsersDto;

public interface IUsersService {
	public UsersDto getLogin(String id, String pw);
	public String idChk(String id);
	boolean Regist(UsersDto dto);
}
