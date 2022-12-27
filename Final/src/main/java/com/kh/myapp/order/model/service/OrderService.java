package com.kh.myapp.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.order.model.dao.OrderDao;
import com.kh.myapp.order.model.vo.OrderVO;

@Service
public class OrderService {
	
	  @Autowired
	  private OrderDao dao;

	 //상품디테일에서 구매하기
	public int insertOrder(OrderVO vo) {
		return dao.inserOrder(vo);
	}
}
