package com.hk.ruh;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.hk.ruh.dtos.UsersDto;
import com.hk.ruh.service.IMapService;
import com.hk.ruh.service.IUsersService;

@Controller
public class MapController {

	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	@Autowired
	IMapService imapservice;
	@Autowired
	IUsersService iusersservice;
	
	@RequestMapping(value = "/map.do", method = RequestMethod.GET)
	public String map(Locale locale, Model model ,HttpServletRequest request) {
		logger.info("Welcome map! The client locale is {}.", locale);	
		HttpSession session=request.getSession();//session객체 구함
		UsersDto udto = (UsersDto)session.getAttribute("usersDto");
		String id=udto.getId();
		
		UsersDto usersdto=iusersservice.viewlocation(id);
		
		String si=usersdto.getSi();
		String gu=usersdto.getGu();
		model.addAttribute("si", si);
		model.addAttribute("gu",gu);
		
		return "map";
	}
	
	

	
	
}
