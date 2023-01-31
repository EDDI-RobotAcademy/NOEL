package com.kh.myapp.cl.model.service;

import com.kh.myapp.cl.model.dao.ClassWishlistDao;
import com.kh.myapp.cl.model.vo.Wishlist;
import com.kh.myapp.market.model.vo.MarketWishVO;

import java.util.ArrayList;
import java.util.HashMap;

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

	public HashMap<String, Object> myClassWishList(String bookmarkId, int reqPage) {
		
		// 화면에 보이는 게시물 수 
		int numPerPage = 6;
		
		// 끝 페이지
		int end = numPerPage * reqPage;
		
		// 시작페이지
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end", end);
		map.put("start", start);
		map.put("bookmarkId", bookmarkId);
	
		ArrayList<Wishlist> list = dao.myClassWishList(map);
		int totalCount = dao.totalClassWish(bookmarkId);
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/myClassWishList?bookmarkId=" + bookmarkId + "&reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageNo'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/myBookmarkList.do?bookmarkId=" + bookmarkId + "&reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			
			pageNo++;
			
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/myBookmarkList.do?bookmarkId=" + bookmarkId + "&reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
	}

	public int deleteClassWishList(int classNo) {
		int result = dao.deleteClassWishList(classNo);
		return result;
	}
}
