<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/01/30
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아파! 어디가?</title>
    <jsp:include page="/WEB-INF/views/include/cdn.jsp"></jsp:include>
    <link rel="stylesheet" href="${ctp}/resources/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    <link rel="stylesheet" href="${ctp}/resources/css/main.css">
    <style>
        .search-form {
            width: 80%;
            margin: 0 auto;
            margin-top: 1rem;
        }

        .search-form input {
            height: 100%;
            background: transparent;
            border: 0;
            display: block;
            width: 100%;
            padding: 1rem;
            height: 100%;
            font-size: 1rem;
        }

        .search-form select {
            background: transparent;
            border: 0;
            padding: 1rem;
            height: 100%;
            font-size: 1rem;
        }

        .search-form select:focus {
            border: 0;
        }

        .search-form button {
            height: 100%;
            width: 100%;
            font-size: 1rem;
        }

        .search-form button svg {
            width: 24px;
            height: 24px;
        }

        .search-body {
            margin-bottom: 1.5rem;
        }

        .search-body .search-filters .filter-list {
            margin-bottom: 1.3rem;
        }

        .search-body .search-filters .filter-list .title {
            color: #3c4142;
            margin-bottom: 1rem;
        }

        .search-body .search-filters .filter-list .filter-text {
            color: #727686;
        }

        .search-body .search-result .result-header {
            margin-bottom: 2rem;
        }

        .search-body .search-result .result-header .records {
            color: #3c4142;
        }

        .search-body .search-result .result-header .result-actions {
            text-align: right;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .search-body .search-result .result-header .result-actions .result-sorting {
            display: flex;
            align-items: center;
        }

        .search-body .search-result .result-header .result-actions .result-sorting span {
            flex-shrink: 0;
            font-size: 0.8125rem;
        }

        .search-body .search-result .result-header .result-actions .result-sorting select {
            color: #68CBD7;
        }

        .search-body .search-result .result-header .result-actions .result-sorting select option {
            color: #3c4142;
        }

        @media (min-width: 768px) and (max-width: 991.98px) {
            .search-body .search-filters {
                display: flex;
            }
            .search-body .search-filters .filter-list {
                margin-right: 1rem;
            }
        }
        .card-box {
            padding: 20px;
            border-radius: 3px;
            margin-bottom: 30px;
            background-color: #fff;
        }

        .file-man-box {
            padding: 20px;
            border: 1px solid #e3eaef;
            border-radius: 5px;
            position: relative;
            margin-bottom: 20px
        }

        .file-man-box .file-close {
            color: #f1556c;
            position: absolute;
            line-height: 24px;
            font-size: 24px;
            right: 10px;
            top: 10px;
            visibility: hidden
        }

        .file-man-box .file-img-box {
            line-height: 120px;
            text-align: center
        }

        .file-man-box .file-img-box img {
            height: 64px
        }

        .file-man-box .file-download {
            font-size: 32px;
            color: #98a6ad;
            position: absolute;
            right: 10px
        }

        .file-man-box .file-download:hover {
            color: #313a46
        }

        .file-man-box .file-man-title {
            /*padding-right: 25px;*/
        }

        .file-man-box:hover {
            -webkit-box-shadow: 0 0 24px 0 rgba(0, 0, 0, .06), 0 1px 0 0 rgba(0, 0, 0, .02);
            box-shadow: 0 0 24px 0 rgba(0, 0, 0, .06), 0 1px 0 0 rgba(0, 0, 0, .02);
        }

        .file-man-box:hover .file-close {
            visibility: visible
        }
        .text-overflow {
            text-overflow: ellipsis;
            white-space: nowrap;
            display: block;
            width: 100%;
            overflow: hidden;
        }
        h5 {
            font-size: 15px;
        }
        .feature-box-1 {
            padding: 32px;
            box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
            margin: 15px 0;
            position: relative;
            z-index: 1;
            border-radius: 10px;
            overflow: hidden;
            -moz-transition: ease all 0.35s;
            -o-transition: ease all 0.35s;
            -webkit-transition: ease all 0.35s;
            transition: ease all 0.35s;
            top: 0;
        }
        .feature-box-1 * {
            -moz-transition: ease all 0.35s;
            -o-transition: ease all 0.35s;
            -webkit-transition: ease all 0.35s;
            transition: ease all 0.35s;
        }
        .feature-box-1 .icon {
            width: 70px;
            height: 70px;
            line-height: 70px;
            background: #fc5356;
            color: #ffffff;
            text-align: center;
            border-radius: 50%;
            margin-bottom: 22px;
            font-size: 27px;
        }
        .feature-box-1 .icon i {
            line-height: 70px;
        }
        .feature-box-1 h5 {
            color: #20247b;
            font-weight: 600;
        }
        .feature-box-1 p {
            margin: 0;
        }
        .feature-box-1:after {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            left: auto;
            right: 0;
            border-radius: 10px;
            width: 0;
            background: #20247b;
            z-index: -1;
            -moz-transition: ease all 0.35s;
            -o-transition: ease all 0.35s;
            -webkit-transition: ease all 0.35s;
            transition: ease all 0.35s;
        }
        .feature-box-1:hover {
            top: -5px;
        }
        .feature-box-1:hover h5 {
            color: #ffffff;
        }
        .feature-box-1:hover p {
            color: rgba(255, 255, 255, 0.8);
        }
        .feature-box-1:hover:after {
            width: 100%;
            height: 100%;
            border-radius: 10px;
            left: 0;
            right: auto;
        }
        /*.sgguCdNmList {*/
        /*    transition: ease 0.5s;*/
        /*    display: none;*/
        /*}*/
        /*.feature-box-1:hover .sgguCdNmList {*/
        /*    display: block;*/
        /*    transition: ease 0.5s;*/
        /*}*/
        .section {
            /*padding: 100px 0;*/
            position: relative;
            z-index: 0;
        }
        .section-title {
            padding-bottom: 45px;
        }
        .section-title h2 {
            font-weight: 700;
            color: #20247b;
            font-size: 45px;
            margin: 0 0 15px;
            border-left: 5px solid #fc5356;
            padding-left: 15px;
        }
    </style>
    <script>
        'use strict';

        // $('.feature-box-1').on('click', function () {
        //     alert("하이");
        // });
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

<%-- 심심 풀이로 만들어본 배너 이미지 --%>


<!-- 본문 내용 -->

<%-- 검색창 --%>
<div class="container">
    <div class="container align-center"><img src="${ctp}/resources/images/green2209S_07_banner.png" width="100%"></div>
    <div class="row">
        <div class="col-lg-12 card-margin">
            <div class="card search-form">
                <div class="card-body p-0">
                    <form id="search-form">
                        <div class="row">
                            <div class="col-12">
                                <div class="row no-gutters">
                                    <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                        <select class="form-control" id="exampleFormControlSelect1">
                                            <option>지역</option>
                                            <option>진료 과목</option>
                                            <option>등등등</option>
                                            <option>등등등</option>
                                            <option>등등등</option>
                                            <option>등등등</option>
                                            <option>등등등</option>

                                        </select>
                                    </div>
                                    <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                        <input type="text" placeholder="검색" class="form-control" id="search" name="search">
                                    </div>
                                    <div class="col-lg-1 col-md-3 col-sm-12 p-0">
                                        <button type="submit" class="btn btn-base">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%-- 병원 리스트 뽑아줄 창 --%>
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card-box">
                        <div class="row">
                            <div class="col-lg-6 col-xl-6">
                                <h4 class="header-title m-b-30">진료 과목별 검색</h4>
                            </div>
                        </div>

                        <div class="row">
<%--                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList';">--%>
<%--                                <div class="file-man-box">--%>
<%--                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/hospital.png" alt="icon"></div>--%>
<%--                                    <div class="file-man-title">--%>
<%--                                        <h5 class="mb-0">모든 병원</h5>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=49';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/dent.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">치과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=12';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/eyes.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">안과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=14';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/derm.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">피부과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=8';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/plas.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">성형외과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=10';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/women.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">산부인과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=3';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/mental_new.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">정신의학과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=15';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/pee.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">비뇨기과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=5';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/sprint.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">정형외과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=9';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/stun.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">마취통증의학과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=6';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/nsurgery.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">신경외과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=21';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/rehab.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">재활의학과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=16';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/video.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">영상의학과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=4';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/surgery.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">외과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=2';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/neuron.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">신경과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=11';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/child.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">소아과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=1';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/inner.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">내과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=13';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/ears.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">이비인후과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=23';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/home.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">가정의학과</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xl-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode=99';">
                                <div class="file-man-box">
                                    <div class="file-img-box"><img src="${ctp}/resources/images/hospital/han.svg" alt="icon"></div>
                                    <div class="file-man-title">
                                        <h5 class="mb-0">한의원</h5>
                                    </div>
                                </div>
                            </div>

<%--                            <div class="col-lg-3 col-xl-2">--%>
<%--                                <div class="file-man-box"><a href="" class="file-close"><i class="fa fa-times-circle"></i></a>--%>
<%--                                    <div class="file-img-box"><img src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/txt.svg" alt="icon"></div><a href="#" class="file-download"><i class="fa fa-download"></i></a>--%>
<%--                                    <div class="file-man-title">--%>
<%--                                        <h5 class="mb-0 text-overflow">Mytextfile.txt</h5>--%>
<%--                                        <p class="mb-0"><small>568.8 kb</small></p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
<%--                        <div class="text-center mt-3">--%>
<%--                            <button type="button" class="btn btn-outline-danger w-md waves-effect waves-light"><i class="mdi mdi-refresh"></i> Load More Files</button>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- container -->
    </div>

    <%-- 전국 지역 리스트 보여줄 페이지 --%>

    <section class="section services-section" id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-title">
                        <h2>지역별 검색</h2>
                        <p>전국 지역별로 원하는 정보를 검색해보세요.</p>
                    </div>
                </div>
            </div>
            <div class="row">

                <c:forEach var="sidoCdNmVO" items="${sidoCdNmVOS}">
                    <div class="col-sm-6 col-lg-4" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfoList?regionCode=${sidoCdNmVO.sidoCd}';">
                        <div class="feature-box-1">
                            <div class="icon">
                                <i class="fa fa-map-marker fa-2x" aria-hidden="true"></i>
                            </div>
                            <div class="feature-content">
                                <h5>${sidoCdNmVO.sidoCdNm}</h5>
                                <div class="row sgguCdNmList">
                                    <c:forEach var="sgguCdNmVO" items="${sgguCdNmVOS}">
                                        <c:if test="${fn:substring(sidoCdNmVO.sidoCd, 0, 2)==fn:substring(sgguCdNmVO.sgguCd, 0, 2)}">
                                            <div class="col-sm-6 col-lg-4 pr-0">
                                                <p><a href="${ctp}/hospitalInfo/hospitalInfoList?regionCode=${sgguCdNmVO.sgguCd}">${sgguCdNmVO.sgguCdNm}</a></p>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- / -->
            </div>
        </div>
    </section>

</div>
<p><br/></p>
<!-- Footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>

</html>