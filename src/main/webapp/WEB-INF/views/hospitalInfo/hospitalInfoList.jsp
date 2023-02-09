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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous"/>
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

    /*    카카오 맵 관련 CSS */

        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
        .info .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
        .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}

    </style>
    <script>
        'use strict';

        // 시도 콤보 박스 변경시 안에 시군구 내용 바꾸기

        $(function() {
            $("#sidoCd").change(function() {
                loadSgguList();
            });
        });

        $(document).ready(function() {
            loadSgguList();

            <%--if(${fn:substring(regionCode, 2, 6)}!="0000") {--%>
            <%--    $("#sgguCd").val("${regionCode}").prop("selected", true);--%>
            <%--}--%>

            <c:if test="${fn:substring(regionCode, 2, 6)!='0000'}">
                $("#sgguCd").val("${regionCode}").prop("selected", true);
            </c:if>

        });

        // $(function() {
        //     $("#sggu").change(function() {
        //         let sgguCd=$("#sggu").val();
        //         // alert(sgguCd);
        //     });
        // });


        function loadSgguList() {
            let sidoCd=$("#sidoCd").val();
            // console.log(sido);
            if(sidoCd=="") {
                alert("시도를 선택해주시기 바랍니다!");
                return false;
            }
            $.ajax({
                type:"post",
                url:"${ctp}/hospitalInfo/getSgguList",
                data: {sidoCd: sidoCd},
                async: false,

                // 한번 보기

                success: function(vos) {
                    let str='';
                    str+='<option value="">시군구 선택</option>';

                    <%--alert("${vos}");--%>

                    for(let i=0; i<vos.length; i++) {
                        console.log(vos[i].sgguCdNm);
                        if(vos[i]==null) break;
                        str+='<option value="'+vos[i].sgguCd+'">'+vos[i].sgguCdNm+'</option>';
                    }
                    $("#sgguCd").html(str);
                },
                error: function() {
                    alert("전송 오류!");
                }
            });

            <%--alert(${regionCode});--%>


        }

        function hospitalInfoSearch() {
            let data=$("#hospitalInfoSearchForm").serialize();

            let regionCode="";
            let medicalSubjectCode=hospitalInfoSearchForm.medicalSubjectCode.value;
            let sidoCd=hospitalInfoSearchForm.sidoCd.value;
            let sgguCd=hospitalInfoSearchForm.sgguCd.value;

            if(sidoCd=="" && sgguCd!="") {
                regionCode=sgguCd;
            }
            else if(sgguCd=="" && sidoCd!="") {
                regionCode=sidoCd;
            }
            else if(sidoCd!="" && sgguCd!="") {
                regionCode=sgguCd;
            }

            // alert(data);
            location.href="${ctp}/hospitalInfo/hospitalInfoList?medicalSubjectCode="+medicalSubjectCode+"&regionCode="+regionCode;
        }


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
                    <h3 class="text-dark mb-0">${region}의 ${medicalSubject}</h3>
                </div>
                <form id="hospitalInfoSearchForm">
                    <div class="sort-button float-right">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item mr-3">
                                <select id="medicalSubjectCode" name="medicalSubjectCode" class="nice-select">
                                    <option data-display="Sort By">진료 과목</option>
                                    <option value="49" <c:if test="${medicalSubject=='치과'}">selected</c:if>>치과</option>
                                    <option value="12" <c:if test="${medicalSubject=='안과'}">selected</c:if>>안과</option>
                                    <option value="14" <c:if test="${medicalSubject=='피부과'}">selected</c:if>>피부과</option>
                                    <option value="8" <c:if test="${medicalSubject=='성형외과'}">selected</c:if>>성형외과</option>
                                    <option value="10" <c:if test="${medicalSubject=='산부인과'}">selected</c:if>>산부인과</option>
                                    <option value="3" <c:if test="${medicalSubject=='정신의학과'}">selected</c:if>>정신의학과</option>
                                    <option value="15" <c:if test="${medicalSubject=='비뇨기과'}">selected</c:if>>비뇨기과</option>
                                    <option value="5" <c:if test="${medicalSubject=='정형외과'}">selected</c:if>>정형외과</option>
                                    <option value="9" <c:if test="${medicalSubject=='마취통증의학과'}">selected</c:if>>마치통증의학과</option>
                                    <option value="6" <c:if test="${medicalSubject=='신경외과'}">selected</c:if>>신경외과</option>
                                    <option value="21" <c:if test="${medicalSubject=='재활의학과'}">selected</c:if>>재활의학과</option>
                                    <option value="16" <c:if test="${medicalSubject=='영상의학과'}">selected</c:if>>영상의학과</option>
                                    <option value="4" <c:if test="${medicalSubject=='외과'}">selected</c:if>>외과</option>
                                    <option value="2" <c:if test="${medicalSubject=='신경과'}">selected</c:if>>신경과</option>
                                    <option value="11" <c:if test="${medicalSubject=='소아과'}">selected</c:if>>소아과</option>
                                    <option value="1" <c:if test="${medicalSubject=='내과'}">selected</c:if>>내과</option>
                                    <option value="13" <c:if test="${medicalSubject=='이비인후과'}">selected</c:if>>이비인후과</option>
                                    <option value="23" <c:if test="${medicalSubject=='가정의학과'}">selected</c:if>>가정의학과</option>
                                    <option value="99" <c:if test="${medicalSubject=='한의원'}">selected</c:if>>한의원</option>
                                </select>
                            </li>

                            <li class="list-inline-item">
                                <select id="sidoCd" name="sidoCd" class="nice-select">
                                    <option data-display="Default">시도 선택</option>
                                    <c:forEach var="sidoListVO" items="${sidoListVOS}" varStatus="st">
                                        <option value="${sidoListVO.sidoCd}" <c:if test="${fn:substring(regionCode, 0, 2)==fn:substring(sidoListVO.sidoCd, 0, 2)}">selected</c:if>>${sidoListVO.sidoCdNm}</option>
                                    </c:forEach>
                                </select>
                            </li>

                            <li class="list-inline-item">
                                <select id="sgguCd" name="sgguCd" class="nice-select">
                                    <option value="">시군구 선택</option>
                                </select>
                            </li>
                            <li class="list-inline-item">
                                <input type="button" value="목록 조회" onclick="hospitalInfoSearch()" class="nice-select">
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 p-2">
            <div class="container card d-flex" style="height: 80vh;">
