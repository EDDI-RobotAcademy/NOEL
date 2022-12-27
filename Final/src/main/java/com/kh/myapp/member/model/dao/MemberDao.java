package com.kh.myapp.member.model.dao;


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
		int result = sqlSession.insert("member.insertMember",m);
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



	public String selectJoinedMember(Member member) {
		return sqlSession.selectOne("member.selectJoinedMember", member);
	}

	public String selectJoinedMarketer(Marketer marketer) {
		return sqlSession.selectOne("marketer.selectJoinedMarketer", marketer);
	}





	


	

}