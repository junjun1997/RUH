package com.hk.ruh;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.ruh.dtos.RestlistDto;
import com.hk.ruh.dtos.ReviewDto;
import com.hk.ruh.service.IReviewService;
import com.hk.ruh.dtos.UsersDto;

@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	@Autowired
	IReviewService ireviewservice;
	
//리뷰 리스트를 가져옴	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review(Locale locale, Model model) {
		logger.info("Welcome review! The client locale is {}.", locale);	
		List<ReviewDto> list=ireviewservice.reviewlist();
				
		model.addAttribute("list",list);
		return "choice";
	}	
	
//addreview.jsp
	@RequestMapping(value = "/addreview.do", method = RequestMethod.GET)
	public String reviewinsert(Locale locale, Model model) {
		logger.info("Welcome addreview! The client locale is {}.", locale);	
	
		return "addreview";
	}	
	//작성할 리뷰 식당과 음식범주를 찾는 페이지 selectName.jsp
		@RequestMapping(value = "/selectName.do", method = RequestMethod.GET)
		public String selectName(Locale locale, Model model) {
			logger.info("Welcome selectName! The client locale is {}.", locale);	
		
			return "selectName";
		}		
		
		//작성할리뷰 식당과음식범주찾기
		@ResponseBody //ajax
		@RequestMapping(value = "/selectres.do", method = {RequestMethod.GET , RequestMethod.POST},produces = "application/json; charset=utf-8")
		public Map<String, Object> selectres(Locale locale, Model model,HttpServletRequest request ,String title) {
			logger.info("Welcome selectres	! The client locale is {}.", locale);
			
			Map<String, Object>  map=ireviewservice.reslist(title);
			
			return map;
		}
		
		//리뷰 등록
				@ResponseBody
				@RequestMapping(value = "/insertreview.do", method = {RequestMethod.GET , RequestMethod.POST} ,produces ="text/html; charset=utf-8")
				public String insertreview(Locale locale, Model model, String category, String title, String id, String content ) {
					logger.info("Welcome insertreview! The client locale is {}.", locale);	
				
					boolean isS =ireviewservice.insertreview(category, title, id, content);
					String returns="";
					if(isS=true) {
					 returns="<script type='text/javascript'>location.href='review.do';alert('등록 성공');</script>";
					}else {
						returns="<script type='text/javascript'>location.href='review.do';alert('등록 실패');</script>";
					}
					return returns;
				}		
			//리뷰 삭제
				@ResponseBody
				@RequestMapping(value = "/delreview.do", method = {RequestMethod.GET , RequestMethod.POST} ,produces ="text/html; charset=utf-8")
				public String delreview(Locale locale, Model model,HttpServletRequest request,String seq ) {
					logger.info("Welcome delreview! The client locale is {}.", locale);	
					
					HttpSession session=request.getSession();//session객체 구함
					session.removeAttribute("readcount");
					UsersDto sess= (UsersDto)session.getAttribute("usersDto");
					String id= sess.getId();
							
					boolean isS;
					String returns="";
					//단일 삭제용
					if(seq!=null) {
						System.out.println("단일삭제@@@@@@@@ seq은:"+seq);
						String[] seqs= {seq};
					   isS=ireviewservice.delreview(id,seqs);
						System.out.println("seqs[]:@@@@@@@@"+seqs.getClass()+seqs.length);		
						if(isS==true) {
							 returns="<script type='text/javascript'>location.href='review.do';alert('삭제 성공');</script>";
							}else {
								returns="<script type='text/javascript'>location.href='review.do';alert('삭제 실패');</script>";
							}
					}else if(seq==null) {
						String[] seqs=request.getParameterValues("chk");  // 체크박스는 가져오기 헷갈려서 겟파라미터벨류즈 썼음
					     isS=ireviewservice.delreview(id,seqs);
					     System.out.println("컨트롤러 "+isS);
					     if(isS==true) {
							 returns="<script type='text/javascript'>location.href='review.do';alert('삭제 성공');</script>";
							}else {
								returns="<script type='text/javascript'>location.href='review.do';alert('삭제 실패');</script>";
							}
					}			
					return returns;
				}		
				
				//리뷰 상세보기
				@RequestMapping(value = "/detailreview.do", method = {RequestMethod.GET , RequestMethod.POST} ,produces ="text/html; charset=utf-8")
				public String detailreview(Locale locale, Model model,HttpServletRequest request,String seq ) {
					logger.info("Welcome detailreview! The client locale is {}.", locale);	
					
					int sseq = Integer.parseInt(seq);
					
					ReviewDto rdto=ireviewservice.detailreview(sseq);
					model.addAttribute("category", rdto.getCategory());
					model.addAttribute("id", rdto.getId());
					model.addAttribute("title",rdto.getTitle() );
					model.addAttribute("content", rdto.getContent() );
					model.addAttribute("seq", rdto.getSeq());
					return "reviewdetail";
				}		
				
				//리뷰 수정폼이동
				@RequestMapping(value = "/updateboard.do", method = {RequestMethod.GET , RequestMethod.POST} ,produces ="text/html; charset=utf-8")
				public String updateboard(HttpServletResponse response, Locale locale, Model model,HttpServletRequest request,String seq,String id ) {
					logger.info("Welcome updateboard! The client locale is {}.", locale);
					HttpSession session=request.getSession();//session객체 구함
					session.removeAttribute("readcount");
					UsersDto sess= (UsersDto)session.getAttribute("usersDto");
					String sessid= sess.getId();
					if(!id.equals(sessid)) {
						model.addAttribute("msg","작성자만 가능합니다");
						
						return "reviewdetail?seq" ;
						
					}
					
					int sseq = Integer.parseInt(seq);
					
					ReviewDto rdto=ireviewservice.detailreview(sseq);
					model.addAttribute("category", rdto.getCategory());
					model.addAttribute("id", rdto.getId());
					model.addAttribute("title",rdto.getTitle() );
					model.addAttribute("content", rdto.getContent() );
					model.addAttribute("seq", rdto.getSeq());
					
					return "updateboard";	
					
				}		
				
				//리뷰 수정
				@ResponseBody
				@RequestMapping(value = "/updatereview.do", method = {RequestMethod.GET , RequestMethod.POST} ,produces ="text/html; charset=utf-8")
				public String updatereview(Locale locale, Model model,  String title, String seq, String content ) {
					logger.info("Welcome insertreview! The client locale is {}.", locale);	

					System.out.println(seq+title+content);
					boolean isS =ireviewservice.updatereview(seq, title, content);
					String returns="";
					if(isS=true) {
					 returns="<script type='text/javascript'>location.href='review.do';alert('수정 성공');</script>";
					}else {
						returns="<script type='text/javascript'>location.href='review.do';alert('수정 실패');</script>";
					}
					return returns;
				}	
				
				//카테고리 필터
				@RequestMapping(value = "/categoryfilter.do", method = {RequestMethod.GET , RequestMethod.POST} ,produces ="text/html; charset=utf-8")
				public String categoryfilter(HttpServletResponse response, Locale locale, Model model,HttpServletRequest request ) {
					logger.info("Welcome updateboard! The client locale is {}.", locale);
					String[] categorys=request.getParameterValues("category");
					System.out.println(categorys);
					if (categorys==null) {
						String[] allcategory=new String[] {"한식","중식","일식","분식","양식","패스트푸드"};
						List<ReviewDto> list=ireviewservice.reviewlist(allcategory);
						model.addAttribute("list",list);
					}else {
						List<ReviewDto> list=ireviewservice.reviewlist(categorys);
						model.addAttribute("list",list);
					}
			
					return "choice";
					
				}	
}
