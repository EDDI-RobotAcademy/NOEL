package com.kh.myapp.member.controller;

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
		set.put("to", phone); // ????????????

		set.put("from", "01040753418"); // ????????????
		set.put("text", "??????????????? [" + numStr + "]?????????."); // ????????????
		set.put("type", "sms"); // ?????? ??????
		set.put("app_version", "test app 1.2");

		try {
			JSONObject result = coolsms.send(set); // ?????????&??????????????????

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
		set.put("to", phone); // ????????????

		set.put("from", "01040753418"); // ????????????
		set.put("text", "??????????????? [" + numStr + "]?????????."); // ????????????
		set.put("type", "sms"); // ?????? ??????
		set.put("app_version", "test app 1.2");

		try {
			JSONObject result = coolsms.send(set); // ?????????&??????????????????

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
		
		boolean Pwmatches = false;
		
		if (m != null) {
			Pwmatches = pwEncoder.matches(inputPw, m.getUserPw());
		}
		if (Pwmatches == true) {
			session.setAttribute("m", m);
			return "redirect:/";
		} else {
			request.setAttribute("msg", "????????? ?????? ??????????????? ???????????? ????????????. ?????? ??????????????????.");
			request.setAttribute("url", "/");
		}
		return "layouts/alert";
	}

	@RequestMapping(value = "/marketerLogin")
	public String marketerLogin(Marketer marketer, HttpSession session, HttpServletRequest request) {
		// JSP????????? ???????????? ????????? ????????????
		String inputPw = marketer.getMarketerPw();
		// id??? ???????????? ????????? ???????????? Member ????????? ??????
		Marketer mk = service.selectOneMarketer(marketer);
		
		boolean pwMatches = false;
		
		if (mk != null) {
			pwMatches = pwEncoder.matches(inputPw, mk.getMarketerPw());
		}
		
		if (pwMatches == true) {
			if (mk.getMarketerAuth() == 0) {
				session.setAttribute("mk", mk);
				request.setAttribute("msg", "???????????? ?????? ???????????????.");
				request.setAttribute("url", "/");
				return "layouts/alert";
			} else {
				session.setAttribute("mk", mk);
				return "redirect:/";
			}
		} else {
			request.setAttribute("msg", "????????? ?????? ??????????????? ???????????? ????????????. ?????? ??????????????????");
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

	// ??????????????? > ????????????
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

	// ??????????????? > ????????????
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

	// ??????????????? > ???????????? > ???????????? ??????
	@RequestMapping(value = "/updateMarketerLevel")
	public String updateMarketerLevel(String marketerId, Marketer mk, HttpServletRequest request) {
		int result = service.updateMarketerLevel(marketerId, mk);
		if (result > 0) {
			request.setAttribute("msg", "????????? ??????????????? ???????????????.");
			request.setAttribute("url", "/adminMemberManage?reqPage=1");
			return "layouts/alert";
		} else {
			return "redirect:/";
		}
	}

	// ??????????????? > ???????????? > ???????????? ??????
	@RequestMapping(value = "/dropoutMember")
	public String dropoutMember(String userId, Member m, HttpServletRequest request) {
		int result = service.dropoutMember(userId, m);
		if (result > 0) {
			request.setAttribute("msg", "????????? ?????? ???????????????.");
			request.setAttribute("url", "/memberManage?reqPage=1");
			return "layouts/alert";
		} else {
			return "redirect:/";
		}
	}

	// ??????????????? > ??????????????? > ??????????????? ??????
	@RequestMapping(value = "/dropoutMarketer")
	public String dropoutMember(String marketerId, Marketer mk, HttpServletRequest request) {
		int result = service.dropoutMarketer(marketerId, mk);
		if (result > 0) {
			request.setAttribute("msg", "????????? ????????? ?????? ???????????????.");
			request.setAttribute("url", "/adminMemberManage?reqPage=1");
			return "layouts/alert";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/myPage")
	public String mypage(HttpSession session, HttpServletRequest request, Member member) {
		if (session.getAttribute("m") == null) {
			request.setAttribute("msg", "????????? ??? ??????????????????.");
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
			request.setAttribute("msg", "?????? ???????????????. ?????? ????????? ????????????.");
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
			request.setAttribute("msg", "????????? ??????????????????. ??????????????? ??????????????????.");
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
			request.setAttribute("msg", "?????? ???????????????. ?????? ????????? ????????????.");
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
			request.setAttribute("msg", "????????? ??????????????????. ??????????????? ??????????????????.");
			request.setAttribute("url", "/");
			return "layouts/alert";
		}
	}

	// marketerMypage.jsp??? ??????
	@RequestMapping(value = "/marketerMypage", method = RequestMethod.GET)
	public String form() {
		return "/member/marketerMypage";
	}
	
	//??????????????? > ??????????????? > ??????????????????
	@RequestMapping(value="/searchMarketer")
	public String searchOwner(String type, String keyword,int reqPage, Model model){
		HashMap<String, Object> list = service.searchMarketer(type,keyword, reqPage);
		model.addAttribute("list", list.get("list"));
		model.addAttribute("pageNavi", list.get("pageNavi"));
		return "member/admin";
	}
	
	//??????????????? > ???????????? > ????????????
	@RequestMapping(value="/searchMember")
	public String searchMember(String type, String keyword,int reqPage, Model model){
		HashMap<String, Object> list = service.searchMember(type,keyword,reqPage);
		model.addAttribute("list", list.get("list"));
		model.addAttribute("pageNavi", list.get("pageNavi"));
		return "member/memberManage";
	}
	
	// ????????? > ????????????
	@RequestMapping(value = "market/orderManagementView")
	public String orderManagementView(Model model, OrderlistVO vo, int reqPage, @SessionAttribute Marketer mk)
			throws Exception {
		List<OrderlistVO> list = service.selectAllOrderListPrd(mk.getMarketerId());
		model.addAttribute("list", list);
		return "market/orderManagementView";

	}

	// ????????? > ???????????? > ????????????(????????????)
	@RequestMapping(value = "market/orderAll")
	public void orderAll(Model model, int reqPage, @SessionAttribute Marketer mk) throws Exception {

		String marketerId = mk.getMarketerId();
		HashMap<String, Object> map = service.selectAllOrderListMarketer(reqPage, marketerId);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("marketerId", marketerId);

	}

	// ????????? > ???????????? > ?????? ??? ????????????
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

	// ?????? > ????????????
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

	// ????????? > ???????????? > ???????????? ??????(?????????)
	@RequestMapping(value = "/market/updateOrderLevel")
	public String updateOrderLevel(OrderlistVO vo, int orderNo) {
		vo.setOrderNo(orderNo);
		int result = service.updateOrderLevel(vo);
		int prdNo = vo.getPrdNo();
		return "redirect:/market/orderPrd?reqPage=1&prdNo=" + prdNo;
	}

	// ?????? > ?????? ??????
	@RequestMapping(value = "/cancleOrder")
	public String cancleOrder(int orderNo, HttpServletRequest request) {
		int result = service.cancleOrder(orderNo);
		if (result > 0) {
			request.setAttribute("msg", "????????? ?????????????????????.");
			request.setAttribute("url", "/userOrderList?reqPage=1");
			return "common/alert";
		} else {
			request.setAttribute("msg", "?????? ??? ????????? ??????????????????.");
			request.setAttribute("url", "/userOrderList?reqPage=1");
			return "common/alert";
		}
	}
	
	// ????????? > ???????????? > ???????????? ??????(?????? ??????)
		@RequestMapping(value = "/market/updateOrderAllLevel")
		public String updateOrderAllLevel(OrderlistVO vo, int orderNo) {
			vo.setOrderNo(orderNo);
			int result = service.updateOrderLevel(vo);
			return "redirect:/market/orderAll?reqPage=1";
		}
		//????????? > ???????????? > ???????????? >??????
		@RequestMapping(value = "/searchPrdMarketerList")
		public String searchPrdMarketerList(OrderlistVO vo, Model model,int reqPage, @SessionAttribute Marketer mk, String type, String keyword ) {
			String marketerId = vo.getMarketerId();
			HashMap<String, Object> map = service.searchOrderMarketerList(marketerId, type, keyword, reqPage);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageNavi", map.get("pageNavi"));
			
			return "market/orderPrd";
		}

		//????????? > ???????????? > ???????????? > ??????
	@RequestMapping(value = "/searchOrderMarketerList")
	public String searchOrderMarketerList(OrderlistVO vo, Model model,int reqPage, @SessionAttribute Marketer mk, String type, String keyword ) {
		String marketerId = vo.getMarketerId();
		HashMap<String, Object> map = service.searchOrderMarketerList(marketerId, type, keyword, reqPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageNavi", map.get("pageNavi"));
		
		return "market/orderAll";
	}
	
	// ?????? > QnA
	@RequestMapping(value = "/memberQna")
	public String memberQna(HttpSession session, int reqPage, Model model) {

		Member m = (Member) session.getAttribute("m");
		String userId = m.getUserId();
		HashMap<String, Object> map = service.memberQna(reqPage, userId);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("userId", userId);
		
		return "/member/memberQna";
	}
	
	// ?????? > QnA > ?????????
	@RequestMapping(value = "/memberClassQna")
	public String memberClassQna(HttpSession session, int reqPage, Model model) {

		Member m = (Member) session.getAttribute("m");
		String userId = m.getUserId();
		HashMap<String, Object> map = service.memberClassQna(reqPage, userId);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("userId", userId);
		
		return "/member/memberClassQna";
	}
	
	// ????????? > QnA > ??????
	@RequestMapping(value = "/marketerProductQna")
	public String marketerProductQna(HttpSession session, int reqPage, Model model) {
		
		Marketer mk = (Marketer) session.getAttribute("mk");
		String marketerId = mk.getMarketerId();
		HashMap<String, Object> map = service.marketerProductQna(reqPage, marketerId);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("marketerId", marketerId);
		
		return "/member/marketerProductQna";
	}
	
	// ????????? > QnA > ?????????
	@RequestMapping(value = "/marketerClassQna")
	public String marketerClassQna(HttpSession session, int reqPage, Model model) {

		Marketer mk = (Marketer) session.getAttribute("mk");
		String marketerId = mk.getMarketerId();
		HashMap<String, Object> map = service.marketerClassQna(reqPage, marketerId);

		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("marketerId", marketerId);
		
		return "/member/marketerClassQna";
		
		
	}
	
	//????????? > ???????????? > ???????????? > ????????????
	@RequestMapping(value = "market/shippingDetail" )
	public void shippingDetail(OrderlistVO vo,Model model, int orderNo) throws Exception {
		vo.setOrderNo(orderNo);
		List list = service.shippingDetail(orderNo);
		model.addAttribute("list",list);
		model.addAttribute("orderNo",orderNo);
	}
}