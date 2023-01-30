<%--
  Created by IntelliJ IDEA.
  User: bazzi
  Date: 2023/01/30
  Time: 8:37 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous"/>
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
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #e5e9f2;
            border-radius: .2rem;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<div class="container h-100">
    <div class="row h-100">
        <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
            <div class="d-table-cell align-middle">

                <div class="text-center mt-4">
                    <h1 class="h2">Get started</h1>
                    <p class="lead">
                        Start creating the best possible user experience for you customers.
                    </p>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="m-sm-4">
                            <form>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="form-control form-control-lg" type="text" name="name" placeholder="Enter your name">
                                </div>
                                <div class="form-group">
                                    <label>Company</label>
                                    <input class="form-control form-control-lg" type="text" name="company" placeholder="Enter your company name">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="form-control form-control-lg" type="email" name="email" placeholder="Enter your email">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="form-control form-control-lg" type="password" name="password" placeholder="Enter password">
                                </div>
                                <div class="text-center mt-3">
                                    <a href="index.html" class="btn btn-lg btn-primary">Sign up</a>
                                    <!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>