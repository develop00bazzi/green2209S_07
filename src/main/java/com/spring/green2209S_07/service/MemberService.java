package com.spring.green2209S_07.service;

import com.spring.green2209S_07.vo.MemberVO;

public interface MemberService {

    public MemberVO getMemberInfoMid(String mid);

    public MemberVO getMemberInfoNickName(String nickName);

    public MemberVO getMemberInfoEmail(String email);

    public void setMemberJoinOk(MemberVO vo);

    public void memberJoinOkEmailSend(MemberVO vo, String bannerImg);

    public void setMemberAuthStatusUpdate(MemberVO vo);


}
