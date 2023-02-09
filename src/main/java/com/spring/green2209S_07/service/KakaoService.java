package com.spring.green2209S_07.service;

import com.spring.green2209S_07.vo.KakaoLoginVO;

public interface KakaoService {

    public String getAccessToken(String kakaoAuthUrl, String kakaoApiKey, String redirectURI, String authorize_Code);

    public KakaoLoginVO getKakaoUserInfo(String access_Token);

    public void kakaoLogout(String access_Token);

    public void kakaoLogoutAdminKey(String user_id);
}
