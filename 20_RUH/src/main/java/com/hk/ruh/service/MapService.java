package com.hk.ruh.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.ruh.daos.IMapDao;
import com.hk.ruh.daos.IReviewDao;
import com.hk.ruh.dtos.FoodDto;
import com.hk.ruh.dtos.RestlistDto;
import com.hk.ruh.dtos.ReviewDto;

@Service
public class MapService implements IMapService {

	@Autowired
	private IMapDao imapdao;
	
//	//리뷰 리스트를 불러옴
//	@Override
//	public List<ReviewDto> reviewlist() {
//		// TODO Auto-generated method stub
//		List<ReviewDto> list=ireviewdao.reviewlist();
//		return list;
//	}

	

}
