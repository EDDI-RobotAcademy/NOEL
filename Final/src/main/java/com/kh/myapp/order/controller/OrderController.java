package com.kh.myapp.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.myapp.member.model.vo.Member;
import com.kh.myapp.order.model.service.OrderService;
import com.kh.myapp.order.model.vo.OrderVO;

@Controller
public class OrderController {

    @Autowired
    private OrderService service;

    //상품 디테일 → 구매하기 → 배송지 입력
    @RequestMapping(value = "/insertOrder")
    public String insertOrder(OrderVO vo, Model model) {
        model.addAttribute("Order", vo);
        return "order/order";
    }

    //상품 디테일 → 구매하기 → 배송지 입력 → 주문 및 결제
    @RequestMapping(value="/orderDirect")
    public String orderDirect(OrderVO vo, String shippingAddr1, String shippingAddr2) {
        vo.setShippingAddr(shippingAddr1 + "*" + shippingAddr2);
        int result = service.orderNext(vo);
        return "order/ordercomplete";
    }

    //장바구니 → 주문 및 결제
    @RequestMapping(value = "/ordercartNext")
    public String ordercartNext(OrderVO vo, String shippingAddr1, String shippingAddr2, int[] prdNo1, int[] orderQuan1, @SessionAttribute Member m) {
        vo.setShippingAddr(shippingAddr1 + "*" + shippingAddr2);
        int result =0;
        for (int i = 0; i < prdNo1.length; i++) {
            vo.setPrdNo(prdNo1[i]);
            vo.setOrderQuan(orderQuan1[i]);
            result = service.orderNext(vo);
        }
        //결제 성공 시 장바구니에서 삭제
        if(result > 0) {
            int deleteResult = service.deleteCart(m.getUserId());
        }

        return "order/ordercomplete";
    }


}