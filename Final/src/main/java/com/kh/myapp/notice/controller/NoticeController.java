package com.kh.myapp.notice.controller;


import com.kh.myapp.notice.model.service.NoticeService;
import com.kh.myapp.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService service;

    @RequestMapping(value="/selectNoticeList")
    public String selectAllNotice(int reqPage, Model model) {
        HashMap<String, Object> list = service.selectAllNotice(reqPage);

        if(list == null) {
            model.addAttribute("msg", "아직 공지사항이 없습니다.");
            return "notice/noticeList";
        }else {
            model.addAttribute("list", list.get("list"));
            model.addAttribute("pageNavi", list.get("pageNavi"));
            return "notice/noticeList";
        }
    }

    @RequestMapping(value="/noticeDetail")
    public String noticeDetail(int noticeNo, Model model) {
        Notice notice = service.selectOneNotice(noticeNo);

        if(notice == null) {
            model.addAttribute("msg", "없는데?");
            return "notice/noticeDetail";
        }else {

            model.addAttribute("n", notice);
            return "notice/noticeDetail";

        }

    }

    @RequestMapping(value="/goNoticeFrm")
    public String goNoticeFrm() {
        return "notice/noticeWriteFrm";
    }

    @RequestMapping(value="/insertNoticeWrite")
    public String insertNotice(Notice notice) {
        int result = service.insertNotice(notice);
        return "redirect:/selectNoticeList?reqPage=1";
    }

    @RequestMapping(value = "/deleteNotice")
    public String deleteNotice(int noticeNo){
        int result = service.deleteNotice(noticeNo);

        return "redirect:/selectNoticeList?reqPage=1";
    }

    @RequestMapping(value="updateNoticeFrm")
    public String updateNoticeFrm(int noticeNo, Model model) {
        Notice notice = service.selectOneNotice(noticeNo);
        model.addAttribute("n", notice);

        return "notice/updateNoticeFrm";
    }

    @RequestMapping("updateNotice")
    public String updateNotice(Notice n) {
        int result = service.updateNotice(n);
        return "redirect:/noticeDetail?noticeNo=" + n.getNoticeNo();
    }

}
