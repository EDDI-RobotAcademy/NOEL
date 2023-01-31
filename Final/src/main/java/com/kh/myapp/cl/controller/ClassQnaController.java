package com.kh.myapp.cl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.myapp.cl.model.service.ClassQnaService;
import com.kh.myapp.cl.model.vo.Qna;

@Controller
public class ClassQnaController {

    private static final Logger logger = LoggerFactory.getLogger(ClassQnaController.class);

    @Autowired
    private ClassQnaService qnaService;

    // QnA 상세 & 댓글 상세
    @RequestMapping(value = "/class/qnaDetail", method = RequestMethod.GET)
    public String qnaDetail(Qna qna, Model model, int classQnaNo) throws Exception {
        qnaService.qnaDetail(qna.getClassQnaNo());
        model.addAttribute("qnadetail", qnaService.qnaDetail(qna.getClassQnaNo()));
        List<Qna> qnareply = null;
        qnareply = qnaService.qnarList(classQnaNo);
        model.addAttribute("qnareply", qnareply);

        return "/class/qnaDetail";
    }
    
    // QnA 비밀글 상세 & 댓글 상세
	@RequestMapping(value = "/class/qnaSecretDetail")
	public String qnaSecretDetail(int classQnaNo, String classQnaPw, Model model, int classNo) throws Exception {
		Qna qnaPw = qnaService.qnaSecretDetail(classQnaNo, classQnaPw);
		if(qnaPw != null) {
			return "redirect:/class/qnaDetail?classQnaNo=" + classQnaNo;
		}else {
			return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";
		}
	}
	 

    // QnA 작성
    @RequestMapping(value = "/class/qnaInsert", method = {RequestMethod.GET, RequestMethod.POST})//post
    public String qnaInsert(Qna qna, Model model, int classNo, HttpServletRequest request)
            throws Exception {
        int result = qnaService.qnaInsert(qna);

        if (result > 0) {
            return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";
        }
        return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";

    }

    // QnA 수정
    @RequestMapping(value = "/class/qnaUpdate", method = RequestMethod.POST)
    public String qnaUpdate(Qna qna, int classNo) throws Exception {
        qnaService.qnaUpdate(qna);
        return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";
    }

    // QnA 삭제
    @RequestMapping(value = "/class/qnaDelete")
    public String qnaDelete(Qna qna, int classNo) throws Exception {
        qnaService.qnaDelete(qna.getClassQnaNo());
        return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";
    }

    // QnA 리플 작성
    @RequestMapping(value = "/class/qnareply", method = RequestMethod.POST)
    public String qnarInsert(Qna qna) throws Exception {
        qnaService.qnarInsert(qna);
		/* qnaService.qnaStatusUptate(marketqnaVO); */
        return "redirect:/class/qnaDetail?classQnaNo=" + qna.getClassQnaNo();
    }

    // QnA 리플 삭제
    @RequestMapping(value = "/class/qnareplyDelete", method = RequestMethod.GET)
    public String replyDelete(int classQnaNo) throws Exception {
        qnaService.qnarDelete(classQnaNo);
        return "redirect:/class/qnaDetail?classQnaNo=" + classQnaNo;
    }

}