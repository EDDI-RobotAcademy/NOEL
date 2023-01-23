package com.kh.myapp.notice.controller;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.myapp.commom.FileRename;
import com.kh.myapp.notice.model.service.NoticeService;
import com.kh.myapp.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	@Autowired
	private FileRename fileRename;

	@RequestMapping(value = "/selectNoticeList")
	public String selectAllNotice(int reqPage, Model model) {
		HashMap<String, Object> list = service.selectAllNotice(reqPage);

		if (list == null) {
			model.addAttribute("msg", "아직 공지사항이 없습니다.");
			return "notice/noticeList";
		} else {
			model.addAttribute("list", list.get("list"));
			model.addAttribute("pageNavi", list.get("pageNavi"));
			return "notice/noticeList";
		}
	}

	@RequestMapping(value = "/noticeDetail")
	public String noticeDetail(int noticeNo, Model model) {
		Notice notice = service.selectOneNotice(noticeNo);

		if (notice == null) {
			model.addAttribute("msg", "오류가 발생하였습니다. 다시시도해주세요");
			return "notice/noticeDetail";
		} else {

			model.addAttribute("n", notice);
			return "notice/noticeDetail";

		}

	}

	@RequestMapping(value = "/goNoticeFrm")
	public String goNoticeFrm() {
		return "notice/noticeWriteFrm";
	}

	@RequestMapping(value = "/insertNoticeWrite")
	public String insertNotice(Notice notice) {
		int result = service.insertNotice(notice);
		return "redirect:/selectNoticeList?reqPage=1";
	}

	@RequestMapping(value = "/deleteNotice")
	public String deleteNotice(int noticeNo) {
		int result = service.deleteNotice(noticeNo);

		return "redirect:/selectNoticeList?reqPage=1";
	}

	@RequestMapping("updateNotice")
	public String updateNotice(Notice n) {
		int result = service.updateNotice(n);
		return "redirect:/noticeDetail?noticeNo=" + n.getNoticeNo();
	}

	@ResponseBody
	@RequestMapping(value = "/noticeEditorUpload", produces = "application/json;charset=utf-8")
	public String prdEditorUpload(MultipartFile[] files, HttpServletRequest request) {
		String filepath = null;

		if (!files[0].isEmpty()) {
			// 파일 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			// 파일 중복처리
			for (MultipartFile fileList : files) {
				String filename = fileList.getOriginalFilename();
				filepath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = fileList.getBytes();

					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
			}
		}
		Gson gson = new Gson();
		String result = gson.toJson("/resources/upload/notice/" + filepath);
		return result;
	}

	@RequestMapping(value = "updateNoticeFrm")
	public String updateNoticeFrm(int noticeNo, Model model) {
		Notice notice = service.selectOneNotice(noticeNo);
		model.addAttribute("n", notice);

		return "notice/updateNoticeFrm";
	}

}
