package com.kh.myapp.cl.model.dao;

import com.kh.myapp.cl.model.vo.Wishlist;
import com.kh.myapp.market.model.vo.MarketWishVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassWishlistDao {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int insertClassWishlist(Wishlist wls) {
        int result = sqlSession.insert("classWishList.insertClassWishlist", wls);
        return result;
    }

    public int deleteClassWishlist(Wishlist wls) {
        int result = sqlSession.delete("classWishList.deleteClassWishlist", wls);
        return result;
    }

	public ArrayList<Wishlist> myClassWishList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("classWishList.myClassWishList", map);
		
		if(list.isEmpty()) {
			return null;
		}else {
			return (ArrayList<Wishlist>)list;
		}
	}

	public int totalClassWish(String bookmarkId) {
		int result = sqlSession.selectOne("classWishList.totalClassWish", bookmarkId);
		return result;
	}

	public int deleteClassWishList(int classNo) {
		int result = sqlSession.delete("classWishList.deleteClassMyWishList", classNo);
		return result;
	}
}
