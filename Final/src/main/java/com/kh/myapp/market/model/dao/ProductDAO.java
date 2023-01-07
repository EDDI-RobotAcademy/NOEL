package com.kh.myapp.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.MarketWishVO;
import com.kh.myapp.market.model.vo.ProductImgVO;
import com.kh.myapp.market.model.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sql;

	// 상품 등록
	public int add(ProductVO vo) {
		return sql.insert("productMapper.insert", vo);
	}

	// 상품 이미지 등록
	public int prdimgadd(ProductImgVO vo) {
		int result = sql.insert("productMapper.prdimginsert", vo);
		return result;
	}

	// 상품no 제일 큰거 조회
	public int selectPrdNo() {
		int result = sql.selectOne("productMapper.selectPrdNo");
		return result;
	}

	// 상품 등록 목록 조회
	public List<ProductVO> list(String marketerId) throws Exception {
		List result = sql.selectList("productMapper.selectlist", marketerId);
		return result;
	}

	// 상품 등록된것 조회
	public ProductVO read(int prdNo) {
		ProductVO result = sql.selectOne("productMapper.read", prdNo);
		return result;
	}

	// 상품 수정
	public int update(ProductVO vo) {
		int result = sql.update("productMapper.update", vo);
		return result;
	}

	// 상품 삭제
	public int delete(int prdNo) {
		int result = sql.delete("productMapper.delete", prdNo);
		return result;
	}

	// 상품 이미지 수정
	public ArrayList<ProductImgVO> selectImg(int prdNo) {
		List list = sql.selectList("productMapper.selectImg", prdNo);
		return (ArrayList<ProductImgVO>) list;
	}

	// 상품 이미지 삭제
	public int prdimgdelete(int imgNo) {
		return sql.delete("productMapper.prdimgdelete", imgNo);
	}

	// 마켓 상품 리스트 출력을 위한 메서드
	public ArrayList<ProductVO> marketList(HashMap<String, Object> map) {
		List list = sql.selectList("productMapper.marketList", map);
		if (list.isEmpty()) {
			return null;
		} else {
			return (ArrayList<ProductVO>) list;
		}
	}

	// 마켓에서 상품하나를 눌렀을 때 조회
	public ProductVO selectOnePrd(int prdNo) {
		ProductVO vo = sql.selectOne("productMapper.selectOnePrd", prdNo);
		return vo;

	}

	// 마켓 상품 리스트 출력을 위한 메서드 000
	public int countAllList() {
		return sql.selectOne("productMapper.countAllList");
	}

	public ArrayList<ProductVO> selectTag(HashMap<String, Object> map) {
		List list = sql.selectList("productMapper.selectTag", map);
		return (ArrayList<ProductVO>) list;
	}

	public int countTagList(String category) {
		return sql.selectOne("productMapper.countTagList", category);
	}
	
	//상품상세에서 클릭한 위시 그대로 보여지도록
	public MarketWishVO selectOneMarketWish(HashMap<String, Object> map) {
		MarketWishVO marketwish = sql.selectOne("marketWish.selectOneMarketWish", map);
		return marketwish;
	}

	//정렬기능(리뷰, 위시)
	public ArrayList<ProductVO> sortList(HashMap<String, Object> map) {
		List list = sql.selectList("productMapper.sortList", map);
		return (ArrayList<ProductVO>) list;
	}

	public int countTagList(HashMap<String, Object> map) {
		return sql.selectOne("productMapper.countTagList",map);
	}
}