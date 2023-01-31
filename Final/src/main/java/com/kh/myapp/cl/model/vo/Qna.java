package com.kh.myapp.cl.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Qna {

   private int classQnaNo;
   private int classNo;
   private String marketerId;
   private String userId;
   private String userId2;
   private String classQnaContent;
   private Date classQnaRegdate;
   private String classSecret;
   private String classQnaPw;
   private String classQnaReply;
   private String classQnaReplyWriter;
   private Date classQnaReplyDate;
   private int classQnaStatus;
   private String className;
   
}