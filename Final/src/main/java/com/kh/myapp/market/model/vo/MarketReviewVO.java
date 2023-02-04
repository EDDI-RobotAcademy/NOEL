package com.kh.myapp.market.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MarketReviewVO {

   private int prdReviewno;
   private int prdNo;
   private String marketerId;
   private String prdReviewcontent;
   private String userId;
   private String userId2;
   private Date prdReviewregdate;
   private int rating;
   private String prdName;

}