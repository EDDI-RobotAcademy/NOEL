package com.kh.myapp.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.myapp.market.model.service.ProductService;
import com.kh.myapp.member.model.service.MemberService;
import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;
import com.kh.myapp.order.model.vo.OrderlistVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/joinFrm")
	public String joinFrm() {
		return "/member/joinFrm";
	}

	@RequestMapping(value = "/loginFrm")
	public String loginFrm() {
		return "/member/loginFrm";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/sj")
	public String selectJoin() {
		return "member/sj";
	}

	@RequestMapping(value = "/marketerJoinFrm")
	public String marketerJoinFrm() {
		return "member/marketerJoinFrm";
	}

	@RequestMapping(value = "/contentModal1")
	public String contentModal1() {
		return "member/contentModal1";
	}

	@RequestMapping(value = "/contentModal2")
	public String contentModal2() {
		return "member/contentModal2";
	}

	@RequestMapping(value = "/searchMemberFrm")
	public String searchMemberFrm() {
		return "member/searchMemberFrm";
	}

	@RequestMapping(value = "/searchIdFrm")
	public String searchIdFrm() {
		return "/member/searchIdFrm";
	}

	@RequestMapping(value = "/searchPwFrm")
	public String searchPwFrm() {
		return "/member/searchPwFrm";
	}

	@RequestMapping(value = "/checkId")
	public String checkId(String checkId, Model model) {
		String userId = service.checkId(checkId);
		if (userId != null) {
			model.addAttribute("result", false);
			model.addAttribute("userId", userId);
			model.addAttribute("checkId", checkId);
		} else {
			model.addAttribute("result", true);
			model.addAttribute("userId", userId);
			model.addAttribute("checkId", checkId);
		}
		return "/member/checkId";
	}

	@RequestMapping(value = "/marketerCheckId")
	public String marketerCheckId(String marketerCheckId, Model model) {
		String marketerId = service.marketerCheckId(marketerCheckId);
		if (marketerId != null) {
			model.addAttribute("result", false);
			model.addAttribute("marketerId", marketerId);
			model.addAttribute("marketerCheckId", marketerCheckId);
		} else {
			model.addAttribute("result", true);
			model.addAttribute("marketerId", marketerId);
			model.addAttribute("marketerCheckId", marketerCheckId);
		}
		return "/member/marketerCheckId";

	}

	@ResponseBody
	@RequestMapping(value = "/memberPhoneCheck")
	public String memberPhoneCheck(String phone, Model model) throws CoolsmsException {

		String api_key = "NCSNIQHLPIYDZDYO";
		String api_secret = "K1LSXUOIGDJERAJWSYDT5TUK8MQAXKJE";
		Message coolsms = new Message(api_key, api_secret);

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", phone); // 수신번호

		set.put("from", "01040753418"); // 발신번호
		set.put("text", "인증번호는 [" + numStr + "]입니다."); // 문자내용
		set.put("type", "sms"); // 문자 타입
		set.put("app_version", "test app 1.2");

		try {
			JSONObject result = coolsms.send(set); // 보내기&전송결과받기

			System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		model.addAttribute("numStr", numStr);
		return numStr;

	}

	@ResponseBody
	@RequestMapping(value = "/marketerPhoneCheck")
	public String ownerPhoneCheck(String phone, Model model) throws CoolsmsException {

		String api_key = "NCSNIQHLPIYDZDYO";
		String api_secret = "K1LSXUOIGDJERAJWSYDT5TUK8MQAXKJE";
		Message coolsms = new Message(api_key, api_secret);

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", phone); // 수신번호

		set.put("from", "01040753418"); // 발신번호
		set.put("text", "인증번호는 [" + numStr + "]입니다."); // 문자내용
		set.put("type", "sms"); // 문자 타입
		set.put("app_version", "test app 1.2");

		try {
			JSONObject result = coolsms.send(set); // 보내기&전송결과받기

			System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		model.addAttribute("numStr", numStr);
		System.out.println(numStr);
		return numStr;

	}

	@RequestMapping(value = "/join")
	public String join(Member m) {
		String inputPw = m.getUserPw();
		String encodePw = pwEncoder.encode(inputPw);
		m.setUserPw(encodePw);
		int result = service.insertMember(m);
		if (result > 0) {
			return "redirect:/";
		} else {
			return "member/joinFrm";
		}
	}

	@RequestMapping(value = "/marketerJoin")
	public String MarkterJoin(Marketer mk) {
		String inputPw = mk.getMarketerPw();
		String encodePw = pwEncoder.encode(inputPw);
		mk.setMarketerPw(encodePw);
		int result = service.insertMarketer(mk);
		if (result > 0) {
			return "redirect:/";
		} else {
			return "member/marketerJoinFrm";
		}
	}

	@RequestMapping(value = "/login")
	public String login(Member member, HttpSession session, HttpServletRequest request) {

		String inputPw = member.getUserPw();
		Member m = service.selectOneMember(member);
		boolean Pwmatches = pwEncoder.matches(inputPw, m.getUserPw());
		if (m != null && Pwmatches == true) {
			session.setAttribute("m", m);
			return "redirect:/";
		} else {
			request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			request.setAttribute("url", "/");
		}
		return "layouts/alert";
	}

	@RequestMapping(value = "/marketerLogin")
	public String marketerLogin(Marketer marketer, HttpSession session, HttpServletRequest request) {
		// JSP로부터 넘겨받은 입력한 비밀번호
		String inputPw = marketer.getMarketerPw();
		// id를 기준으로 정보를 불러와서 Member 객체에 담음
		Marketer mk = service.selectOneMarketer(marketer);

		if (pwEncoder.matches(inputPw, mk.getMarketerPw())) {
			if (mk.getMarketerAuth() == 0) {
				session.setAttribute("mk", mk);
				request.setAttribute("msg", "가입승인 대기 상태입니다.");
				request.setAttribute("url", "/");
				return "layouts/alert";
			} else {
				session.setAttribute("mk", mk);
				return "redirect:/";
			}
		} else {
			request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다. 다시 확인해주세요");
			request.setAttribute("url", "/");
		}
		return "layouts/alert";
	}

	@RequestMapping(value = "/searchNormalId")
	public String searchNormalId(Member m, Model model) {
		String userId = service.searchMemberId(m);
		model.addAttribute("userId", userId);
		if (userId != null) {
			model.addAttribute("result", false);
			model.addAttribute("userId", userId);
		} else {
			model.addAttribute("result", true);
			model.addAttribute("userId", userId);
		}
		return "member/searchIdResult";
	}

	@RequestMapping(value = "/searchMarketerId")
	public String searchMarketerId(Marketer mk, Model model) {
		String marketerId = service.searchMarketerId(mk);
		model.addAttribute("marketerId", marketerId);
		if (marketerId != null) {
			model.addAttribute("result", false);
			model.addAttribute("marketerId", marketerId);
		} else {
			model.addAttribute("result", true);
			model.addAttribute("marketerId", marketerId);
		}
		return "member/searchIdResult";
	}

	@RequestMapping(value = "/searchNormalPw")
	public String searchNormalPw(Member member, Model model) {
		String userId = service.searchNormalPw(member);
		if (userId != null) {
			model.addAttribute("result", false);
			model.addAttribute("userId", userId);
		} else {
			model.addAttribute("result", true);
			model.addAttribute("userId", userId);
		}
		return "member/updateMemberPw";
	}

	@RequestMapping(value = "/updateNormalPw")
	public String updateNormalPw(Member m) {
		String inputPw = m.getUserPw();
		String encodePw = pwEncoder.encode(inputPw);
		m.setUserPw(encodePw);
		int result = service.updatePwMember(m);
		if (result > 0) {
			return "member/updatePwSuccess";
		} else {
			return "/";
		}
	}

	@RequestMapping(value = "/searchMarketerPw")
	public String searchMarketerPw(Marketer marketer, Model model) {
		String marketerId = service.searchMarketerPw(marketer);
		if (marketerId != null) {
			model.addAttribute("result", false);
			model.addAttribute("marketerId", marketerId);
		} else {
			model.addAttribute("result", true);
			model.addAttribute("marketerId", marketerId);

		}
		return "member/updateMarketerPw";
	}

	@RequestMapping(value = "/updateMarketerPw")
	public String updateOwnerPw(Marketer mk) {
		String inputPw = mk.getMarketerPw();
		String encodePw = pwEncoder.encode(inputPw);
		mk.setMarketerPw(encodePw);
		int result = service.updatePwMarketer(mk);
		if (result > 0) {
			return "/member/updatePwSuccess";
		} else {
			return "/";
		}
	}

	// 최고관리자 > 회원관리
	@RequestMapping(value = "/memberManage")
	public String memberManage(Model model, Member m, int reqPage) {
		HashMap<String, Object> map = service.selectMemberList(reqPage);
		/* ArrayList<Notice> ncList = service.myPageNcList(); */
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		/* model.addAttribute("ncList", ncList); */
		return "member/memberManage";
	}

	// 최고관리자 > 업주관리
	@RequestMapping(value = "/adminMemberManage")
	public String adminMemberManage(Model model, Marketer mk, int reqPage) {
		HashMap<String, Object> map = service.selectMarketerList(reqPage);
		/* ArrayList<Notice> ncList = service.myPageNcList(); */
		/* model.addAttribute("ncList", ncList); */
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		return "member/admin";
	}

	// 최고관리자 > 업주관리 > 업주레벨 지정
	@RequestMapping(value = "/updateMarketerLevel")
	public String updateMarketerLevel(String marketerId, Marketer mk, HttpServletRequest request) {
		int result = service.updateMarketerLevel(marketerId, mk);
		if (result > 0) {
			request.setAttribute("msg", "판매자 승인처리가 되었습니다.");
			request.setAttribute("url", "/adminMemberManage?reqPage=1");
			return "layouts/alert";
		} else {
			return "redirect:/";
		}
	}

	// 최고관리자 > 회원관리 > 회원강제 탈퇴
	@RequestMapping(value = "/dropoutMember")
	public String dropoutMember(String userId, Member m, HttpServletRequest request) {
		int result = service.dropoutMember(userId, m);
		if (result > 0) {
			request.setAttribute("msg", "회원을 탈퇴 시켰습니다.");
			request.setAttribute("url", "/memberManage?reqPage=1");
			return "layouts/alert";
		} else {
			return "redirect:/";
		}
	}

	// 최고관리자 > 판매자관리 > 판매자강제 탈퇴
	@RequestMapping(value = "/dropoutMarketer")
	public String dropoutMember(String marketerId, Marketer mk, HttpServletRequest request) {
		int result = service.dropoutMarketer(marketerId, mk);
		if (result > 0) {
			request.setAttribute("msg", "판매자 회원을 탈퇴 시켰습니다.");
			request.setAttribute("url", "/adminMemberManage?reqPage=1");
			return "layouts/alert";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/myPage")
	public String mypage(HttpSession session, HttpServletRequest request, Member member) {
		if (session.getAttribute("m") == null) {
			request.setAttribute("msg", "로그인 후 이용해주세요.");
			request.setAttribute("url", "/");
			return "layouts/alert";
		} else {
			return "member/mypage";
		}
	}

	@RequestMapping(value = "/updateMember")
	public String updateMember(Member m, HttpSession session, HttpServletRequest request) {
		String inputPw = m.getUserPw();
		String encodePw = pwEncoder.encode(inputPw);
		m.setUserPw(encodePw);
		int result = service.updateMember(m);
		if (result > 0) {
			request.setAttribute("msg", "수정 되었습니다. 다시 로그인 해주세요.");
			request.setAttribute("url", "/");
			session.invalidate();
			return "layouts/alert";
		} else {
			request.setAttribute("msg", "error");
			request.setAttribute("url", "member/mypage");
			return "layouts/alert";
		}
	}

	@RequestMapping(value = "/deleteMember")
	public String deleteMember(@RequestParam String userId, HttpServletRequest request) {
		int result = service.deleteMember(userId);
		if (result > 0) {
			return "redirect:/logout";
		} else {
			request.setAttribute("msg", "오류가 발생했습니다. 관리자에게 문의해주세요.");
			request.setAttribute("url", "/");
			return "layouts/alert";
		}
	}

	@RequestMapping(value = "/updateMarketer")
	public String updateMarketer(Marketer mk, HttpSession session, HttpServletRequest request) {
		String inputPw = mk.getMarketerPw();
		String encodePw = pwEncoder.encode(inputPw);
		mk.setMarketerPw(encodePw);
		int result = service.updateMarketer(mk);
		if (result > 0) {
			request.setAttribute("msg", "수정 되었습니다. 다시 로그인 해주세요.");
			request.setAttribute("url", "/");
			session.invalidate();
			return "layouts/alert";
		} else {
			request.setAttribute("msg", "error");
			request.setAttribute("url", "/marketerMypage");
			return "layouts/alert";
		}
	}

	@RequestMapping(value = "/deleteMarketer")
	public String deleteMarketer(@RequestParam String marketerId, HttpServletRequest request) {
		int result = service.deleteMarketer(marketerId);
		if (result > 0) {
			return "redirect:/logout";
		} else {
			request.setAttribute("msg", "오류가 발생했습니다. 관리자에게 문의해주세요.");
			request.setAttribute("url", "/");
			return "layouts/alert";
		}
	}

	// marketerMypage.jsp로 이동
	@RequestMapping(value = "/marketerMypage", method = RequestMethod.GET)
	public String form() {
		return "/member/marketerMypage";
	}

	// 판매자 > 주문관리
	@RequestMapping(value = "market/orderManagementView")
	public String orderManagementView(Model model, OrderlistVO vo, int reqPage, @SessionAttribute Marketer mk)
			throws Exception {

		List<OrderlistVO> list = service.selectAllOrderListPrd(mk.getMarketerId());
		model.addAttribute("list", list);

		/*
		 * String marketerNo = mk.getMarketerId(); HashMap<String, Object> map =
		 * service.selectAllOrderListPrd(reqPage, marketerNo);
		 * 
		 * model.addAttribute("list", map.get("list"));
		 * model.addAttribute("reqPage",reqPage);
		 * model.addAttribute("pageNavi",map.get("pageNavi"));
		 * model.addAttribute("total", map.get("total")); model.addAttribute("pageNo",
		 * map.get("pageNo")); model.addAttribute("marketerNo", marketerNo);
		 */
		return "market/orderManagementView";

	}

	// 판매자 > 주문관리 > 주문내역(모든상품)
	@RequestMapping(value = "market/orderAll")
	public void orderAll(Model model, int reqPage, @SessionAttribute Marketer mk) throws Exception {

		String marketerNo = mk.getMarketerId();
		HashMap<String, Object> map = service.selectAllOrderListMarketer(reqPage, marketerNo);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("marketerNo", marketerNo);

	}

	// 판매자 > 주문관리 > 상품 별 주문내역
	@RequestMapping(value = "market/orderPrd")
	public void orderPrd(OrderlistVO vo, Model model, int reqPage, @SessionAttribute Marketer mk) throws Exception {

		String marketerNo = mk.getMarketerId();
		int prdNo = vo.getPrdNo();
		HashMap<String, Object> map = service.selectOrderPrdListMarketer(reqPage, prdNo);
		String prdName = service.selectPrdName(prdNo);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("prdName", prdName);
		
		
	}

	// 회원 > 주문내역
	@RequestMapping(value = "/userOrderList")
	public String orderList(HttpSession session, int reqPage, Model model) {

		Member m = (Member) session.getAttribute("m");
		String userId = m.getUserId();
		HashMap<String, Object> map = service.selectMyOrderList(reqPage, userId);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("userId", userId);
		model.addAttribute("uidCntList", map.get("uidCnt"));
		return "/member/userOrderList";

	}

	// 판매자 > 주문관리 > 배송상태 지정

	@RequestMapping(value = "/market/updateOrderLevel")
	public String updateOrderLevel(OrderlistVO vo, int prdNo) {
		System.out.println("주문번호" + vo);
		int result = service.updateOrderLevel(vo);
		return "redirect:/market/orderPrd?reqPage=1&prdNo=" + prdNo;
	}

	// 회원 > 주문 취소
	@RequestMapping(value = "/cancleOrder")
	public String cancleOrder(int orderNo, HttpServletRequest request) {
		int result = service.cancleOrder(orderNo);
		System.out.println("컨트롤러:"+orderNo);
		if (result > 0) {
			request.setAttribute("msg", "주문이 취소되었습니다.");
			request.setAttribute("url", "/userOrderList?reqPage=1");
			return "common/alert";
		} else {
			request.setAttribute("msg", "취소 중 문제가 발생했습니다.");
			request.setAttribute("url", "/userOrderList?reqPage=1");
			return "common/alert";
		}
	}

}