package com.hk.ruh.dtos;

public class AddressDto {

	private int seq;
	private String id;
	private String si;
	private String gu;
	
	public AddressDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AddressDto(int seq, String id, String si, String gu) {
		super();
		this.seq = seq;
		this.id = id;
		this.si = si;
		this.gu = gu;
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

	@Override
	public String toString() {
		return "AddressDto [seq=" + seq + ", id=" + id + ", si=" + si + ", gu=" + gu + "]";
	}
	
	
}
