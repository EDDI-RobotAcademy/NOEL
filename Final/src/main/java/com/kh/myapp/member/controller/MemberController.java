package com.kh.myapp.member.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.myapp.member.model.service.MemberService;
import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/home.do")
	public String hoemFrm() {
		return "home";
	}

	@RequestMapping(value = "/joinFrm.do")
	public String joinFrm() {
		return "/member/joinFrm";
	}

	@RequestMapping(value = "/loginFrm.do")
	public String loginFrm() {
		return "/member/loginFrm";
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/sj.do")
	public String selectJoin() {
		return "member/sj";
	}

	@RequestMapping(value = "/marketerJoinFrm.do")
	public String marketerJoinFrm() {
		return "member/marketerJoinFrm";
	}

	@RequestMapping(value = "/mypage.do")
	public String mypage(HttpSession session, HttpServletRequest request, Member member) {
		if (session.getAttribute("m") == null) {
			request.setAttribute("msg", "로그인 후 이용해주세요.");
			request.setAttribute("url", "/home.do");
			return "layouts/alert";
		} else {
			return "member/mypage";
		}
	}

	@RequestMapping(value = "/checkId.do")
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

	@RequestMapping(value = "/marketerCheckId.do")
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

	@RequestMapping(value = "/join.do")
	public String join(Member m) {
		int result = service.insertMember(m);
		if (result > 0) {
			return "redirect:/";
		} else {
			return "member/joinFrm";
		}
	}

	@RequestMapping(value = "/marketerJoin.do")
	public String MarkterJoin(Marketer mk) {
		int result = service.insertMarketer(mk);
		if (result > 0) {
			return "redirect:/";
		} else {
			return "member/marketerJoinFrm";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/memberPhoneCheck.do")
	public String memberPhoneCheck(String phone, Model model) throws CoolsmsException {
		
		  String api_key = "NCSNIQHLPIYDZDYO";
		  String api_secret = "K1LSXUOIGDJERAJWSYDT5TUK8MQAXKJE";
		  Message coolsms = new Message(api_key, api_secret);
		  
		  Random rand = new Random(); 
		  String numStr = "";
		  	for(int i=0; i<4; i++) {
		  		String ran = Integer.toString(rand.nextInt(10)); 
				numStr += ran;
			}
		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", phone); // 수신번호

		  set.put("from", "01040753418"); // 발신번호
		  set.put("text","인증번호는 [" + numStr + "]입니다."); // 문자내용
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
	@RequestMapping(value="/marketerPhoneCheck.do")
	public String ownerPhoneCheck(String phone, Model model) throws CoolsmsException {
		
		  String api_key = "NCSNIQHLPIYDZDYO";
		  String api_secret = "K1LSXUOIGDJERAJWSYDT5TUK8MQAXKJE";
		  Message coolsms = new Message(api_key, api_secret);
		  
		  Random rand = new Random(); 
		  String numStr = "";
		  for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10)); 
			numStr += ran;
		  }
		  
		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", phone); // 수신번호

		  set.put("from", "01040753418"); // 발신번호
		  set.put("text", numStr); // 문자내용
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

	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session, HttpServletRequest request) {
		Member m = service.selectOneMember(member);
		/* System.out.println("/login.do 실행" + member + m); */
		
		
		/*
		 * if(pwEncoder.matches(member.getUserPw(), m.getUserPw())) {
		 * 
		 * }
		 */
		 
		if(m != null) {
				session.setAttribute("m", m);
				return "redirect:/";
		}else {
			String memberId = service.selectJoinedMember(member);
			if (memberId == null) {
				request.setAttribute("msg", "가입된 회원이 아닙니다.");
				request.setAttribute("url", "/home.do");
			} else {
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				request.setAttribute("url", "/home.do");
			}
			return "layouts/alert";
		}
	}

	@RequestMapping(value = "/marketerLogin.do")
	public String marketerLogin(Marketer marketer, HttpSession session, HttpServletRequest request) {
		Marketer mk = service.selectOneMarketer(marketer);
		if (mk != null) {
			if (mk.getMarketerAuth() == 0) {
				session.setAttribute("mk", mk);
				request.setAttribute("msg", "가입승인 대기 상태입니다.");
				request.setAttribute("url", "/home.do");
				return "layouts/alert";
			} else {
				session.setAttribute("mk", mk);
				return "redirect:/";
			}
		} else {
			String marketerId = service.selectJoinedMarketer(marketer);
			if (marketerId == null) {
				request.setAttribute("msg", "가입된 회원이 아닙니다.");
				request.setAttribute("url", "/loginFrm.do");
			} else {
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				request.setAttribute("url", "/loginFrm.do");
			}
			return "layouts/alert";
		}
		
	}

}
