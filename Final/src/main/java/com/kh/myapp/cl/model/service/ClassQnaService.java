package com.kh.myapp.cl.model.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.myapp.cl.model.dao.ClassQnaDao;
import com.kh.myapp.cl.model.vo.Qna;
import com.kh.myapp.cl.model.vo.QnaReply;
import com.kh.myapp.market.model.vo.MarketQnaReplyVO;
import com.kh.myapp.market.model.vo.MarketQnaVO;

@Service
public class ClassQnaService {

	@Inject
	private ClassQnaDao dao;

	// qna상세
	public Qna qnaDetail(int classQnaNo) throws Exception {
		dao.qnaDetail(classQnaNo);
		return dao.qnaDetail(classQnaNo);
	}

	public int qnaInsert(Qna qna) throws Exception {
		return dao.qnaInsert(qna);
	}

	// qna수정
	public void qnaUpdate(Qna qna) {
		dao.qnaUpdate(qna);
	}

	public void qnaDelete(int classQnaNo) throws Exception {
		dao.qnaDelete(classQnaNo);
	}

	// qna 게시물 총개수
	public int qnaCount(int classNo) throws Exception {
		return dao.qnaCount(classNo);
	}

	// qna 게시물 목록+페이징
	public List<Qna> qnaList(int classNo, int qnadisplayPost, int qnapostNum) throws Exception {
		return dao.qnaList(classNo, qnadisplayPost, qnapostNum);
	}

	// QNA 댓글 조회
	public List<Qna> qnarList(int classQnaNo) throws Exception {
		return dao.qnarList(classQnaNo);
	}

	// QNA 댓글 작성
	public void qnarInsert(Qna qna) throws Exception {
		dao.qnarInsert(qna);
	}

	// QNA 댓글 수정
	public void qnarUpdate(QnaReply qnaReply) throws Exception {
		dao.qnarUpdate(qnaReply);
	}

	// QNA 댓글 삭제
	public void qnarDelete(int classQnaNo) throws Exception {
		dao.qnarDelete(classQnaNo);
	}

	// QNA 댓글 개수
	public void qnarCount(int classQnaNo) throws Exception {
		dao.qnarCount(classQnaNo);
	}

	// 판매자의 QNA 댓글등록시 QNA 답변완료로 변경
	public void qnaStatusUptate(Qna qna) {
		dao.qnaStatusUptate(qna);

	}

	public Qna qnaSecretDetail(int classQnaNo, String classQnaPw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classQnaNo", classQnaNo);
		map.put("classQnaPw", classQnaPw);
		
		Qna result = dao.qnaSecretDetail(map);
		return result;
	}
}