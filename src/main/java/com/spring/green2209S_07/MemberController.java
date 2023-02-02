package com.spring.green2209S_07;

import com.spring.green2209S_07.service.MemberService;
import com.spring.green2209S_07.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    MemberService memberService;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    // 회원 로그인 폼 이동
    @RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
    public String memberLoginGet(HttpServletRequest request) {

        // 로그인 폼 호출시 저장된 쿠키가 있다면 해당 쿠키 가져가기!

        Cookie[] cookies = request.getCookies();
        for(int i=0; i<cookies.length; i++) {
            if(cookies[i].getName().equals("cMid")) {
                request.setAttribute("mid", cookies[i].getValue());
                break;
            }
        }

        return "member/memberLogin";
    }

    // 회원 로그인 확인

    @RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
    public String memberLoginPost(HttpServletRequest request, HttpServletResponse response, HttpSession session,
        @RequestParam(name = "mid", defaultValue = "", required = false) String mid,
        @RequestParam(name = "pwd", defaultValue = "", required = false) String pwd,
        @RequestParam(name = "idSave", defaultValue = "", required = false) String idSave
        ) {
        MemberVO vo=memberService.getMemberInfoMid(mid);

        // VO에 해당 값이 존재하고, 비밀번호가 일치, 탈퇴 신청한 회원이 아닌 경우 로그인 처리
        if(vo!=null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getMemDrop().equals("NO") && vo.getAuthStatus()==1) {
            // 로그인에 필요한 내용들에 대한 처리

            // 세션에 아이디, 닉네임, 회원 등급 저장
            session.setAttribute("sMemClass", vo.getMemClass());
            session.setAttribute("sMid", vo.getMid());
            session.setAttribute("sNickName", vo.getNickName());

            // 아이디 저장 선택시 쿠키에 7일 동안 해당 아이디 저장

            if(idSave.equals("on")) {
                Cookie cookie = new Cookie("cMid", mid);
                cookie.setMaxAge(60*60*24*7);
                response.addCookie(cookie);
            }
            else {
                Cookie[] cookies = request.getCookies();
                for(int i=0; i<cookies.length; i++) {
                    if(cookies[i].getName().equals("cMid")) {
                        cookies[i].setMaxAge(0);
                        response.addCookie(cookies[i]);
                        break;
                    }
                }
            }

            return "redirect:/msg/memberLoginOk?mid="+mid;
        }
        else {
            return "redirect:/msg/memberLoginNo";
        }

    }

    // 회원 로그아웃

    @RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
    public String memberLogoutGet(HttpSession session) {

        String mid=(String)session.getAttribute("sMid");
        session.invalidate();

        return "redirect:/msg/memberLogout?mid="+mid;
    }

    // 회원 가입 폼 이동
    @RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
    public String memberJoinGet() {
        return "member/memberJoin";
    }

    // 회원가입 버튼 누를 시 회원가입 처리
    @RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
    public String memberJoinPost(MemberVO vo, HttpServletRequest request) {
//        System.out.println("vo"+vo);

        // 아이디 중복 체크

        if(memberService.getMemberInfoMid(vo.getMid())!=null) {
            return "redirect:/msg/memberIdOverYes";
        }

        // 닉네임 중복 체크

        if(memberService.getMemberInfoNickName(vo.getNickName())!=null) {
            return "redirect:/msg/memberNickNameOverYes";
        }

        // 이메일 중복 체크

        if(memberService.getMemberInfoEmail(vo.getEmail())!=null) {
            return "redirect:/msg/memberEmailOverYes";
        }

        // 비밀번호 암호화 처리

        vo.setPwd(passwordEncoder.encode(vo.getPwd()));

        // 모든 체크, 비밀번호 암호화 처리 후 DB에 저장 처리

        memberService.setMemberJoinOk(vo);

        // 이메일 인증을 위한 이메일 발송 처리
        // 사진 파일 경로
        String bannerImg=request.getSession().getServletContext().getRealPath("/resources/images/green2209S_07_banner.png");

        // 서비스 단에서 request 사용하려면 복잡하니까 컨트롤러 부분에서 미리 경로 생성 후 넘겨주면 작업이 훨씬 용이하다.

        memberService.memberJoinOkEmailSend(vo, bannerImg);

        return "redirect:/msg/memberJoinOk";
    }


    // 회원 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value = "/memberMidOverCheck", method = RequestMethod.POST)
    public String memberMidOverCheckPost(String mid) {
        String res="0";
        MemberVO vo=memberService.getMemberInfoMid(mid);
        if(vo!=null) res="1";
        return res;
    }

    // 회원 닉네임 중복 체크
    @ResponseBody
    @RequestMapping(value = "/memberNickNameOverCheck", method = RequestMethod.POST)
    public String memberNickNameOverCheckPost(String nickName) {
        String res="0";
        MemberVO vo=memberService.getMemberInfoNickName(nickName);
        if(vo!=null) res="1";
        return res;
    }

    // 회원 이메일 중복 체크
    @ResponseBody
    @RequestMapping(value = "/memberEmailOverCheck", method = RequestMethod.POST)
    public String memberEmailOverCheckPost(String email) {
        String res="0";
        MemberVO vo=memberService.getMemberInfoEmail(email);
        if(vo!=null) res="1";
        return res;
    }

    // 회원 이메일 인증

    @RequestMapping(value = "/memberEmailAuthUpdate", method = RequestMethod.GET)
    public String memberEmailAuthUpdatePost(String email, String authKey) {
        MemberVO vo=memberService.getMemberInfoEmail(email);
        if(vo.getAuthKey().equals(authKey)) {
            memberService.setMemberAuthStatusUpdate(vo);
            return "redirect:/msg/memberEmailAuthOk";
        }
        else {
            return "redirect:/msg/memberEmailAuthNo";
        }
    }


}
