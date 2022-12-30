package com.kh.myapp.market.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.myapp.market.model.dao.MarketQnaDAO;
import com.kh.myapp.market.model.vo.MarketQnaReplyVO;
import com.kh.myapp.market.model.vo.MarketQnaVO;

@Service
public class MarketQnaService {

   @Inject
   private MarketQnaDAO dao;

   /*
    * public String prdQnaWrite(int regPage) throws Exception { return
    * dao.prdQnaWrite(regPage); }
    */

   /*
    * public ArrayList<MarketQnaVO> qnaList(int prdNo) { ArrayList<MarketQnaVO>
    * list = dao.qnaList(prdNo); return list; }
    */

   //qna상세
   public MarketQnaVO qnaDetail(int prdQnano) throws Exception{
      dao.qnaDetail(prdQnano);
      return dao.qnaDetail(prdQnano);
   }

   public int qnaInsert(MarketQnaVO marketQnaVO) throws Exception {
      return dao.qnaInsert(marketQnaVO);
   }

   //qna수정
   public void qnaUpdate(MarketQnaVO marketqnaVO) {
      dao.qnaUpdate(marketqnaVO);
   }

   public void qnaDelete(int prdQnano) throws Exception{
      dao.qnaDelete(prdQnano);
   }

   //qna 게시물 총개수
   public int qnaCount(int prdNo) throws Exception {
      return dao.qnaCount(prdNo);
   }

   //qna 게시물 목록+페이징
   public List<MarketQnaVO> qnaList(int prdNo, int qnadisplayPost, int qnapostNum) throws Exception {
      return dao.qnaList(prdNo, qnadisplayPost, qnapostNum);
   }


   // QNA 댓글 조회
   public List<MarketQnaReplyVO> qnarList(int prdQnano) throws Exception {
      return dao.qnarList(prdQnano);
   }

   // QNA 댓글 작성
   public void qnarInsert(MarketQnaReplyVO marketqnarVO) throws Exception {
      dao.qnarInsert(marketqnarVO);
   }

   // QNA 댓글 수정
   public void qnarUpdate(MarketQnaReplyVO marketqnarVO) throws Exception {
      dao.qnarUpdate(marketqnarVO);
   }

   // QNA 댓글 삭제
   public void qnarDelete(int prdQnarno) throws Exception {
      dao.qnarDelete(prdQnarno);
   }

   // QNA 댓글 개수
   public void qnarCount(int prdQnano) throws Exception {
      dao.qnarCount(prdQnano);
      System.out.println("prdqnano service"+prdQnano);
   }
}