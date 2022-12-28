package com.kh.myapp.market.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.myapp.market.model.dao.MarketReviewDAO;
import com.kh.myapp.market.model.vo.MarketReviewVO;

@Service
public class MarketReviewService {

	@Inject
	private MarketReviewDAO dao;

	// 게시물 총개수
	public int reviewCount(int prdNo) throws Exception {
		return dao.reviewCount(prdNo);
	}

	// 게시물 목록+페이징
	public List<MarketReviewVO> reviewList(int prdNo, int displayPost, int postNum) throws Exception {
		return dao.reviewList(prdNo, displayPost, postNum);
	}
	
	public String reviewInsert(int regPage) throws Exception {
		return dao.reviewInsert(regPage);
	}

	public MarketReviewVO reviewDetail(int reviewNo) throws Exception {
		dao.reviewDetail(reviewNo);
		return dao.reviewDetail(reviewNo);
	}

	public int reviewInsert(MarketReviewVO marketReviewVO) throws Exception {
		return dao.reviewInsert(marketReviewVO);
	}

	public void reviewUpdate(MarketReviewVO marketReviewVO) {
		dao.reviewUpdate(marketReviewVO);

	}

	public void reviewDelete(int qnaReviewno) throws Exception {
		dao.reviewDelete(qnaReviewno);

	}

}