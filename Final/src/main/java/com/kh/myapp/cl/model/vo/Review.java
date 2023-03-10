package com.kh.myapp.cl.model.vo;

import java.util.ArrayList;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Review {

   private int classReviewNo;
   private int classNo;
   private String marketerId;
   private String classReviewContent;
   private String userId;
   private String userId2;
   private Date classReviewRegdate;
   private String classReviewName;
   private String className;
   private String thumNail;
   private Integer bookNo;
   private ArrayList<ClassReviewImg> classReviewImgList;
   private String rating;
}