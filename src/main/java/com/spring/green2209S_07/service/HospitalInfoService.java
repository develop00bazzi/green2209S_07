package com.spring.green2209S_07.service;

import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;

import java.util.ArrayList;

public interface HospitalInfoService {

    public ArrayList<HospitalInfoVO> getHospitalInfoList();

    public ArrayList<MedicalSubjectInfoVO> getMedicalSubjectList(String ykiho);

    public ArrayList<DetailInfoVO> getDetailInfoList(String ykiho);
}
