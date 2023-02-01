package com.spring.green2209S_07.dao;

import com.spring.green2209S_07.vo.MemberVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

    public MemberVO getMemberInfoMid(@Param("mid") String mid);

    public MemberVO getMemberInfoNickName(@Param("nickName") String nickName);

    public MemberVO getMemberInfoEmail(@Param("email") String email);

    public void setMemberJoinOk(@Param("vo") MemberVO vo);

    public void setEmailAuthKey(@Param("vo") MemberVO vo, @Param("authKey") String authKey);

    public void setMemberAuthStatusUpdate(@Param("vo") MemberVO vo);
}
