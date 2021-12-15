package com.hk.ruh.daos;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.ruh.dtos.FoodDto;

@Repository
public class InsertchosenDao implements IInsertchosenDao {

private String namespace="com.hk.ruh.roulette.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public boolean insertchosen(String id, String getfoodname, String category) {
		Map<String, String>map=new HashMap();
		map.put("id", id);
		map.put("foodname", getfoodname);
		map.put("category", category);
		
		
		int count=sqlSession.insert(namespace+"insertchosen", map);
		return count>0? true :false;
	}

}
