package com.kh.myapp.market.model.dao;

import com.kh.myapp.market.model.vo.MarketWishVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MarketWishDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMarketWish(MarketWishVO marketwish) {
		int result = sqlSession.insert("marketWish.insertMarketWish", marketwish);
		return result;
	}
	
	public int deleteMarketWish(MarketWishVO marketwish) {
		int result = sqlSession.insert("marketWish.deleteMarketWish", marketwish);
		return result;
	}

	public ArrayList<MarketWishVO> myPrdWishList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("marketWish.myPrdWishList", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<MarketWishVO>)list;
		}
	}

	public int toalPrdWish(String bookmarkId) {
		int result = sqlSession.selectOne("marketWish.toalPrdWish", bookmarkId);
		return result;
	}

	public int deletePrdWishList(int prdNo) {
		int result = sqlSession.delete("marketWish.deletePrdWishList", prdNo);
		return result;
	}
	
}
