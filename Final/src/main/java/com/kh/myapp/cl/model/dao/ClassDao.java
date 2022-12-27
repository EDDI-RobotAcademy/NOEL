package com.kh.myapp.cl.model.dao;

import com.kh.myapp.cl.model.vo.*;
import com.kh.myapp.cl.model.vo.Class;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class ClassDao {

    @Autowired
    private SqlSessionTemplate sqlSession;


    //생성자
    public ClassDao() {
        super();
    }


    public ArrayList<Class> classList(HashMap<String, Object> map) {
        List list = sqlSession.selectList("class.classList",map);
        if(list.isEmpty()) {
            return null;
        }else {
            return (ArrayList<Class>) list;
        }
    }

    public int countAllList() {
        return sqlSession.selectOne("class.countAllList");
    }

    //맛집 상세
    public Class selectOneClass(int classNo) {
        Class c = sqlSession.selectOne("class.selectOneClass", classNo);
        return c;
    }

    public ArrayList<Review> selectReviewList(int classNo) {
        List list = sqlSession.selectList("selectReviewList", classNo);
        return (ArrayList<Review>) list;
    }

    //맛집 상세 - 메뉴조회
    public ArrayList<Menu> selectMenuList(int classNo) {
        List list = sqlSession.selectList("class.selectMenuList", classNo);
        return (ArrayList<Menu>)list;
    }

    // 예약 확인
    public ArrayList<Reserve> checkReserve(Reserve r) {
        List list = sqlSession.selectList("class.checkReserve", r);
        return (ArrayList<Reserve>)list;
    }

    //비활성화 시간 확인하기
    public ArrayList<Reserve> ajaxCheckReserveTime(HashMap<String, Object> map) {
        List list = sqlSession.selectList("class.ajaxCheckReserveTime", map);
        return (ArrayList<Reserve>)list;
    }

    // 클래스 등록
    public int addClassAc(Class cv)
    {
        return sqlSession.insert("class.addClassAc", cv);
    }


}
