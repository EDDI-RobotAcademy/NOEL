package com.kh.myapp.market.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.MarketReviewVO;
import com.kh.myapp.market.model.vo.MarketWishVO;

@Repository
public class MarketReviewDAO {

   @Inject
   private SqlSession sqlSession;

   //리뷰 게시물 총개수
   public int reviewCount(int prdNo) throws Exception {
      return sqlSession.selectOne("marketMapper.reviewCount", prdNo);
   }

   //리뷰 게시물 목록+페이징
   public List<MarketReviewVO> reviewList(int prdNo,int displayPost, int postNum) throws Exception {

      HashMap data = new HashMap();

      data.put("prdNo", prdNo);
      data.put("displayPost", displayPost);
      data.put("postNum", postNum);

      return sqlSession.selectList("marketMapper.reviewList", data);
   }

   public String reviewInsert(int regPage) throws Exception {
      String rvselect = sqlSession.selectOne("marketMapper.reviewInsert");
      return rvselect;
   }

   public MarketReviewVO reviewDetail(int reviewNo) throws Exception {
      return sqlSession.selectOne("marketMapper.reviewDetail", reviewNo);
   }

   public int reviewInsert(MarketReviewVO marketReviewVO) throws Exception {
      int result = sqlSession.insert("marketMapper.reviewInsert", marketReviewVO);
      return result;
   }

   public void reviewUpdate(MarketReviewVO marketReviewVO) {
      sqlSession.update("marketMapper.reviewUpdate", marketReviewVO);

   }

   public void reviewDelete(int qnaReviewno) throws Exception {
      sqlSession.delete("marketMapper.reviewDelete", qnaReviewno);
   }

	public MarketReviewVO userReview(HashMap<String, Object> map) {
		MarketReviewVO userReview = sqlSession.selectOne("marketMapper.userReview", map);
		return userReview;
	}

}