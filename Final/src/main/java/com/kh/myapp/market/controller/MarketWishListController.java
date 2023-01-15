package com.kh.myapp.market.controller;

import com.kh.myapp.market.model.service.MarketWishService;
import com.kh.myapp.market.model.vo.MarketWishVO;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MarketWishListController {

	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private MarketWishService service;
	
    
    @ResponseBody
    @RequestMapping(value="/insertMarketWish", produces = "application/json;charset=utf-8")
    public String insertMarketWish(MarketWishVO marketwish) {
        int result = service.insertMarketWish(marketwish);

        if(result > 0) {
            return "1";
        }else {
            return "0";
        }
    }

    @ResponseBody
    @RequestMapping(value="/deleteMarketWish", produces = "application/json;charset=utf-8")
    public String deleteMarketWish(MarketWishVO marketwish) {
        int result = service.deleteMarketWish(marketwish);

        if(result > 0) {
            return "1";
        }else {
            return "0";
        }
    }

    //마이페이지 위시리스트(마켓)
    @RequestMapping(value = "/myPrdWishList")
    private String myPrdWishList(String bookmarkId, int reqPage, Model model) {
    	HashMap<String, Object> map = service.myPrdWishList(bookmarkId, reqPage);
    	
    	if(map == null) {
    		model.addAttribute("msg", "등록된 위시 상품이 없습니다.");
			/* System.out.println("null"); */
    		return "market/myPrdWishList";
    	}else {
    		model.addAttribute("list", map.get("list"));
    		model.addAttribute("pageNavi", map.get("pageNavi"));
			/* System.out.println(map.get("list")); */	
    		return "market/myPrdWishList";
    	}
    }
    
    @ResponseBody
	@RequestMapping(value="/deletePrdWishList", produces = "application/json;charset=utf-8")
	public String deletPrdWishList(int prdNo) {
    	int result = service.deletePrdWishList(prdNo);
    	
    	if(result > 0) {
            return "1";
        }else {
            return "0";
        }
    }
}
