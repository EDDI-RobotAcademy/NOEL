package com.kh.myapp.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.order.model.dao.OrderDao;
import com.kh.myapp.order.model.vo.OrderVO;

@Service
public class OrderService {

	@Autowired
	private OrderDao dao;

	// 주문 및 결제
	public int orderNext(OrderVO vo) {
		return dao.orderNext(vo);
	}

	// 결제 성공 시 장바구니에서 삭제
	public int deleteCart(String userId) {
		return dao.deleteCart(userId);
	}

	//마켓상세 > 배송완료 상품의 구매평 작성버튼 활성화
	public List<OrderVO> orderlist(Integer prdNo, String bookmarkId) throws Exception {
		return dao.orderlist(prdNo, bookmarkId);
	}
}