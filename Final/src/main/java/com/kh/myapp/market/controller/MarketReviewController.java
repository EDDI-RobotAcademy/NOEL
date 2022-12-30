package com.kh.myapp.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.myapp.market.model.service.MarketReviewService;
import com.kh.myapp.market.model.vo.MarketReviewVO;
import com.kh.myapp.market.model.vo.ProductVO;

@Controller
public class MarketReviewController {

    private static final Logger logger = LoggerFactory.getLogger(MarketReviewController.class);

    @Autowired
    private MarketReviewService reviewService;

    // 리뷰 작성
    @RequestMapping(value = "/market/reviewInsert", method = RequestMethod.POST)
    public String reviewInsert(MarketReviewVO marketreviewVO, Model model, int prdNo, HttpServletRequest request)
            throws Exception {
        logger.info("리뷰 작성");

        int result = reviewService.reviewInsert(marketreviewVO);

        if (result > 0) {
            return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
        }
        return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
    }

    // 리뷰 상세
    @RequestMapping(value = "/market/reviewDetail", method = RequestMethod.GET)
    public String reivewDetail(MarketReviewVO marketReviewVO, Model model, int prdReviewno) throws Exception {
        logger.info("리뷰 상세조회");
        reviewService.reviewDetail(marketReviewVO.getPrdReviewno());
        model.addAttribute("reviewdetail", reviewService.reviewDetail(marketReviewVO.getPrdReviewno()));
        return "/market/reviewDetail";
    }

    // 리뷰 수정
    @RequestMapping(value = "/market/reviewUpdate", method = RequestMethod.POST)
    public String reviewUpdate(MarketReviewVO marketReviewVO, int prdNo) throws Exception {
        logger.info("리뷰 수정");
        reviewService.reviewUpdate(marketReviewVO);
        return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
    }

    // 리뷰 삭제
    @RequestMapping(value = "/market/reviewDelete")
    public String reviewDelete(MarketReviewVO marketReviewVO, int prdNo) throws Exception {
        logger.info("리뷰 삭제");
        reviewService.reviewDelete(marketReviewVO.getPrdReviewno());
        return "redirect:/marketDetailView?reqPage=1&prdNo=" + prdNo + "&rnum=1&qnum=1";
    }
}