<%--                <div class="row">--%>
<%--                </div>--%>
                <div id="map" class="m-2 align-self-center align-bottom col" style="width: 100%; height: 60vh; padding: 5px; z-index: 10;"></div>
            </div>
        </div>
        <p><br/></p>
        <div class="col-lg-6 p-2">
            <div class="candidates-listing-item algin-self-center p-2 card" style="height: 80vh; overflow: auto;">
                <c:forEach var="hospitalInfoVO" items="${hospitalInfoVOS}" varStatus="st">
                    <div class="list-grid-item mt-2 p-2" style="cursor:pointer;" onclick="location.href='${ctp}/hospitalInfo/hospitalInfo?ykiho=${hospitalInfoVO.ykiho}';">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="candidates-list-desc job-single-meta p-2">
                                    <h5 class="mb-2 f-19"><a href="#" class="text-dark">${hospitalInfoVO.yadmNm}</a></h5>
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item mr-4">
                                            <p class="f-15 mb-0"><i class="fa fa-map-marker mr-2" aria-hidden="true"></i></i><a>${hospitalInfoVO.addr}</a></p>
                                        </li>
                                        <br/>
                                        <li class="list-inline-item">
                                            <p class="f-15 mb-0">
                                                <i class="fa fa-phone" aria-hidden="true"></i>
                                                <c:if test="${hospitalInfoVO.telno==''}">
                                                    정보 없음
                                                </c:if>
                                                <c:if test="${hospitalInfoVO.telno!=''}">
                                                    <a href="tel:${hospitalInfoVO.telno}">${hospitalInfoVO.telno}</a>
                                                </c:if>
                                            </p>
                                        </li>
                                        <br/>
                                        <li class="list-inline-item">
                                            <div>
                                                <c:forEach var="medicalSubjectInfoVOS" items="${medicalSubjectInfoVOHashMap}">
                                                    <c:if test="${medicalSubjectInfoVOS.key==hospitalInfoVO.ykiho}">
                                                        <c:forEach var="medicalSubectInfoVO" items="${medicalSubjectInfoVOS.value}">
                                                            <span class="badge badge-pill badge-info">${medicalSubectInfoVO.dgsbjtCdNm}</span>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </li>
                                        <br/>
                                        <li class="list-inline-item">
                                            <p class="f-15 mb-0 text-muted">
                                                <i class="fa fa-check-circle mr-1 mb-0" aria-hidden="true"></i>
                                                <c:set var="today" value="<%=new java.util.Date()%>" />
                                                <c:set var="todayStr"><fmt:formatDate value="${today}" pattern="E" /></c:set>
                                                오늘 진료시간:
                                                <c:forEach var="detailInfoVO" items="${detailInfoVOHashMap}">
                                                    <c:if test="${detailInfoVO.key==hospitalInfoVO.ykiho}">
                                                        <c:choose>
                                                            <c:when test="${todayStr=='월'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtMonStart=='' || detailInfoVO.value.trmtMonEnd==''}">
                                                                        전화문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtMonStart, 0, detailInfoVO.value.trmtMonStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtMonStart, 0, detailInfoVO.value.trmtMonStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtMonStart, detailInfoVO.value.trmtMonStart.length()-2, detailInfoVO.value.trmtMonStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtMonStart, 0, detailInfoVO.value.trmtMonStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtMonStart, 0, detailInfoVO.value.trmtMonStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtMonStart, detailInfoVO.value.trmtMonStart.length()-2, detailInfoVO.value.trmtMonStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtMonEnd, 0, detailInfoVO.value.trmtMonEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtMonEnd, 0, detailInfoVO.value.trmtMonEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtMonEnd, detailInfoVO.value.trmtMonEnd.length()-2, detailInfoVO.value.trmtMonEnd.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtMonEnd, 0, detailInfoVO.value.trmtMonEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtMonEnd, 0, detailInfoVO.value.trmtMonEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtMonEnd, detailInfoVO.value.trmtMonEnd.length()-2, detailInfoVO.value.trmtMonEnd.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${todayStr=='화'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtTueStart=='' || detailInfoVO.value.trmtTueEnd==''}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtTueStart, 0, detailInfoVO.value.trmtTueStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtTueStart, 0, detailInfoVO.value.trmtTueStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtTueStart, detailInfoVO.value.trmtTueStart.length()-2, detailInfoVO.value.trmtTueStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtTueStart, 0, detailInfoVO.value.trmtTueStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtTueStart, 0, detailInfoVO.value.trmtTueStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtTueStart, detailInfoVO.value.trmtTueStart.length()-2, detailInfoVO.value.trmtTueStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtTueEnd, 0, detailInfoVO.value.trmtTueEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtTueEnd, 0, detailInfoVO.value.trmtTueEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtTueEnd, detailInfoVO.value.trmtTueEnd.length()-2, detailInfoVO.value.trmtTueEnd.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtTueEnd, 0, detailInfoVO.value.trmtTueEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtTueEnd, 0, detailInfoVO.value.trmtTueEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtTueEnd, detailInfoVO.value.trmtTueEnd.length()-2, detailInfoVO.value.trmtTueEnd.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${todayStr=='수'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtWedStart=='' || detailInfoVO.value.trmtWedEnd==''}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtWedStart, 0, detailInfoVO.value.trmtWedStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtWedStart, 0, detailInfoVO.value.trmtWedStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtWedStart, detailInfoVO.value.trmtWedStart.length()-2, detailInfoVO.value.trmtWedStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtWedStart, 0, detailInfoVO.value.trmtWedStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtWedStart, 0, detailInfoVO.value.trmtWedStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtWedStart, detailInfoVO.value.trmtWedStart.length()-2, detailInfoVO.value.trmtWedStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtWedEnd, 0, detailInfoVO.value.trmtWedEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtWedEnd, 0, detailInfoVO.value.trmtWedEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtWedEnd, detailInfoVO.value.trmtWedEnd.length()-2, detailInfoVO.value.trmtWedEnd.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtWedEnd, 0, detailInfoVO.value.trmtWedEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtWedEnd, 0, detailInfoVO.value.trmtWedEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtWedEnd, detailInfoVO.value.trmtWedEnd.length()-2, detailInfoVO.value.trmtWedEnd.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${todayStr=='목'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtThuStart=='' || detailInfoVO.value.trmtThuEnd==''}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtThuStart, 0, detailInfoVO.value.trmtThuStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtThuStart, 0, detailInfoVO.value.trmtThuStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtThuStart, detailInfoVO.value.trmtThuStart.length()-2, detailInfoVO.value.trmtThuStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtThuStart, 0, detailInfoVO.value.trmtThuStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtThuStart, 0, detailInfoVO.value.trmtThuStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtThuStart, detailInfoVO.value.trmtThuStart.length()-2, detailInfoVO.value.trmtThuStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtThuEnd, 0, detailInfoVO.value.trmtThuEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtThuEnd, 0, detailInfoVO.value.trmtThuEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtThuEnd, detailInfoVO.value.trmtThuEnd.length()-2, detailInfoVO.value.trmtThuEnd.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtThuEnd, 0, detailInfoVO.value.trmtThuEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtThuEnd, 0, detailInfoVO.value.trmtThuEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtThuEnd, detailInfoVO.value.trmtThuEnd.length()-2, detailInfoVO.value.trmtThuEnd.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${todayStr=='금'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtFriStart=='' || detailInfoVO.value.trmtFriEnd==''}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtFriStart, 0, detailInfoVO.value.trmtFriStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtFriStart, 0, detailInfoVO.value.trmtFriStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtFriStart, detailInfoVO.value.trmtFriStart.length()-2, detailInfoVO.value.trmtFriStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtFriStart, 0, detailInfoVO.value.trmtFriStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtFriStart, 0, detailInfoVO.value.trmtFriStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtFriStart, detailInfoVO.value.trmtFriStart.length()-2, detailInfoVO.value.trmtFriStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtFriEnd, 0, detailInfoVO.value.trmtFriEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtFriEnd, 0, detailInfoVO.value.trmtFriEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtFriEnd, detailInfoVO.value.trmtFriEnd.length()-2, detailInfoVO.value.trmtFriEnd.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtFriEnd, 0, detailInfoVO.value.trmtFriEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtFriEnd, 0, detailInfoVO.value.trmtFriEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtFriEnd, detailInfoVO.value.trmtFriEnd.length()-2, detailInfoVO.value.trmtFriEnd.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${todayStr=='토'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtSatStart=='' || detailInfoVO.value.trmtSatEnd==''}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSatStart, 0, detailInfoVO.value.trmtSatStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtSatStart, 0, detailInfoVO.value.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtSatStart, detailInfoVO.value.trmtSatStart.length()-2, detailInfoVO.value.trmtSatStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSatStart, 0, detailInfoVO.value.trmtSatStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtSatStart, 0, detailInfoVO.value.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtSatStart, detailInfoVO.value.trmtSatStart.length()-2, detailInfoVO.value.trmtSatStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSatEnd, 0, detailInfoVO.value.trmtSatEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtSatStart, 0, detailInfoVO.value.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtSatEnd, detailInfoVO.value.trmtSatEnd.length()-2, detailInfoVO.value.trmtSatStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSatEnd, 0, detailInfoVO.value.trmtSatEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtSatStart, 0, detailInfoVO.value.trmtSatStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtSatEnd, detailInfoVO.value.trmtSatEnd.length()-2, detailInfoVO.value.trmtSatStart.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:when test="${todayStr=='일'}">
                                                                <c:choose>
                                                                    <c:when test="${detailInfoVO.value.trmtSunStart=='' || detailInfoVO.value.trmtSunEnd==''}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:when test="${empty detailInfoVO.value}">
                                                                        전화 문의
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSunStart, 0, detailInfoVO.value.trmtSunStart.length()-2)<10}">
                                                                            0${fn:substring(detailInfoVO.value.trmtSunStart, 0, detailInfoVO.value.trmtSunStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtSunStart, detailInfoVO.value.trmtSunStart.length()-2, detailInfoVO.value.trmtSunStart.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSunStart, 0, detailInfoVO.value.trmtSunStart.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtSunStart, 0, detailInfoVO.value.trmtSunStart.length()-2)}:${fn:substring(detailInfoVO.value.trmtSunStart, detailInfoVO.value.trmtSunStart.length()-2, detailInfoVO.value.trmtSunStart.length())}
                                                                        </c:if>
                                                                        ~
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSunEnd, 0, detailInfoVO.value.trmtSunEnd.length()-2)<10}">
                                                                            1${fn:substring(detailInfoVO.value.trmtSunEnd, 0, detailInfoVO.value.trmtSunEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtSunEnd, detailInfoVO.value.trmtSunEnd.length()-2, detailInfoVO.value.trmtSunEnd.length())}
                                                                        </c:if>
                                                                        <c:if test="${fn:substring(detailInfoVO.value.trmtSunEnd, 0, detailInfoVO.value.trmtSunEnd.length()-2)>=10}">
                                                                            ${fn:substring(detailInfoVO.value.trmtSunEnd, 0, detailInfoVO.value.trmtSunEnd.length()-2)}:${fn:substring(detailInfoVO.value.trmtSunEnd, detailInfoVO.value.trmtSunEnd.length()-2, detailInfoVO.value.trmtSunEnd.length())}
                                                                        </c:if>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                            </p>
                                        </li>
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
                    <c:if test="${pageVO.pag>1}">
                        <li class="page-item">
                            <a class="page-link" href="${ctp}/hospitalInfo/hospitalInfoList?pag=1&pageSize=${pageVO.pageSize}&medicalSubjectCode=${pageVO.medicalSubjectCode}&regionCode=${pageVO.regionCode}&yadmNm=${pageVO.yadmNm}">
                                <i class="mdi mdi-chevron-double-left f-15"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageVO.curBlock>0}">
                        <li class="page-item">
                            <a class="page-link" href="${ctp}/hospitalInfo/hospitalInfoList?pag=${(pageVO.curBlock-1)*pageVO.blockSize+1}&pageSize=${pageVO.pageSize}&medicalSubjectCode=${pageVO.medicalSubjectCode}&regionCode=${pageVO.regionCode}&yadmNm=${pageVO.yadmNm}">
                                <i class="mdi mdi-chevron-left f-15"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="${(pageVO.curBlock)*pageVO.blockSize+1}" end="${(pageVO.curBlock)*pageVO.blockSize+pageVO.blockSize}" varStatus="st">
                        <c:if test="${i<=pageVO.totPage && i==pageVO.pag}">
                            <li class="page-item active"><a class="page-link" href="${ctp}/hospitalInfo/hospitalInfoList?pag=${i}&pageSize=${pageVO.pageSize}&medicalSubjectCode=${pageVO.medicalSubjectCode}&regionCode=${pageVO.regionCode}&yadmNm=${pageVO.yadmNm}">${i}</a></li>
                        </c:if>
                        <c:if test="${i<=pageVO.totPage && i!=pageVO.pag}">
                            <li class="page-item"><a class="page-link" href="${ctp}/hospitalInfo/hospitalInfoList?pag=${i}&pageSize=${pageVO.pageSize}&medicalSubjectCode=${pageVO.medicalSubjectCode}&regionCode=${pageVO.regionCode}&yadmNm=${pageVO.yadmNm}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageVO.curBlock<pageVO.lastBlock}">
                        <li class="page-item">
                            <a class="page-link" href="${ctp}/hospitalInfo/hospitalInfoList?pag=${(pageVO.curBlock+1)*pageVO.blockSize+1}&pageSize=${pageVO.pageSize}&medicalSubjectCode=${pageVO.medicalSubjectCode}&regionCode=${pageVO.regionCode}&yadmNm=${pageVO.yadmNm}">
                                <i class="mdi mdi-chevron-right f-15"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageVO.pag<pageVO.totPage}">
                        <li class="page-item">
                            <a class="page-link" href="${ctp}/hospitalInfo/hospitalInfoList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}&medicalSubjectCode=${pageVO.medicalSubjectCode}&regionCode=${pageVO.regionCode}&yadmNm=${pageVO.yadmNm}">
                                <i class="mdi mdi-chevron-double-right f-15"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

