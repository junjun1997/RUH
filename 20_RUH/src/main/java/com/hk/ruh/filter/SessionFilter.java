package com.hk.ruh.filter;


import java.awt.print.Pageable;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.hk.ruh.dtos.UsersDto;

@WebFilter(                                                    //  어노테이션시  xml 따로 설정 x
		urlPatterns = { "/main.do", "/location.do", "/nowlocation.do","/updatelocation.do","/insertchosen.do"
				, "/review.do","/addreview.do","/selectName.do","/selectres.do","/insertreview.do","/delreview.do","/detailreview.do","/updateboard.do","/updatereview.do" ,"/categoryfilter.do"
				,"/map.do"}, 
		initParams = { 
				@WebInitParam(name = "encoding", value = "utf-8")
		})

public class SessionFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpSession session=req.getSession();
		
		HttpServletResponse res=(HttpServletResponse) response;
		
		System.out.println("@@@@@@@@@@filter");
		UsersDto udto = (UsersDto)session.getAttribute("usersDto");	
		if(udto==null){
			System.out.println("@@@@@@@@@@udto null");
			res.sendRedirect("home.do");
			return;
		}
	 chain.doFilter(request, response);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
