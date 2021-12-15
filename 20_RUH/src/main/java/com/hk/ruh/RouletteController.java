package com.hk.ruh;


import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
import com.hk.ruh.service.IRouletteService;


@Controller
public class RouletteController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	IRouletteService irouletteservice;
	
	

	@ResponseBody //ajax
	@RequestMapping(value = "/insertchosen.do", method = {RequestMethod.GET , RequestMethod.POST},produces = "application/json; charset=utf-8")
	public String insertchosen(Locale locale, Model model,HttpServletRequest request ,String foodname) {
		logger.info("Welcome RouletteController	! The client locale is {}.", locale);
		
		//FoodDao dao=new FoodDao();
		HttpSession session=request.getSession();//session객체 구함
		
		session.removeAttribute("readcount");

		UsersDto sess= (UsersDto)session.getAttribute("usersDto");
		String id= sess.getId();
		//FoodDto returnfood= dao.returnfood(id,foodname); //하나 select 한 dto
		//System.out.println(returnfood.toString());
		boolean isS=irouletteservice.insertchosen(id,foodname);	
		
		 String returns= "";
		 if(isS==true) {
			 System.out.print("hi");
			 returns=" like 성공";
		 }else {
			 System.out.print("bie");
			 returns=" like 실패";
		 }
		
		return returns;
		
		
	}
	

	

	
}
