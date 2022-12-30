package com.kh.myapp.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private String userId; 
	private String userPw;
	private String userName;
	private String userTel;
	private Date userRegdate;
	private String userBirth;
	private int userLevel;
	private String userOrder;
	private String userCart;
}
