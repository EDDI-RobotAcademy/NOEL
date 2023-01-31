package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wishlist {

    private int wishNo;
    private String userId;
    private int classNo;
    private String thumbNail;
    private String className;
    private String classPrice;

}