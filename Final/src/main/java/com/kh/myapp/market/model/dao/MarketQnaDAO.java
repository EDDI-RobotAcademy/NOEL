package com.kh.myapp.market.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.MarketQnaReplyVO;
import com.kh.myapp.market.model.vo.MarketQnaVO;



@Repository
public class MarketQnaDAO {

	@Inject
	private SqlSession sqlSession;

	// qna 게시물 총개수
	public int qnaCount(int prdNo) throws Exception {
		return sqlSession.selectOne("marketMapper.qnaCount", prdNo);
	}

	// qna 게시물 목록+페이징
	public List<MarketQnaVO> qnaList(int prdNo, int qnadisplayPost, int qnapostNum) throws Exception {

		HashMap data = new HashMap();

		data.put("prdNo", prdNo);
		data.put("qnadisplayPost", qnadisplayPost);
		data.put("qnapostNum", qnapostNum);

		return sqlSession.selectList("marketMapper.qnaList", data);
	}

	public int qnaInsert(MarketQnaVO marketqnaVO) throws Exception {
		int result = sqlSession.insert("marketMapper.qnaInsert", marketqnaVO);
		return result;
	}

	public MarketQnaVO qnaDetail(int prdQnano) throws Exception {
		return sqlSession.selectOne("marketMapper.qnaDetail", prdQnano);
	}

	public void qnaUpdate(MarketQnaVO marketqnaVO) {
		sqlSession.update("marketMapper.qnaUpdate", marketqnaVO);
	}

	public void qnaDelete(int prdQnano) throws Exception {
		sqlSession.delete("marketMapper.qnaDelete", prdQnano);
	}

	// QNA 댓글 조회
	public List<MarketQnaVO> qnarList(int prdQnano) throws Exception {
		return sqlSession.selectList("marketMapper.qnareplyList", prdQnano);
	}

	// QNA 댓글 작성
	public void qnarInsert(MarketQnaVO marketqnaVO) throws Exception {
		sqlSession.update("marketMapper.qnareplyWrite", marketqnaVO);
	}

	// QNA 댓글 수정
	public void qnarUpdate(MarketQnaReplyVO marketqnarVO) throws Exception {
		sqlSession.update("marketMapper.qnareplyModify", marketqnarVO);
	}

	// QNA 댓글 삭제
	public void qnarDelete(int prdQnano) throws Exception {
		sqlSession.update("marketMapper.qnareplyDelete", prdQnano);
	}

	// QNA 댓글 개수
	public void qnarCount(int prdQnano) throws Exception {
		sqlSession.update("marketMapper.qnareplyCount", prdQnano);
	}

	// 판매자의 QNA 댓글등록시 QNA 답변완료로 변경
	public void qnaStatusUptate(MarketQnaVO marketqnaVO) {
		sqlSession.update("marketMapper.qnaStatus", marketqnaVO);
	}

	public MarketQnaVO qnaSecretDetail(HashMap<String, Object> map) {
		MarketQnaVO result = sqlSession.selectOne("marketMapper.qnaSecretDetail", map);
		return result;
	}
}