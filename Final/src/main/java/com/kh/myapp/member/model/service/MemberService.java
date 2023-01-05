package com.kh.myapp.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.member.model.dao.MemberDao;
import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;
import com.kh.myapp.order.model.vo.OrderVO;
import com.kh.myapp.order.model.vo.OrderlistVO;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;


	public String checkId(String checkId) {
		String userId = dao.checkId(checkId);
		return userId;
	}

	public Member pwChkMember(Member member) {
		return dao.pwChkMember(member);
	}


	public int insertMember(Member m) {
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


	//최고관리자 > 회원관리
	public HashMap<String, Object> selectMemberList(int reqPage) {
		int numPerPage = 7;
		int end = numPerPage * reqPage;
		int start = (end-numPerPage)+1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<Member> list = dao.selectMemberList(map);
		int totalPage = dao.countAllMember();
		int totalMan = 0;
		if(totalPage % numPerPage == 0) {
			totalMan = totalPage / numPerPage;
		}else {
			totalMan = totalPage / numPerPage + 1;
		}

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		// 페이지 시작 번호
		int pageNo = 1;

		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지 내비 시작
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/memberManage.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
					"            chevron_left\r\n" +
					"            </span></a>";
		}

		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/memberManage.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalMan) {
				break;
			}
		}

		// 다음버튼
		if(pageNo <= totalMan) {
			pageNavi += "<a href='/memberManage.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
					"            chevron_right\r\n" +
					"            </span></a>";
		}


		HashMap<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("list", list);
		memberMap.put("reqPage", reqPage);
		memberMap.put("pageNavi", pageNavi);
		memberMap.put("total", totalPage);
		memberMap.put("pageNo", pageNo);

		if(list == null) {
			return null;
		}else {
			return memberMap;
		}
	}


	//최고관리자 > 업주관리
	public HashMap<String, Object> selectMarketerList(int reqPage) {
         /*
         ArrayList<Owner> list = dao.selectOwnerList(o);
         return list;
         */
		int numPerPage = 7;
		int end = numPerPage * reqPage;
		int start = (end-numPerPage)+1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<Marketer> list = dao.selectMarketerList(map);
		int totalPage = dao.countAllMarketer();
		int totalMan = 0;
		if(totalPage % numPerPage == 0) {
			totalMan = totalPage / numPerPage;
		}else {
			totalMan = totalPage / numPerPage + 1;
		}

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		// 페이지 시작 번호
		int pageNo = 1;

		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지 내비 시작
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/adminMemberManage.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
					"            chevron_left\r\n" +
					"            </span></a>";
		}

		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/adminMemberManage.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalMan) {
				break;
			}
		}

		// 다음버튼
		if(pageNo <= totalMan) {
			pageNavi += "<a href='/adminMemberManage.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
					"            chevron_right\r\n" +
					"            </span></a>";
		}


		HashMap<String, Object> ownerMap = new HashMap<String, Object>();
		ownerMap.put("list", list);
		ownerMap.put("reqPage", reqPage);
		ownerMap.put("pageNavi", pageNavi);
		ownerMap.put("total", totalPage);
		ownerMap.put("pageNo", pageNo);

		if(list == null) {
			return null;
		}else {
			return ownerMap;
		}

	}

	//최고관리자 > 업주관리 > 업주레벨 지정
	public int updateMarketerLevel(String marketerId, Marketer mk) {
		return dao.updateMarketerLevel(marketerId,mk);
	}

	//최고관리자 > 회원관리 > 회원탈퇴
	public int dropoutMember(String userId, Member m) {
		return dao.dropoutMember(userId,m);
	}
	
	//최고관리자 > 판매자관리 > 판매자탈퇴
	public int dropoutMarketer(String marketer, Marketer mk) {
		return dao.dropoutMarketer(marketer,mk);
	}

	public String searchMemberId(Member m) {
		return dao.searchMemberId(m);
	}

	public String searchMarketerId(Marketer mk) {
		return dao.searchMarketerId(mk);
	}

	public String searchNormalPw(Member member) {
		return dao.searchNormalPw(member);
	}

	public int updatePwMember(Member m) {
		return dao.updatePwMember(m);
	}

	public String searchMarketerPw(Marketer marketer) {
		return dao.searchPwMarketer(marketer);
	}

	public int updatePwMarketer(Marketer mk) {
		return dao.updatePwMarketer(mk);
	}

	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	public int deleteMember(String userId) {
		return dao.deleteMember(userId);
	}

	public int updateMarketer(Marketer mk) {
		return dao.updateMarketer(mk);
	}

	public int deleteMarketer(String marketerId) {
		return dao.deleteMarketer(marketerId);
	}
	
	//판매자 > 주문관리
	public List<OrderlistVO> selectAllOrderListPrd(String marketerId) {
		List result = dao.selectAllOrderListPrd(marketerId);
		return result;
	}

	
	//총 주문수량
	public int orderQuanAll(int prdNo) {
		return dao.orderQuanAll(prdNo);
	}
	
	//판매자 > 주문관리 > 주문 상세내역(모든 주문 건)
	public HashMap<String, Object> selectAllOrderListMarketer(int reqPage, String marketerNo) {

		//한 페이지 당 보여지는 주문건수
		int numPerPage = 10;
		// end = 10
		int end = numPerPage *reqPage;
		//start = 1
		int start = (end-numPerPage)+1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("marketerNo", marketerNo);
		
		ArrayList<OrderVO> list = dao.selectAllOrderList(map);
		
		int totalPage = dao.countAllOrder(marketerNo);
		int totalMan = 0;
		if(totalPage % numPerPage == 0) {
			totalMan = totalPage / numPerPage;
		}else {
			totalMan = totalPage / numPerPage +1;
			
		}
		// 페이지 네비 사이즈
		int pageNaviSize = 5;
		
		// 페이지 시작 번호
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		//이전 버튼 ownerOrderManageFrm
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href='/market/orderManagement?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/market/orderManagement?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalMan) {
				break;
			}
		}
		
		// 다음버튼
		if(pageNo <= totalMan) {
			pageNavi += "<a href='/market/orderManagement?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>"; 
		}

		HashMap<String, Object> orderMap = new HashMap<String, Object>();
		System.out.println("서비스 orderMap : "+orderMap);
		orderMap.put("list", list);
		orderMap.put("reqPage", reqPage);
		orderMap.put("pageNavi", pageNavi);
		orderMap.put("total", totalPage);
		orderMap.put("pageNo", pageNo);
		
		if(list == null) {
			return null;
		}else {
			return orderMap;
		}
		
	}



	







}