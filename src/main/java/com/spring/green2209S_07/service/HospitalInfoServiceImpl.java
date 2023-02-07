package com.spring.green2209S_07.service;

import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.dao.HospitalInfoDAO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class HospitalInfoServiceImpl implements HospitalInfoService {
    @Autowired
    HospitalInfoDAO hospitalInfoDAO;

    @Override
    public ArrayList<MedicalSubjectInfoVO> getMedicalSubjectInfoList(String ykiho) {
        return hospitalInfoDAO.getMedicalSubjectInfoList(ykiho);
    }

    @Override
    public ArrayList<DetailInfoVO> getDetailInfoList(String ykiho) {
        return hospitalInfoDAO.getDetailInfoList(ykiho);
    }

    @Override
    public ArrayList<HospitalInfoVO> getSidoList() {
        return hospitalInfoDAO.getSidoList();
    }

    @Override
    public ArrayList<HospitalInfoVO> getSgguList(String sidoCd) {
        return hospitalInfoDAO.getSgguList(sidoCd);
    }

    @Override
    public int getTotRecCnt(String medicalSubjectCode, String regionCode, String regionFlag, String yadmNm) {

        System.out.println("getTotRecCnt 서비스: "+medicalSubjectCode);
        System.out.println("getTotRecCnt 서비스: "+regionCode);
        System.out.println("getTotRecCnt 서비스: "+regionFlag);
        System.out.println("getTotRecCnt 서비스: "+yadmNm);

        return hospitalInfoDAO.getTotRecCnt(medicalSubjectCode, regionCode, regionFlag, yadmNm);
    }

    @Override
    public ArrayList<HospitalInfoVO> getHospitalInfoList(int startIndexNo, int pageSize, String medicalSubjectCode, String regionCode, String regionFlag, String yadmNm) {

        System.out.println("getHospitalInfoList 서비스: "+medicalSubjectCode);
        System.out.println("getHospitalInfoList 서비스: "+regionCode);
        System.out.println("getHospitalInfoList 서비스: "+regionFlag);
        System.out.println("getHospitalInfoList 서비스: "+yadmNm);

        return hospitalInfoDAO.getHospitalInfoList(startIndexNo, pageSize, medicalSubjectCode, regionCode, regionFlag, yadmNm);
    }

    @Override
    public HospitalInfoVO getHositalInfo(String ykiho) {
        return hospitalInfoDAO.getHositalInfo(ykiho);
    }

    @Override
    public DetailInfoVO getDetailInfo(String ykiho) {
        return hospitalInfoDAO.getDetailInfo(ykiho);
    }


}
