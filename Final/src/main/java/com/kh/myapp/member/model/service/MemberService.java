package com.kh.myapp.member.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.myapp.member.model.dao.MemberDao;
import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	public String checkId(String checkId) {
		String userId = dao.checkId(checkId);
		return userId;
	}
	
	public Member pwChkMember(Member member) {
		return dao.pwChkMember(member);
	}


	public int insertMember(Member m) {
		m.setUserPw(pwEncoder.encode(m.getUserPw()));
		return dao.insertMember(m);
	}

	public Member selectOneMember(Member member) {
	
		Member m = dao.selectOneMember(member);
		
		return m;
	}

	public int insertMarketer(Marketer mk) {
		return dao.insertMarketer(mk);
	}

	public String marketerCheckId(String marketerCheckId) {
		String marketerId = dao.marketerCheckId(marketerCheckId);
		return marketerId;
	}

	public Marketer selectOneMarketer(Marketer marketer) {
		Marketer mk = dao.selectOneMarketer(marketer);
		return mk;
	}
	
	public String selectJoinedMember(Member member) {
		return dao.selectJoinedMember(member);
	}

	public String selectJoinedMarketer(Marketer marketer) {
		return dao.selectJoinedMarketer(marketer);
	}
	
}