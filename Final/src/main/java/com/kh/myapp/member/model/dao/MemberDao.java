package com.kh.myapp.member.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;

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







}