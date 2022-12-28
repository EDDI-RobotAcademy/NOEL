package com.kh.myapp.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.market.model.dao.ProductDAO;
import com.kh.myapp.market.model.vo.ProductImgVO;
import com.kh.myapp.market.model.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;

	// 상품 등록
	public int add(ProductVO v) {
		int result = dao.add(v);
		if (result > 0) {
			int prdNo = dao.selectPrdNo();
			for (ProductImgVO vo : v.getPrdImgList()) {
				vo.setPrdNo(prdNo);
				result += dao.prdimgadd(vo);
			}
		}
		return result;
	}

	// 상품 등록리스트
	public List<ProductVO> list(String marketerId) throws Exception {
		List result = dao.list(marketerId);
		return result;
	}

	// 상품no에 맞는 img 조회
	public ArrayList<ProductImgVO> selectPrdImg(int prdNo) {
		return dao.selectImg(prdNo);
	}

	// 상품 등록된것 조회
	public ProductVO read(int prdNo) throws Exception {
		ProductVO result = dao.read(prdNo);
		return result;
	}

	// 상품 수정
	public int update(ProductVO vo, int[] imgNoList) {
		int result = dao.update(vo);
		if (result > 0) {
			for (ProductImgVO imgvo : vo.getPrdImgList()) {
				imgvo.setPrdNo(vo.getPrdNo());
				result = dao.prdimgadd(imgvo);
			}
			if (imgNoList != null) {
				for (int imgNo : imgNoList) {
					result += dao.prdimgdelete(imgNo);
				}
			}
		}
		return result;
	}

	// 상품 삭제
	public int delete(int prdNo) {
		int result = dao.delete(prdNo);
		return result;
	}

	//마켓에서 하나의 상품을 눌렀을 떄
	   public HashMap<String, Object> selectOnePrd (int prdNo){
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      ProductVO vo = dao.selectOnePrd(prdNo);
	      map.put("prd", vo);
	      return map;
	   }

	// 마켓에서 상품 리스트 출력 000
	public HashMap<String, Object> marketList(int reqPage) {
		// 한페이지당 게시물 지정
		int numPerPage = 9;
		int end = numPerPage * reqPage;
		int start = (end - numPerPage) + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<ProductVO> list = dao.marketList(map);

		// 페이징 처리하기 위한 수
		int totalCnt = dao.countAllList();
		int totalPage = 0;
		if (totalCnt % numPerPage == 0) {
			totalPage = totalCnt / numPerPage;
		} else {
			totalPage = totalCnt / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "";
		if (pageNo != 1) {
			pageNavi += "<a href='/marketListFrm?reqPage=" + (pageNo - 1) + "'>"
					+ "<span class='material-symbols-outlined' style='font-size: 30px;'>\r\n"
					+ "            chevron_left\r\n" + "            </span></a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/marketListFrm?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a href='/marketListFrm?reqPage=" + (pageNo)
					+ "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n"
					+ "            chevron_right\r\n" + "            </span></a>";
		}
		HashMap<String, Object> tagMap = new HashMap<String, Object>();

		tagMap.put("list", list);
		tagMap.put("reqPage", reqPage);
		tagMap.put("pageNavi", pageNavi);
		tagMap.put("total", totalPage);
		tagMap.put("pageNo", pageNo);

		return tagMap;
	}

	// 마켓에서 카테고리별 상품조회 000
	public HashMap<String, Object> selectTag(String category, int reqPage) {

		// 화면에 보여주는 게시물 수
		int numPerPage = 9;

		// 끝페이지
		int end = numPerPage * reqPage;

		// 시작페이지
		int start = (end - numPerPage) + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);

		ArrayList<ProductVO> list = dao.selectTag(map);

		int totalCnt = dao.countTagList(category);
		int totalPage = 0;
		if (totalCnt % numPerPage == 0) {
			totalPage = totalCnt / numPerPage;
		} else {
			totalPage = totalCnt / numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		String pageNavi = "";
		if (pageNo != 1) {
			pageNavi += "<a href='/selectTag?category=" + category + "&reqPage=" + (pageNo - 1) + "'>"
					+ "<span class='material-symbols-outlined' style='font-size: 30px;'>\r\n"
					+ "            chevron_left\r\n" + "            </span></a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/selectTag?category=" + category + "&reqPage=" + pageNo + "'><span>" + (pageNo)
						+ "</span></a>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a href='/selectTag?category=" + category + "&reqPage=" + (pageNo)
					+ "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n"
					+ "            chevron_right\r\n" + "            </span></a>";
		}
		HashMap<String, Object> tagMap = new HashMap<String, Object>();
		tagMap.put("list", list);
		tagMap.put("reqPage", reqPage);
		tagMap.put("pageNavi", pageNavi);
		tagMap.put("total", totalPage);
		tagMap.put("pageNo", pageNo);

		return tagMap;
	}

}
