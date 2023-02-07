<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/02/07
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/cdn.jsp"></jsp:include>
    <link rel="stylesheet" href="${ctp}/resources/css/main.css">
    <link rel="stylesheet" href="${ctp}/resources/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous"/>
    <style>
        body {
            /*margin-top:20px;*/
            background-color: #f5f5f5;
        }
        .blog-listing {
            padding-top: 30px;
            padding-bottom: 30px;
        }
        .gray-bg {
            background-color: #f5f5f5;
        }
        /* Blog
        ---------------------*/
        .blog-grid {
            box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
            border-radius: 5px;
            overflow: hidden;
            background: #ffffff;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .blog-grid .blog-img {
            position: relative;
        }
        .blog-grid .blog-img .date {
            position: absolute;
            background: #fc5356;
            color: #ffffff;
            padding: 8px 15px;
            left: 10px;
            top: 10px;
            border-radius: 4px;
        }
        .blog-grid .blog-img .date span {
            font-size: 22px;
            display: block;
            line-height: 22px;
            font-weight: 700;
        }
        .blog-grid .blog-img .date label {
            font-size: 14px;
            margin: 0;
        }
        .blog-grid .blog-info {
            padding: 20px;
        }
        .blog-grid .blog-info h5 {
            font-size: 22px;
            font-weight: 700;
            margin: 0 0 10px;
        }
        .blog-grid .blog-info h5 a {
            color: #20247b;
        }
        .blog-grid .blog-info p {
            margin: 0;
        }
        .blog-grid .blog-info .btn-bar {
            margin-top: 20px;
        }


        /* Blog Sidebar
        -------------------*/
        .blog-aside .widget {
            box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
            border-radius: 5px;
            overflow: hidden;
            background: #ffffff;
            margin-top: 15px;
            margin-bottom: 15px;
            width: 100%;
            display: inline-block;
            vertical-align: top;
        }
        .blog-aside .widget-body {
            padding: 15px;
        }
        .blog-aside .widget-title {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        .blog-aside .widget-title h3 {
            font-size: 20px;
            font-weight: 700;
            color: #fc5356;
            margin: 0;
        }
        .blog-aside .widget-author .media {
            margin-bottom: 15px;
        }
        .blog-aside .widget-author p {
            font-size: 16px;
            margin: 0;
        }
        .blog-aside .widget-author .avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            overflow: hidden;
        }
        .blog-aside .widget-author h6 {
            font-weight: 600;
            color: #20247b;
            font-size: 22px;
            margin: 0;
            padding-left: 20px;
        }
        .blog-aside .post-aside {
            margin-bottom: 15px;
        }
        .blog-aside .post-aside .post-aside-title h5 {
            margin: 0;
        }
        .blog-aside .post-aside .post-aside-title a {
            font-size: 18px;
            color: #20247b;
            font-weight: 600;
        }
        .blog-aside .post-aside .post-aside-meta {
            padding-bottom: 10px;
        }
        .blog-aside .post-aside .post-aside-meta a {
            color: #6F8BA4;
            font-size: 12px;
            text-transform: uppercase;
            display: inline-block;
            margin-right: 10px;
        }
        .blog-aside .latest-post-aside + .latest-post-aside {
            border-top: 1px solid #eee;
            padding-top: 15px;
            margin-top: 15px;
        }
        .blog-aside .latest-post-aside .lpa-right {
            width: 90px;
        }
        .blog-aside .latest-post-aside .lpa-right img {
            border-radius: 3px;
        }
        .blog-aside .latest-post-aside .lpa-left {
            padding-right: 15px;
        }
        .blog-aside .latest-post-aside .lpa-title h5 {
            margin: 0;
            font-size: 15px;
        }
        .blog-aside .latest-post-aside .lpa-title a {
            color: #20247b;
            font-weight: 600;
        }
        .blog-aside .latest-post-aside .lpa-meta a {
            color: #6F8BA4;
            font-size: 12px;
            text-transform: uppercase;
            display: inline-block;
            margin-right: 10px;
        }

        .tag-cloud a {
            padding: 4px 15px;
            font-size: 13px;
            color: #ffffff;
            background: #20247b;
            border-radius: 3px;
            margin-right: 4px;
            margin-bottom: 4px;
        }
        .tag-cloud a:hover {
            background: #fc5356;
        }

        .blog-single {
            padding-top: 30px;
            padding-bottom: 30px;
        }

        .article {
            box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
            border-radius: 5px;
            overflow: hidden;
            background: #ffffff;
            padding: 15px;
            margin: 15px 0 30px;
        }
        .article .article-title {
            padding: 15px 0 20px;
        }
        .article .article-title h6 {
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .article .article-title h6 a {
            text-transform: uppercase;
            color: #fc5356;
            border-bottom: 1px solid #fc5356;
        }
        .article .article-title h2 {
            color: #20247b;
            font-weight: 600;
        }
        .article .article-title .media {
            padding-top: 15px;
            border-bottom: 1px dashed #ddd;
            padding-bottom: 20px;
        }
        .article .article-title .media .avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            overflow: hidden;
        }
        .article .article-title .media .media-body {
            padding-left: 8px;
        }
        .article .article-title .media .media-body label {
            font-weight: 600;
            color: #fc5356;
            margin: 0;
        }
        .article .article-title .media .media-body span {
            display: block;
            font-size: 12px;
        }
        .article .article-content h1,
        .article .article-content h2,
        .article .article-content h3,
        .article .article-content h4,
        .article .article-content h5,
        .article .article-content h6 {
            color: #20247b;
            font-weight: 600;
            margin-bottom: 15px;
        }
        .article .article-content blockquote {
            max-width: 600px;
            padding: 15px 0 30px 0;
            margin: 0;
        }
        .article .article-content blockquote p {
            font-size: 20px;
            font-weight: 500;
            color: #fc5356;
            margin: 0;
        }
        .article .article-content blockquote .blockquote-footer {
            color: #20247b;
            font-size: 16px;
        }
        .article .article-content blockquote .blockquote-footer cite {
            font-weight: 600;
        }
        .article .tag-cloud {
            padding-top: 10px;
        }

        .article-comment {
            box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
            border-radius: 5px;
            overflow: hidden;
            background: #ffffff;
            padding: 20px;
        }
        .article-comment h4 {
            color: #20247b;
            font-weight: 700;
            margin-bottom: 25px;
            font-size: 22px;
        }
        img {
            max-width: 100%;
        }
        img {
            vertical-align: middle;
            border-style: none;
        }

        /* Contact Us
        ---------------------*/
        .contact-name {
            margin-bottom: 30px;
        }
        .contact-name h5 {
            font-size: 22px;
            color: #20247b;
            margin-bottom: 5px;
            font-weight: 600;
        }
        .contact-name p {
            font-size: 18px;
            margin: 0;
        }

        .social-share a {
            width: 40px;
            height: 40px;
            line-height: 40px;
            border-radius: 50%;
            color: #ffffff;
            text-align: center;
            margin-right: 10px;
        }
        .social-share .dribbble {
            box-shadow: 0 8px 30px -4px rgba(234, 76, 137, 0.5);
            background-color: #ea4c89;
        }
        .social-share .behance {
            box-shadow: 0 8px 30px -4px rgba(0, 103, 255, 0.5);
            background-color: #0067ff;
        }
        .social-share .linkedin {
            box-shadow: 0 8px 30px -4px rgba(1, 119, 172, 0.5);
            background-color: #0177ac;
        }

        .contact-form .form-control {
            border: none;
            border-bottom: 1px solid #20247b;
            background: transparent;
            border-radius: 0;
            padding-left: 0;
            box-shadow: none !important;
        }
        .contact-form .form-control:focus {
            border-bottom: 1px solid #fc5356;
        }
        .contact-form .form-control.invalid {
            border-bottom: 1px solid #ff0000;
        }
        .contact-form .send {
            margin-top: 20px;
        }
        @media (max-width: 767px) {
            .contact-form .send {
                margin-bottom: 20px;
            }
        }

        .section-title h2 {
            font-weight: 700;
            color: #20247b;
            font-size: 45px;
            margin: 0 0 15px;
            border-left: 5px solid #fc5356;
            padding-left: 15px;
        }
        .section-title {
            padding-bottom: 45px;
        }
        .contact-form .send {
            margin-top: 20px;
        }
        .px-btn {
            padding: 0 50px 0 20px;
            line-height: 60px;
            position: relative;
            display: inline-block;
            color: #20247b;
            background: none;
            border: none;
        }
        .px-btn:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            display: block;
            border-radius: 30px;
            background: transparent;
            border: 1px solid rgba(252, 83, 86, 0.6);
            border-right: 1px solid transparent;
            -moz-transition: ease all 0.35s;
            -o-transition: ease all 0.35s;
            -webkit-transition: ease all 0.35s;
            transition: ease all 0.35s;
            width: 60px;
            height: 60px;
        }
        .px-btn .arrow {
            width: 13px;
            height: 2px;
            background: currentColor;
            display: inline-block;
            position: absolute;
            top: 0;
            bottom: 0;
            margin: auto;
            right: 25px;
        }
        .px-btn .arrow:after {
            width: 8px;
            height: 8px;
            border-right: 2px solid currentColor;
            border-top: 2px solid currentColor;
            content: "";
            position: absolute;
            top: -3px;
            right: 0;
            display: inline-block;
            -moz-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
        }

        /*body{*/
        /*    margin-top:20px;*/
        /*    background:#eee;*/
        /*}*/
        .card {
            box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
        }
        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0,0,0,.125);
            border-radius: 1rem;
        }
        .bgc-h-secondary-l3:hover, .bgc-secondary-l3 {
            background-color: #ebeff1!important;
        }
        .h-4 {
            height: 2rem;
        }
        .w-4 {
            width: 2rem;
        }
        .d-zoom-1, .d-zoom-2, .d-zoom-3, .dh-zoom-1, .dh-zoom-2, .dh-zoom-3 {
            transition: -webkit-transform 180ms;
            transition: transform 180ms;
            transition: transform 180ms,-webkit-transform 180ms;
        }
        .mr-25, .mx-25 {
            margin-right: .75rem!important;
        }

        .p-25 {
            padding: .75rem!important;
        }
        .radius-1 {
            border-radius: .25rem!important;
        }
        [class*=bgc-h-] {
            transition: background-color .15s;
        }

        .text-default-d3 {
            color: #416578!important;
        }
        .font-bolder, .text-600 {
            font-weight: 600!important;
        }
        .text-90 {
            font-size: .9em!important;
        }


        .bgc-h-secondary-l4:hover, .bgc-secondary-l4 {
            background-color: #f2f4f6!important;
        }
        .text-danger-m1 {
            color: #da3636!important;
        }
        .text-green-m1 {
            color: #2c8d6a!important;
        }
        .text-95 {
            font-size: .95em!important;
        }
    </style>
    <script>
        'use strict';
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9f2a0e2e19ba0f1e69f3d21528563d0"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

