package com.hk.ruh.dtos;

import java.util.Date;

public class ReviewDto {
	private int seq;
	private String category;
	private String title;
	private String id;
	private String content;
	private Date regdate;
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int seq, String category, String title, String id, String content, Date regdate) {
		super();
		this.seq = seq;
		this.category = category;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", category=" + category + ", title=" + title + ", id=" + id + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
	
	
}
