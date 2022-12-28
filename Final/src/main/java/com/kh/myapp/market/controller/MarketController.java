package com.kh.myapp.market.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.myapp.commom.FileRename;
import com.kh.myapp.market.model.service.MarketQnaService;
import com.kh.myapp.market.model.service.MarketReviewService;
import com.kh.myapp.market.model.service.ProductService;
import com.kh.myapp.market.model.vo.MarketQnaReplyVO;
import com.kh.myapp.market.model.vo.MarketQnaVO;
import com.kh.myapp.market.model.vo.MarketReviewVO;
import com.kh.myapp.market.model.vo.ProductImgVO;
import com.kh.myapp.market.model.vo.ProductVO;
import com.kh.myapp.member.model.vo.Marketer;

@Controller
public class MarketController {

	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private FileRename fileRename;

	@Autowired
	private MarketReviewService reviewService;

	@Autowired
	private MarketQnaService qnaService;

	// 생성자
	public MarketController() {
		super();
	}

	// 판매자 관리화면 출력, 판매자 상품등록 리스트 출력
	@RequestMapping(value = "market/marketerProductMypage", method = RequestMethod.GET)
	public void getMarketer(Model model, @SessionAttribute Marketer mk) throws Exception {
		List<ProductVO> list = productService.list(mk.getMarketerId());
		model.addAttribute("prdlist", list);
	}

	/*
	 * // 판매자 관리화면 출력, 판매자 상품등록 리스트 출력
	 * 
	 * @RequestMapping(value = "market/main", method = RequestMethod.GET) public
	 * void getMarketer(Model model) throws Exception { List<ProductVO> list =
	 * productService.list(); model.addAttribute("prdlist", list); }
	 */
	// 판매자 상품 등록폼
	@RequestMapping(value = "/market/prd_add", method = RequestMethod.GET)
	public void getPrdadd() throws Exception {
		logger.info("판매자 상품등록화면으로 이동");
	}

