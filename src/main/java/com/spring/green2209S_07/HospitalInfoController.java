package com.spring.green2209S_07;

import com.spring.green2209S_07.pagenation.PageProcess;
import com.spring.green2209S_07.pagenation.PageVO;
import com.spring.green2209S_07.service.HospitalInfoService;
import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping("/hospitalInfo")
public class HospitalInfoController {

    @Autowired
    HospitalInfoService hospitalInfoService;

    @Autowired
    PageProcess pageProcess;

    @RequestMapping(value = "/hospitalInfoList", method = RequestMethod.GET)
    public String hospitalInfoListGet(Model model,
        @RequestParam(name = "pag", defaultValue = "1") int pag,
        @RequestParam(name = "pageSize", defaultValue = "5") int pageSize,
        @RequestParam(name = "medicalSubjectCode", defaultValue = "49") String medicalSubjectCode,
        @RequestParam(name = "medicalSubject", defaultValue = "") String medicalSubject,
        @RequestParam(name = "regionCode", defaultValue = "") String regionCode,
        @RequestParam(name = "sidoCd", defaultValue = "110000") String sidoCd,
        @RequestParam(name = "sgguCd", defaultValue = "110017") String sgguCd,
        @RequestParam(name = "yadmNm", defaultValue = "") String yadmNm
    ) {

        // 병원 기본 리스트

        // 넘어온 진료 과목, 지역코드, 검색어 가지고 자료의 총 개수 구하기

//        String regionCode=regionCode;
        String regionFlag="";

        if(regionCode.equals("")) {
            if(!sidoCd.equals("") && sgguCd.equals("")) {
                regionCode=sidoCd;
                regionFlag="sido";
            }
            else if(sidoCd.equals("") && !sgguCd.equals("")) {
                regionCode=sgguCd;
                regionFlag="sggu";
            }
            else if(!sidoCd.equals("") && !sgguCd.equals("")) {
                regionCode=sgguCd;
                regionFlag="sggu";
            }
        }
        else if(!regionCode.equals("")) {
//            regionCode=regionCode;
            if(!regionCode.substring(2,6).equals("0000")) {
                regionFlag="sggu";
            }
            else if(regionCode.substring(2,6).equals("0000")){
                regionFlag="sido";
            }
        }

        System.out.println("regionCode: "+regionCode);

        int totRecCnt=hospitalInfoService.getTotRecCnt(medicalSubjectCode, regionCode, regionFlag, yadmNm);

        System.out.println("총 개수: "+totRecCnt);

//        System.out.println("totRecCnt: "+totRecCnt);

        PageVO pageVO=pageProcess.pageNation(pag, pageSize, totRecCnt);

        pageVO.setMedicalSubjectCode(medicalSubjectCode);
        pageVO.setRegionCode(regionCode);
        pageVO.setRegionFlag(regionFlag);
        pageVO.setYadmNm(yadmNm);

        model.addAttribute("pageVO", pageVO);

        ArrayList<HospitalInfoVO> hospitalInfoVOS=hospitalInfoService.getHospitalInfoList(pageVO.getStartIndexNo(), pageVO.getPageSize(), medicalSubjectCode, regionCode, regionFlag, yadmNm);

        System.out.println("병원 정보 VOS: "+hospitalInfoVOS);

        System.out.println(hospitalInfoVOS.get(0).getSgguCdNm());
        System.out.println(hospitalInfoVOS.get(0).getSidoCdNm());

        model.addAttribute("hospitalInfoVOS", hospitalInfoVOS);

        // 병원 진료 과목 정보 리스트

        ArrayList<ArrayList<MedicalSubjectInfoVO>> medicalSubjectInfoListVOS=new ArrayList<>();

        for(int i=0; i<hospitalInfoVOS.size(); i++) {
            medicalSubjectInfoListVOS.add(hospitalInfoService.getMedicalSubjectList(hospitalInfoVOS.get(i).getYkiho()));
        }

        model.addAttribute("medicalSubjectInfoListVOS", medicalSubjectInfoListVOS);

        // 병원 진료시간 정보 리스트

        ArrayList<ArrayList<DetailInfoVO>> detailInfoListVOS=new ArrayList<>();

        for(int i=0; i<hospitalInfoVOS.size(); i++) {
            detailInfoListVOS.add(hospitalInfoService.getDetailInfoList(hospitalInfoVOS.get(i).getYkiho()));
        }

        System.out.println("병원 상세 정보 리스트 테스트: "+detailInfoListVOS);

        model.addAttribute("detailInfoListVOS", detailInfoListVOS);

        // 시도 리스트 가져오기

        ArrayList<HospitalInfoVO> sidoListVOS=hospitalInfoService.getSidoList();

        model.addAttribute("sidoListVOS", sidoListVOS);

        // 나머지 필요한 항목들 던져주기

        model.addAttribute("medicalSubject", medicalSubject);
        model.addAttribute("regionCode", regionCode);
        model.addAttribute("region", hospitalInfoVOS.get(0).getSgguCdNm());

        return "hospitalInfo/hospitalInfoList";
    }

    // 콤보박스 시도 선택시 해당 시도에 해당하는 시군구 리스트 가져오기
    @ResponseBody
    @RequestMapping(value = "getSgguList", method = RequestMethod.POST)
    public ArrayList<HospitalInfoVO> getSgguListPost(Model model, String sidoCd) {

        return hospitalInfoService.getSgguList(sidoCd);
    }



}
