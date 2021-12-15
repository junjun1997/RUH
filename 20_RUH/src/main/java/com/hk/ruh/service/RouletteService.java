package com.hk.ruh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.ruh.daos.IInsertchosenDao;
import com.hk.ruh.daos.IRetrunfoodDao;
import com.hk.ruh.daos.IUsersDao;
import com.hk.ruh.dtos.FoodDto;
import com.hk.ruh.dtos.UsersDto;

@Service
public class RouletteService implements IRouletteService {
	
	@Autowired
	private IRetrunfoodDao ireturnfooddao;
	@Autowired 
	private IInsertchosenDao iinsertchosendao;
	
	@Override
	public boolean insertchosen(String id ,String foodname) {
		// TODO Auto-generated method stub
	FoodDto fdto= ireturnfooddao.returnfood(foodname); 
	String getfoodname =fdto.getFoodname();
	String category= fdto.getCategory();
	boolean isS=iinsertchosendao.insertchosen(id, getfoodname, category);
	
	
		return isS;
	}
	
}

