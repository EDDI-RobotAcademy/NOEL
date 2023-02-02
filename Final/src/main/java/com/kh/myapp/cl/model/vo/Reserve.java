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
    private int bookStatus;
    private String bookDate;
    private String bookNum;
    private String bookTime;
    private String impUid;
    private String marketerId;
    private String reserverName;
    
    
}
