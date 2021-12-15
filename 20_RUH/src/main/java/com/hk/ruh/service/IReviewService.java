package com.hk.ruh.service;

import java.util.List;
import java.util.Map;

import com.hk.ruh.dtos.RestlistDto;
import com.hk.ruh.dtos.ReviewDto;

public interface IReviewService {
	public List<ReviewDto> reviewlist();

	public Map<String, Object> reslist(String title);

	public boolean insertreview(String category, String title, String id, String content);

	public boolean delreview(String id, String[] seqs);

	public ReviewDto detailreview(int sseq);

	public boolean updatereview(String seq, String title, String content);

	public List<ReviewDto> reviewlist(String[] categorys); 
}
