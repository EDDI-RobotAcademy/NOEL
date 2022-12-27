package com.kh.myapp.market.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MarketQnaReplyVO {

   private int prdQnarno;
   private int prdQnano;
   private String writer;
   private String prdQnarcontent;
   private Date prdQnarregdate;

}