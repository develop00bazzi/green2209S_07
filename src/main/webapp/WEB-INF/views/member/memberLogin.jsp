<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/01/30
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/cdn.jsp"></jsp:include>

    <link rel="stylesheet" href="${ctp}/resources/css/main.css">
    <link rel="stylesheet" href="${ctp}/resources/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    <script>
        'use strict';

        function loginCheck() {
            let mid=loginForm.mid.value;
            let pwd=loginForm.pwd.value;

            if(mid.trim()=="") {
                alert("아이디 (ID)를 입력하세요!");
                loginForm.mid.focus();
                return false;
            }
            else if(pwd.trim()=="") {
                alert("비밀번호(PASSWORD)를 입력하세요!");
                loginForm.pwd.focus();
                return false;
            }
            else {
                loginForm.submit();
            }
        }

        function kakaoLogin() {
            $.ajax({
                url: "${ctp}/kakao/kakaoAuthUrl",
                type:"get",
                success:function(requestUrl) {
                    location.href=requestUrl;
                },
                error:function() {
                    alert("전송 오류!");
                }
            });
        }

    </script>
    <style>
        body{
            margin-top:20px;
            background:#eee;
        }
        .gradient-brand-color {
            background-image: -webkit-linear-gradient(0deg, #376be6 0%, #6470ef 100%);
            background-image: -ms-linear-gradient(0deg, #376be6 0%, #6470ef 100%);
            color: #fff;
        }
        .contact-info__wrapper {
            overflow: hidden;
            border-radius: .625rem .625rem 0 0
        }

        @media (min-width: 1024px) {
            .contact-info__wrapper {
                border-radius: 0 .625rem .625rem 0;
                padding: 5rem !important
            }
        }
        .contact-info__list span.position-absolute {
            left: 0
        }
        .z-index-101 {
            z-index: 101;
        }
        .list-style--none {
            list-style: none;
        }
        .contact__wrapper {
            background-color: #fff;
            border-radius: 0 0 .625rem .625rem
        }

        @media (min-width: 1024px) {
            .contact__wrapper {
                border-radius: .625rem 0 .625rem .625rem
            }
        }
        @media (min-width: 1024px) {
            .contact-form__wrapper {
                padding: 5rem !important
            }
        }
        .shadow-lg, .shadow-lg--on-hover:hover {
            box-shadow: 0 1rem 3rem rgba(132,138,163,0.1) !important;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
<div class="container">
    <div class="contact__wrapper shadow-lg mt-n9">
        <div class="row no-gutters">
            <div class="col-lg-5 contact-info__wrapper gradient-brand-color p-5 order-lg-2">
                <h2 class="color--white mb-5">아파! 어디가? 로그인</h2>

                <ul class="contact-info__list list-style--none position-relative z-index-101">
<%--                    <li class="mb-4 pl-4">--%>
<%--                        <h4>소셜 로그인</h4>--%>
<%--                    </li>--%>
                    <li class="mb-4">
                        <a href="javascript:kakaoLogin()"><img src="${ctp}/resources/images/kakao_login_large_narrow.png" width="100%" style="z-index: 990;"></a>
                    </li>
                    <li class="mb-4">
                        <a href="#"><img src="${ctp}/resources/images/btnG_완성형.png" width="100%" style="z-index: 990;"></a>
                    </li>
                    <li class="mb-4">
                        <a href="#"><img src="${ctp}/resources/images/btn_google_signin_light_normal_web@2x.png" width="100%" style="z-index: 990;"></a>
                    </li>
                </ul>

<%--                <figure class="figure position-absolute m-0 opacity-06 z-index-100" style="bottom:0; right: 10px">--%>
<%--                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="444px" height="626px">--%>
<%--                        <defs>--%>
<%--                            <linearGradient id="PSgrad_1" x1="0%" x2="81.915%" y1="57.358%" y2="0%">--%>
<%--                                <stop offset="0%" stop-color="rgb(255,255,255)" stop-opacity="1"></stop>--%>
<%--                                <stop offset="100%" stop-color="rgb(0,54,207)" stop-opacity="0"></stop>--%>
<%--                            </linearGradient>--%>

<%--                        </defs>--%>
<%--                        <path fill-rule="evenodd" opacity="0.302" fill="rgb(72, 155, 248)" d="M816.210,-41.714 L968.999,111.158 L-197.210,1277.998 L-349.998,1125.127 L816.210,-41.714 Z"></path>--%>
<%--                        <path fill="url(#PSgrad_1)" d="M816.210,-41.714 L968.999,111.158 L-197.210,1277.998 L-349.998,1125.127 L816.210,-41.714 Z"></path>--%>
<%--                    </svg>--%>
<%--                </figure>--%>
            </div>

            <div class="col-lg-7 contact-form__wrapper p-5 order-lg-1">
                <h2 class="mb-3"><b>로그인</b></h2>
                <form name="loginForm" class="contact-form form-validate" method="post" novalidate="novalidate">
                    <div class="row">
                        <div class="col-sm-12 mb-3">
                            <div class="form-group">
                                <label class="required-field" for="mid">아이디</label>
                                <input type="text" class="form-control form-control-lg" id="mid" name="mid" value="${mid}" placeholder="아이디를 입력해주세요!">
                            </div>
                        </div>

                        <div class="col-sm-12 mb-3">
                            <div class="form-group">
                                <label for="pwd">비밀번호</label>
                                <input type="password" class="form-control form-control-lg" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요!">
                            </div>
                        </div>

                        <div class="col-sm-6 mb-3 custom-control custom-switch">
                            &nbsp;&nbsp;<input type="checkbox" class="custom-control-input" id="idSave" name="idSave">
                            <label class="custom-control-label" for="idSave">아이디 저장</label>
                        </div>

                        <div class="col-sm-6 mb-3">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${ctp}/member/memberJoin"> 기존 회원이 아니신가요?</a>
                        </div>

                        <div class="col-sm-12">
                            <button type="button" onclick="loginCheck()" class="btn btn-primary form-control">로그인</button>
                        </div>

                    </div>
                </form>
            </div>
            <!-- End Contact Form Wrapper -->

        </div>
    </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>