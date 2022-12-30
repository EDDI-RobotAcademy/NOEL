package com.kh.myapp.cl.controller;

import com.kh.myapp.cl.model.service.ClassWishlistService;
import com.kh.myapp.cl.model.vo.Wishlist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClassWishlistController {

    @Autowired
    private ClassWishlistService service;

    @ResponseBody
    @RequestMapping(value="/insertClassWishlist", produces = "application/json;charset=utf-8")
    public String insertStoreBookmark(Wishlist wsl) {
        int result = service.insertClassWishlist(wsl);

        if(result > 0) {
            return "1";
        }else {
            return "0";
        }
    }

    @ResponseBody
    @RequestMapping(value="/deleteClassWishlist", produces = "application/json;charset=utf-8")
    public String deleteClassWishlist(Wishlist wsl) {
        int result = service.deleteClassWishlist(wsl);

        if(result > 0) {
            return "1";
        }else {
            return "0";
        }
    }

}
