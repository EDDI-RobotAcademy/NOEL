package com.kh.myapp.cl.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.cl.model.vo.Class;
import com.kh.myapp.cl.model.vo.ClassImg;
import com.kh.myapp.cl.model.vo.Menu;
import com.kh.myapp.cl.model.vo.Reserve;
import com.kh.myapp.cl.model.vo.Review;
import com.kh.myapp.cl.model.vo.Wishlist;
import com.kh.myapp.market.model.vo.ProductVO;

@Repository
public class ClassDao {

    @Autowired
    private SqlSessionTemplate sqlSession;


    //생성자
    public ClassDao() {
        super();
    }
    
	
    // 클래스 관리 페이지에 클래스를 출력하기 위해 조회
	public List<Class> list(String marketerId) throws Exception {
		List result = sqlSession.selectList("class.selectlist", marketerId);
		return result;
	}
    
    // 클래스 등록
    public int addClass(Class cv)
    {
        return sqlSession.insert("class.addClass", cv);
    }
    public int selectClassNo()
    {
        return sqlSession.selectOne("class.selectClassNo");
    }
    public int insertImg(ClassImg ci)
    {
        return sqlSession.insert("insertImg", ci);
    }
    
    // 클래스 수정
	public ArrayList<ClassImg> selectImg(int classNo) {
		List list = sqlSession.selectList("class.selectImg",classNo);
		return (ArrayList<ClassImg>) list;
	}
	public Class read(int classNo) 
	{
		Class result = sqlSession.selectOne("class.read", classNo);
		return result;
	}
	public int updateClass(Class cv) {
		return sqlSession.update("class.updateClass", cv);
	}
	public int deleteImg(int imgNo) {
		return sqlSession.delete("class.deleteClassImg", imgNo);
	}
	
    // 클래스 메뉴
	public List<Menu> menuList(String marketerId) throws Exception {
		List result = sqlSession.selectList("class.menuList", marketerId);
		return result;
	}
	
	// 클래스 메뉴 등록
	public int addMenu(Menu me) {
		return sqlSession.insert("addMenu", me);
	}
	
	// 클래스 메뉴 수정
	public Menu readMenu(int menuNo) {
		Menu result = sqlSession.selectOne("class.readMenu", menuNo);
		return result;
	}
	public int updateMenu(Menu menu) {
		return sqlSession.update("class.updateMenu", menu);
	}
	
	// 클래스 메뉴 삭제
	public int deleteMenu(int menuNo) {
		int result = sqlSession.delete("class.deleteMenu", menuNo);
		return result;
	}
	
  	// 클래스 예약 관리
  	public ArrayList<Reserve> selectAllReserveList(HashMap<String, Object> map) {
  		List list = sqlSession.selectList("reserve.selectAllReserveList",map);
  		System.out.println("dao 예약 출력  : " + list);
  		return (ArrayList<Reserve>) list;
  	}
  	
  	//  예약 총개수
  	public int countAllReserve(String marketerId) {
  		return sqlSession.selectOne("reserve.AllReserveListMarketer",marketerId);
  	}
  	
	// 예약 상태 지정
	public int updateReserveLevel(Reserve Reserve) {
		int result = sqlSession.update("reserve.updateReserve", Reserve);
		return result;
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

    //예약하기
    public int reserve(Reserve r) {
        int result = sqlSession.insert("class.insertReserve",r);
        return result;
    }

    public Wishlist selectOneStoreBookmark(HashMap<String, Object> map) {
        Wishlist sbm = sqlSession.selectOne("classWishList.selectOneStoreBookmark", map);
        return sbm;
    }
    
  //예약관리
    public ArrayList<Reserve> selectReserveList(HashMap<String, Object> map) {
        List list = sqlSession.selectList("reserve.selectReserveList",map);
        return (ArrayList<Reserve>) list;
    }

    public int cancleReserve(int reserveNo) {
        return sqlSession.delete("cancleReserve", reserveNo);
    }
	
}
