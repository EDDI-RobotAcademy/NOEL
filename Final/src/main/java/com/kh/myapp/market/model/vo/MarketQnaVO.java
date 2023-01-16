package com.kh.myapp.market.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MarketQnaVO {

   private int prdQnano;
   private int prdNo;
   private String marketerId;
   private String prdQnacontent;
   private int prdQnastatus;
   private String userId;
   private String userId2;
   private Date prdQnaregdate;
   private String prdQnareply;
   private String prdName;
   private String secret;
   private String prdQnapw;
   
}