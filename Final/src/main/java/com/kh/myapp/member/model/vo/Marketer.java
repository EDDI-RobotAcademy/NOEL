package com.kh.myapp.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Marketer {
	private String marketerId;	
	private String marketerPw;
	private String marketerName;	
	private String marketerTel;
	private String marketerEmail;	
	private Date marketerRegdate; 
	private int marketerAuth;
	private String prdNo;	
	private String clNo;	
	private int marketerLevel;
}
