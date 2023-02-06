package com.spring.green2209S_07.pagenation;

import org.springframework.stereotype.Service;

@Service
public class PageProcess {
    public PageVO pageNation(int pag, int pageSize, int totRecCnt) {

        PageVO vo=new PageVO();

        int totPage=(totRecCnt%pageSize)==0? totRecCnt/pageSize: (totRecCnt/pageSize)+1;
        int startIndexNo=(pag-1)*pageSize;
        int curScrStartNo=totRecCnt-startIndexNo;

        int blockSize=3;
        int curBlock=(pag-1)/blockSize;
        int lastBlock=(totPage-1)/blockSize;

        vo.setPag(pag);
        vo.setPageSize(pageSize);
        vo.setTotRecCnt(totRecCnt);
        vo.setTotPage(totPage);
        vo.setStartIndexNo(startIndexNo);
        vo.setCurScrStartNo(curScrStartNo);
        vo.setBlockSize(blockSize);
        vo.setCurBlock(curBlock);
        vo.setLastBlock(lastBlock);

        return vo;
    }
}
