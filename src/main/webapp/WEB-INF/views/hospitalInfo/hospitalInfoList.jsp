<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/02/02
  Time: 9:01 PM
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
    <title>병원 리스트</title>
    <jsp:include page="/WEB-INF/views/include/cdn.jsp"></jsp:include>
    <link rel="stylesheet" href="${ctp}/resources/css/main.css">
    <link rel="stylesheet" href="${ctp}/resources/css/footer.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
          integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous"/>
    <style>
        body{
            margin-top:0;
            background:#f4ffff;
        }
        .candidates-listing-bg {
            padding: 210px 0px 60px 0px;
            /*background-image: url("../images/candidates-listing-bg.jpg");*/
            background-size: cover;
            position: relative;
            background-position: center center;
        }

        .custom-checkbox .custom-control-input:checked ~ .custom-control-label:before {
            background-color: #ff4f6c;
            border-color: #ff4f6c;
        }

        .custom-checkbox .custom-control-input:focus ~ .custom-control-label:before {
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .candidates-img img {
            max-width: 90px;
        }

        .fav-icon i {
            -webkit-text-stroke: 2px #ff4f6c;
            -webkit-text-fill-color: transparent;
        }

        .fav-icon i:hover {
            -webkit-text-stroke: 0px #ff4f6c;
            -webkit-text-fill-color: #ff4f6c;
        }

        .candidates-list-desc {
            overflow: hidden;
        }

        .candidates-right-details {
            position: absolute;
            top: 0;
            right: 20px;
        }

        .candidates-item-desc {
            margin-left: 45px;
        }

        .list-grid-item {
            border: 1px solid #ececec;
            border-radius: 6px;
            -webkit-transition: all 0.5s;
            transition: all 0.5s;
        }

        .list-grid-item:hover {
            -webkit-box-shadow: 0 0 20px 0px rgba(47, 47, 47, 0.09);
            box-shadow: 0 0 20px 0px rgba(47, 47, 47, 0.09);
            -webkit-transition: all 0.5s;
            transition: all 0.5s;
            border-color: transparent;
        }

        .left-sidebar .card-body {
            border-bottom: 1px solid #ececec;
        }

        .custom-control {
            margin: 11px 20px;
        }

        .card-header {
            background-color: transparent;
            margin-bottom: 0 !important;
        }

        .pagination.job-pagination .page-link {
            border-radius: 50% !important;
            margin: 0 4px;
            height: 46px;
            width: 45px;
            line-height: 29px;
            text-align: center;
            color: #777777;
        }

        .page-item.active .page-link {
            background-color: #ff4f6c;
            border-color: #ff4f6c;
            color: #ffffff !important;
        }

        .f-14 {
            font-size: 14px;
        }

        .btn-outline {
            color: #ff4f6c;
            border-color: #ff4f6c;
        }
        .btn-sm {
            padding: 8px 22px;
        }
    </style>
    <script>
        'use strict';

        // 시도 콤보 박스 변경시 안에 시군구 내용 바꾸기

        $(function() {
            $("#sido").change(function() {
                let sidoCd=$("#sido").val();
                // console.log(sido);
                if(sido=="") {
                    alert("시도를 선택해주시기 바랍니다!");
                    return false;
                }

                // 선택한 시도에 따라 ajax로 해당 리스트 가져오기

                $.ajax({
                    type:"post",
                    url:"${ctp}/hospitalInfo/getSgguList",
                    data: {sidoCd: sidoCd},
                    success: function(vos) {
                        let str='';
                        str+='<option value="">시군구 선택</option>';

                        for(let i=0; i<vos.length; i++) {
                            console.log(vos[i].sgguCdNm);
                            if(vos[i]==null) break;
                            str+='<option>'+vos[i].sgguCdNm+'</option>';
                        }
                        $("#sggu").html(str);
                        // console.log(str);
                    },
                    error: function() {
                        alert("전송 오류!");
                    }
                });
            });
        });
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9f2a0e2e19ba0f1e69f3d21528563d0"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

<link href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/4.9.95/css/materialdesignicons.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />
<div class="container">
    <div class="row align-items-center">
        <div class="col-lg-12">
            <div class="show-results mt-5">
                <div class="float-left p-2">
                    <h5 class="text-dark mb-0 pt-2">서울시 어딘가의  무슨무슨과 목록</h5>
                </div>
                <div class="sort-button float-right">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mr-3">
                            <select id="subject" name="subject" class="nice-select">
                                <option data-display="Sort By">진료 과목</option>
                                <option value="1">모든 병원</option>
                                <option value="2">치과</option>
                                <option value="3">안과</option>
                                <option value="3">피부과</option>
                                <option value="3">성형외과</option>
                                <option value="3">산부인과</option>
                                <option value="3">정신의학과</option>
                                <option value="3">정형외과</option>
                                <option value="3">마치통증의학과</option>
                                <option value="3">신경외과</option>
                                <option value="3">재활의학과</option>
                                <option value="3">영상의학과</option>
                                <option value="3">외과</option>
                                <option value="3">신경과</option>
                                <option value="3">소아과</option>
                                <option value="3">내과</option>
                                <option value="3">이비인후과</option>
                                <option value="3">가정의학과</option>
                                <option value="3">한의원</option>
                            </select>
                        </li>

                        <li class="list-inline-item">
                            <select id="sido" name="sido" class="nice-select">
                                <option data-display="Default">시도 선택</option>
                                <c:forEach var="sidoListVO" items="${sidoListVOS}" varStatus="st">
                                    <option value="${sidoListVO.sidoCd}">${sidoListVO.sidoCdNm}</option>
                                </c:forEach>
                            </select>
                        </li>

                        <li class="list-inline-item">
                            <select id="sggu" name="sggu" class="nice-select">
                                <option value="">시군구 선택</option>
                            </select>
                        </li>
                        <li class="list-inline-item">
                            <input type="button" value="목록 조회" class="nice-select">
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 p-2">
            <div class="container card d-flex" style="height: 80vh;">
                <div class="row">
<%--                    <div class="col">--%>
<%--                        <p class="text-center">테스트 영역</p>--%>
<%--                        <p class="text-center">테스트 영역</p>--%>
<%--                        <p class="text-center">테스트 영역</p>--%>
<%--                        <p class="text-center">테스트 영역</p>--%>
<%--                    </div>--%>
                </div>
                <div id="map" class="m-2 align-self-center align-bottom col" style="width: 100%; height: 60vh; padding: 5px; z-index: 10;"></div>
            </div>
        </div>
        <p><br/></p>
        <div class="col-lg-6 p-2">
            <div class="candidates-listing-item algin-self-center p-2 card" style="height: 80vh; overflow: auto;">
                <c:forEach var="hospitalInfoVO" items="${hospitalInfoVOS}" varStatus="st">
                    <div class="list-grid-item mt-2 p-2" style="cursor:pointer;" onclick="location.href='';">
                        <div class="row">
                            <div class="col-md-12">
<%--                                <div class="candidates-img float-left mr-4">--%>
<%--                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="img-fluid d-block rounded">--%>
<%--                                </div>--%>
                                <div class="candidates-list-desc job-single-meta p-2">
                                    <h5 class="mb-2 f-19"><a href="#" class="text-dark">${hospitalInfoVO.yadmNm}</a></h5>
                                    <ul class="list-inline mb-0">
<%--                                        <li class="list-inline-item mr-4">--%>
<%--                                            <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>Web Developer</p>--%>
<%--                                        </li>--%>

                                        <li class="list-inline-item mr-4">
                                            <p class="f-15 mb-0"><i class="fa fa-map-marker mr-2" aria-hidden="true"></i></i><a>${hospitalInfoVO.addr}</a></p>
                                        </li>
                                        <br/>
                                        <li class="list-inline-item">
                                            <p class="f-15 mb-0"><i class="fa fa-phone mr-2" aria-hidden="true"></i>${hospitalInfoVO.telno}</p>
                                        </li>
                                        <br/>
                                        <li class="list-inline-item">
                                            <div>
                                                <c:forEach var="medicalSubjectInfoListVOSList" items="${medicalSubjectInfoListVOS}" varStatus="st">
                                                    <c:forEach var="medicalSubjextInfoVO" items="${medicalSubjectInfoListVOSList}" varStatus="st">
                                                        <c:if test="${hospitalInfoVO.ykiho==medicalSubjextInfoVO.ykiho}">
                                                            <span class="badge badge-pill badge-info">${medicalSubjextInfoVO.dgsbjtCdNm}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </li>
                                        <br/>
<%--                                        <li class="list-inline-item">--%>
<%--                                            <p class="f-15 mb-0 text-muted">--%>
<%--                                                <i class="fa fa-check-circle mr-1 mb-0" aria-hidden="true"></i>--%>
<%--                                                <c:set var="today" value="<%=new java.util.Date()%>" />--%>
<%--                                                <c:set var="todayStr"><fmt:formatDate value="${today}" pattern="E" /></c:set>--%>
<%--&lt;%&ndash;                                                <c:out value="${todayStr}요일 진료시간" /> :&ndash;%&gt;--%>
<%--                                                오늘 진료시간:--%>
<%--                                                <c:forEach var="detailInfoListVOSList" items="${detailInfoListVOS}" varStatus="st">--%>
<%--                                                    <c:forEach var="detailInfoVO" items="${detailInfoListVOSList}" varStatus="st">--%>
<%--                                                        <c:if test="${hospitalInfoVO.ykiho==detailInfoVO.ykiho}">--%>
<%--                                                            <c:choose>--%>
<%--                                                                <c:when test="${todayStr=='월'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtMonStart, 0, detailInfoVO.trmtMonStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtMonStart, 0, detailInfoVO.trmtMonStart.length()-2)}:${fn:substring(detailInfoVO.trmtMonStart, detailInfoVO.trmtMonStart.length()-2, detailInfoVO.trmtMonStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtMonEnd, 0, detailInfoVO.trmtMonEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtMonEnd, 0, detailInfoVO.trmtMonEnd.length()-2)}:${fn:substring(detailInfoVO.trmtMonEnd, detailInfoVO.trmtMonEnd.length()-2, detailInfoVO.trmtMonEnd.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                                <c:when test="${todayStr=='화'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtTueStart, 0, detailInfoVO.trmtTueStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtTueStart, 0, detailInfoVO.trmtTueStart.length()-2)}:${fn:substring(detailInfoVO.trmtTueStart, detailInfoVO.trmtTueStart.length()-2, detailInfoVO.trmtTueStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtTueEnd, 0, detailInfoVO.trmtTueEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtTueEnd, 0, detailInfoVO.trmtTueEnd.length()-2)}:${fn:substring(detailInfoVO.trmtTueEnd, detailInfoVO.trmtTueEnd.length()-2, detailInfoVO.trmtTueEnd.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                                <c:when test="${todayStr=='수'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtWedStart, 0, detailInfoVO.trmtWedStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtWedStart, 0, detailInfoVO.trmtWedStart.length()-2)}:${fn:substring(detailInfoVO.trmtWedStart, detailInfoVO.trmtWedStart.length()-2, detailInfoVO.trmtWedStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtWedEnd, 0, detailInfoVO.trmtWedEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtWedEnd, 0, detailInfoVO.trmtWedEnd.length()-2)}:${fn:substring(detailInfoVO.trmtWedEnd, detailInfoVO.trmtWedEnd.length()-2, detailInfoVO.trmtWedEnd.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                                <c:when test="${todayStr=='목'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtThuStart, 0, detailInfoVO.trmtThuStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtThuStart, 0, detailInfoVO.trmtThuStart.length()-2)}:${fn:substring(detailInfoVO.trmtThuStart, detailInfoVO.trmtThuStart.length()-2, detailInfoVO.trmtThuStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtThuEnd, 0, detailInfoVO.trmtThuEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtThuEnd, 0, detailInfoVO.trmtThuEnd.length()-2)}:${fn:substring(detailInfoVO.trmtThuEnd, detailInfoVO.trmtThuEnd.length()-2, detailInfoVO.trmtThuEnd.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                                <c:when test="${todayStr=='금'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtFriStart, 0, detailInfoVO.trmtFriStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtFriStart, 0, detailInfoVO.trmtFriStart.length()-2)}:${fn:substring(detailInfoVO.trmtFriStart, detailInfoVO.trmtFriStart.length()-2, detailInfoVO.trmtFriStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtFriEnd, 0, detailInfoVO.trmtFriEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtFriEnd, 0, detailInfoVO.trmtFriEnd.length()-2)}:${fn:substring(detailInfoVO.trmtFriEnd, detailInfoVO.trmtFriEnd.length()-2, detailInfoVO.trmtFriEnd.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                                <c:when test="${todayStr=='토'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.trmtSatStart, detailInfoVO.trmtSatStart.length()-2, detailInfoVO.trmtSatStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtSatEnd, 0, detailInfoVO.trmtSatEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtSatStart, 0, detailInfoVO.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.trmtSatEnd, detailInfoVO.trmtSatEnd.length()-2, detailInfoVO.trmtSatStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                                <c:when test="${todayStr=='일'}">--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtSunStart, 0, detailInfoVO.trmtSunStart.length()-2)<10}">--%>
<%--                                                                        0${fn:substring(detailInfoVO.trmtSunStart, 0, detailInfoVO.trmtSunStart.length()-2)}:${fn:substring(detailInfoVO.trmtSunStart, detailInfoVO.trmtSunStart.length()-2, detailInfoVO.trmtSunStart.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                    ~--%>
<%--                                                                    <c:if test="${fn:substring(detailInfoVO.trmtSunEnd, 0, detailInfoVO.trmtSunEnd.length()-2)>10}">--%>
<%--                                                                        ${fn:substring(detailInfoVO.trmtSunEnd, 0, detailInfoVO.trmtSunEnd.length()-2)}:${fn:substring(detailInfoVO.trmtSunEnd, detailInfoVO.trmtSunEnd.length()-2, detailInfoVO.trmtSunEnd.length())}--%>
<%--                                                                    </c:if>--%>
<%--                                                                </c:when>--%>
<%--                                                            </c:choose>--%>
<%--                                                        </c:if>--%>
<%--                                                    </c:forEach>--%>

<%--                                                </c:forEach>--%>
<%--                                            </p>--%>
<%--                                        </li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <nav aria-label="Page navigation example">
                <ul class="pagination job-pagination justify-content-center mt-5 mb-5">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                            <i class="mdi mdi-chevron-double-left f-15"></i>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">
                            <i class="mdi mdi-chevron-double-right f-15"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

<script src="${ctp}/resources/js/hospitalInfoKakaoMap.js"></script>
<script>
    window.onload=function(){
        charMarker();
    }

    function charMarker() {


        <c:forEach var="vo" items="${hospitalInfoVOS}">

        // 마커를 표시할 위치입니다
        <%--var position =  new kakao.maps.LatLng(${vo.lati}, ${vo.longi});--%>

        // 마커를 생성합니다
        // var marker = new kakao.maps.Marker({
        //     position: position,
        //     clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
        // });

        // ====================================================================================================

        var imageSrc = 'data:image/png;base64,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', // 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(35, 35), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(${vo.lati}, ${vo.longi}); // 마커가 표시될 위치입니다

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage, // 마커이미지 설정
            clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
        });

        // 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
        // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
        // marker.setClickable(true);

        // 마커를 지도에 표시합니다.
        marker.setMap(map);


        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        var iwContent = '<div> <table class="table table-bordered"><tr><th style="width:150px;">병원 이름</th><td>${vo.yadmNm}</td></tr><tr><th>병원 주소</th><td>${vo.addr}</td></tr><tr><th>병원 상세정보</th><td><a><a>병원의 상세 정보가 궁금하신가요?</a></td></tr></table> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });



        kakao.maps.event.addListener(marker, 'click', function(info, mark) {
            return function() {
                info.open(map, mark);
            }
        }(infowindow, marker));

        </c:forEach>

    }
</script>
</body>
</html>