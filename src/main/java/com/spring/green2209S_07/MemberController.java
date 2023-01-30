package com.spring.green2209S_07;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {

    // 회원 로그인 폼 이동
    @RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
    public String memberLoginGet() {
        return "member/memberLogin";
    }

    // 회원 로그인 확인

    // 회원 가입 폼 이동
    @RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
    public String memberJoinGet() {
        return "member/memberJoin";
    }
}
