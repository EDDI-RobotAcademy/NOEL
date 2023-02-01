package com.kh.myapp.cl.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.cl.model.dao.ClassDao;
import com.kh.myapp.cl.model.vo.Class;
import com.kh.myapp.cl.model.vo.ClassImg;
import com.kh.myapp.cl.model.vo.ClassReviewImg;
import com.kh.myapp.cl.model.vo.Menu;
import com.kh.myapp.cl.model.vo.Reserve;
import com.kh.myapp.cl.model.vo.Review;
import com.kh.myapp.cl.model.vo.Wishlist;

@Service
public class ClassService {

    @Autowired
    private ClassDao dao;

    public ClassService() {
        super();
    }
    
	// 클래스 관리 페이지에 클래스를 출력하기 위해 조회
	public List<Class> list(String marketerId) throws Exception {
		List result = dao.list(marketerId);
		return result;
	}
    
    // 클래스 등록
    public int addClass(Class cv)
    {

        int result = dao.addClass(cv);
        if (result > 0) {
            int classNo = dao.selectClassNo();
            for (ClassImg ci : cv.getClassImgList()) {
                ci.setClassNo(classNo);
                result += dao.insertImg(ci);
            }
        }
        return result;
    }
	
    // 클래스 수정을 위한 이미지 조회
	public ArrayList<ClassImg> selectClassImg(int classNo) {
		return dao.selectImg(classNo);
	}
	
	// 클래스 수정을 위한 클래스 조회
	public Class read(int classNo) throws Exception {
		Class result = dao.read(classNo);
		return result;
	}
	

	// 클래스 수정
	public int updateClass(Class cv, int[] imgNoList) {
		int result = dao.updateClass(cv);
		if(result > 0) {
			for(ClassImg ci : cv.getClassImgList()) {
				ci.setClassNo(cv.getClassNo());
				result += dao.insertImg(ci);
			}
			if(imgNoList != null) {
				for(int imgNo : imgNoList) {
					result += dao.deleteImg(imgNo);
				}
			}
		}
		return result;
	}
	
	// 클래스 삭제
	public int classDelete(int classNo) {
		int result = dao.classDelete(classNo);
		return result;
	}
	
	
	
    // 클래스 메뉴 리스트
	public List<Menu> menuList(String marketerId) throws Exception  {
		List result = dao.menuList(marketerId);
		return result;
	}
	
	// 클래스 메뉴 추가
	public int addMenu(Menu me) {
		return dao.addMenu(me);
	}
	
	// 클래스 메뉴 수정을 위해 메뉴 조회
	public Menu readMenu(int menuNo) throws Exception {
		Menu result = dao.readMenu(menuNo);
		return result;
	}
	
	// 클래스 메뉴 수정
	public int updateMenu(Menu me) {
		return dao.updateMenu(me);
	}
	
	// 클래스 메뉴 삭제
	public int deleteMenu(int menuNo) {
		int result = dao.deleteMenu(menuNo);
		return result;
	} 
	
    // 메뉴 리스트
    public ArrayList<Menu> selectMenuList(int classNo) {
        ArrayList<Menu> list = dao.selectMenuList(classNo);
        return list;
    }
    
	
	
  	// 판매자 > 예약관리 리스트
  	public HashMap<String, Object> selectAllReserveListMarketer(int reqPage, String marketerId) {

  		//한 페이지 당 보여지는 주문건수
  		int numPerPage = 10;
  		// end = 10
  		int end = numPerPage *reqPage;
  		//start = 1
  		int start = (end-numPerPage)+1;

  		HashMap<String, Object> map = new HashMap<String, Object>();
  		map.put("start", start);
  		map.put("end", end);
  		map.put("marketerId", marketerId);

  		ArrayList<Reserve> list = dao.selectAllReserveList(map);

  		int totalPage = dao.countAllReserve(marketerId);
  		int totalMan = 0;
  		if(totalPage % numPerPage == 0) {
  			totalMan = totalPage / numPerPage;
  		}else {
  			totalMan = totalPage / numPerPage +1;

  		}
  		// 페이지 네비 사이즈
  		int pageNaviSize = 5;

  		// 페이지 시작 번호
  		int pageNo = 1;

  		if(reqPage > 3) {
  			pageNo = reqPage - 2;
  		}

  		//이전 버튼
  		String pageNavi = "";
  		if(pageNo != 1) {
  			pageNavi += "<a href='/class/reserveManagement?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
  					"            chevron_left\r\n" + 
  					"            </span></a>";
  		}

  		for(int i = 0; i < pageNaviSize; i++) {
  			if(reqPage == pageNo) {
  				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
  			}else {
  				pageNavi += "<a href='/class/reserveManagement?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
  			}
  			pageNo++;
  			if(pageNo > totalMan) {
  				break;
  			}
  		}

  		// 다음버튼
  		if(pageNo <= totalMan) {
  			pageNavi += "<a href='/class/reserveManagement?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
  					"            chevron_right\r\n" + 
  					"            </span></a>"; 
  		}

  		HashMap<String, Object> reserveMap = new HashMap<String, Object>();
  		reserveMap.put("list", list);
  		reserveMap.put("reqPage", reqPage);
  		reserveMap.put("pageNavi", pageNavi);
  		reserveMap.put("total", totalPage);
  		reserveMap.put("pageNo", pageNo);

  		if(list == null) {
  			return null;
  		}else {
  			return reserveMap;
  		}

  	}
  	
