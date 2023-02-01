<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/01/30
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <div class="container">
            <a href="${ctp}/" class="w3-bar-item w3-button w3-wide">아파! 어디가?</a>
            <!-- Right-sided navbar links -->
            <div class="w3-right w3-hide-small">
                <c:if test="${empty sMemClass}">
                    <a href="${ctp}/member/memberLogin" class="w3-bar-item w3-button">로그인</a>
                    <a href="${ctp}/member/memberJoin" class="w3-bar-item w3-button"><i class="fa fa-user"></i> 회원가입</a>
                </c:if>
                <c:if test="${!empty sMemClass}">
                    <a class="w3-bar-item w3-button">${sNickName}</a>
                    <a href="${ctp}/member/memberLogout" class="w3-bar-item w3-button">로그아웃</a>
                    <a href="#work" class="w3-bar-item w3-button"><i class="fa fa-th"></i> 마이페이지</a>
                </c:if>
                <a href="#pricing" class="w3-bar-item w3-button"><i class="fa fa-usd"></i> 등등등</a>
                <a href="#contact" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> 등등등</a>
            </div>
        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium"
           onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large w3-top"
     style="display:none" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">닫기
        ×</a>

    <c:if test="${empty sMemClass}">
        <a href="${ctp}/member/memberLogin" onclick="w3_close()" class="w3-bar-item w3-button">로그인</a>
        <a href="${ctp}/member/memberJoin" onclick="w3_close()" class="w3-bar-item w3-button">회원가입</a>
    </c:if>
    <c:if test="${!empty sMemClass}">
        <a class="w3-bar-item w3-button">${sNickName}</a>
        <a href="${ctp}/member/memberLogout" class="w3-bar-item w3-button">로그아웃</a>
        <a href="#work" onclick="w3_close()" class="w3-bar-item w3-button">마이페이지</a>
    </c:if>
    <a href="#pricing" onclick="w3_close()" class="w3-bar-item w3-button">등등등</a>
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">등등등</a>
</nav>

<script>
    // Toggle between showing and hiding the sidebar when clicking the menu icon
    var mySidebar = document.getElementById("mySidebar");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
        } else {
            mySidebar.style.display = 'block';
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
    }
</script>