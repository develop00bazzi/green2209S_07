package com.spring.green2209S_07;

import com.spring.green2209S_07.pagenation.PageProcess;
import com.spring.green2209S_07.pagenation.PageVO;
import com.spring.green2209S_07.service.HospitalInfoService;
import com.spring.green2209S_07.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/hospitalInfo")
public class HospitalInfoController {

    @Autowired
    HospitalInfoService hospitalInfoService;

    @Autowired
    PageProcess pageProcess;

    // 병원 정보 리스트 페이지 이동

    @RequestMapping(value = "/hospitalInfoList", method = RequestMethod.GET)
    public String hospitalInfoListGet(Model model,
        @RequestParam(name = "pag", defaultValue = "1") int pag,
        @RequestParam(name = "pageSize", defaultValue = "5") int pageSize,
        @RequestParam(name = "medicalSubjectCode", defaultValue = "49") String medicalSubjectCode,
        @RequestParam(name = "regionCode", defaultValue = "") String regionCode,
        @RequestParam(name = "sidoCd", defaultValue = "110000") String sidoCd,
        @RequestParam(name = "sgguCd", defaultValue = "110017") String sgguCd,
        @RequestParam(name = "yadmNm", defaultValue = "") String yadmNm
    ) {

        // 병원 기본 리스트

        // 넘어온 진료 과목, 지역코드, 검색어 가지고 자료의 총 개수 구하기
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
            if(!regionCode.substring(2,6).equals("0000")) {
                regionFlag="sggu";
            }
            else if(regionCode.substring(2,6).equals("0000")){
                regionFlag="sido";
            }
        }

        // 선택한 항목에 해당하는 병원 리스트 가져오기 (페이지 처리)

        int totRecCnt=hospitalInfoService.getTotRecCnt(medicalSubjectCode, regionCode, regionFlag, yadmNm);

        PageVO pageVO=pageProcess.pageNation(pag, pageSize, totRecCnt);

        pageVO.setMedicalSubjectCode(medicalSubjectCode);
        pageVO.setRegionCode(regionCode);
        pageVO.setRegionFlag(regionFlag);
        pageVO.setYadmNm(yadmNm);

        model.addAttribute("pageVO", pageVO);

        ArrayList<HospitalInfoVO> hospitalInfoVOS=hospitalInfoService.getHospitalInfoList(pageVO.getStartIndexNo(), pageVO.getPageSize(), medicalSubjectCode, regionCode, regionFlag, yadmNm);

        model.addAttribute("hospitalInfoVOS", hospitalInfoVOS);

        // 병원 진료 과목 정보 리스트 가져오기

        ArrayList<MedicalSubjectInfoVO> medicalSubjectInfoVOS=new ArrayList<>();
        HashMap<String, ArrayList<MedicalSubjectInfoVO>> medicalSubjectInfoVOHashMap=new HashMap<>();

        for(int i=0; i<hospitalInfoVOS.size(); i++) {
            medicalSubjectInfoVOHashMap.put(hospitalInfoVOS.get(i).getYkiho(), hospitalInfoService.getMedicalSubjectInfoList(hospitalInfoVOS.get(i).getYkiho()));
        }

        model.addAttribute("medicalSubjectInfoVOHashMap", medicalSubjectInfoVOHashMap);

        // 병원 진료시간 정보 가져오기

        HashMap<String, DetailInfoVO> detailInfoVOHashMap=new HashMap<>();

        for(int i=0; i<hospitalInfoVOS.size(); i++) {
            detailInfoVOHashMap.put(hospitalInfoVOS.get(i).getYkiho(), hospitalInfoService.getDetailInfo(hospitalInfoVOS.get(i).getYkiho()));
        }

        model.addAttribute("detailInfoVOHashMap", detailInfoVOHashMap);

        // 시도 리스트 가져오기

        ArrayList<HospitalInfoVO> sidoListVOS=hospitalInfoService.getSidoList();

        model.addAttribute("sidoListVOS", sidoListVOS);

        // medicalSubjectCode에 따른 진료과목 문자 처리

        String medicalSubject="";

