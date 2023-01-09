package com.kh.myapp.cart.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.myapp.cart.model.service.CartService;
import com.kh.myapp.cart.model.vo.CartVO;
import com.kh.myapp.member.model.vo.Member;


@Controller
public class CartController {

    @Autowired
    private CartService service;

    // 상품 상세 페이지에서 장바구니 클릭(삽입, 수정)
    @RequestMapping(value = "/insertCart")
    public String insertCart(CartVO vo, Model model) {

        CartVO cart = service.searchCart(vo);
        if (cart == null) {
            int result = service.insertCart(vo);
        } else {
            cart.setCartQuan(vo.getCartQuan());
            int result = service.updateCart(cart);
        }
        return "redirect:/Cart?userId="+vo.getUserId();

    }

    //헤더에서 장바구니
    @RequestMapping(value = "/Cart")
    public String cart(Model model, CartVO vo, @SessionAttribute Member m) {
        ArrayList<CartVO> list = service.cartList(m.getUserId());
        model.addAttribute("list", list);
        return "cart/cart";
    }

    //장바구니 삭제
    @RequestMapping(value="/deleteCart")
    public String deleteCart(String delCartArr, String userId) {
        boolean result = service.deleteCart(delCartArr, userId);
        return "redirect:Cart?userId=" + userId;

    }

    //장바구니에서 구매하기
    @RequestMapping(value = "/ordercart")
    public String ordercart(Model model, String userId) {
        System.out.println(userId);
        ArrayList<CartVO> list = service.ordercart(userId);
        model.addAttribute("list", list);
        return "order/ordercart";
    }
}