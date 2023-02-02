package com.spring.green2209S_07;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/hospitalInfo")
public class HospitalInfoController {

    @RequestMapping(value = "/hospitalInfoList", method = RequestMethod.GET)
    public String hospitalInfoGet() {

        return "hospitalInfo/hospitalInfoList";
    }
}
