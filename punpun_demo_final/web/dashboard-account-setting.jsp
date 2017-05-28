<%--
    Document   : dashboard-account-setting
    Created on : May 28, 2017, 10:56:53 PM
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
        <!-- Bootstrap 4 -->
        <!--<link href="assets/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>-->
        <!-- Animation CSS File. "Please, Don't Touch it" - Ice -->
        <link rel="stylesheet" href="assets/css/vendor.css">
        <!-- Custom CSS. -->
        <link href="assets/css/app-seagreen.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <!-- Main -->
        <div class="main-wrapper">
            <div class="app" id="app">

                <!-- Header bar -->
                <header class="header">
                    <div class="header-block header-block-collapse hidden-lg-up"> <button class="collapse-btn" id="sidebar-collapse-btn">
                            <i class="fa fa-bars"></i>
                        </button> </div>
                    <div class="header-block header-block-nav">
                        <ul class="nav-profile">
                            <li class="header-block header-block-buttons">
                                <a href="dashboard-project-setup-info.jsp" class="btn header-btn"> <i class="fa fa-plus"></i> <span> สร้างโครงการระดมทุน </span> </a>
                            </li>
                            <!-- notification -->
                            <c:if test="${empty member}">
                                <!-- login -->
                                <li class="header-block header-block-buttons">
                                    <a href="login.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                                </li>
                            </c:if>
                            <c:if test="${member != null }">
                                <li class="notifications new">
                                    <a href="checkNotificationServlet" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <sup>
                                            <span class="counter">${countNoti}</span>
                                        </sup>
                                    </a>
                                    <div class="dropdown-menu notifications-dropdown-menu">
                                        <ul class="notifications-container">
                                            <c:forEach var="noti" items="${uncheckNoti}">
                                                <li>
                                                    <a href="" class="notification-item">
                                                        <div class="img-col">
                                                            <div class="img" style="background-image: url('assets/img/profile/0000${noti.memberId}.jpg')"></div>
                                                        </div>
                                                        <div class="body-col">
                                                            <p> <span class="accent">${noti.actor}</span> ${noti.action}: <span class="accent"> ${noti.detail}</span>. </p>
                                                        </div>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <footer>
                                            <ul>
                                                <li> <a href="viewAllNotificationServlet?id=${member.memberId}">
                                                        View All
                                                    </a> </li>
                                            </ul>
                                        </footer>
                                    </div>
                                </li>
                                <li class="profile dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                        <div class="img" style="background-image: url('assets/img/profile/0000${member.memberId}.jpg')"> </div> <span class="name">
                                            ${member.firstName}
                                        </span> </a>
                                    <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item" href="profile.jsp?member_id=${member.memberId}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
                                        <a class="dropdown-item" href="dashboard.jsp"> <i class="fa fa-user icon"></i> แดชบอร์ด </a>
                                        <a class="dropdown-item" href="dashboard-project-list.jsp"> <i class="fa fa-bell icon"></i> โครงการของคุณ </a>
                                        <a class="dropdown-item" href="dashboard-account-setting.jsp"> <i class="fa fa-gear icon"></i> ตั้งค่าบัญชีผู้ใช้ </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logoutServlet"> <i class="fa fa-power-off icon"></i> ลงชื่อออก </a>
                                    </div>
                                </li>
                            </c:if>



                        </ul>
                    </div>
                </header>

                <!-- Side Bar -->
                <aside class="sidebar">
                    <!--Main Side Bar-->
                    <div class="sidebar-container">
                        <!--Logo-->
                        <div class="sidebar-header">
                            <div class="brand">
                                <a href="index.jsp"><div class="image-container logo"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div></a></div>
                        </div>
                        <!--Menu-->
                        <nav class="menu">
                            <ul class="nav metismenu" id="sidebar-menu">
                                <li>                <a href="dashboard.jsp">       <i class="fa fa-home"></i> แดชบอร์ด </a></li>
                                <li>                <a href="dashboard-profile.jsp">         <i class="fa fa-user"></i> โปรไฟล์ </a></li>
                                <li>                <a href="dashboard-following.jsp">       <i class="fa fa-bell"></i> การติดตาม </a></li>
                                <li>                <a href="dashboard-funded-project.jsp">  <i class="fa fa-thumbs-up"></i> โครงการที่เคยร่วมระดมทุน </a></li>
                                <li>                <a href="dashboard-project-list.jsp">    <i class="fa fa-th-list"></i> จัดการโครงการของคุณ </a></li>
                                <li class="active"> <a href="dashboard-account-setting.jsp">         <i class="fa fa-gear"></i> ตั้งค่าบัญชีผู้ใช้ </a></li>
                                <li> <hr> </li>
                                <li>                <a href="admin-dashboard.jsp">       <i class="fa fa-dashboard"></i> แดชบอร์ดของแอดมิน </a></li>
                                <li>                <a href="admin-payment-control.jsp">         <i class="fa fa-money"></i> หลักฐานการโอนเงิน </a></li>
                                <li>                <a href="admin-active-project.jsp">         <i class="fa fa-gift"></i> โครงการที่กำลังระดมทุน </a></li>
                                <li>                <a href="admin-pending-project.jsp">  <i class="fa fa-legal"></i> โครงการที่รอการอนุมัติ </a></li>
                                <li>                <a href="admin-reported-project.jsp">    <i class="fa fa-exclamation-triangle"></i> โครงการที่ถูกรายงาน </a></li>
                                <li> <a href="admin-banned-project.jsp">         <i class="fa fa-ban"></i> โครงการที่ถูกระงับ </a></li>
                            </ul>
                        </nav>

                    </div>
                </aside>
                <div class="sidebar-overlay" id="sidebar-overlay"></div>
                <div class="sidebar-overlay" id="sidebar-overlay"></div>

                <!-- Content -->
                <article class="content dashboard-page">
                    <!--Pill Tab-->
                    <section class="section">
                        <div class="row">
                            <!-- Title -->
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <!-- <div class="title-block"> -->
                                    <h2> ตั้งค่าบัญชีและโปรไฟล์ของคุณ</h2>
                                    <p> </p>
                                    <!-- </div> -->
                                </div>
                            </div>
                            <!-- Tab -->
                            <div class="col-md-12">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="#" class="nav-link active"> ตั้งค่าบัญชี </a> </li>
                                            <li class="nav-item"> <a href="dashboard-setting-profile.jsp" class="nav-link"> จัดการโปรไฟล์ </a> </li>
                                            <li class="nav-item"> <a href="dashboard-setting-payment.jsp" class="nav-link"> การชำระเงิน </a> </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <!--Account Tab-->
                                            <div class="tab-pane fade in active" id="account-setting-pills">

                                                <!--Edit Personal Info-->
                                                <div class="card card-block ">
                                                    <h3 class="title"> แก้ไขข้อมูลส่วนตัว </h3>
                                                </div>
                                                <!--Form Here-->
                                                <form name="item">
                                                    <div class="card card-block">

                                                        <!--Username-->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 form-control-label text-xs-right">
                                                                ชื่อผู้ใช้:
                                                            </label>
                                                            <div class="col-sm-10"> <input type="text" readonly="readonly" class="form-control" value="${member.username}"> </div>
                                                        </div>

                                                        <!--Name-->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 form-control-label text-xs-right">
                                                                ชื่อ-นามสกุล:
                                                            </label>
                                                            <div class="col-sm-10"> <input type="text" class="form-control" value="${member.firstName} ${member.lastName}" placeholder=""> </div>
                                                        </div>

                                                        <!--Email-->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 form-control-label text-xs-right">
                                                                อีเมล:
                                                            </label>
                                                            <div class="col-sm-10"> <input type="email" class="form-control" value="${member.email}" placeholder=""> </div>
                                                        </div>

                                                        <!--Submit Btn-->
                                                        <div class="form-group row">
                                                            <div class="col-md-10 offset-md-2 col-sm-10 offset-sm-2">
                                                                <button type="submit" class="btn btn-primary btn-block">
                                                                    บันทึก
                                                                </button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>

                                                <!--Edit Security Info-->
                                                <div class="card card-block">
                                                    <h3 class="title"> ตั้งค่าความปลอดภัย</h3>
                                                </div>
                                                <!--Form Here-->
                                                <form name="item" action="error-404-alt.jsp">
                                                    <div class="card card-block">

                                                        <!--Password: Old-->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 form-control-label text-xs-right">
                                                                รหัสผ่านเดิม:
                                                            </label>
                                                            <div class="col-sm-10"> <input type="password" class="form-control" placeholder=""> </div>
                                                        </div>

                                                        <!--Password: New-->
                                                        <div class="form-group row">
                                                            <label class="col-sm-2 form-control-label text-xs-right">
                                                                รหัสผ่านใหม่:
                                                            </label>
                                                            <div class="col-sm-10"> <input type="password" class="form-control" placeholder=""> </div>
                                                        </div>

                                                        <!--Password Comfirmation-->
                                                        <div class="form-group has-warning row">
                                                            <label class="col-sm-2 form-control-label text-xs-right">
                                                                รหัสผ่านใหม่อีกครั้ง:
                                                            </label>
                                                            <div class="col-sm-10"> <input type="password" class="form-control" placeholder=""> <span class="has-warning">กรุณาใส่ให้ตรงกับรหัสผ่านด้านบน</span></div>

                                                        </div>

                                                        <!--Submit Btn-->
                                                        <div class="form-group row ">
                                                            <div class="col-md-10 offset-md-2 col-sm-10 offset-sm-2">
                                                                <button type="submit" class="btn btn-primary btn-block">
                                                                    บันทึก
                                                                </button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>

                <!-- Footer -->
                <footer class="footer">
                    <div class="footer-block buttons"> </div>
                    <div class="footer-block author">
                        <ul>
                            <li> Theme by <a href="https://github.com/modularcode"> ModularCode </a> </li>
                            <li> Created by <a href=""> Disanuwat & Kanokwan </a> </li>
                            <li> <a href="www.it.kmitl.ac.th"> IT KMITL </a> </li>
                        </ul>
                    </div>
                </footer>

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
