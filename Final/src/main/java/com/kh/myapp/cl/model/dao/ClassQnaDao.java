package com.kh.myapp.cl.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.myapp.cl.model.vo.Qna;
import com.kh.myapp.cl.model.vo.QnaReply;
import com.kh.myapp.market.model.vo.MarketQnaVO;



@Repository
public class ClassQnaDao {

	@Inject
	private SqlSession sqlSession;

	// qna 게시물 총개수
	public int qnaCount(int classNo) throws Exception {
		return sqlSession.selectOne("classQna.qnaCount", classNo);
	}

	// qna 게시물 목록+페이징
	public List<Qna> qnaList(int classNo, int qnadisplayPost, int qnapostNum) throws Exception {

		HashMap data = new HashMap();

		data.put("classNo", classNo);
		data.put("qnadisplayPost", qnadisplayPost);
		data.put("qnapostNum", qnapostNum);
		System.out.println("qnaList는 " + data);
		return sqlSession.selectList("classQna.qnaList", data);
	}

	public int qnaInsert(Qna qna) throws Exception {
		int result = sqlSession.insert("classQna.qnaInsert", qna);
		return result;
	}

	public Qna qnaDetail(int classQnaNo) throws Exception {
		return sqlSession.selectOne("classQna.qnaDetail", classQnaNo);
	}

	public void qnaUpdate(Qna qna) {
		sqlSession.update("classQna.qnaUpdate", qna);
	}

	public void qnaDelete(int classQnaNo) throws Exception {
		sqlSession.delete("classQna.qnaDelete", classQnaNo);
	}

	// QNA 댓글 조회
	public List<Qna> qnarList(int classQnaNo) throws Exception {
		return sqlSession.selectList("classQna.qnareplyList", classQnaNo);
	}

	// QNA 댓글 작성
	public void qnarInsert(Qna qna) throws Exception {
		sqlSession.update("classQna.qnareplyWrite", qna);
	}

	// QNA 댓글 수정
	public void qnarUpdate(QnaReply qnaReply) throws Exception {
		sqlSession.update("classQna.qnareplyModify", qnaReply);
	}

	// QNA 댓글 삭제
	public void qnarDelete(int classQnaNo) throws Exception {
		sqlSession.update("classQna.qnareplyDelete", classQnaNo);
	}

	// QNA 댓글 개수
	public void qnarCount(int classQnaNo) throws Exception {
		sqlSession.update("classQna.qnareplyCount", classQnaNo);
	}

	// 판매자의 QNA 댓글등록시 QNA 답변완료로 변경
	public void qnaStatusUptate(Qna qna) {
		sqlSession.update("classQna.qnaStatus", qna);
	}

	public Qna qnaSecretDetail(HashMap<String, Object> map) {
		Qna result = sqlSession.selectOne("classQna.qnaSecretDetail", map);
		return result;
	}
}