package com.kh.myapp.notice.model.service;

import com.kh.myapp.notice.model.dao.NoticeDao;
import com.kh.myapp.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class NoticeService {
    @Autowired
    private NoticeDao dao;

    public HashMap<String, Object> selectAllNotice(int reqPage) {
        // 화면에 보여주는 게시물 수
        int numPerPage = 10;

        // 끝페이지
        int end = numPerPage * reqPage;

        // 시작
        int start = (end - numPerPage) + 1;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);

        ArrayList<Notice> list = dao.selectAllNotice(map);

        int totalCnt = dao.selectNoticeCount();

        int totalPage = 0;
        if(totalCnt % numPerPage == 0) {
            totalPage = totalCnt / numPerPage;
        }else {
            totalPage = totalCnt / numPerPage + 1;
        }

        int pageNaviSize = 5;
        int pageNo = 1;

        if(reqPage > 3) {
            pageNo = reqPage - 2;
        }

        String pageNavi = "";
        if(pageNo != 1) {
            pageNavi +=  "<a href='/selectNoticeList.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
                    "            chevron_left\r\n" +
                    "            </span></a>";
        }

        for(int i = 0; i < pageNaviSize; i++) {
            if(pageNo == reqPage) {
                pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
            }else {
                pageNavi += "<a href='/selectNoticeList.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
            }
            pageNo++;
            if(pageNo > totalPage) {
                break;
            }
        }

        if(pageNo <= totalPage) {
            pageNavi += "<a href='/selectNoticeList.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" +
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

    public Notice selectOneNotice(int noticeNo) {
        int result = dao.updateReadCount(noticeNo);

        Notice n = null;

        if(result > 0) {
            n = dao.selectOneNotice(noticeNo);
            return n;
        }else {
            return null;
        }

    }

    public int insertNotice(Notice notice) {
        int result = dao.insertNotice(notice);
        if(result > 0) {
            int noticeNo = 0;
        }
        return result;
    }

    public int deleteNotice(int noticeNo){
        int result = dao.deleteNotice(noticeNo);
        return result;
    }

    public int updateNotice(Notice n) {
        int result = dao.updateNotice(n);
        return result;
    }


}
