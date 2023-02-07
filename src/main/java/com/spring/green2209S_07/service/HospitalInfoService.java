package com.spring.green2209S_07.service;

import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;

import java.util.ArrayList;

public interface HospitalInfoService {

    public ArrayList<MedicalSubjectInfoVO> getMedicalSubjectInfoList(String ykiho);

    public ArrayList<DetailInfoVO> getDetailInfoList(String ykiho);

    public ArrayList<HospitalInfoVO> getSidoList();

    public ArrayList<HospitalInfoVO> getSgguList(String sidoCd);

    public int getTotRecCnt(String medicalSubjectCode, String regionCode, String regionFlag, String yadmNm);

    public ArrayList<HospitalInfoVO> getHospitalInfoList(int startIndexNo, int pageSize, String medicalSubjectCode, String regionCode, String regionFlag, String yadmNm);

    public HospitalInfoVO getHositalInfo(String ykiho);

    public DetailInfoVO getDetailInfo(String ykiho);
}
