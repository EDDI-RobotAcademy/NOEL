package com.kh.myapp.member.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.MarketQnaVO;
import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;
import com.kh.myapp.order.model.vo.OrderVO;
import com.kh.myapp.order.model.vo.OrderlistVO;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String checkId(String checkId) {
		String userId = sqlSession.selectOne("member.checkId",checkId);
		return userId;
	}
	public Member pwChkMember(Member member) {
		return sqlSession.selectOne("member.pwChkMember", member);
	}

	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember", m);
		return result;
	}

	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		return m;
	}

	public int insertMarketer(Marketer mk) {
		int result = sqlSession.insert("marketer.insertMarketer",mk);
		return result;
	}

	public String marketerCheckId(String marketerCheckId) {
		String marketerId = sqlSession.selectOne("marketer.marketerCheckId", marketerCheckId);
		return marketerId;
	}

	public Marketer selectOneMarketer(Marketer marketer) {
		Marketer mk = sqlSession.selectOne("marketer.selectOneMarketer", marketer);
		return mk;
	}
	//최고관리자 > 회원관리
	public ArrayList<Member> selectMemberList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.memberList", map);
		return (ArrayList<Member>) list;
	}
	//최고관리자 > 회원관리 (전체회원수 조회)
	public int countAllMember() {
		return sqlSession.selectOne("member.countAllMember");
	}

	//최고관리자>업주관리
	public ArrayList<Marketer> selectMarketerList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("marketer.marketerList", map);
		return (ArrayList<Marketer>) list;
	}

	//최고관리자 > 업주관리 (전체 업주수 조회)
	public int countAllMarketer() {
		return sqlSession.selectOne("marketer.countAllMarketer");
	}

	//최고관리자 > 업주관리 > 업주레벨 지정
	public int updateMarketerLevel(String marketerId, Marketer mk) {
		int result = sqlSession.update("marketer.updateLevel", mk);
		return result;
	}

	//최고관리자 > 회원관리 > 회원탈퇴
	public int dropoutMember(String userId, Member m) {
		int result = sqlSession.delete("member.dropout", m);
		return result;
	}
	
	//최고관리자 > 판매자관리 > 판매자탈퇴
	public int dropoutMarketer(String marketer, Marketer mk) {
		int result = sqlSession.delete("marketer.dropout", mk);
		return result;
	}

	public String searchMemberId(Member m) {
		return sqlSession.selectOne("member.searchMemberId",m);
	}

	public String searchMarketerId(Marketer mk) {
		return sqlSession.selectOne("marketer.searchMarketerId", mk);
	}

	public String searchNormalPw(Member member) {
		return sqlSession.selectOne("member.searchNormalPw", member);
	}

	public int updatePwMember(Member m) {
		return sqlSession.update("member.updateMember", m);
	}

	public String searchPwMarketer(Marketer marketer) {
		return sqlSession.selectOne("marketer.searchMarketerPw",marketer);
	}

	public int updatePwMarketer(Marketer mk) {
		return sqlSession.update("marketer.updatePwMarketer",mk);
	}

	public int updateMember(Member m) {
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}

	public int deleteMember(String userId) {
		return sqlSession.delete("member.deleteMember", userId);
	}

	public int updateMarketer(Marketer mk) {
		int result = sqlSession.update("marketer.updatePwMarketer", mk);
		return result;
	}
	public int deleteMarketer(String marketerId) {
		return sqlSession.delete("marketer.deleteMarketer", marketerId);

	}

	//판매자 > 주문관리
	public List selectAllOrderListPrd(String marketerId) {
		return sqlSession.selectList("order.selectAllOrderListPrd",marketerId);
	}
	
	// 판매자 > 주문관리 > 주문 총 갯수
		public int countAllOrder(String marketerId) {
			return sqlSession.selectOne("order.AllOrderListMarketer",marketerId);
		}
		
	// 판매자 > 주문관리 > 주문 상품 별 갯수
	public int countOrderPrd(int prdNo) {
		return sqlSession.selectOne("order.PrdOrderListMarketer",prdNo);
	}
	
	//판매자 > 주문관리 > 주문 상세내역(모든 주문 건)
	public ArrayList<OrderVO> selectAllOrderList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("order.selectAllOrderList",map);
		return (ArrayList<OrderVO>) list;
	}
	
	//판매자 > 주문관리, 총 주문수량
	public int orderQuanAll(int prdNo) {
		return sqlSession.selectOne("order.orderQuanAll",prdNo);
	}
	
	//판매자 > 주문관리 > 주문 상세내역(상품 별)
	public ArrayList<OrderVO> selectOrderPrdList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("order.selectOrderPrdList",map);
		return (ArrayList<OrderVO>) list;
	}
	
	//판매자 > 주문관리 > 배송상태 지정
	public int updateOrderLevel(OrderlistVO vo) {
		int result = sqlSession.update("order.updateOrder", vo);
		return result;
	}
	
	
	//회원 > 주문관리
	public ArrayList<OrderVO> selectMyOrderList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("order.selectMyOrderList", map);
		return (ArrayList<OrderVO>) list;
	}
	//회원 > 주문관리, 총 주문수량
	public int countMyOrderList(String userId) {
		return sqlSession.selectOne("order.countMyOrderList", userId) ;
	}
	//회원 > 주문관리 uid 개수
	public ArrayList<OrderVO> uidCnt(String userId) {
		List list = sqlSession.selectList("order.uidCnt", userId);
		return null;
	}
	
	//회원 > 주문관리 > 주문취소
	public int cancleOrder(int orderNo) {
		return sqlSession.update("order.cancleOrder", orderNo);
	}
	
	//판매자 > 주문관리 > 주문 상세 (상품명 조회) 
	public String selectPrdName(int prdNo) {
		String result = sqlSession.selectOne("order.selectPrdName", prdNo);
		return result;
	}
	// 판매자 > 주문관리 > 검색
	public ArrayList<OrderlistVO> searchMarketerList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("order.searchOrderListMarketer",map);
		return (ArrayList<OrderlistVO>) list;
	}
	
	// 판매자 > 주문관리 > 검색 > 총개수
	public int searchOrderMarketerListCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("order.searchOrderMarketerListCount", map);
		return result;
	}
	
	//최고관리자 > 업주관리 > 검색기능
	public ArrayList<Marketer> searchMarketer(HashMap<String, Object> map) {
		List list = sqlSession.selectList("marketer.searchMarketer",map);
		return (ArrayList<Marketer>) list;
	}
	
	//최고관리자 > 업주관리  > 검색기능 (글 개수 조회)
	public int searchMarketerCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("marketer.searchMarketerCount", map);
		return result;
	}
	
	//최고관리자 > 회원관리 > 검색기능
	public ArrayList<Member> searchMember(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.searchMember",map);
		return (ArrayList<Member>) list;
		}
	
	//최고관리자 > 회원관리 > 검색기능 (글 개수 조회)
	public int searchMemberCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("member.searchMemberCount", map);
		return result;
	}
	
	// 회원 > QnA
	public ArrayList<MarketQnaVO> memberQna(HashMap<String, Object> map) {
		List list = sqlSession.selectList("marketMapper.memberQna", map);
		return (ArrayList<MarketQnaVO>) list;
	}
	// 회원 > QnA 개수
	public int countmemberQna(String userId) {
		return sqlSession.selectOne("marketMapper.countmemberQna", userId) ;
	}
	
	//판매자 > 주문관리 > 주문상세 > 배송상세
	public List shippingDetail(int orderNo) {
		return sqlSession.selectList("order.shippingDetail", orderNo);
	}

	
}