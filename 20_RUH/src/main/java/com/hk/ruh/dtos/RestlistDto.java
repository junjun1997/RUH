package com.hk.ruh.dtos;

public class RestlistDto {
	private int seq;
	private String id;
	private String name;
	private String foodname;
	private String address;
	private String phone;
	private String breakstart;
	private String breakend;
	private String opentime;
	private String closetime;
	private String parking;
	private String si;
	private String gu;
	private int lat;
	private int ing;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String state;
	public RestlistDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestlistDto(int seq, String id, String name, String foodname, String address, String phone,
			String breakstart, String breakend, String opentime, String closetime, String parking, String si, String gu,
			int lat, int ing, String img1, String img2, String img3, String img4, String state) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.foodname = foodname;
		this.address = address;
		this.phone = phone;
		this.breakstart = breakstart;
		this.breakend = breakend;
		this.opentime = opentime;
		this.closetime = closetime;
		this.parking = parking;
		this.si = si;
		this.gu = gu;
		this.lat = lat;
		this.ing = ing;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.state = state;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBreakstart() {
		return breakstart;
	}
	public void setBreakstart(String breakstart) {
		this.breakstart = breakstart;
	}
	public String getBreakend() {
		return breakend;
	}
	public void setBreakend(String breakend) {
		this.breakend = breakend;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public String getClosetime() {
		return closetime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getIng() {
		return ing;
	}
	public void setIng(int ing) {
		this.ing = ing;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "RestlistDto [seq=" + seq + ", id=" + id + ", name=" + name + ", foodname=" + foodname + ", address="
				+ address + ", phone=" + phone + ", breakstart=" + breakstart + ", breakend=" + breakend + ", opentime="
				+ opentime + ", closetime=" + closetime + ", parking=" + parking + ", si=" + si + ", gu=" + gu
				+ ", lat=" + lat + ", ing=" + ing + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4="
				+ img4 + ", state=" + state + "]";
	}
	
	
}
