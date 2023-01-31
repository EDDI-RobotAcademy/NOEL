package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassReviewImg {
    private String classReviewNum;
    private int classReviewNo;
    private String imgPath;
    private ArrayList<ClassReviewImg> classReviewImgList;

}
