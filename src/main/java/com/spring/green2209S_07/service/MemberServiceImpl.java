package com.spring.green2209S_07.service;

import com.spring.green2209S_07.dao.MemberDAO;
import com.spring.green2209S_07.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.UUID;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO memberDAO;

    @Autowired
    JavaMailSender mailSender;

    @Override
    public MemberVO getMemberInfoMid(String mid) {
        return memberDAO.getMemberInfoMid(mid);
    }

    @Override
    public MemberVO getMemberInfoNickName(String nickName) {
        return memberDAO.getMemberInfoNickName(nickName);
    }

    @Override
    public MemberVO getMemberInfoEmail(String email) {
        return memberDAO.getMemberInfoEmail(email);
    }

    @Override
    public void setMemberJoinOk(MemberVO vo) {
        memberDAO.setMemberJoinOk(vo);
    }

    @Override
    public void memberJoinOkEmailSend(MemberVO vo, String bannerImg) {
        // 회원 가입시 인증 이메일 전송 처리 및 해당 인증 코드 전송 및 DB 저장

        UUID uuid=UUID.randomUUID();
        String authKey=uuid.toString().substring(0,8);

        // 생성된 8자리 인증 키 DB에 저장 처리
        memberDAO.setEmailAuthKey(vo, authKey);

        // 이메일 발송 처리

        try {
            String toMail=vo.getEmail();
            String title="아파! 어디가? 회원가입 이메일 인증 링크입니다.";
            String content="";

//		메일을 전송하기 위한 객체 : MimeMessage(), MimeMessageHelper()

            MimeMessage message=mailSender.createMimeMessage();
            MimeMessageHelper messageHelper=new MimeMessageHelper(message, true, "UTF-8");

//			메일 보관함에 회원이 보내온 메세지들을 모두 저장시킨다.

            messageHelper.setTo(toMail);
            messageHelper.setSubject(title);
            messageHelper.setText(content);

//			메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송 처리

            content=content.replace("\n", "<br/>");
            content+="<br><hr><h3>아파! 어디가? 이메일 인증을 위한 링크입니다.</h3><hr><br>";
            content+="<p><img src=\"cid:green2209S_07_banner.png\" width='100%'></p>";
            content+="<hr>";
            content+="<p><b>이메일 인증 (학원)</b>  : <a href='http://192.168.0.8:9090/green2209S_07/member/memberEmailAuthUpdate?email="+vo.getEmail()+"&authKey="+authKey+"'>이메일 인증하기</a></p>";
//            content+="<p><b>이메일 인증 (집)</b>  : <a href='http://192.168.0.8:9090/green2209S_07/member/memberEmailAuthUpdate?email="+vo.getEmail()+"&authKey="+authKey+"'>이메일 인증하기</a></p>";
            content+="<hr>";

            messageHelper.setText(content, true);

//			본문에 기재된 그림 파일의 경로를 따로 표시시켜준다. 그리고, 보관함에 다시 저장 처리

            FileSystemResource fileSystemResource=new FileSystemResource(bannerImg);

            messageHelper.addInline("green2209S_07_banner.png", fileSystemResource);	// 그림을 넣을때

//			메일 전송하기

            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void setMemberAuthStatusUpdate(MemberVO vo) {
        memberDAO.setMemberAuthStatusUpdate(vo);
    }




}
