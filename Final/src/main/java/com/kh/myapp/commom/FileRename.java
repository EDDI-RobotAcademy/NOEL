package com.kh.myapp.commom;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class FileRename {
	public String fileRename(String path, String filename) {
		String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); // 파일이름 0번부터 마지막에오는 .앞까지
		String extention = filename.substring(filename.lastIndexOf(".")); // .부터 끝까지 가져옴

		// 실제 업로드할 파일명
		String filepath = null;

		// 파일명이 중복되는 경우 뒤에 붙일 숫자
		int count = 0;
		while (true) {
			if (count == 0) {
				// 파일이름 체크 -> 첫번째 인 경우
				filepath = onlyFilename + extention; // 원래 파일명 그대로(ex : text.txt)
			} else {
				filepath = onlyFilename + "_" + count + extention; // 파일명_숫자.확장자(ex : text_1.txt)
			}
			File checkFile = new File(path + filepath);
			if (!checkFile.exists()) {
				// 파일명이 존재하지않을때 (중복이 아닐때)
				break;
			}
			count++;
		}
		return filepath;
	}
}
