package com.kh.myapp.cl.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.myapp.cl.model.service.ClassQnaService;
import com.kh.myapp.cl.model.service.ClassService;
import com.kh.myapp.cl.model.vo.Class;
import com.kh.myapp.cl.model.vo.ClassImg;
import com.kh.myapp.cl.model.vo.ClassReviewImg;
import com.kh.myapp.cl.model.vo.Menu;
import com.kh.myapp.cl.model.vo.Qna;
import com.kh.myapp.cl.model.vo.Reserve;
import com.kh.myapp.cl.model.vo.Review;
import com.kh.myapp.commom.FileRename;
import com.kh.myapp.member.model.vo.Marketer;
import com.kh.myapp.member.model.vo.Member;

@Controller
public class ClassController {

    @Autowired
    private ClassService service;
	
	@Autowired
	private ClassQnaService qnaService;

    @Autowired
    private FileRename fileRename;


    // 생성자
    public ClassController(){
        super();
    }

   
	// 판매자 > 클래스 관리 > 클래스 출력
	@RequestMapping(value = "/class/marketerClassMypage", method = RequestMethod.GET)
	public void getMarketer(Model model, @SessionAttribute Marketer mk) throws Exception {
		List<Class> list = service.list(mk.getMarketerId());
		model.addAttribute("classlist", list);
	}
	
	// 판매자 > 클래스 관리 > 클래스 등록 폼
	@RequestMapping(value = "/class/classAdd", method = RequestMethod.GET)
	public void getClassAdd() throws Exception {
		System.out.println("classAdd.jsp로 이동");
	}
	
