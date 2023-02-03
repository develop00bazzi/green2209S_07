package com.spring.green2209S_07.dao;

import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface HospitalInfoDAO {

    public ArrayList<HospitalInfoVO> getHospitalInfoList();

    public ArrayList<MedicalSubjectInfoVO> getMedicalSubjectList(@Param("ykiho") String ykiho);

    public ArrayList<DetailInfoVO> getDetailInfoList(@Param("ykiho") String ykiho);
}
