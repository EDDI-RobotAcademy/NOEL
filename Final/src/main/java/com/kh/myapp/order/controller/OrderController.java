package com.kh.myapp.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.myapp.order.model.service.OrderService;
import com.kh.myapp.order.model.vo.OrderVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService service;

	@RequestMapping(value = "/insertOrder")
	public String insertOrder(OrderVO vo, Model model) {
		model.addAttribute("Order", vo);
		return "order/order";
	}

}
