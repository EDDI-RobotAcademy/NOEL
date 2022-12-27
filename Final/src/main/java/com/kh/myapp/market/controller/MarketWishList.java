package com.kh.myapp.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketWishList {

	@RequestMapping(value = "/myWishList")
	private String myWishList() {
		// TODO Auto-generated method stub
		return "market/myWishList";
	}
}
