package com.spring.green2209S_07;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
    @RequestMapping(value = "/msg/{msgFlag}", method = RequestMethod.GET)
    public String msgGet(@PathVariable String msgFlag, Model model,
                         @RequestParam(value = "mid", defaultValue = "", required = false) String mid,
                         @RequestParam(value = "flag", defaultValue = "", required = false) String flag
                         ) {

        if(msgFlag.equals("memberJoinOk")) {
            model.addAttribute("msg", "회원가입에 성공하였습니다! 이메일 인증 완료 후 사용하여 주시기 바랍니다!");
            model.addAttribute("url", "member/memberLogin");
        }
        else if(msgFlag.equals("memberIdOverYes")) {
            model.addAttribute("msg", "아이디가 중복되었습니다!");
            model.addAttribute("url", "member/memberJoin");
        }
        else if(msgFlag.equals("memberNickNameOverYes")) {
            model.addAttribute("msg", "닉네임이 중복되었습니다!");
            model.addAttribute("url", "member/memberJoin");
        }
        else if(msgFlag.equals("memberEmailOverYes")) {
            model.addAttribute("msg", "이메일이 중복되었습니다!");
            model.addAttribute("url", "member/memberJoin");
        }
        else if(msgFlag.equals("memberLoginOk")) {
            model.addAttribute("msg", mid+"님 로그인되었습니다!");
            model.addAttribute("url", "");
        }
        else if(msgFlag.equals("memberLoginNo")) {
            model.addAttribute("msg", "로그인에 실패하였습니다! 정보를 확인해주세요!");
            model.addAttribute("url", "member/memberLogin");
        }
        else if(msgFlag.equals("memberLogout")) {
            model.addAttribute("msg", mid+"님 로그아웃하셨습니다!");
            model.addAttribute("url", "member/memberLogin");
        }
        else if(msgFlag.equals("memberEmailAuthOk")) {
            model.addAttribute("msg", "이메일 인증에 성공하였습니다!");
            model.addAttribute("url", "member/memberLogin");
        }
        else if(msgFlag.equals("memberEmailAuthNo")) {
            model.addAttribute("msg", "이메일 인증에 실패하였습니다!");
            model.addAttribute("url", "member/memberLogin");
        }


        return "include/message";
    }
}
