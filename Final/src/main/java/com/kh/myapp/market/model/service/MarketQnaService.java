package com.kh.myapp.market.model.service;

import java.util.HashMap;
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

	// qna상세
	public MarketQnaVO qnaDetail(int prdQnano) throws Exception {
		dao.qnaDetail(prdQnano);
		return dao.qnaDetail(prdQnano);
	}

	public int qnaInsert(MarketQnaVO marketQnaVO) throws Exception {
		return dao.qnaInsert(marketQnaVO);
	}

	// qna수정
	public void qnaUpdate(MarketQnaVO marketqnaVO) {
		dao.qnaUpdate(marketqnaVO);
	}

	public void qnaDelete(int prdQnano) throws Exception {
		dao.qnaDelete(prdQnano);
	}

	// qna 게시물 총개수
	public int qnaCount(int prdNo) throws Exception {
		return dao.qnaCount(prdNo);
	}

	// qna 게시물 목록+페이징
	public List<MarketQnaVO> qnaList(int prdNo, int qnadisplayPost, int qnapostNum) throws Exception {
		return dao.qnaList(prdNo, qnadisplayPost, qnapostNum);
	}

	// QNA 댓글 조회
	public List<MarketQnaVO> qnarList(int prdQnano) throws Exception {
		return dao.qnarList(prdQnano);
	}

	// QNA 댓글 작성
	public void qnarInsert(MarketQnaVO marketqnaVO) throws Exception {
		dao.qnarInsert(marketqnaVO);
	}

	// QNA 댓글 수정
	public void qnarUpdate(MarketQnaReplyVO marketqnarVO) throws Exception {
		dao.qnarUpdate(marketqnarVO);
	}

	// QNA 댓글 삭제
	public void qnarDelete(int prdQnano) throws Exception {
		dao.qnarDelete(prdQnano);
	}

	// QNA 댓글 개수
	public void qnarCount(int prdQnano) throws Exception {
		dao.qnarCount(prdQnano);
		System.out.println("prdqnano service" + prdQnano);
	}

	// 판매자의 QNA 댓글등록시 QNA 답변완료로 변경
	public void qnaStatusUptate(MarketQnaVO marketqnaVO) {
		dao.qnaStatusUptate(marketqnaVO);

	}

	public MarketQnaVO qnaSecretDetail(int prdQnano, String prdQnapw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prdQnano", prdQnano);
		map.put("prdQnapw", prdQnapw);
		
		MarketQnaVO result = dao.qnaSecretDetail(map);
		return result;
	}
}