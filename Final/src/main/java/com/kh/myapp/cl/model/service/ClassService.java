package com.kh.myapp.cl.model.service;

import com.kh.myapp.cl.model.dao.ClassDao;
import com.kh.myapp.cl.model.vo.*;
import com.kh.myapp.cl.model.vo.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class ClassService {

    @Autowired
    private ClassDao dao;

    public ClassService() {
        super();
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
        //System.out.println(list);
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

    public ArrayList<Review> selectReviewList(int classNo) {
        return dao.selectReviewList(classNo);
    }

    //맛집 상세 - 메뉴 조회
    public ArrayList<Menu> selectMenuList(int classNo) {
        ArrayList<Menu> list = dao.selectMenuList(classNo);
        return list;
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
