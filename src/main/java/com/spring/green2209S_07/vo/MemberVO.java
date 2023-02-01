package com.spring.green2209S_07.vo;

import lombok.Data;

@Data
public class MemberVO {
    private int idx;
    private String mid;
    private String pwd;
    private String nickName;
    private String name;
    private String phoneNum;
    private String email;
    private String address;
    private String authKey;
    private int authStatus;
    private int memClass;
    private String memDrop;
}
