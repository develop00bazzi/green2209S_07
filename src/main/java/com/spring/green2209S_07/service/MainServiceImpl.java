package com.spring.green2209S_07.service;

import com.spring.green2209S_07.dao.MainDAO;
import com.spring.green2209S_07.vo.HospitalInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    MainDAO mainDAO;


    @Override
    public ArrayList<HospitalInfoVO> getSidoList() {
        return mainDAO.getSidoList();
    }

    @Override
    public ArrayList<HospitalInfoVO> getSgguList() {
        return mainDAO.getSgguList();
    }

}