<script src="${ctp}/resources/js/hospitalInfoKakaoMap.js"></script>
<script>
    'use strict';

    var points=[];

    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    var bounds = new kakao.maps.LatLngBounds();

    window.onload=function(){
        charMarker();
        setBounds();
    }

    function charMarker() {

        <c:forEach var="vo" items="${hospitalInfoVOS}" varStatus="st">

            // 마커를 표시할 위치입니다
            <%--var position =  new kakao.maps.LatLng(${vo.lati}, ${vo.longi});--%>

            // 마커를 생성합니다
            // var marker = new kakao.maps.Marker({
            //     position: position,
            //     clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
            // });

            // ====================================================================================================

            var imageSrc = '${ctp}/resources/images/hospitalMarker.png', // 마커이미지의 주소입니다
                imageSize = new kakao.maps.Size(35, 35), // 마커이미지의 크기입니다
                imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng(${vo.lati}, ${vo.longi}); // 마커가 표시될 위치입니다

            // points 배열에 좌표 추가
            points.push(new kakao.maps.LatLng(${vo.lati}, ${vo.longi}));

            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(points[${st.index}]);

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
            var iwContent = '<div class="p-2"><div class="row"><div class="col-3">병원 이름</div><div class="col-9">${vo.yadmNm}</div></div><div class="row"><div class="col-3">병원 주소</div><div class="col-9">${vo.addr}</div></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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

    function setBounds() {
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
        map.setBounds(bounds);
    }



</script>
</body>
</html>