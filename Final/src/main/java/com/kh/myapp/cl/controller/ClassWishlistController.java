package com.kh.myapp.cl.controller;

import com.kh.myapp.cl.model.service.ClassWishlistService;
import com.kh.myapp.cl.model.vo.Wishlist;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
  //마이페이지 위시리스트(클래스)
    @RequestMapping(value = "/myClassWishList")
    private String myPrdWishList(String bookmarkId, int reqPage, Model model) {
    	HashMap<String, Object> map = service.myClassWishList(bookmarkId, reqPage);
    	
    	if(map == null) {
    		model.addAttribute("msg", "등록된 위시 상품이 없습니다.");
    		return "class/myClassWishList";
    	}else {
    		model.addAttribute("list", map.get("list"));
    		model.addAttribute("pageNavi", map.get("pageNavi"));
    		return "class/myClassWishList";
    	}
    }
    
    @ResponseBody
 	@RequestMapping(value="/deleteClassWishList", produces = "application/json;charset=utf-8")
 	public String deletPrdWishList(int classNo) {
     	int result = service.deleteClassWishList(classNo);
     	
     	if(result > 0) {
             return "1";
         }else {
             return "0";
         }
     }

}
