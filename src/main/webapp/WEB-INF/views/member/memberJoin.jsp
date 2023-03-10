<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/01/31
  Time: 10:06 AM
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
            margin-top:20px;
            background-color: #f2f3f8;
        }
        .card {
            margin-bottom: 1.5rem;
            box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
        }

        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            /*word-wrap: break-word;*/
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #e5e9f2;
            border-radius: .2rem;
        }
        .input-group-append {
            z-index: 0;
        }
    </style>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${ctp}/resources/js/woo.js"></script>
    <script src="${ctp}/resources/js/memberJoin.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

<div class="container h-100">
    <div class="row h-100">
        <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
            <div class="d-table-cell align-middle">

                <div class="text-center mt-4">
                    <h1 class="h2">??????! ?????????? ????????????</h1>
                    <p class="lead">
                        ??????! ?????????? ??????????????? ????????? ??? ?????? ????????? ??????????????????!
                    </p>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="m-sm-4">
                            <div class="mb-3">
                                <font color="red">*</font> ?????? ?????? ??????
                            </div>
                            <form name="joinForm" method="post">
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>????????? (ID)</label>
                                    <input class="form-control form-control-lg" type="text" name="mid" id="mid">
                                    <span id="midCheck"></span>
                                </div>
                                <div class="form-group password">
                                    <font color="red"><b>*&nbsp;</b></font><label class="password">???????????? (PASSWORD)</label> &nbsp; <span class="pwdEyes"><i class="fa fa-eye fa-lg"></i></span>
                                    <input class="form-control form-control-lg" type="password" name="pwd" id="pwd">
                                    <span id="pwdCheck"></span>
                                </div>
                                <div class="form-group passwordCheck">
                                    <font color="red"><b>*&nbsp;</b></font><label>???????????? ????????? (PASSWORD CHECK)</label> &nbsp; <span class="rePwdEyes"><i class="fa fa-eye fa-lg"></i></span>
                                    <input class="form-control form-control-lg" type="password" name="rePwd" id="rePwd">
                                    <span id="rePwdCheck"></span>
                                </div>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>????????? (NICKNAME)</label>
                                    <input class="form-control form-control-lg" type="text" name="nickName" id="nickName">
                                    <span id="nickNameCheck"></span>
                                </div>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>?????? (NAME)</label>
                                    <input class="form-control form-control-lg" type="text" name="name" id="name">
                                    <span id="nameCheck"></span>
                                </div>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>????????????</label>
                                    <div class="input-group">
                                        <div class="input-group-append">
                                            <input class="form-control form-control-lg" type="text" name="tel1" id="tel1" value="010" readonly>
                                            <input class="form-control form-control-lg" type="text" name="tel2" id="tel2">
                                            <input class="form-control form-control-lg" type="text" name="tel3" id="tel3">
                                        </div>
                                    </div>
                                    <span id="telCheck"></span>
                                </div>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>?????????<font color="#00bfff" style="font-size: 0.8em;">&nbsp;&nbsp;???????????? ??? ???????????? ???????????? ????????? ???????????? ???????????? ???????????????!</font></label>
<%--                                    <div class="input-group">--%>
                                        <input class="form-control form-control-lg" type="email" name="email" id="email">
<%--                                    </div>--%>
                                    <span id="emailCheck"></span>
                                </div>
                                <div class="form-group">
                                    <label>????????????</label>
                                    <div class="input-group">
                                        <input class="form-control form-control-lg" type="text" name="postcode" id="sample6_postcode" readonly>
                                        <div class="input-group-append">
                                            <input class="btn btn-primary" type="button" value="???????????? ??????" onclick="sample6_execDaumPostcode()">
<%--                                            <a href="javascript:sample6_execDaumPostcode()" class="btn btn-primary">???????????? ??????</a>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>????????? ?????? / ?????? ??????</label>
                                    <input class="form-control form-control-lg" type="text" name="roadAddress" id="sample6_address" readonly>
                                    <div class="valid-feedback"></div>
                                    <div class="invalid-feedback">?????? ?????? ???????????????.</div>
                                </div>
                                <div class="form-group">
                                    <label>?????? ??????</label>
                                    <input class="form-control form-control-lg" type="text" name="detailAddress" id="sample6_detailAddress">
                                </div>
                                <div class="form-group">
                                    <label>?????? ??????</label>
                                    <input class="form-control form-control-lg" type="text" name="extraAddress" id="sample6_extraAddress" readonly>
                                </div>
                                <div class="text-center mt-3">
                                    <input type="button" value="????????????" class="form-control btn btn-lg btn-primary" onclick="joinCheck()" />
                                    <!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
                                </div>
                                <input type="hidden" name="address" id="address" />
                                <input type="hidden" name="phoneNum" id="phoneNum" />
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>