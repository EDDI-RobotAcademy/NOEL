package com.kh.myapp.cart.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.cart.model.vo.CartVO;

@Repository
public class CartDao {

	@Autowired
	private SqlSessionTemplate sql;

	//장바구니 리스트 출력
	public ArrayList<CartVO> cartList(String userId) {
		List list = sql.selectList("cart.cartList", userId);
		return (ArrayList<CartVO>) list;
	}

	//userid별 장바구니 조회
	public CartVO searchCart(CartVO vo) {
		return sql.selectOne("cart.searchCart",vo);
	}
	
	//장바구니 추가
	public int insertCart(CartVO vo) {
		return sql.insert("cart.insertCart",vo);
	}

	//장바구니 수정
	public int updateCart(CartVO vo) {
		return sql.update("cart.updateCart", vo);
	}

	//장바구니 삭제
	public int deleteCart(CartVO vo) {
		int result= sql.delete("cart.deleteCart",vo);
		return result;
	}

	//장바구니에서 결제하기
	public ArrayList<CartVO> ordercart(String userId) {
		List list = sql.selectList("cart.cartOrder",userId);
		return (ArrayList<CartVO>) list;
	}
}
