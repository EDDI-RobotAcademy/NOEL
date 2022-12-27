package com.kh.myapp.cl.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.myapp.cl.model.service.ClassService;
import com.kh.myapp.cl.model.vo.Class;
import com.kh.myapp.cl.model.vo.Menu;
import com.kh.myapp.cl.model.vo.Reserve;
import com.kh.myapp.cl.model.vo.Review;

@Controller
public class ClassController {

    @Autowired
    private ClassService service;


    // 생성자
    public ClassController(){
        super();
    }

    // 업체 리스트출력
    @RequestMapping(value = "/classList")
    public String storeListFrm(int reqPage, Model model) {

        HashMap<String, Object> map = service.classList(reqPage);

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

    // marketerMypage.jsp로 이동
    @RequestMapping(value="/marketerMypage", method = RequestMethod.GET)
    public String form()
    {
        return "/class/marketerMypage";
    }

    // 클래스 추가 jsp로 이동
    @RequestMapping(value = "/class/addClass")
    public void addClass() throws Exception
    {
        System.out.println("addClass.jsp로 이동");
    }

    // 클래스 추가 메소드
    @RequestMapping(value = "/class/addClassAc")
    public String addClassAc(Class cv, HttpServletRequest request, String zipCode, String detailAddress,String closedHour) {
        cv.setClassResTime(cv.getClassResTime() + "~" + closedHour);
        int result = service.addClassAc(cv);
        cv.setClassAddr(zipCode + "*" + cv.getClassAddr() + "*" + detailAddress);
        return "/class/marketerMypage";
    }

}