    //판매자 > 예약관리> 예약상태 지정
	public int updateReserveLevel(Reserve Reserve) {
		return dao.updateReserveLevel(Reserve);
	}
    
	// 판매자 > 예약관리 > 검색
	public HashMap<String, Object> searchReserve(String marketerId, String type, String keyword,
			int reqPage) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = (end - numPerPage) + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("marketerId", marketerId);

		ArrayList<Reserve> list = dao.searchReserve(map);
		int totalPage = dao.searchReserveCount(map);
		int totalMan = 0;
		if (totalPage % numPerPage == 0) {
			totalMan = totalPage / numPerPage;
		} else {
			totalMan = totalPage / numPerPage + 1;
		}
		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		// 페이지 시작 번호
		int pageNo = 1;

		// 페이지 내비 시작
		String pageNavi = "";
		if (pageNo != 1) {
			pageNavi += "<a href='/searchReserve?reqPage=" + (pageNo - 1)
					+ "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n"
					+ "            chevron_left\r\n" + "            </span></a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/searchReserve?reqPage=" + pageNo + "'><span>" + (pageNo)
						+ "</span></a>";
			}
			pageNo++;
			if (pageNo > totalMan) {
				break;
			}
		}

		// 다음버튼
		if (pageNo <= totalMan) {
			pageNavi += "<a href='/searchReserve?reqPage=" + (pageNo)
					+ "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n"
					+ "            chevron_right\r\n" + "            </span></a>";
		}

		HashMap<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("list", list);
		orderMap.put("pageNavi", pageNavi);

		if (list == null) {
			return null;
		} else {
			return orderMap;
		}
	}
  	
	
	
	// 클래스 리뷰 리스트
    public HashMap<String, Object> classReviewList(int reqPage) {
        //한페이지당 게시물 지정
        int numPerPage = 9;

        // 12
        int end = numPerPage * reqPage;

        // 1
        int start = (end - numPerPage) + 1;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("start",start);
        map.put("end",end);

        ArrayList<Review> list = dao.classReviewList(map);
        //페이징 처리하기 위한 수 (34)
        int totalCnt = dao.countAllList();
        //전체페이지
        int totalPage = 0;


        if(totalCnt % numPerPage == 0) {
            totalPage = totalCnt / numPerPage;
        }else {
            totalPage = totalCnt / numPerPage + 1;
        }
        // totalPage = 34 / 12  + 1 = 3;

        //네비게이션 사이즈
        int pageNaviSize = 5;

        //페이지 네비게이션 시작번호 지정
        int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
        // 페이지 네비게이션 제작
        String pageNavi = "";
        //이전버튼
        if(pageNo != 1) {
            pageNavi += "<a href='/classReviewList?reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
                    "            chevron_left\r\n" +
                    "            </span></a>";
        }

        for(int i = 0; i < pageNaviSize; i++) {
            if(reqPage == pageNo) {
                pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
            }else {
                pageNavi += "<a href='/classReviewList?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
            }
            pageNo++;
            if(pageNo > totalPage) {
                break;
            }
        }
        //다음버튼
        if(pageNo <= totalPage) {
            pageNavi += "<a href='/classReviewList?reqPage=" + pageNo + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
                    "            chevron_right\r\n" +
                    "            </span></a>";
        }
        HashMap<String, Object> classReviewListMap = new HashMap<String, Object>();
        classReviewListMap.put("list", list);
        classReviewListMap.put("reqPage", reqPage);
        classReviewListMap.put("pageNavi", pageNavi);
        classReviewListMap.put("total", totalPage);
        classReviewListMap.put("pageNo", pageNo);

        if(list == null) {
            return null;
        }else {
            return classReviewListMap;
        }
    }
    
    // 클래스 리뷰 등록
    public int addClassReview(Review review)
    {

        int result = dao.addClassReview(review);
        if (result > 0) {
            int classReviewNo = dao.selectClassReviewNo();
            for (ClassReviewImg ri : review.getClassReviewImgList()) {
                ri.setClassReviewNo(classReviewNo);
                result += dao.insertReviewImg(ri);
            }
        }
        return result;
    }
    
    // 클래스 리뷰 상세보기
    public HashMap<String, Object> selectOneClassReview(int classReviewNo, String userId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Review review = dao.selectOneClassReview(classReviewNo);

        HashMap<String, Object> bookMap = new HashMap<String, Object>();
        bookMap.put("classReviewNo", classReviewNo);
        bookMap.put("userId", userId);
        
        map.put("s", review);
        
        return map;
    }
    
    // 클래스 리뷰 수정을 위한 리뷰 이미지 조회
	public ArrayList<ClassReviewImg> selectClassReviewImg(int classReviewNo) {
		return dao.selectReviewImg(classReviewNo);
	}
	
	// 클래스 리뷰 수정을 위한 클래스 리뷰 조회
	public Review reviewRead(int classReviewNo) throws Exception {
		Review result = dao.reviewRead(classReviewNo);
		return result;
	}
	
	// 클래스 리뷰 수정
	public int updateClassReview(Review review, int[] imgNoList) {
		int result = dao.updateClassReview(review);
		if(result > 0) {
			for(ClassReviewImg ri : review.getClassReviewImgList()) {
				ri.setClassReviewNo(review.getClassReviewNo());
				result += dao.insertReviewImg(ri);
			}
			if(imgNoList != null) {
				for(int imgNo : imgNoList) {
					result += dao.deleteReviewImg(imgNo);
				}
			}
		}
		return result;
	}
	
	
	
	

    public HashMap<String, Object> classList(int reqPage) {
        //한페이지당 게시물 지정
        int numPerPage = 9;

        // 12
        int end = numPerPage * reqPage;

        // 1
        int start = (end - numPerPage) + 1;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("start",start);
        map.put("end",end);

        ArrayList<Class> list = dao.classList(map);
        //페이징 처리하기 위한 수 (34)
        int totalCnt = dao.countAllList();
        //전체페이지
        int totalPage = 0;


        if(totalCnt % numPerPage == 0) {
            totalPage = totalCnt / numPerPage;
        }else {
            totalPage = totalCnt / numPerPage + 1;
        }
        // totalPage = 34 / 12  + 1 = 3;

        //네비게이션 사이즈
        int pageNaviSize = 5;

        //페이지 네비게이션 시작번호 지정
        int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
        // 페이지 네비게이션 제작
        String pageNavi = "";
        //이전버튼
        if(pageNo != 1) {
            pageNavi += "<a href='/classList?reqPage=" +(pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
                    "            chevron_left\r\n" +
                    "            </span></a>";
        }

        for(int i = 0; i < pageNaviSize; i++) {
            if(reqPage == pageNo) {
                pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
            }else {
                pageNavi += "<a href='/classList?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
            }
            pageNo++;
            if(pageNo > totalPage) {
                break;
            }
        }
        //다음버튼
        if(pageNo <= totalPage) {
            pageNavi += "<a href='/classList?reqPage=" + pageNo + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
                    "            chevron_right\r\n" +
                    "            </span></a>";
        }
        HashMap<String, Object> classListMap = new HashMap<String, Object>();
        classListMap.put("list", list);
        classListMap.put("reqPage", reqPage);
        classListMap.put("pageNavi", pageNavi);
        classListMap.put("total", totalPage);
        classListMap.put("pageNo", pageNo);

        if(list == null) {
            return null;
        }else {
            return classListMap;
        }
    }

    public HashMap<String, Object> selectOneClass(int classNo, String userId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Class c = dao.selectOneClass(classNo);

        HashMap<String, Object> bookMap = new HashMap<String, Object>();
        bookMap.put("classNo", classNo);
        bookMap.put("userId", userId);

        Wishlist sbm = dao.selectOneStoreBookmark(bookMap);
        
        map.put("s", c);
        map.put("sbm", sbm);
        
        return map;
    }


    //예약된 시간 버튼 비활성화
    public ArrayList<Reserve> ajaxCheckReserve(Reserve r) {
        ArrayList<Reserve> list = dao.checkReserve(r);
        return list;
    }

    //비활성화 시간 확인하기
    public ArrayList<Reserve> ajaxCheckReserveTime(String selectDate, int maxNum, int classNo) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("selectDate",selectDate);
        map.put("maxNum",maxNum);
        map.put("classNo",classNo);
        ArrayList<Reserve> list = dao.ajaxCheckReserveTime(map);
        return list;
    }


    //예약하기
    public int reserve(Reserve r) {
        return dao.reserve(r);
    }
    
    public HashMap<String, Object> selectReserveList(int reqPage, String userId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("reqPage", reqPage);
        map.put("userId", userId);
        ArrayList<Reserve> list = dao.selectReserveList(map);

        HashMap<String, Object> reserveMap = new HashMap<String, Object>();
        reserveMap.put("list", list);

        return reserveMap;

    }

    public int cancleReserve(int reserveNo) {
        return dao.cancleReserve(reserveNo);
    }

}