<div class="blog-single gray-bg">
    <div class="container">
        <div class="row align-items-start">
            <div class="col-lg-8 m-15px-tb">
                <article class="article">
                    <div class="article-img">
                        <img src="${ctp}/resources/images/hospitalInfo/hospitalInfoNoImg.png" title="" alt="">
                    </div>
                    <div class="article-title">
                        <h6><a href="#">${hospitalInfoVO.sidoCdNm} > ${hospitalInfoVO.sgguCdNm}<c:if test="${hospitalInfoVO.emdongNm!=''}"> > ${hospitalInfoVO.emdongNm}</c:if></a></h6>
                        <h2>${hospitalInfoVO.yadmNm}</h2>
                        <div class="media pt-0">
                            <div class="media-body">
                                <label><i class="fa fa-location-arrow mr-2" aria-hidden="true"></i>${hospitalInfoVO.addr}</label>
                                <br/>
                                <label><i class="fa fa-phone mr-2" aria-hidden="true"></i>${hospitalInfoVO.telno}</label>
                                <br/>
                                <label><i class="fa fa-calendar-check-o mr-2" aria-hidden="true"></i>개설일자 : ${fn:substring(hospitalInfoVO.estbDd,0,4)}년 ${fn:substring(hospitalInfoVO.estbDd,4,6)}월 ${fn:substring(hospitalInfoVO.estbDd,6,8)}일</label>
                                <c:if test="${hospitalInfoVO.hospUrl!=''}">
                                    <br/>
                                    <label>
                                        <i class="fa fa-external-link mr-2" aria-hidden="true"></i><a href="${hospitalInfoVO.hospUrl}">${hospitalInfoVO.hospUrl}</a>
                                    </label>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="nav tag-cloud mt-0 pt-0 mb-2">
                        <c:forEach var="medicalSubjectInfoVO" items="${medicalSubjectInfoVOS}">
                            <a href="#">${medicalSubjectInfoVO.dgsbjtCdNm}</a>
                        </c:forEach>
                    </div>
                    <hr/>
                    <div class="article-content">
                        <div id="map" style="width: 100%; height: 60vh;"></div>
                    </div>
                </article>
                <div class="contact-form article-comment">
                    <h4>Leave a Reply</h4>
                    <form id="contact-form" method="POST">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input name="Name" id="name" placeholder="Name *" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input name="Email" id="email" placeholder="Email *" class="form-control" type="email">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea name="message" id="message" placeholder="Your message *" rows="4" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="send">
                                    <button class="px-btn theme"><span>Submit</span> <i class="arrow"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 m-15px-tb blog-aside">
                <!-- Latest Post -->
                <div class="widget widget-latest-post">
                    <div class="widget-title">
                        <h3><i class="fa fa-pencil-square-o mr-2" aria-hidden="true"></i>진료 후기</h3>
                    </div>
                    <div class="widget-body">
                        <div class="latest-post-aside media">
                            <div class="lpa-left media-body">
                                <div class="lpa-title">
                                    <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                </div>
                                <div class="lpa-meta">
                                    <a class="name" href="#">
                                        Rachel Roth
                                    </a>
                                    <a class="date" href="#">
                                        26 FEB 2020
                                    </a>
                                </div>
                            </div>
                            <div class="lpa-right">
                                <a href="#">
                                    <img src="https://www.bootdey.com/image/400x200/FFB6C1/000000" title="" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="latest-post-aside media">
                            <div class="lpa-left media-body">
                                <div class="lpa-title">
                                    <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                </div>
                                <div class="lpa-meta">
                                    <a class="name" href="#">
                                        Rachel Roth
                                    </a>
                                    <a class="date" href="#">
                                        26 FEB 2020
                                    </a>
                                </div>
                            </div>
                            <div class="lpa-right">
                                <a href="#">
                                    <img src="https://www.bootdey.com/image/400x200/FFB6C1/000000" title="" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="latest-post-aside media">
                            <div class="lpa-left media-body">
                                <div class="lpa-title">
                                    <h5><a href="#">Prevent 75% of visitors from google analytics</a></h5>
                                </div>
                                <div class="lpa-meta">
                                    <a class="name" href="#">
                                        Rachel Roth
                                    </a>
                                    <a class="date" href="#">
                                        26 FEB 2020
                                    </a>
                                </div>
                            </div>
                            <div class="lpa-right">
                                <a href="#">
                                    <img src="https://www.bootdey.com/image/400x200/FFB6C1/000000" title="" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Latest Post -->
                <!-- Author -->
                <div class="widget widget-author">
                    <div class="widget-title">
                        <h3><i class="fa fa-calendar-check-o mr-2" aria-hidden="true"></i>진료시간 안내</h3>
                    </div>
                    <div class="widget-body">
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                <b>평일 점심시간</b>
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.lunchWeek==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        ${detailInfoVO.lunchWeek}
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                <b>토요일 점심시간</b>
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.lunchSat==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        ${detailInfoVO.lunchSat}
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                월요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtMonStart=='' || detailInfoVO.trmtMonEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtMonStart, 0, detailInfoVO.trmtMonStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtMonStart, 0, detailInfoVO.trmtMonStart.length()-2)}:${fn:substring(detailInfoVO.trmtMonStart, detailInfoVO.trmtMonStart.length()-2, detailInfoVO.trmtMonStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtMonStart, 0, detailInfoVO.trmtMonStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtMonStart, 0, detailInfoVO.trmtMonStart.length()-2)}:${fn:substring(detailInfoVO.trmtMonStart, detailInfoVO.trmtMonStart.length()-2, detailInfoVO.trmtMonStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtMonEnd, 0, detailInfoVO.trmtMonEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtMonEnd, 0, detailInfoVO.trmtMonEnd.length()-2)}:${fn:substring(detailInfoVO.trmtMonEnd, detailInfoVO.trmtMonEnd.length()-2, detailInfoVO.trmtMonEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtMonEnd, 0, detailInfoVO.trmtMonEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtMonEnd, 0, detailInfoVO.trmtMonEnd.length()-2)}:${fn:substring(detailInfoVO.trmtMonEnd, detailInfoVO.trmtMonEnd.length()-2, detailInfoVO.trmtMonEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                화요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtTueStart=='' || detailInfoVO.trmtTueEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtTueStart, 0, detailInfoVO.trmtTueStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtTueStart, 0, detailInfoVO.trmtTueStart.length()-2)}:${fn:substring(detailInfoVO.trmtTueStart, detailInfoVO.trmtTueStart.length()-2, detailInfoVO.trmtTueStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtTueStart, 0, detailInfoVO.trmtTueStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtTueStart, 0, detailInfoVO.trmtTueStart.length()-2)}:${fn:substring(detailInfoVO.trmtTueStart, detailInfoVO.trmtTueStart.length()-2, detailInfoVO.trmtTueStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtTueEnd, 0, detailInfoVO.trmtTueEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtTueEnd, 0, detailInfoVO.trmtTueEnd.length()-2)}:${fn:substring(detailInfoVO.trmtTueEnd, detailInfoVO.trmtTueEnd.length()-2, detailInfoVO.trmtTueEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtTueEnd, 0, detailInfoVO.trmtTueEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtTueEnd, 0, detailInfoVO.trmtTueEnd.length()-2)}:${fn:substring(detailInfoVO.trmtTueEnd, detailInfoVO.trmtTueEnd.length()-2, detailInfoVO.trmtTueEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                수요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtWedStart=='' || detailInfoVO.trmtWedEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtWedStart, 0, detailInfoVO.trmtWedStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtWedStart, 0, detailInfoVO.trmtWedStart.length()-2)}:${fn:substring(detailInfoVO.trmtWedStart, detailInfoVO.trmtWedStart.length()-2, detailInfoVO.trmtWedStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtWedStart, 0, detailInfoVO.trmtWedStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtWedStart, 0, detailInfoVO.trmtWedStart.length()-2)}:${fn:substring(detailInfoVO.trmtWedStart, detailInfoVO.trmtWedStart.length()-2, detailInfoVO.trmtWedStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtWedEnd, 0, detailInfoVO.trmtWedEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtWedEnd, 0, detailInfoVO.trmtWedEnd.length()-2)}:${fn:substring(detailInfoVO.trmtWedEnd, detailInfoVO.trmtWedEnd.length()-2, detailInfoVO.trmtWedEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtWedEnd, 0, detailInfoVO.trmtWedEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtWedEnd, 0, detailInfoVO.trmtWedEnd.length()-2)}:${fn:substring(detailInfoVO.trmtWedEnd, detailInfoVO.trmtWedEnd.length()-2, detailInfoVO.trmtWedEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                목요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtThuStart=='' || detailInfoVO.trmtThuEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtThuStart, 0, detailInfoVO.trmtThuStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtThuStart, 0, detailInfoVO.trmtThuStart.length()-2)}:${fn:substring(detailInfoVO.trmtThuStart, detailInfoVO.trmtThuStart.length()-2, detailInfoVO.trmtThuStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtThuStart, 0, detailInfoVO.trmtThuStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtThuStart, 0, detailInfoVO.trmtThuStart.length()-2)}:${fn:substring(detailInfoVO.trmtThuStart, detailInfoVO.trmtThuStart.length()-2, detailInfoVO.trmtThuStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtThuEnd, 0, detailInfoVO.trmtThuEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtThuEnd, 0, detailInfoVO.trmtThuEnd.length()-2)}:${fn:substring(detailInfoVO.trmtThuEnd, detailInfoVO.trmtThuEnd.length()-2, detailInfoVO.trmtThuEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtThuEnd, 0, detailInfoVO.trmtThuEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtThuEnd, 0, detailInfoVO.trmtThuEnd.length()-2)}:${fn:substring(detailInfoVO.trmtThuEnd, detailInfoVO.trmtThuEnd.length()-2, detailInfoVO.trmtThuEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                금요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtFriStart=='' || detailInfoVO.trmtFriEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtFriStart, 0, detailInfoVO.trmtFriStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtFriStart, 0, detailInfoVO.trmtFriStart.length()-2)}:${fn:substring(detailInfoVO.trmtFriStart, detailInfoVO.trmtFriStart.length()-2, detailInfoVO.trmtFriStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtFriStart, 0, detailInfoVO.trmtFriStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtFriStart, 0, detailInfoVO.trmtFriStart.length()-2)}:${fn:substring(detailInfoVO.trmtFriStart, detailInfoVO.trmtFriStart.length()-2, detailInfoVO.trmtFriStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtFriEnd, 0, detailInfoVO.trmtFriEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtFriEnd, 0, detailInfoVO.trmtFriEnd.length()-2)}:${fn:substring(detailInfoVO.trmtFriEnd, detailInfoVO.trmtFriEnd.length()-2, detailInfoVO.trmtFriEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtFriEnd, 0, detailInfoVO.trmtFriEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtFriEnd, 0, detailInfoVO.trmtFriEnd.length()-2)}:${fn:substring(detailInfoVO.trmtFriEnd, detailInfoVO.trmtFriEnd.length()-2, detailInfoVO.trmtFriEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                토요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtSatStart=='' || detailInfoVO.trmtSatEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.trmtSatStart, detailInfoVO.trmtSatStart.length()-2, detailInfoVO.trmtSatStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.trmtSatStart, detailInfoVO.trmtSatStart.length()-2, detailInfoVO.trmtSatStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtSatEnd, 0, detailInfoVO.trmtSatEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtSatEnd, 0, detailInfoVO.trmtSatEnd.length()-2)}:${fn:substring(detailInfoVO.trmtSatEnd, detailInfoVO.trmtSatEnd.length()-2, detailInfoVO.trmtSatEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtSatEnd, 0, detailInfoVO.trmtSatEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtSatEnd, 0, detailInfoVO.trmtSatEnd.length()-2)}:${fn:substring(detailInfoVO.trmtSatEnd, detailInfoVO.trmtSatEnd.length()-2, detailInfoVO.trmtSatEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                일요일
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${detailInfoVO.trmtSunStart=='' || detailInfoVO.trmtSunEnd==''}">
                                        전화 문의
                                    </c:when>
                                    <c:when test="${empty detailInfoVO}">
                                        전화 문의
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${fn:substring(detailInfoVO.trmtSunStart, 0, detailInfoVO.trmtSunStart.length()-2)<10}">
                                            0${fn:substring(detailInfoVO.trmtSunStart, 0, detailInfoVO.trmtSunStart.length()-2)}:${fn:substring(detailInfoVO.trmtSunStart, detailInfoVO.trmtSunStart.length()-2, detailInfoVO.trmtSunStart.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtSunStart, 0, detailInfoVO.trmtSunStart.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtSunStart, 0, detailInfoVO.trmtSunStart.length()-2)}:${fn:substring(detailInfoVO.trmtSunStart, detailInfoVO.trmtSunStart.length()-2, detailInfoVO.trmtSunStart.length())}
                                        </c:if>
                                        ~
                                        <c:if test="${fn:substring(detailInfoVO.trmtSunEnd, 0, detailInfoVO.trmtSunEnd.length()-2)<10}">
                                            1${fn:substring(detailInfoVO.trmtSunEnd, 0, detailInfoVO.trmtSunEnd.length()-2)}:${fn:substring(detailInfoVO.trmtSunEnd, detailInfoVO.trmtSunEnd.length()-2, detailInfoVO.trmtSunEnd.length())}
                                        </c:if>
                                        <c:if test="${fn:substring(detailInfoVO.trmtSunEnd, 0, detailInfoVO.trmtSunEnd.length()-2)>=10}">
                                            ${fn:substring(detailInfoVO.trmtSunEnd, 0, detailInfoVO.trmtSunEnd.length()-2)}:${fn:substring(detailInfoVO.trmtSunEnd, detailInfoVO.trmtSunEnd.length()-2, detailInfoVO.trmtSunEnd.length())}
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                    </div>
                </div>
                <!-- End Author -->
                <!-- Trending Post -->
                <div class="widget widget-post">
                    <div class="widget-title">
                        <h3><i class="fa fa-car mr-2" aria-hidden="true"></i>주차 정보</h3>
                    </div>
                    <div class="widget-body">
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90 text-600">
                                주차 가능 대수
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${empty detailInfoVO}">
                                        정보 없음 [전화 문의]
                                    </c:when>
                                    <c:when test="${detailInfoVO.parkQty==''}">
                                        정보 없음 [전화 문의]
                                    </c:when>
                                    <c:otherwise>
                                        ${detailInfoVO.parkQty}
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <span class="text-default-d3 text-90">
                                주차요금
                            </span>
                            <span class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${empty detailInfoVO}">
                                        정보 없음 [전화 문의]
                                    </c:when>
                                    <c:when test="${detailInfoVO.parkPay==''}">
                                        정보 없음 [전화 문의]
                                    </c:when>
                                    <c:when test="${detailInfoVO.parkPay!=''}">
                                        <c:if test="${detailInfoVO.parkPay=='Y'}">
                                            주차 요금 있음
                                        </c:if>
                                        <c:if test="${detailInfoVO.parkPay=='N'}">
                                            주차 요금 없음
                                        </c:if>
                                    </c:when>
                                </c:choose>
                            </span>
                        </div>
                        <div role="button" class="d-flex flex-wrap align-items-center my-2 bgc-secondary-l4 bgc-h-secondary-l3 radius-1 p-25 d-style">
                            <div class="text-default-d3 text-90 text-600">
                                상세 정보
                            </div>
                            <br/>
                            <div class="ml-auto text-dark-l2">
                                <c:choose>
                                    <c:when test="${empty detailInfoVO}">
                                        정보 없음 [전화 문의]
                                    </c:when>
                                    <c:when test="${detailInfoVO.parkNotice==''}">
                                        정보 없음 [전화 문의]
                                    </c:when>
                                    <c:when test="${detailInfoVO.parkNotice!=''}">
                                        ${detailInfoVO.parkNotice}
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Trending Post -->
                <!-- widget Tags -->
                <div class="widget widget-tags">
                    <div class="widget-title">
                        <h3>
                            <i class="fa fa-bus mr-2" aria-hidden="true"></i>로렘 입슘
                        </h3>
                    </div>
                    <div class="widget-body">

                    </div>
                </div>
                <!-- End widget Tags -->
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<script src="${ctp}/resources/js/hospitalInfoKakaoMap.js"></script>
<script>

    $(document).ready(function() {
        panTo();
    });

    // 지도 중심 좌표 병원 좌표로 이동

    function panTo() {
        // 이동할 위도 경도 위치를 생성합니다
        var moveLatLon = new kakao.maps.LatLng(${hospitalInfoVO.lati}, ${hospitalInfoVO.longi});

        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map.panTo(moveLatLon);
    }


    function setCenter() {
        // 이동할 위도 경도 위치를 생성합니다
        var moveLatLon = new kakao.maps.LatLng(${hospitalInfoVO.lati}, ${hospitalInfoVO.longi});

        // 지도 중심을 이동 시킵니다
        map.setCenter(moveLatLon);
    }

    // 병원 위치 마커 표시

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(${hospitalInfoVO.lati}, ${hospitalInfoVO.longi});

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);
</script>
</body>
</html>