package com.kh.myapp.cl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private String clReviewNo;
    private String clNo;
    private String marketerId;
    private String resNo;
    private String clReviewContent;
    private String clReviewImg;
    private String clReviewDate;
    private int clReviewRating;
}