    // 판매자 > 클래스 관리 > 클래스 등록
    @RequestMapping(value = "/class/addClass")
    public String addClass(Class cv, MultipartFile[] file, HttpServletRequest request, String zipCode,
                           String detailAddress, String closedHour)
    {
        // 첨부이미지 목록 저장할 리스트 생성
        ArrayList<ClassImg> classImgList = new ArrayList<ClassImg>();

        if (!file[0].isEmpty())
        {
            String savePath = request.getSession().getServletContext().getRealPath("resources/upload/class/");

            for (MultipartFile file2 : file)
            {
                String filename = file2.getOriginalFilename();
                String imgpath = fileRename.fileRename(savePath, filename);
                try
                {
                    FileOutputStream fos = new FileOutputStream(new File(savePath + imgpath));
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    byte[] bytes = file2.getBytes();
                    bos.write(bytes);
                    bos.close();
                }
                catch (FileNotFoundException e)
                {
                    e.printStackTrace();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
                ClassImg classImg = new ClassImg();
                classImg.setImgPath(imgpath);
                classImgList.add(classImg);
            }
        }
        cv.setClassImgList(classImgList);
        cv.setClassAddr(zipCode + "*" + cv.getClassAddr() + "*" + detailAddress);
        cv.setClassResTime(cv.getClassResTime() + "~" + closedHour);
        int result = service.addClass(cv);

        return "redirect:/class/marketerClassMypage";
    }

    // 판매자 > 클래스 관리 > 클래스 등록 시 content 내에 이미지를 삽입하기 위한 메소드
    @ResponseBody
    @RequestMapping(value = "/classEditorUpload", produces = "application/json;charset=utf-8")
    public String classEditorUpload(MultipartFile[] files, HttpServletRequest request)
    {
        String filepath = null;

        if (!files[0].isEmpty())
        {
            // 파일 경로 설정
            String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/class/editor/");
            // 파일 중복처리
            for (MultipartFile fileList : files)
            {
                String filename = fileList.getOriginalFilename();
                filepath = fileRename.fileRename(savePath, filename);
                try
                {
                    FileOutputStream fos = new FileOutputStream(savePath + filepath);
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    byte[] bytes = fileList.getBytes();

                    bos.write(bytes);
                    bos.close();
                }
                catch (FileNotFoundException e)
                {
                    e.printStackTrace();
                }
                catch (IOException e)
                {

                    e.printStackTrace();
                }
            }
        }
        Gson gson = new Gson();
        String result = gson.toJson("/resources/upload/class/editor/" + filepath);
        return result;
    }
    
	// 판매자 > 클래스 관리 > 클래스 수정 폼
	@RequestMapping(value = "/class/classUpdate", method = RequestMethod.GET)
	public String updateClass(Class cv, Model model) throws Exception {
		ArrayList<ClassImg> classImgList = service.selectClassImg(cv.getClassNo());
		Class read = service.read(cv.getClassNo());
		model.addAttribute("classlist", read);
		model.addAttribute("classImgList", classImgList);
		return "/class/classUpdate";
	}
	
	// 판매자 > 클래스 관리 > 클래스 수정
	@RequestMapping(value = "/class/updateClass", method = RequestMethod.POST)
	public String updateClass(int[] imgNoList, Class cv, String[] imgpathList, MultipartFile[] file,
			HttpServletRequest request, String zipCode, String detailAddress, String closedHour) throws Exception 
	{
		ArrayList<ClassImg> classImgList = new ArrayList<ClassImg>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/class/");
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
					ClassImg ci = new ClassImg();
					ci.setImgPath(imgpath);
					classImgList.add(ci);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		cv.setClassImgList(classImgList);
		cv.setClassAddr(zipCode + "*" + cv.getClassAddr() + "*" + detailAddress);
		cv.setClassResTime(cv.getClassResTime() + "~" + closedHour);
		int result = service.updateClass(cv, imgNoList);
		if (imgNoList != null && (result == (classImgList.size() + imgNoList.length + 1))) {
			if (imgpathList != null) {
				for (String filepath : imgpathList) {
					File delFile = new File(savePath + filepath);
					delFile.delete();
				}
			}
		}
		return "redirect:/class/marketerClassMypage";
	}
	
	// 클래스 삭제
	@RequestMapping(value = "/class/classDelete", method = RequestMethod.GET)
	public String classDelete(int classNo) throws Exception {
		service.classDelete(classNo);
		return "redirect:/class/marketerClassMypage";
	}
	

 		

    // 판매자 > 클래스 > 메뉴 리스트 페이지
	@RequestMapping(value = "/class/menuFrm", method = RequestMethod.GET)
	public String getMarketer2(Model model, @SessionAttribute Marketer mk, HttpServletRequest request) throws Exception {
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		List<Menu> menuList = service.menuList(mk.getMarketerId());
		model.addAttribute("classNo", classNo);
		model.addAttribute("menuList", menuList);
		return "/class/menuFrm";
	}
	
	// 판매자 > 클래스 > 메뉴 등록 폼
	@RequestMapping(value = "/class/addMenuFrm", method = RequestMethod.GET)
	public String getAddMenuFrm(HttpServletRequest request, Model model) throws Exception {
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		model.addAttribute("classNo", classNo);
		return "/class/addMenuFrm";		
	}
		
	// 판매자 > 메뉴 등록
	@RequestMapping(value = "/addMenu", method = RequestMethod.POST)
	public String addMenu(Menu me, MultipartFile file, HttpServletRequest request) throws Exception {
		if (!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/menu/");
			String imgName = file.getOriginalFilename();
			String menuPath = fileRename.fileRename(savePath, imgName);

			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + menuPath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			me.setMenuImg(menuPath);
		}
		int result = service.addMenu(me);
		return "redirect:/class/menuFrm?classNo=" + me.getClassNo();
	}
		
		
	// 판매자 > 클래스 > 메뉴 수정폼으로 이동
	@RequestMapping(value = "/class/updateMenuFrm", method = RequestMethod.GET)
	public String updateMenuFrm(Model model, Menu me) throws Exception {
		Menu readMenu = service.readMenu(me.getMenuNo());
		model.addAttribute("menulist", readMenu);
		return "/class/updateMenuFrm";
	}

	// 판매자 > 클래스 > 메뉴 수정
	@RequestMapping(value = "/class/updateMenu", method = RequestMethod.POST)
	public String updateMenu(Menu me, MultipartFile file, HttpServletRequest request) throws Exception  {
		if (!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/menu/");
			String imgName = file.getOriginalFilename();
			String menuPath = fileRename.fileRename(savePath, imgName);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + menuPath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			me.setMenuImg(menuPath);
		}
		int result = service.updateMenu(me);
		return "redirect:/class/menuFrm?classNo=" + me.getClassNo();
	}
		

	// 메뉴 삭제
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.GET)
	public String deleteMenu(int menuNo, Menu me) throws Exception {
		service.deleteMenu(menuNo);
		return "redirect:/class/menuFrm?classNo=" + me.getClassNo();
	}
	
