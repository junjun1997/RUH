package com.hk.ruh.daos;

import java.util.List;

import com.hk.ruh.dtos.FoodDto;
import com.hk.ruh.dtos.RestlistDto;
import com.hk.ruh.dtos.ReviewDto;

public interface IReviewDao {
	public List<ReviewDto> reviewlist();

	public List<RestlistDto> reslist(String title);

	public List<FoodDto> food2category(List<RestlistDto> list);

	public boolean insertreview(String category, String title, String id, String content);

	public boolean delreview(String id, String[] seqs);

	public ReviewDto detailreview(int sseq);

	public boolean updatereview(String seq, String title, String content);

	public List<ReviewDto> reviewlist(String[] categorys);
}
