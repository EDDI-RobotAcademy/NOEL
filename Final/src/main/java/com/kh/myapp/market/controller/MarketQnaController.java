package com.kh.myapp.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.myapp.market.model.service.MarketQnaService;
import com.kh.myapp.market.model.vo.MarketQnaReplyVO;
import com.kh.myapp.market.model.vo.MarketQnaVO;

@Controller
public class MarketQnaController {

    private static final Logger logger = LoggerFactory.getLogger(MarketQnaController.class);

    @Autowired
    private MarketQnaService qnaService;

    // QnA 상세 & 댓글 상세
    @RequestMapping(value = "/market/qnaDetail", method = RequestMethod.GET)
    public String qnaDetail(MarketQnaVO marketQnaVO, Model model, int prdQnano) throws Exception {
        qnaService.qnaDetail(marketQnaVO.getPrdQnano());
        model.addAttribute("qnadetail", qnaService.qnaDetail(marketQnaVO.getPrdQnano()));
        List<MarketQnaVO> qnareply = null;
        qnareply = qnaService.qnarList(prdQnano);
        model.addAttribute("qnareply", qnareply);

        return "/market/qnaDetail";
    }
    
    // QnA 비밀글 상세 & 댓글 상세
	@RequestMapping(value = "/market/qnaSecretDetail")
	public String qnaSecretDetail(int prdQnano, String prdQnapw, Model model, int prdNo) throws Exception {
		MarketQnaVO qnaPw = qnaService.qnaSecretDetail(prdQnano, prdQnapw);
		if(qnaPw != null) {
			return "redirect:/market/qnaDetail?prdQnano=" + prdQnano;
		}else {
			return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
		}
	}
	 

    // QnA 작성
    @RequestMapping(value = "/market/qnaInsert", method = RequestMethod.POST)
    public String qnaInsert(MarketQnaVO marketqnaVO, Model model, int prdNo, HttpServletRequest request)
            throws Exception {
        int result = qnaService.qnaInsert(marketqnaVO);

        if (result > 0) {
            return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
        }
        return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";

    }

    // QnA 수정
    @RequestMapping(value = "/market/qnaUpdate", method = RequestMethod.POST)
    public String qnaUpdate(MarketQnaVO marketqnaVO, int prdNo) throws Exception {
        qnaService.qnaUpdate(marketqnaVO);
        return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
    }

    // QnA 삭제
    @RequestMapping(value = "/market/qnaDelete")
    public String qnaDelete(MarketQnaVO marketqnaVO, int prdNo) throws Exception {
        qnaService.qnaDelete(marketqnaVO.getPrdQnano());
        return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
    }

    // QnA 리플 작성
    @RequestMapping(value = "/market/qnareply", method = RequestMethod.POST)
    public String qnarInsert(MarketQnaVO marketqnaVO) throws Exception {
        qnaService.qnarInsert(marketqnaVO);
		/* qnaService.qnaStatusUptate(marketqnaVO); */
        return "redirect:/market/qnaDetail?prdQnano=" + marketqnaVO.getPrdQnano();
    }

    // QnA 리플 삭제
    @RequestMapping(value = "/market/qnareplyDelete", method = RequestMethod.GET)
    public String replyDelete(int prdQnano) throws Exception {
        qnaService.qnarDelete(prdQnano);
        return "redirect:/market/qnaDetail?prdQnano=" + prdQnano;
    }

}