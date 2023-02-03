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
    public ArrayList<HospitalInfoVO> getHospitalInfoList() {
        return hospitalInfoDAO.getHospitalInfoList();
    }

    @Override
    public ArrayList<MedicalSubjectInfoVO> getMedicalSubjectList(String ykiho) {
        return hospitalInfoDAO.getMedicalSubjectList(ykiho);
    }

    @Override
    public ArrayList<DetailInfoVO> getDetailInfoList(String ykiho) {
        return hospitalInfoDAO.getDetailInfoList(ykiho);
    }


}
