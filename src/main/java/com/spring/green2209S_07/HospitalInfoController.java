package com.spring.green2209S_07;

import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.service.HospitalInfoService;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;

@Controller
@RequestMapping("/hospitalInfo")
public class HospitalInfoController {

    @Autowired
    HospitalInfoService hospitalInfoService;

    @RequestMapping(value = "/hospitalInfoList", method = RequestMethod.GET)
    public String hospitalInfoListGet(Model model) {

        // 병원 기본 리스트

        ArrayList<HospitalInfoVO> hospitalInfoVOS=hospitalInfoService.getHospitalInfoList();

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

        return "hospitalInfo/hospitalInfoList";
    }



}
