package com.hk.ruh.dtos;
import java.util.Date;
public class UsersDto {
private int seq;
private String id;
private String pw;
private String name;
private String sex;
private Date birth;
private String email;
private String si;
private String gu;
private String admin;
private String delflag;
private String regdate;
public UsersDto() {
	super();
	// TODO Auto-generated constructor stub
}
public UsersDto(int seq, String id, String pw, String name, String sex, Date birth, String email, String si, String gu,
		String admin, String delflag, String regdate) {
	super();
	this.seq = seq;
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.sex = sex;
	this.birth = birth;
	this.email = email;
	this.si = si;
	this.gu = gu;
	this.admin = admin;
	this.delflag = delflag;
	this.regdate = regdate;
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
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public Date getBirth() {
	return birth;
}
public void setBirth(Date birth) {
	this.birth = birth;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
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
public String getAdmin() {
	return admin;
}
public void setAdmin(String admin) {
	this.admin = admin;
}
public String getDelflag() {
	return delflag;
}
public void setDelflag(String delflag) {
	this.delflag = delflag;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
@Override
public String toString() {
	return "UsersDto [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", sex=" + sex + ", birth=" + birth
			+ ", email=" + email + ", si=" + si + ", gu=" + gu + ", admin=" + admin + ", delflag=" + delflag
			+ ", regdate=" + regdate + "]";
}

}