package com.kh.myapp.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MarketWishVO {

	private int wishNo;
	private int prdNo;
	private String userId;
	private String thumbNail;
	private String prdName;
	private String prdPrice;
	
}
