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
    <title>아파! 어디가? 소셜 회원가입</title>
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
    <script src="${ctp}/resources/js/socialJoin.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

<div class="container h-100">
    <div class="row h-100">
        <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
            <div class="d-table-cell align-middle">

                <div class="text-center mt-4">
                    <h1 class="h2">아파! 어디가? 소셜 회원가입</h1>
                    <p class="lead">
                        회원님의 소셜 계정으로 존재하는 정보가 없습니다!
                        아파! 어디가? 회원가입을 통하여 더 많은 기능을 사용해보세요!
                    </p>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="m-sm-4">
                            <div class="mb-3">
                                <font color="red">*</font> 필수 입력 항목
                            </div>
                            <form name="socialJoinForm" method="post" action="${ctp}/member/socialJoin">
<%--                                <div class="form-group">--%>
<%--                                    <font color="red"><b>*&nbsp;</b></font><label>아이디 (ID)</label>--%>
<%--                                    <input class="form-control form-control-lg" type="text" name="mid" id="mid" value="${memberVO.mid}" readonly>--%>
<%--                                    <span id="midCheck"></span>--%>
<%--                                </div>--%>
<%--                                <div class="form-group password">--%>
<%--                                    <font color="red"><b>*&nbsp;</b></font><label class="password">비밀번호 (PASSWORD)</label> &nbsp; <span class="pwdEyes"><i class="fa fa-eye fa-lg"></i></span>--%>
<%--                                    <input class="form-control form-control-lg" type="password" name="pwd" id="pwd" value="${memberVO.pwd}" readonly>--%>
<%--                                    <span id="pwdCheck"></span>--%>
<%--                                </div>--%>
<%--                                <div class="form-group passwordCheck">--%>
<%--                                    <font color="red"><b>*&nbsp;</b></font><label>비밀번호 재확인 (PASSWORD CHECK)</label> &nbsp; <span class="rePwdEyes"><i class="fa fa-eye fa-lg"></i></span>--%>
<%--                                    <input class="form-control form-control-lg" type="password" name="rePwd" id="rePwd" value="${memberVO.pwd}" readonly>--%>
<%--                                    <span id="rePwdCheck"></span>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>닉네임 (NICKNAME)</label>
                                    <input class="form-control form-control-lg" type="text" name="nickName" id="nickName" value="${socialJoinVO.nickName}">
                                    <span id="nickNameCheck"></span>
                                </div>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>성명 (NAME)</label>
                                    <input class="form-control form-control-lg" type="text" name="name" id="name">
                                    <span id="nameCheck"></span>
                                </div>
                                <div class="form-group">
                                    <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
                                    <div class="input-group">
                                        <div class="input-group-append">
                                            <input class="form-control form-control-lg" type="text" name="tel1" id="tel1" value="010" readonly>
                                            <input class="form-control form-control-lg" type="text" name="tel2" id="tel2">
                                            <input class="form-control form-control-lg" type="text" name="tel3" id="tel3">
                                        </div>
                                    </div>
                                    <span id="telCheck"></span>
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <font color="red"><b>*&nbsp;</b></font><label>이메일</label>--%>
<%--                                    <font color="#00bfff" style="font-size: 0.8em;">&nbsp;&nbsp;회원가입 후 이메일을 확인하여 인증을 완료해야 로그인이 가능합니다!</font>--%>
<%--                                    <div class="input-group">--%>
<%--                                        <input class="form-control form-control-lg" type="email" name="email" id="email">--%>
<%--                                    </div>--%>
<%--                                    <span id="emailCheck"></span>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <label>우편번호</label>
                                    <div class="input-group">
                                        <input class="form-control form-control-lg" type="text" name="postcode" id="sample6_postcode" readonly>
                                        <div class="input-group-append">
                                            <input class="btn btn-primary" type="button" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
<%--                                            <a href="javascript:sample6_execDaumPostcode()" class="btn btn-primary">우편번호 찾기</a>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>도로명 주소 / 지번 주소</label>
                                    <input class="form-control form-control-lg" type="text" name="roadAddress" id="sample6_address" readonly>
                                    <div class="valid-feedback"></div>
                                    <div class="invalid-feedback">필수 입력 항목입니다.</div>
                                </div>
                                <div class="form-group">
                                    <label>상세 주소</label>
                                    <input class="form-control form-control-lg" type="text" name="detailAddress" id="sample6_detailAddress">
                                </div>
                                <div class="form-group">
                                    <label>참고 항목</label>
                                    <input class="form-control form-control-lg" type="text" name="extraAddress" id="sample6_extraAddress" readonly>
                                </div>
                                <div class="text-center mt-3">
                                    <input type="button" value="회원가입" class="form-control btn btn-lg btn-primary" onclick="joinCheck()" />
                                    <!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
                                </div>
                                <input type="hidden" name="address" id="address" />
                                <input type="hidden" name="phoneNum" id="phoneNum" />

<%--                                아이디, 비밀번호, 이메일 입력처리를 안 받았기 때문에 hidden 태그로 따로 처리 --%>
                                <input type="hidden" name="mid" id="mid" value="${socialJoinVO.mid}">
                                <input type="hidden" name="pwd" id="pwd" value="${socialJoinVO.pwd}">
                                <input type="hidden" name="email" id="email" value="${socialJoinVO.email}">
                                <input type="hidden" name="joinKey" id="joinKey" value="${socialJoinVO.joinKey}">
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