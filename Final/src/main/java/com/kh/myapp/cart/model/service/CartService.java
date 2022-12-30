package com.kh.myapp.cart.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.cart.model.dao.CartDao;
import com.kh.myapp.cart.model.vo.CartVO;

@Service
public class CartService {

    @Autowired
    private CartDao dao;

    // 장바구니 리스트 출력
    public ArrayList<CartVO> cartList(String userId) {
        ArrayList<CartVO> list = dao.cartList(userId);
        return (ArrayList<CartVO>) list;
    }

    // userId별 장바구니 조회
    public CartVO searchCart(CartVO vo) {
        return dao.searchCart(vo);
    }

    // 장바구니 추가
    public int insertCart(CartVO vo) {
        return dao.insertCart(vo);
    }

    // 장바구니 수정
    public int updateCart(CartVO vo) {
        return dao.updateCart(vo);
    }

    // 장바구니 삭제
    public boolean deleteCart(String delCartArr, String userId) {
        // 배열을 [/]를 기준으로 나눠 토큰(문자열)로 저장
        StringTokenizer sT1 = new StringTokenizer(delCartArr, "/");

        // 레벨 변경이 성공했는지 저장할 변수
        boolean result = true;
        while (sT1.hasMoreTokens()) {
            int cartNo = Integer.parseInt(sT1.nextToken());
            CartVO vo = new CartVO();
            vo.setCartNo(cartNo);
            vo.setUserId(userId);
            int changeResult = dao.deleteCart(vo);
            if (changeResult == 0) {
                result = false;
                break;
            }
        }
        return result;
    }

    //장바구니에서 구매하기
    public ArrayList<CartVO> ordercart(String userId) {
        ArrayList<CartVO> list = dao.ordercart(userId);
        return list;
    }

}