	// 판매자 상품 등록하기(다중 이미지)
	@RequestMapping(value = "/prd_add", method = RequestMethod.POST)
	public String addPrd(ProductVO vo, MultipartFile[] file, HttpServletRequest request, @SessionAttribute Marketer mk) {
		logger.info("판매자 상품등록 하기");
		
		// 첨부이미지 목록 저장할 리스트 생성
		ArrayList<ProductImgVO> prdImgList = new ArrayList<ProductImgVO>();
		
		if (!file[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/prd/");
			
			for (MultipartFile file2 : file) {
				String filename = file2.getOriginalFilename();
				String imgpath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + imgpath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file2.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				ProductImgVO prdImg = new ProductImgVO();
				prdImg.setPrdImgpath(imgpath);
				prdImgList.add(prdImg);
			}
		}
		
		
		vo.setPrdImgList(prdImgList);
		vo.setMarketerId(mk.getMarketerId());
		int result = productService.add(vo);
		return "redirect:/market/marketerProductMypage";
		
	}
	/*
	 * // 판매자 상품 등록하기(다중 이미지)
	 * 
	 * @RequestMapping(value = "/prd_add", method = RequestMethod.POST) public
	 * String addPrd(ProductVO vo, MultipartFile[] file, HttpServletRequest request)
	 * { logger.info("판매자 상품등록 하기");
	 * 
	 * // 첨부이미지 목록 저장할 리스트 생성 ArrayList<ProductImgVO> prdImgList = new
	 * ArrayList<ProductImgVO>();
	 * 
	 * if (!file[0].isEmpty()) { String savePath =
	 * request.getSession().getServletContext().getRealPath(
	 * "resources/upload/prd_add/");
	 * 
	 * for (MultipartFile file2 : file) { String filename =
	 * file2.getOriginalFilename(); String imgpath = fileRename.fileRename(savePath,
	 * filename); try { FileOutputStream fos = new FileOutputStream(new
	 * File(savePath + imgpath)); BufferedOutputStream bos = new
	 * BufferedOutputStream(fos); byte[] bytes = file2.getBytes(); bos.write(bytes);
	 * bos.close(); } catch (FileNotFoundException e) { e.printStackTrace(); } catch
	 * (IOException e) { e.printStackTrace(); } ProductImgVO prdImg = new
	 * ProductImgVO(); prdImg.setPrdImgpath(imgpath); prdImgList.add(prdImg);
	 * }//for문 끝 }//if문 끝
	 * 
	 * vo.setPrdImgList(prdImgList); int result = productService.add(vo); return
	 * "redirect:/market/main";
	 * 
	 * }
	 */

	// 판매자 상품 수정폼
	@RequestMapping(value = "/market/prd_update", method = RequestMethod.GET)
	public String getupdatePrd(ProductVO vo, Model model) throws Exception {
		ArrayList<ProductImgVO> prdImgList = productService.selectPrdImg(vo.getPrdNo());
		ProductVO read = productService.read(vo.getPrdNo());
		model.addAttribute("prdlist", read);
		model.addAttribute("prdImgList", prdImgList);
		return "/market/prd_update";
	}

	// 판매자 상품 수정하기
	@RequestMapping(value = "/market/prd_update", method = RequestMethod.POST)
	public String updatePrd(int[] imgNoList, ProductVO vo, String[] imgpathList, MultipartFile[] file,
			HttpServletRequest request, String zipCode) throws Exception {

		ArrayList<ProductImgVO> prdImgList = new ArrayList<ProductImgVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/prd/");
		if (!file[0].isEmpty()) {
			for (MultipartFile File : file) {
				String filename = File.getOriginalFilename();
				String imgpath = fileRename.fileRename(savePath, filename);
				File upFile = new File(savePath + imgpath);
				try {
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = File.getBytes();
					bos.write(bytes);
					bos.close();
					ProductImgVO imgvo = new ProductImgVO();
					imgvo.setPrdImgpath(imgpath);
					prdImgList.add(imgvo);
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		vo.setPrdImgList(prdImgList);
		int result = productService.update(vo, imgNoList);
		if (imgNoList != null && (result == (prdImgList.size() + imgNoList.length + 1))) {
			if (imgpathList != null) {
				for (String filepath : imgpathList) {
					File delFile = new File(savePath + filepath);
					delFile.delete();
				}
			}
		}
		/* productService.update(vo); */
		return "redirect:/market/marketerProductMypage";
	}

	// 판매자 상품 삭제하기
	@RequestMapping(value = "/market/prd_delete", method = RequestMethod.GET)
	public String deletePrd(int prdNo) throws Exception {
		productService.delete(prdNo);
		return "redirect:/market/marketerProductMypage";
	}

	// 마켓 상품 리스트 페이지 000
	   @RequestMapping(value = "/marketListFrm")
	   public String getmarketListFrm(int reqPage, Model model) {
	      HashMap<String, Object> map = productService.marketList(reqPage);
	      
	      if (map == null) {
	         model.addAttribute("msg", "등록된 상품이 없습니다.");
	         return "/market/marketListFrm";
	      } else {
	         model.addAttribute("list", map.get("list"));
	         model.addAttribute("reqPage", reqPage);
	         model.addAttribute("pageNavi", map.get("pageNavi"));
	         model.addAttribute("total", map.get("total"));
	         model.addAttribute("pageNo", map.get("pageNo"));
	         return "/market/marketListFrm";
	      }
	   }

	// 마켓 상품 리스트 페이지 카테고리(전체 뺀 나머지) 000
	@RequestMapping(value = "/selectTag")
	public String selectTag(String category, int reqPage, Model model) {
		HashMap<String, Object> map = productService.selectTag(category, reqPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("category", category);
		model.addAttribute("pageNavi", map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));

		return "/market/marketListFrm";
	}

	// 마켓 상품 상세 페이지 (리뷰 & qna 목록, 모달)
	@RequestMapping(value = "/marketDetailView", method = RequestMethod.GET)
	public String marketDetailView(Integer prdNo, Model model, @RequestParam("rnum") int rnum,
			@RequestParam("qnum") int qnum) throws Exception {
		logger.info("마켓 상세");
		HashMap<String, Object> map = productService.selectOnePrd(prdNo);
		model.addAttribute("prd", map.get("prd"));

		// 해당상품의 리뷰 갯수, qna 갯수
		int reviewcount = reviewService.reviewCount(prdNo);
		int qnacount = qnaService.qnaCount(prdNo);

		// 한 페이지에 출력할 게시물 갯수
		int postNN = 5;

		int postNum = 5 * rnum;
		int qnapostNum = 5 * qnum;

		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int reviewpageNum = (int) Math.ceil((double) reviewcount / postNN);
		int qnapageNum = (int) Math.ceil((double) qnacount / postNN);

		// 출력할 게시물
		int displayPost = (rnum - 1) * postNN;
		int qnadisplayPost = (qnum - 1) * postNN;

		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("reviewpageNum", reviewpageNum);
		model.addAttribute("qnapageNum", qnapageNum);

		List<MarketReviewVO> reviewlist = reviewService.reviewList(prdNo, displayPost, postNum);
		model.addAttribute("reviewlist", reviewlist);

		List<MarketQnaVO> qnalist = qnaService.qnaList(prdNo, qnadisplayPost, qnapostNum);
		/* qnalist += qnaService.qnarCount(prdQnano); */
		model.addAttribute("qnalist", qnalist);

		

		return "/market/marketDetailView";
	}

}
