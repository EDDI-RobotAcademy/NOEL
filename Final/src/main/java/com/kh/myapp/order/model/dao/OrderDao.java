package com.kh.myapp.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.cart.model.vo.CartVO;
import com.kh.myapp.order.model.vo.OrderVO;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sql;

	// 주문 및 결제
	public int orderNext(OrderVO vo) {
		return sql.insert("order.nextOrder", vo);
	}

	// 결제 성공 시 장바구니에서 삭제
	public int deleteCart(String userId) {
		return sql.delete("order.deleteCartAll", userId);
	}

	//마켓상세 > 배송완료 상품의 구매평 작성버튼 활성화
	public List<OrderVO> orderlist(Integer prdNo, String bookmarkId)  throws Exception {
		HashMap data = new HashMap();
		
		data.put("prdNo", prdNo);
		data.put("bookmarkId", bookmarkId);
		
		return sql.selectList("order.selectOrder", data);
	}


}