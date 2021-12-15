package com.hk.ruh.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hk.ruh.dtos.FoodDto;
import com.hk.ruh.dtos.RestlistDto;
import com.hk.ruh.dtos.ReviewDto;

@Repository
public class ReviewDao implements IReviewDao {

	private String namespace="com.hk.ruh.review.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReviewDto> reviewlist() {
		List<ReviewDto> list=sqlSession.selectList(namespace+"reviewlist", null);
		return list;
	}

	@Override
	public List<RestlistDto> reslist(String title) {
		// TODO Auto-generated method stub
		List<RestlistDto> list=sqlSession.selectList(namespace+"selectres",title);
		return list;
	}

	@Override
	public List<FoodDto> food2category(List<RestlistDto> list) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap();
		List<FoodDto> flist = new ArrayList<FoodDto>();
		
		// list 는 식당dto 리스트 햄ㅋ버거 햄버거 샌드위치
		for (RestlistDto restlistDto : list) {
			String foodname=restlistDto.getFoodname(); //식당의 음식이름으로 범주를 찾는다
			map.put("foodname", foodname);
			FoodDto fdto=sqlSession.selectOne(namespace+ "food2category",map );
			System.out.println("fdto: "+fdto);
			flist.add(fdto);
			System.out.println("flist: "+flist.toString());
		}
		
  		return flist;
	}
	
	@Override
	public boolean insertreview(String category, String title, String id, String content) {
		// TODO Auto-generated method stub
		
		Map<String, String>map=new HashMap();
		map.put("category", category);
		map.put("title", title);
		map.put("id", id);
		map.put("content", content);
		int count =sqlSession.insert(namespace+ "insertreview",map );
		return count>0? true:false;
	}
	
	
	@Override
	public boolean delreview(String id, String[] seqs) {
		// TODO Auto-generated method stub
		Map<String, Object>param=new HashMap();
		int count=0;
		param.put("id", id);
		param.put("seq", seqs);
		count+=sqlSession.delete(namespace+"delreview", param);

	
		System.out.println("맵퍼끝나고"+count);
		return count>0?true:false ;
	}

	@Override
	public ReviewDto detailreview(int sseq) {
		// TODO Auto-generated method stub
		Map<String, Object>map=new HashMap();
		map.put("seq", sseq);
		ReviewDto rdto=sqlSession.selectOne(namespace+"detailreview",map);
		return rdto;
	}

	@Override
	public boolean updatereview(String seq, String title, String content) {
		// TODO Auto-generated method stub
		Map<String, String>map=new HashMap();
		map.put("seq", seq);
		map.put("title", title);
		map.put("content", content);
		int count=sqlSession.update(namespace+"updatereview",map);
		
		return count>0? true: false;
	}

	@Override
	public List<ReviewDto> reviewlist(String[] categorys) {
		// TODO Auto-generated method stub
		Map<String, Object>param=new HashMap();
		
		param.put("categorys", categorys);
		List<ReviewDto> list=sqlSession.selectList(namespace+"reviewlists", param);
		return list;
	}



	

}
