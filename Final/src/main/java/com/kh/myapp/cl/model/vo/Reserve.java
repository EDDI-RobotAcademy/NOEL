package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Reserve {

    private int bookNo;
    private int classNo;
    private String bookName;
    private String userId;
    private String bookTel;
    private String couponNo;
    private String bookDate;
    private String bookTime;

}