    // 판매자 > 예약 관리
 	@RequestMapping(value = "class/reserveManagement", method = RequestMethod.GET)
 	public void reserveManagement(Model model, Reserve re, @SessionAttribute Marketer mk, int reqPage) throws Exception {

 		String marketerId = mk.getMarketerId();
 		HashMap<String, Object> map = service.selectAllReserveListMarketer(reqPage, marketerId);
 		model.addAttribute("list", map.get("list"));
 		model.addAttribute("reqPage",map.get("reqPage"));
		model.addAttribute("pageNavi",map.get("pageNavi"));
		model.addAttribute("total", map.get("total"));
		model.addAttribute("pageNo", map.get("pageNo"));
		model.addAttribute("marketerNo", marketerId);
 	}
 	
 	//판매자 > 예약관리> 예약상태 지정
 	@RequestMapping(value="/class/updateReserveLevel", method = RequestMethod.POST)
 	public String updateReserveLevel(Reserve Reserve) {
 		int result = service.updateReserveLevel(Reserve);
 		return "redirect:/class/reserveManagement?reqPage=1";
 	}
 	
 	
	//판매자 > 예약관리 > 검색기능
	@RequestMapping(value="/searchReserve", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchReserve(Reserve reserve, String type, String keyword,
			int reqPage, Model model, @SessionAttribute Marketer mk){
		String marketerId = reserve.getMarketerId();
		HashMap<String, Object> map = service.searchReserve(marketerId, type, keyword,reqPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageNavi", map.get("pageNavi"));
		return "class/reserveManagement";
	}
	
	
	
	// 구매자 > 예약 내역 > 리뷰 등록 폼
	@RequestMapping(value = "/class/classReviewAdd", method = RequestMethod.GET)
	public void getClassReviewAdd(HttpServletRequest request, Model model) throws Exception {
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		model.addAttribute("classNo", classNo);
		System.out.println("classReviewAdd.jsp로 이동");
	}
	
	// 구매자 > 예약 내역 > 리뷰 등록
    @RequestMapping(value = "/class/addClassReview", method = RequestMethod.POST)
    public String addClassReview(Review review, MultipartFile[] file, HttpServletRequest request, int classNo)
    {
        // 첨부이미지 목록 저장할 리스트 생성
        ArrayList<ClassReviewImg> classReviewImgList = new ArrayList<ClassReviewImg>();

        if (!file[0].isEmpty())
        {
            String savePath = request.getSession().getServletContext().getRealPath("resources/upload/classReview/");

            for (MultipartFile file2 : file)
            {
                String filename = file2.getOriginalFilename();
                String imgpath = fileRename.fileRename(savePath, filename);
                try
                {
                    FileOutputStream fos = new FileOutputStream(new File(savePath + imgpath));
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    byte[] bytes = file2.getBytes();
                    bos.write(bytes);
                    bos.close();
                }
                catch (FileNotFoundException e)
                {
                    e.printStackTrace();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
                ClassReviewImg classReviewImg = new ClassReviewImg();
                classReviewImg.setImgPath(imgpath);
                classReviewImgList.add(classReviewImg);
            }
        }
        review.setClassReviewImgList(classReviewImgList);
        int result = service.addClassReview(review);

        if (result > 0) {
            return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";
        }
        return "redirect:/classDetail?reqPage=1&classNo=" + classNo + "&rnum=1&qnum=1";
    }

    // 구매자 > 예약 내역 > 리뷰 등록 시 content 내에 이미지를 삽입하기 위한 메소드
    @ResponseBody
    @RequestMapping(value = "/classReviewEditorUpload", produces = "application/json;charset=utf-8")
    public String classReviewEditorUpload(MultipartFile[] files, HttpServletRequest request)
    {
        String filepath = null;

        if (!files[0].isEmpty())
        {
            // 파일 경로 설정
            String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/editor/");
            // 파일 중복처리
            for (MultipartFile fileList : files)
            {
                String filename = fileList.getOriginalFilename();
                filepath = fileRename.fileRename(savePath, filename);
                try
                {
                    FileOutputStream fos = new FileOutputStream(savePath + filepath);
                    BufferedOutputStream bos = new BufferedOutputStream(fos);
                    byte[] bytes = fileList.getBytes();

                    bos.write(bytes);
                    bos.close();
                }
                catch (FileNotFoundException e)
                {
                    e.printStackTrace();
                }
                catch (IOException e)
                {

                    e.printStackTrace();
                }
            }
        }
        Gson gson = new Gson();
        String result = gson.toJson("/resources/upload/review/editor/" + filepath);
        return result;
    }
    
    // 리뷰 상세 보기
    @RequestMapping(value = "/classReviewDetail", method = RequestMethod.GET)
    public String classReviewDetail(Integer classReviewNo, String userId, Model model) throws Exception {
    	
        HashMap<String, Object> map = service.selectOneClassReview(classReviewNo, userId);
        model.addAttribute("s", map.get("s"));



        return "/class/classReviewDetail";
    }
    
	// 리뷰 삭제
	@RequestMapping(value = "/class/reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(int classReviewNo) throws Exception {
		service.reviewDelete(classReviewNo);
		return "redirect:/classReviewListFrm?reqPage=1";
	}
    
    
    // 구매자 > 예약 내역 > 리뷰 수정 폼
	@RequestMapping(value = "/class/classReviewUpdate", method = RequestMethod.GET)
	public String updateClassReiview(Review review, Model model) throws Exception {
		ArrayList<ClassReviewImg> classReviewImgList = service.selectClassReviewImg(review.getClassReviewNo());
		Review reviewRead = service.reviewRead(review.getClassReviewNo());
		model.addAttribute("classReviewlist", reviewRead);
		model.addAttribute("classReviewImgList", classReviewImgList);
		return "/class/classReviewUpdate";
	}
	
	// 구매자 > 예약 내역 > 리뷰 수정
	@RequestMapping(value = "/class/updateClassReview", method = RequestMethod.POST)
	public String updateClassReview(int[] imgNoList, Review review, String[] imgpathList, MultipartFile[] file,
			HttpServletRequest request) throws Exception 
	{
		ArrayList<ClassReviewImg> classReviewImgList = new ArrayList<ClassReviewImg>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/classReview/");
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
					ClassReviewImg ri = new ClassReviewImg();
					ri.setImgPath(imgpath);
					classReviewImgList.add(ri);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		review.setClassReviewImgList(classReviewImgList);
		int result = service.updateClassReview(review, imgNoList);
		if (imgNoList != null && (result == (classReviewImgList.size() + imgNoList.length + 1))) {
			if (imgpathList != null) {
				for (String filepath : imgpathList) {
					File delFile = new File(savePath + filepath);
					delFile.delete();
				}
			}
		}
		return "redirect:/classReviewListFrm?reqPage=1";
	}
	
	
	
    // 업체 리뷰 리스트출력
    @RequestMapping(value = "/classReviewListFrm")
    public String classReviewListFrm(int reqPage, Model model) {

        HashMap<String, Object> map = service.classReviewList(reqPage); // 1이라는 데이터를 가지고 classList 메소드를 실행시킨다.

        if (map == null) {
            model.addAttribute("msg", "아직 등록된 리뷰가 없습니다.");
            return "class/classReviewListFrm";
        } else {
            model.addAttribute("list", map.get("list"));
            model.addAttribute("reqPage", reqPage);
            model.addAttribute("pageNavi", map.get("pageNavi"));
            model.addAttribute("total", map.get("total"));
            model.addAttribute("pageNo", map.get("pageNo"));
            return "class/classReviewListFrm";
        }
    }
	
    // 클래스 리스트 출력
    @RequestMapping(value = "/classList")
    public String storeListFrm(int reqPage, Model model) {

        HashMap<String, Object> map = service.classList(reqPage); // 1이라는 데이터를 가지고 classList 메소드를 실행시킨다.

        if (map == null) {
            model.addAttribute("msg", "아직 등록된 업체가 없습니다.");
            return "class/classListFrm";
        } else {
            model.addAttribute("list", map.get("list"));
            model.addAttribute("reqPage", reqPage);
            model.addAttribute("pageNavi", map.get("pageNavi"));
            model.addAttribute("total", map.get("total"));
            model.addAttribute("pageNo", map.get("pageNo"));
            return "class/classListFrm";
        }
    }
    
    

    // 클래스 디테일
    @RequestMapping(value = "/classDetail", method = RequestMethod.GET)
    public String classDetail(Integer classNo, String userId, Model model,
    		@RequestParam(value="rnum", defaultValue="1") int rnum, @RequestParam(value="qnum", defaultValue="1") int qnum) throws Exception {
    	
        HashMap<String, Object> map = service.selectOneClass(classNo, userId);
        model.addAttribute("s", map.get("s"));
        model.addAttribute("sbm", map.get("sbm"));


        int qnacount = qnaService.qnaCount(classNo);
        int postNN = 5;
        
		int postNum = 5 * rnum;
		int qnapostNum = 5 * qnum;
		
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int qnapageNum = (int) Math.ceil((double) qnacount / postNN);
		
		// 출력할 게시물
		int displayPost = (rnum - 1) * postNN;
		int qnadisplayPost = (qnum - 1) * postNN;
		model.addAttribute("qnapageNum", qnapageNum);

		List<Qna> qnalist = qnaService.qnaList(classNo, qnadisplayPost, qnapostNum);
		model.addAttribute("qnalist", qnalist);

        List<Menu> list = service.selectMenuList(classNo);
        model.addAttribute("menuList", list);
        return "/class/classDetail";
    }

    // 예약된 시간/날짜 확인하기
    @ResponseBody
    @RequestMapping(value = "/checkReserve", produces = "application/json;charset=utf-8")
    public String ajaxCheckReserve(Reserve r) {
        ArrayList<Reserve> list = service.ajaxCheckReserve(r);
        Gson gson = new Gson();
        String result = gson.toJson(list);
        return result;
    }

    // 비활성화 시간 확인하기
    @ResponseBody
    @RequestMapping(value = "/checkReserveTime", produces = "application/json;charset=utf-8")
    public String ajaxCheckReserveTime(String selectDate, int maxNum, int classNo) {
        ArrayList<Reserve> list = service.ajaxCheckReserveTime(selectDate, maxNum, classNo);
        Gson gson = new Gson();
        String result = gson.toJson(list);
        return result;
    }

    // 예약하기
    @RequestMapping(value = "/reserve")
    public String StoreDetail(String userId, int classNo, Reserve r, HttpServletRequest request) {
        int result = service.reserve(r);
        if (result > 0) {
            request.setAttribute("msg", "예약이 완료되었습니다.");
            request.setAttribute("url", "/classDetail.do?classNo="+ classNo);
            return "common/alert";
        } else {
            return "redirect:/";
        }
    }

    
  //예약관리
    @RequestMapping(value="/reserveList")
    public String reserveList(@SessionAttribute Member m, Model model, int reqPage) {
        String userId = m.getUserId();
        HashMap<String, Object> map = service.selectReserveList(reqPage, userId);
        model.addAttribute("list", map.get("list"));
        return "class/reserveList";
    }
    
    // 예약취소
    @RequestMapping(value = "/cancleReserve")
    public String cancleReserve(int reserveNo, HttpServletRequest request) {
        int result = service.cancleReserve(reserveNo);
        if(result > 0) {
            request.setAttribute("msg", "예약이 취소되었습니다.");
            request.setAttribute("url", "/reserveList?reqPage=1");
            return "layouts/alert";
        } else {
            request.setAttribute("msg", "취소 중 문제가 발생했습니다.");
            request.setAttribute("url", "/reserveList?reqPage=1");
            return "layouts/alert";
        }
    }
	
}
