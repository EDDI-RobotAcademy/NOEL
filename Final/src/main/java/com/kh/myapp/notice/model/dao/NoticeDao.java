package com.kh.myapp.notice.model.dao;

import com.kh.myapp.notice.model.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class NoticeDao {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public ArrayList<Notice> selectAllNotice(HashMap<String, Object> map) {
        List list = sqlSession.selectList("notice.selectAllNotice", map);

        if(list.isEmpty()) {
            return null;
        }else {
            return (ArrayList<Notice>)list;
        }

    }

    public int selectNoticeCount() {
        int result = sqlSession.selectOne("notice.selectNoticeCount");
        return result;
    }

    public int updateReadCount(int noticeNo) {
        int result = sqlSession.update("notice.updateReadCount", noticeNo);
        return result;
    }

    public Notice selectOneNotice(int noticeNo) {
        Notice n = sqlSession.selectOne("notice.selectOneNotice", noticeNo);
        return n;
    }

    public int insertNotice(Notice notice) {
        int result = sqlSession.insert("notice.insertNotice", notice);
        return result;
    }

    public int deleteNotice(int noticeNo){
        int result = sqlSession.delete("notice.deleteNotice", noticeNo);
        return result;
    }

    public int updateNotice(Notice n) {
        int result = sqlSession.update("notice.updateNotice", n);
        return result;
    }


}
