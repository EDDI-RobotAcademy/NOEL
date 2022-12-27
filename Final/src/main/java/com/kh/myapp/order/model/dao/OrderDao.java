package com.kh.myapp.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.order.model.vo.OrderVO;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sql;

	//상품디테일에서 구매하기
	public int inserOrder(OrderVO vo) {
		return sql.insert("order.insertOrder", vo);
	}
	
	
}
