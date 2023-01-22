package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassImg {
    private String classNum;
    private int classNo;
    private String imgPath;
    private ArrayList<ClassImg> classImgList;

}
