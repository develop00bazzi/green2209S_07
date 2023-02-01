<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/02/01
  Time: 1:08 PM
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
    <title>알림</title>
    <script>
        'use strict';
        let msg = '${msg}';
        let url = '${ctp}/${url}';

        alert(msg);
        location.href = url;
    </script>
</head>
<body>
</body>
</html>