package com.hk.ruh;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.ruh.dtos.UsersDto;
import com.hk.ruh.service.IUsersService;

@Controller
public class LocationController {
	@Autowired
	IUsersService iservice;

	private static final Logger logger = LoggerFactory.getLogger(LocationController.class);

	@RequestMapping(value = "/location.do", method = RequestMethod.GET)
	public String location(Locale locale, Model model) {
		logger.info("Welcome location! The client locale is {}.", locale);
		return "location";
	}
	
	//현재 주소 id 보여주기
	@RequestMapping(value = "/nowlocation.do", method = RequestMethod.GET)
	public String nowlocation(Locale locale, Model model, String id) {
		logger.info("Welcome nowlocation! The client locale is {}.", locale);
		UsersDto dto=iservice.viewlocation(id);
		model.addAttribute("si",dto.getSi());
		model.addAttribute("gu",dto.getGu());
		return "location" ;
	}
	
	//주소 수정하기
		@ResponseBody  //ajax 
		@RequestMapping(value = "/updatelocation.do", method= {RequestMethod.GET , RequestMethod.POST},produces = "application/json; charset=utf-8")
		public String updatelocation(Locale locale, Model model, String id, String si, String gu) {
			logger.info("Welcome updatelocation! The client locale is {}.", locale);
			boolean isS = iservice.updatelocation(id, si, gu);
			
		
			
			return  "주소 재설정 완료" ;
		}
}
