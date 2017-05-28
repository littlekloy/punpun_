<%--
    Document   : promt-password
    Created on : May 28, 2017, 11:45:00 PM
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
                        <h1 class="auth-title"> ยืนยันรหัสผ่าน </h1>
                    </header>
                    <div class="auth-content">
                        <form id="login-form" action="dashboard-add-payment.jsp" method="GET" novalidate="">
                            <div class="form-group"> <label for="password">รหัสผ่าน</label> <input type="password" class="form-control underlined" name="password" id="password" placeholder="รหัสผ่านของคุณ" required> </div>
                            <div class="form-group"> <button type="submit" class="btn btn-block btn-primary"><i class="fa fa-lock"></i> ยืนยัน</button> </div>
                        </form>
                    </div>
                </div>
                <div class="text-xs-center">
                    <a href="javascript:history.back()" class="btn btn-secondary rounded btn-sm"> <i class="fa fa-arrow-left"></i> กลับไปหน้าก่อน </a>
                </div>
            </div>
        </div>

        <!-- Script -->
        <script src="css/js/vendor.js"></script>
        <script src="css/js/app.js"></script>
    </body>
</html>

