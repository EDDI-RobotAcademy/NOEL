package com.kh.myapp.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.order.model.vo.OrderVO;

@Repository
public class OrderDao {

    @Autowired
    private SqlSessionTemplate sql;

    //주문 및 결제
    public int orderNext(OrderVO vo) {
        return sql.insert("order.nextOrder",vo);
    }

    //결제 성공 시 장바구니에서 삭제
    public int deleteCart(String userId) {
        return sql.delete("order.deleteCartAll", userId);
    }


}