        if(medicalSubjectCode.equals("49")) {
            medicalSubject="치과";
        }
        else if(medicalSubjectCode.equals("12")) {
            medicalSubject="안과";
        }
        else if(medicalSubjectCode.equals("14")) {
            medicalSubject="피부과";
        }
        else if(medicalSubjectCode.equals("8")) {
            medicalSubject="성형외과";
        }
        else if(medicalSubjectCode.equals("10")) {
            medicalSubject="산부인과";
        }
        else if(medicalSubjectCode.equals("3")) {
            medicalSubject="정신의학과";
        }
        else if(medicalSubjectCode.equals("15")) {
            medicalSubject="비뇨기과";
        }
        else if(medicalSubjectCode.equals("5")) {
            medicalSubject="정형외과";
        }
        else if(medicalSubjectCode.equals("9")) {
            medicalSubject="마취통증의학과";
        }
        else if(medicalSubjectCode.equals("6")) {
            medicalSubject="신경외과";
        }
        else if(medicalSubjectCode.equals("21")) {
            medicalSubject="재활의학과";
        }
        else if(medicalSubjectCode.equals("16")) {
            medicalSubject="영상의학과";
        }
        else if(medicalSubjectCode.equals("4")) {
            medicalSubject="외과";
        }
        else if(medicalSubjectCode.equals("2")) {
            medicalSubject="신경과";
        }
        else if(medicalSubjectCode.equals("11")) {
            medicalSubject="소아과";
        }
        else if(medicalSubjectCode.equals("1")) {
            medicalSubject="내과";
        }
        else if(medicalSubjectCode.equals("13")) {
            medicalSubject="이비인후과";
        }
        else if(medicalSubjectCode.equals("23")) {
            medicalSubject="가정의학과";
        }
        else if(medicalSubjectCode.equals("99")) {
            medicalSubject="한의원";
        }


        // 나머지 필요한 항목들 던져주기

        model.addAttribute("medicalSubject", medicalSubject);
        model.addAttribute("regionCode", regionCode);
        model.addAttribute("region", hospitalInfoVOS.get(0).getSgguCdNm());

        return "hospitalInfo/hospitalInfoList";
    }

    // 콤보박스 시도 선택시 해당 시도에 해당하는 시군구 리스트 가져오기
    @ResponseBody
    @RequestMapping(value = "/getSgguList", method = RequestMethod.POST)
    public ArrayList<HospitalInfoVO> getSgguListPost(Model model, String sidoCd) {

        return hospitalInfoService.getSgguList(sidoCd);
    }

    // 병원 상세 정보 페이지 이동

    @RequestMapping(value = "/hospitalInfo", method = RequestMethod.GET)
    public String hospitalInfoGet(Model model, HttpSession session, String ykiho) {

        // 병원 기본 정보 가져오기

        HospitalInfoVO hospitalInfoVO=hospitalInfoService.getHositalInfo(ykiho);
        model.addAttribute("hospitalInfoVO", hospitalInfoVO);

        // 진료과목 정보 가져오기

        ArrayList<MedicalSubjectInfoVO> medicalSubjectInfoVOS=hospitalInfoService.getMedicalSubjectInfoList(ykiho);
        model.addAttribute("medicalSubjectInfoVOS", medicalSubjectInfoVOS);

        // 병원 상세 정보 가져오기

        DetailInfoVO detailInfoVO=hospitalInfoService.getDetailInfo(ykiho);
        model.addAttribute("detailInfoVO", detailInfoVO);

        // 병원 교통 정보 가져오기

        ArrayList<TrafficInfoVO> trafficInfoVOS=hospitalInfoService.getTrafficInfo(ykiho);
        model.addAttribute("trafficInfoVOS", trafficInfoVOS);

        System.out.println("trafficInfoVOS: "+trafficInfoVOS);

        // 접속한 유저의 아이디 가지고 찜 여부 가져오기

        String mid=(String)session.getAttribute("sMid");
        WishlistVO wishlistVO=hospitalInfoService.getYkihoWishlist(hospitalInfoVO.getYkiho(), mid, hospitalInfoVO.getClCd());

        model.addAttribute("wishlistVO", wishlistVO);


        return "hospitalInfo/hospitalInfo";
    }

    // 요양기관(병원 / 약국) 찜 목록 처리

    @ResponseBody
    @RequestMapping(value = "/ykihoWishlist", method = RequestMethod.POST)
    public String ykihoWishlistPost(String ykiho, String mid, String clCd) {

        System.out.println("ykiho: "+ykiho);
        System.out.println("mid: "+mid);
        System.out.println("clCd: "+clCd);

        String res="0";

        WishlistVO wishlistVO=hospitalInfoService.getYkihoWishlist(ykiho, mid, clCd);

//        System.out.println("wishlistVO: "+wishlistVO);

        if(wishlistVO==null) {
            hospitalInfoService.setAddYkihoWishlist(ykiho, mid, clCd);
            res="1";
        }
        else {
            hospitalInfoService.setDropYkihoWishlist(ykiho, mid, clCd);
        }

        return res;
    }



}
