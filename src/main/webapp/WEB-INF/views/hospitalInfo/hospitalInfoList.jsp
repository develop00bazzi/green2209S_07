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
        (function ($) {


            // Nice Select
            $('.nice-select').niceSelect();


        })(jQuery)
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
                    <h5 class="text-dark mb-0 pt-2">Showing  Results : 1-6 of 540</h5>
                </div>
                <div class="sort-button float-right">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mr-3">
                            <select class="nice-select" >
                                <option data-display="Sort By">Nothing</option>
                                <option value="1">Web Developer</option>
                                <option value="2">PHP Developer</option>
                                <option value="3">Web Designer</option>
                            </select>
                        </li>

                        <li class="list-inline-item">
                            <select class="nice-select">
                                <option data-display="Default">Nothing</option>
                                <option value="1">Web Developer</option>
                                <option value="2">PHP Developer</option>
                                <option value="3">Web Designer</option>
                            </select>
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
                    <div class="col">
                        <p class="text-center">테스트 영역</p>
                        <p class="text-center">테스트 영역</p>
                        <p class="text-center">테스트 영역</p>
                        <p class="text-center">테스트 영역</p>
                    </div>
                </div>
                <div id="map" class="m-2 align-self-center align-bottom col" style="width: 100%; height: 60vh; padding: 5px; z-index: 10;"></div>
            </div>
        </div>
        <p><br/></p>
        <div class="col-lg-6 p-2">
            <div class="candidates-listing-item algin-self-center p-2 card" style="height: 80vh; overflow: auto;">
                <div class="list-grid-item mt-4 p-2">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="candidates-img float-left mr-4">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="img-fluid d-block rounded">
                            </div>
                            <div class="candidates-list-desc job-single-meta  pt-2">
                                <h5 class="mb-2 f-19"><a href="#" class="text-dark">Mary Mainor</a></h5>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item mr-4">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>Web Developer</p>
                                    </li>

                                    <li class="list-inline-item mr-4">
                                        <p class="f-15 mb-0"><a href="" class="text-muted"><i class="mdi mdi-map-marker mr-1"></i>Scenic Way Atlanta.</a></p>
                                    </li>

                                    <li class="list-inline-item">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-currency-usd mr-1"></i>$700 - $900/month</p>
                                    </li>
                                </ul>
                                <p class="text-muted mt-1 mb-0">Skills : HTML, CSS, JavaScript, Wordpress, PHP, jQueary.</p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="candidates-list-fav-btn text-right">
                                <div class="fav-icon">
                                    <i class="mdi mdi-heart f-20"></i>
                                </div>
                                <div class="candidates-listing-btn mt-4">
                                    <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-11 offset-lg-1">
                            <div class="candidates-item-desc">
                                <hr>
                                <p class="text-muted mb-2 f-14">Aenean leo ligula porttitor eu consequat eleifend ac enim. Aliquam lorem ante, dapibus in viverra quis feugiat a tellus Phasellus viverra nulla ut metus varius laoreet Quisque rutrum Maecenas tempus tellus eget condimentum pulvinar hendrerit id.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-grid-item mt-4 p-2">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="candidates-img float-left mr-4">
                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="img-fluid d-block rounded">
                            </div>
                            <div class="candidates-list-desc job-single-meta  pt-2">
                                <h5 class="mb-2 f-19"><a href="#" class="text-dark">Jack Hallock</a></h5>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item mr-4">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>Graphic Designer</p>
                                    </li>

                                    <li class="list-inline-item mr-4">
                                        <p class="f-15 mb-0"><a href="" class="text-muted"><i class="mdi mdi-map-marker mr-1"></i>Parrill Chicago</a></p>
                                    </li>

                                    <li class="list-inline-item">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-currency-usd mr-1"></i>$500 - $600/month</p>
                                    </li>
                                </ul>
                                <p class="text-muted mt-1 mb-0">Skills : HTML, CSS, JavaScript, Wordpress, PHP, jQueary.</p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="candidates-list-fav-btn text-right">
                                <div class="fav-icon">
                                    <i class="mdi mdi-heart f-20"></i>
                                </div>
                                <div class="candidates-listing-btn mt-4">
                                    <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-11 offset-lg-1">
                            <div class="candidates-item-desc">
                                <hr>
                                <p class="text-muted mb-2 f-14">Aenean leo ligula porttitor eu consequat eleifend ac enim. Aliquam lorem ante, dapibus in viverra quis feugiat a tellus Phasellus viverra nulla ut metus varius laoreet Quisque rutrum Maecenas tempus tellus eget condimentum pulvinar hendrerit id.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-grid-item mt-4 p-2">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="candidates-img float-left mr-4">
                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="img-fluid d-block rounded">
                            </div>
                            <div class="candidates-list-desc job-single-meta  pt-2">
                                <h5 class="mb-2 f-19"><a href="#" class="text-dark">Rodney Wells</a></h5>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item mr-4">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>Web Developer</p>
                                    </li>

                                    <li class="list-inline-item mr-4">
                                        <p class="f-15 mb-0"><a href="" class="text-muted"><i class="mdi mdi-map-marker mr-1"></i>Avenue Wayne</a></p>
                                    </li>

                                    <li class="list-inline-item">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-currency-usd mr-1"></i>$1000 - $1200/month</p>
                                    </li>
                                </ul>
                                <p class="text-muted mt-1 mb-0">Skills : HTML, CSS, JavaScript, Wordpress, PHP, jQueary.</p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="candidates-list-fav-btn text-right">
                                <div class="fav-icon">
                                    <i class="mdi mdi-heart f-20"></i>
                                </div>
                                <div class="candidates-listing-btn mt-4">
                                    <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-11 offset-lg-1">
                            <div class="candidates-item-desc">
                                <hr>
                                <p class="text-muted mb-2 f-14">Aenean leo ligula porttitor eu consequat eleifend ac enim. Aliquam lorem ante, dapibus in viverra quis feugiat a tellus Phasellus viverra nulla ut metus varius laoreet Quisque rutrum Maecenas tempus tellus eget condimentum pulvinar hendrerit id.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-grid-item mt-4 p-2">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="candidates-img float-left mr-4">
                                <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="img-fluid d-block rounded">
                            </div>
                            <div class="candidates-list-desc job-single-meta  pt-2">
                                <h5 class="mb-2 f-19"><a href="#" class="text-dark">Ruth Miles</a></h5>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item mr-4">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>PHP Developer</p>
                                    </li>

                                    <li class="list-inline-item mr-4">
                                        <p class="f-15 mb-0"><a href="" class="text-muted"><i class="mdi mdi-map-marker mr-1"></i>Melm Providence</a></p>
                                    </li>

                                    <li class="list-inline-item">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-currency-usd mr-1"></i>$750 - $900/month</p>
                                    </li>
                                </ul>
                                <p class="text-muted mt-1 mb-0">Skills : HTML, CSS, JavaScript, Wordpress, PHP, jQueary.</p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="candidates-list-fav-btn text-right">
                                <div class="fav-icon">
                                    <i class="mdi mdi-heart f-20"></i>
                                </div>
                                <div class="candidates-listing-btn mt-4">
                                    <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-11 offset-lg-1">
                            <div class="candidates-item-desc">
                                <hr>
                                <p class="text-muted mb-2 f-14">Aenean leo ligula porttitor eu consequat eleifend ac enim. Aliquam lorem ante, dapibus in viverra quis feugiat a tellus Phasellus viverra nulla ut metus varius laoreet Quisque rutrum Maecenas tempus tellus eget condimentum pulvinar hendrerit id.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-grid-item mt-4 p-2">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="candidates-img float-left mr-4">
                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="" class="img-fluid d-block rounded">
                            </div>
                            <div class="candidates-list-desc job-single-meta  pt-2">
                                <h5 class="mb-2 f-19"><a href="#" class="text-dark">Frank Tower</a></h5>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item mr-4">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>Web Designer</p>
                                    </li>

                                    <li class="list-inline-item mr-4">
                                        <p class="f-15 mb-0"><a href="" class="text-muted"><i class="mdi mdi-map-marker mr-1"></i>Overlook Hartford</a></p>
                                    </li>

                                    <li class="list-inline-item">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-currency-usd mr-1"></i>$600 - $850/month</p>
                                    </li>
                                </ul>
                                <p class="text-muted mt-1 mb-0">Skills : HTML, CSS, JavaScript, Wordpress, PHP, jQueary.</p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="candidates-list-fav-btn text-right">
                                <div class="fav-icon">
                                    <i class="mdi mdi-heart f-20"></i>
                                </div>
                                <div class="candidates-listing-btn mt-4">
                                    <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-11 offset-lg-1">
                            <div class="candidates-item-desc">
                                <hr>
                                <p class="text-muted mb-2 f-14">Aenean leo ligula porttitor eu consequat eleifend ac enim. Aliquam lorem ante, dapibus in viverra quis feugiat a tellus Phasellus viverra nulla ut metus varius laoreet Quisque rutrum Maecenas tempus tellus eget condimentum pulvinar hendrerit id.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-grid-item mt-4 p-2">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="candidates-img float-left mr-4">
                                <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="img-fluid d-block rounded">
                            </div>
                            <div class="candidates-list-desc job-single-meta  pt-2">
                                <h5 class="mb-2 f-19"><a href="#" class="text-dark">Jerry Real</a></h5>
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item mr-4">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-account mr-1"></i>PHP Developer</p>
                                    </li>

                                    <li class="list-inline-item mr-4">
                                        <p class="f-15 mb-0"><a href="" class="text-muted"><i class="mdi mdi-map-marker mr-1"></i> Werninger Houston</a></p>
                                    </li>

                                    <li class="list-inline-item">
                                        <p class="text-muted f-15 mb-0"><i class="mdi mdi-currency-usd mr-1"></i>$800 - $950/month</p>
                                    </li>
                                </ul>
                                <p class="text-muted mt-1 mb-0">Skills : HTML, CSS, JavaScript, Wordpress, PHP, jQueary.</p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="candidates-list-fav-btn text-right">
                                <div class="fav-icon">
                                    <i class="mdi mdi-heart f-20"></i>
                                </div>
                                <div class="candidates-listing-btn mt-4">
                                    <a href="#" class="btn btn-outline btn-sm">View Profile</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-11 offset-lg-1">
                            <div class="candidates-item-desc">
                                <hr>
                                <p class="text-muted mb-2 f-14">Aenean leo ligula porttitor eu consequat eleifend ac enim. Aliquam lorem ante, dapibus in viverra quis feugiat a tellus Phasellus viverra nulla ut metus varius laoreet Quisque rutrum Maecenas tempus tellus eget condimentum pulvinar hendrerit id.</p>
                            </div>
                        </div>
                    </div>
                </div>
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
</body>
</html>