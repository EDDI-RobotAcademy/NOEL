package com.kh.myapp.order.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderlistVO {

    private int orderNo;
    private String userId;
    private String orderDate;
    private int orderQuan;
    private String orderStatus;
    private String shippingName;
    private String shippingAddr;
    private String shippingPhone;
    private String impUid;
    private int prdNo;
    private int orderPrice;
    private int cartNo;
    private int cartQuan;
    private String prdthumNail;
    private String prdName;
    private String prdPrice;
    private String marketerId;
	private int prdAllStock;
	private int prdStock;

}