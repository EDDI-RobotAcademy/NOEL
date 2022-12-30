package com.kh.myapp.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketWishListController {

    @RequestMapping(value = "/myWishList")
    private String myWishList() {
        return "market/myWishList";
    }
}