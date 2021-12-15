package com.hk.ruh.daos;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.ruh.dtos.FoodDto;

@Repository
public class ReturnfoodDao implements IRetrunfoodDao {

private String namespace="com.hk.ruh.roulette.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FoodDto returnfood(String foodname) {
		Map<String, String>map=new HashMap();
		map.put("foodname", foodname);
		FoodDto fdto=sqlSession.selectOne(namespace+"returnfood", map);
		return fdto;
	}

}
