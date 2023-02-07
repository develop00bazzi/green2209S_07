package com.spring.green2209S_07.dao;

import com.spring.green2209S_07.vo.DetailInfoVO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import com.spring.green2209S_07.vo.MedicalSubjectInfoVO;
import com.spring.green2209S_07.vo.TrafficInfoVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface HospitalInfoDAO {

    public ArrayList<MedicalSubjectInfoVO> getMedicalSubjectInfoList(@Param("ykiho") String ykiho);

    public ArrayList<DetailInfoVO> getDetailInfoList(@Param("ykiho") String ykiho);

    public ArrayList<HospitalInfoVO> getSidoList();

    public ArrayList<HospitalInfoVO> getSgguList(@Param("sidoCd") String sidoCd);

    public int getTotRecCnt(@Param("medicalSubjectCode") String medicalSubjectCode, @Param("regionCode") String regionCode, @Param("regionFlag") String regionFlag, @Param("yadmNm") String yadmNm);

    public ArrayList<HospitalInfoVO> getHospitalInfoList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("medicalSubjectCode") String medicalSubjectCode, @Param("regionCode") String regionCode, @Param("regionFlag") String regionFlag, @Param("yadmNm") String yadmNm);

    public HospitalInfoVO getHositalInfo(@Param("ykiho") String ykiho);

    public DetailInfoVO getDetailInfo(@Param("ykiho") String ykiho);

    ArrayList<TrafficInfoVO> getTrafficInfo(@Param("ykiho") String ykiho);
}
