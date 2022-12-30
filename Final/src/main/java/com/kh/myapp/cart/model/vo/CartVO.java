package com.kh.myapp.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
    private int cartNo;
    private String userId;
    private int prdNo;
    private int cartQuan;
    private String prdthumNail;
    private String prdName;
    private int prdPrice;
}