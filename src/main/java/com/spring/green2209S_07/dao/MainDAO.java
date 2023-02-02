package com.spring.green2209S_07.dao;

import com.spring.green2209S_07.vo.HospitalInfoVO;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface MainDAO {
    ArrayList<HospitalInfoVO> getSidoList();

    ArrayList<HospitalInfoVO> getSgguList();
}
