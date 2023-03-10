package com.spring.green2209S_07.pagenation;

import lombok.Data;

@Data
public class PageVO {
    private int pag;
    private int pageSize;
    private int totRecCnt;
    private int totPage;
    private int startIndexNo;
    private int curScrStartNo;
    private int blockSize;
    private int curBlock;
    private int lastBlock;

//	페이지네이션에만 필요한 기본적인 필드 처리

    private String part;
    private String search;
    private String searchString;
    private String flag;

//  추가로 필요한 필드에 대한 처리

    private String medicalSubjectCode;
    private String regionCode;
    private String regionFlag;
    private String yadmNm;

//  병원 리스트 조회에 필요한 필드

}
