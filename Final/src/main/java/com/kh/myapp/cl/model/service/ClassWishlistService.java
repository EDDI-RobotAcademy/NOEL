package com.kh.myapp.cl.model.service;

import com.kh.myapp.cl.model.dao.ClassWishlistDao;
import com.kh.myapp.cl.model.vo.Wishlist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassWishlistService {

    @Autowired
    private ClassWishlistDao dao;

    public int insertClassWishlist(Wishlist wsl) {
        int result = dao.insertClassWishlist(wsl);
        return result;
    }

    public int deleteClassWishlist(Wishlist wsl) {
        int result = dao.deleteClassWishlist(wsl);
        return result;
    }
}
