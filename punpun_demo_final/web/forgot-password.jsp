<%--
    Document   : forgot-password
    Created on : May 28, 2017, 11:37:19 PM
    Author     : kanok
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Punpun: HTML5 App Not JSP</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico in the root directory -->
        <link rel="shortcut icon" href="assets/logo/gift.png"/>
        <!-- Animation CSS File. "Please, Don't Touch it" - Ice -->
        <link rel="stylesheet" href="assets/css/vendor.css">
        <!-- Custom CSS. Bootstrap 4 already there. -->
        <link href="assets/css/app_vistor.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <header class="auth-header">
                        <h1 class="auth-title">
                            รีเซ็ตรหัสผ่าน
                        </h1>
                    </header>
                    <div class="auth-content">
                        <p class="text-muted text-xs-center">ใส่อีเมล เพื่อรีเซ็ตรหัสผ่านของคุณ</p>
                        <form id="reset-form" action="index.jsp" method="GET">
                            <div class="form-group"> <label for="email1">อีเมล์</label> <input type="email" class="form-control underlined" name="email1" id="email1" placeholder="example@example.com" required> </div>
                            <div class="form-group"> <input type="submit" value="รีเซ็ตรหัสผ่าน" class="btn btn-block btn-primary"></input> </div>
                            <div class="form-group clearfix"> <a class="pull-left" href="login.jsp">เข้าสู่ระบบ</a> <a class="pull-right" href="signup.jsp">สมัครสมาชิก!</a> </div>
                        </form>
                    </div>
                </div>
                <div class="text-xs-center">
                    <a href="index.jsp" class="btn btn-secondary rounded btn-sm"> <i class="fa fa-arrow-left"></i> กลับสู่หน้าแรก </a>
                </div>
            </div>
        </div>


        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>

        <!-- Script -->
        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>

