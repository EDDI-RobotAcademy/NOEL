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
   private String userId;
   private String userId2;
   private String prdQnacontent;
   private Date prdQnaregdate;
   private String secret;
   private String prdQnapw;
   private String pqnaReply;
   private String pqnaReplywriter;
   private Date pqnaReplydate;
   private int prdQnastatus;
   private String prdName;
   
}