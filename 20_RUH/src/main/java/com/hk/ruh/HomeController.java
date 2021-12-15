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
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	IUsersService iservice;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);	
		return "home";
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome main! The client locale is {}.", locale);
		return "main";
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Locale locale, Model model,HttpServletRequest request, HttpServletResponse response) {
		logger.info("Welcome home! The client locale is {}.", locale);
		HttpSession session=request.getSession();//session객체 구함
		session.removeAttribute("usersDto");
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getLogin.do", method = {RequestMethod.GET , RequestMethod.POST},produces ="text/html; charset=utf-8")
	public String getLogin(String id, String pw, Locale locale, Model model, HttpServletRequest request, HttpServletResponse response)  {
		logger.info("getLogin (로그인 컨트롤러) {}.", locale);
	
		UsersDto dto=iservice.getLogin(id, pw);
//		System.out.println("id는"+dto.getId() +"pw는"+dto.getPw());
	
		HttpSession session=request.getSession();//session객체 구함
		session.setAttribute("usersDto", dto);
		session.setMaxInactiveInterval(15*60);
		System.out.println(dto);
		String returns="";
		if(dto==null  ) {
			returns= "<script type='text/javascript'>location.href='home.do';alert('login 실패');</script>";	 
		}else if(dto!= null) {
			returns="<script type='text/javascript'>location.href='main.do';alert('login 성공');</script>";	
		}
		
		return returns;
	}
	
	@RequestMapping(value = "/idchk.do", method = {RequestMethod.GET , RequestMethod.POST})
	public String idChk(String id, Locale locale, Model model, HttpServletRequest request)  {
		logger.info("idchk (아이디 중복체크) {}.", locale);
		
		String resultId=iservice.idChk(id);
		model.addAttribute("resultId",resultId);
		
		return "idchk";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getRegist.do", method = {RequestMethod.GET , RequestMethod.POST}, produces ="text/html; charset=utf-8")
	public String getRegist(String idr, String pw, String name, String si, String gu , String sexchk, String birth, String email, Locale locale, Model model, HttpServletRequest request)  {
		logger.info("getRegist) {}.", locale);
		 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		 boolean isS=false;
		 System.out.println(idr+pw);
		 try {
			UsersDto udto=new UsersDto(0, idr, pw, name, sexchk,  transFormat.parse(birth), email, si, gu, "user" , "y", null );
			 isS= iservice.Regist(udto);			
		 } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 String returns= "";
		 if(isS==true) {
			 returns="<script type='text/javascript'>location.href='home.do';alert('회원가입 성공');</script>";
		 }else {
			 returns="<script type='text/javascript'>location.href='home.do';alert('회원가입 실패');</script>";
		 }
		
		return returns;
	}
	
}
