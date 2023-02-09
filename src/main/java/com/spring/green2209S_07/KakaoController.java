package com.spring.green2209S_07;

import com.spring.green2209S_07.service.KakaoService;
import com.spring.green2209S_07.service.MemberService;
import com.spring.green2209S_07.vo.KakaoLoginVO;
import com.spring.green2209S_07.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.UUID;

@Controller
@RequestMapping("/kakao")
public class KakaoController {

    @Autowired
    KakaoService kakaoService;
    @Autowired
    MemberService memberService;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    String kakaoAuthUrl="https://kauth.kakao.com";
    String kakaoApiKey="cf2add5f1bbc94e397370a3b344e9e28";
    String redirectURI="http://192.168.0.8:9090/green2209S_07/kakao/OAuthKakao";
//    String redirectURI="http://localhost:9090/green2209S_07/kakao/OAuthKakao";

    // 카카오 로그인창 호출
    @RequestMapping(value = "/kakaoAuthUrl", method = RequestMethod.GET)
    @ResponseBody
    public String kakaoAuthUrlGet() throws Exception {

        String requestUrl=kakaoAuthUrl+"/oauth/authorize?client_id="+kakaoApiKey+"&redirect_uri="+redirectURI+"&response_type=code";

        return requestUrl;
    }

    // 카카오 연동정보 조회

    @RequestMapping(value = "/OAuthKakao", method = RequestMethod.GET)
    public String OAuthKakaoGet(HttpServletRequest request, HttpSession session, Model model) throws Throwable {
        String authorize_code=request.getParameter("code");
        String error=request.getParameter("error");

        System.out.println("authrize_code: "+authorize_code);
        System.out.println("error: "+error);

        // 카카오 로그인 페이지에서 취소 버튼을 눌렀을 경우

        if(error!=null) {
            if(error.equals("access_denied")) {
                return "redirect:/member/memberLogin";
            }
        }

        String access_Token=kakaoService.getAccessToken(kakaoAuthUrl, kakaoApiKey, redirectURI, authorize_code);
        KakaoLoginVO kakaoLoginVO=kakaoService.getKakaoUserInfo(access_Token);

        System.out.println("accessToken: "+access_Token);
        System.out.println("kakaoLoginVO"+kakaoLoginVO);

        if(kakaoLoginVO!=null && !kakaoLoginVO.equals("")) {
            // 회원 정보 관련된거 조회하고 회원가입 및 로그인 처리 후 메인 이동

            MemberVO memberVO=memberService.getMemberInfoEmail(kakaoLoginVO.getEmail());

            if(memberVO==null) {

                // 정보가 없을시 회원가입 처리를 하는데 소셜 로그인 같은 경우
                // 아이디는 무조건 이메일과 동일하게 처리

                String mid=kakaoLoginVO.getEmail();
                String email=kakaoLoginVO.getEmail();
                String pwd=UUID.randomUUID().toString().substring(0,8)+"!";
                String nickName=kakaoLoginVO.getNickName();

                MemberVO socialJoinVO=new MemberVO();

                socialJoinVO.setMid(mid);
                socialJoinVO.setPwd(pwd);
                socialJoinVO.setEmail(email);
                socialJoinVO.setNickName(nickName);

                // 카카오로 로그인했으므로 joinKey를 kakao로 지정

                socialJoinVO.setJoinKey("kakao");

                model.addAttribute("socialJoinVO", socialJoinVO);

                return "member/socialJoin";

            }

            else {

                if(memberVO.getMemDrop().equals("OK")) {
                    return "redirect:/msg/memberLoginNo";
                }

                // 세션에 아이디, 닉네임, 회원 등급 저장
                session.setAttribute("sMemClass", memberVO.getMemClass());
                session.setAttribute("sMid", memberVO.getMid());
                session.setAttribute("sNickName", memberVO.getNickName());

                // 세션에 발급받은 토큰 저장 처리
                session.setAttribute("access_Token", access_Token);

                // 세션에 user_id 저장 처리
                session.setAttribute("user_id", kakaoLoginVO.getUser_id());

                String encodeNickName = URLEncoder.encode(memberVO.getNickName(), "UTF-8");

                return "redirect:/msg/memberLoginOk?nickName="+encodeNickName;
            }


        }
        else {
            return  "redirect:/msg/kakaoAuthNo";
        }
    }



}
