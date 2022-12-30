package com.kh.myapp.cl.controller;

import com.google.gson.Gson;
import com.kh.myapp.cl.model.service.ClassService;
import com.kh.myapp.cl.model.vo.Class;
import com.kh.myapp.commom.FileRename;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import com.kh.myapp.cl.model.vo.ClassImg;
import com.kh.myapp.cl.model.vo.Menu;
import com.kh.myapp.cl.model.vo.Reserve;
import com.kh.myapp.cl.model.vo.Review;

@Controller
public class ClassController {

    @Autowired
    private ClassService service;

    @Autowired(required=false)
    private FileRename fileRename;


    // 생성자
    public ClassController(){
        super();
    }

    // 업체 리스트출력
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

    // 맛집 상세 보기
    @RequestMapping(value = "/classDetail")
    public String classDetail(int classNo, String bookmarkId, Model model) {
        HashMap<String, Object> map = service.selectOneClass(classNo, bookmarkId);
        model.addAttribute("s", map.get("s"));
        model.addAttribute("sbm", map.get("sbm"));

        System.out.println("ArrayList 출발힙니다. Controller" + classNo);
        ArrayList<Review> reviewList = service.selectReviewList(classNo);
        model.addAttribute("rList", reviewList);

        ArrayList<Menu> list = service.selectMenuList(classNo);
        model.addAttribute("list", list);

        return "class/classDetail";
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
        System.out.println(classNo);
        System.out.println(selectDate);
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



    // 클래스 추가 jsp로 이동
    @RequestMapping(value = "/class/addClassFrm")
    public void addClassFrm() throws Exception
    {
        System.out.println("addClassFrm.jsp로 이동");
    }

    // 클래스 추가 메소드
    @RequestMapping(value = "/class/addClass")
    public String addClass(Class cv, MultipartFile[] file, HttpServletRequest request, String zipCode,
                           String detailAddress, String closedHour)
    {

        System.out.println("addClass 넘어옴");
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

        return "/class/marketerMypage";
    }

    // class content내에 이미지를 삽입하기 위한 메소드
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
}
