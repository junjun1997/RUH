package com.hk.ruh.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.ruh.daos.IReviewDao;
import com.hk.ruh.dtos.FoodDto;
import com.hk.ruh.dtos.RestlistDto;
import com.hk.ruh.dtos.ReviewDto;

@Service
public class ReviewService implements IReviewService {

	@Autowired
	private IReviewDao ireviewdao;
	
	//리뷰 리스트를 불러옴
	@Override
	public List<ReviewDto> reviewlist() {
		// TODO Auto-generated method stub
		List<ReviewDto> list=ireviewdao.reviewlist();
		return list;
	}

	//식당리스트의 음식이름으로 푸드리스트의 범주를 불러옴
	@Override
	public Map<String, Object> reslist(String title) {
		// TODO Auto-generated method stub
		List<RestlistDto> list=ireviewdao.reslist(title);
		System.out.println("식당리스트: "+list);
		List<FoodDto> flist=ireviewdao.food2category(list); 
		System.out.println("음식리스트: "+flist);
		Map<String, Object> map=new HashMap<>(); //자바 map = js json
		map.put("restlist", list);
		map.put("flist", flist);
			
		return map;
		
	}
	
	// 리뷰 등록
	
	@Override
	public boolean insertreview(String category, String title, String id, String content) {
		// TODO Auto-generated method stub
		
		boolean isS =ireviewdao.insertreview(category, title, id, content);
		
		return isS;
	}


	@Override
	public boolean delreview(String id, String[] seqs) {
		// TODO Auto-generated method stub
		boolean isS=ireviewdao.delreview(id, seqs);
		return isS;
	}

	@Override
	public ReviewDto detailreview(int sseq) {
		// TODO Auto-generated method stub
		ReviewDto rdto=ireviewdao.detailreview(sseq);
		return rdto;
	}

	@Override
	public boolean updatereview(String seq, String title, String content) {
		// TODO Auto-generated method stub
		boolean isS =ireviewdao.updatereview(seq,title, content);
		return isS;
	}

	@Override
	public List<ReviewDto> reviewlist(String[] categorys) {
		// TODO Auto-generated method stub
		List<ReviewDto> list=ireviewdao.reviewlist(categorys);
		return list;
	}

}
