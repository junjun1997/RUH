package com.hk.ruh.daos;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.ruh.dtos.UsersDto;


@Repository
public class UsersDao implements IUsersDao{
	private String namespace="com.hk.ruh.login.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//로그인
	public UsersDto getLogin(String id, String pw) {
		Map<String, String>map=new HashMap();
		map.put("id", id);
		map.put("pw", pw);
		UsersDto dto=sqlSession.selectOne(namespace+"getlogin", map);
		return dto;
	}
	
	//회원가입
	public boolean Regist(UsersDto dto) {
		int count=0;
	
		count+=sqlSession.insert(namespace+"register", dto);
	
		System.out.println(count);
	
		return count>0? true:false;
	}


	//아이디 중복체크: 가입할 아이디가 기존 DB에 존재하는 여부 체크-select문실행, 파리미터 : 가입할 ID
	public String idChk(String id) {
		String idchk=null;
		idchk=sqlSession.selectOne(namespace+"idchk", id);
		
		return idchk;
	}

	//주소 가져오기
		public UsersDto viewlocation(String id) {
			Map<String, String>map=new HashMap();
			map.put("id", id);
			UsersDto dto=sqlSession.selectOne(namespace+"nowlocation", map);
			return dto;
		}
		
		//주소 수정하기
		public boolean updatelocation(String id, String si, String gu) {
			Map<String, String>map=new HashMap();
			map.put("id", id);
			map.put("si", si);
			map.put("gu", gu);
			int isS=sqlSession.update(namespace+"updatelocation",map);
			return isS>0? true:false;
		}


}