package com.kh.myapp.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Notice {
    private int rnum;
    private int noticeNo;
    private String noticeTitle;
    private String noticeWriter;
    private String noticeContent;
    private int readCnt;
    private String noticeDate;
}
