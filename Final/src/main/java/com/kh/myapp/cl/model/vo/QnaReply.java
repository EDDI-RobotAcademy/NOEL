package com.kh.myapp.cl.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnaReply {

    private int classQnarNo;
    private int classQnaNo;
    private String writer;
    private String classQnarContent;
    private Date classQnarRegdate;

}