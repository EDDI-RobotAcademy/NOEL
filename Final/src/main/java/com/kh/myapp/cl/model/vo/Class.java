package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Class {

    private int classNo;
    private String marketerId;
    private String className;
    private String classPrice;
    private String classContent;
    private String classDate;
    private String classResDate;
    private String thumNail;
    private ArrayList<ClassImg> classImgList;
    private String classResTime;
    private String classAddr;

    private String clImg;
    private String closedDay;
    private int maxNum;


}
