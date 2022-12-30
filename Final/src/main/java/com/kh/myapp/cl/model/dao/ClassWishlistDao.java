package com.kh.myapp.cl.model.dao;

import com.kh.myapp.cl.model.vo.Wishlist;
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
}
