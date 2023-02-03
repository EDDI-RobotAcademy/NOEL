package com.kh.myapp.cl.model.vo;

import java.util.ArrayList;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
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
   private ArrayList<ClassReviewImg> classReviewImgList;
   private int rating;
}