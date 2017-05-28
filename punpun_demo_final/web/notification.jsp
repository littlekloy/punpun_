<%--
    Document   : notification
    Created on : May 28, 2017, 3:39:01 PM
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

        <!--Main-->
        <div class="main-wrapper header-fixed">

            <!--Nav Bar-->
            <header class="header">
                <div class="brand">
                    <div class="image-container logo hidden-xs-down"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div>
                    <div class="image-container logo hidden-sm-up"style="width: 30px; height: 30px;"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div>
                </div>
                <div class="header-block header-block-search hidden-md-down">
                    <form role="search" action="searchServlet">
                        <div class="input-container">
                            <div>
                                <i class="fa fa-search"></i> <input type="search" name="keyword" placeholder="...ค้นหาโครงการ...">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="header-block header-block-nav">
                    <ul class="nav-profile">
                        <li class="header-block header-block-buttons">
                            <a href="index.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-home"></i> <span> หน้าแรก </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="ViewAllServlet" class="btn btn-none-shadow header-btn"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="how-it-works.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-list-ul"></i> <span> ขั้นตอนการบริจาค </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="dashboard-project-setup-info.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-plus"></i> <span> สร้างโครงการ </span> </a>
                        </li>
                        <c:if test="${empty member}">
                            <!-- login -->
                            <li class="header-block header-block-buttons">
                                <a href="login.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                            </li>
                        </c:if>
                        <c:if test="${member != null }">

                            <!-- notification -->
                            <li class="notifications new">
                                <a href="" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <sup>
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

                            <!-- profile -->
                            <li class="profile dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    <div class="img" style="background-image: url('assets/img/profile/0000${member.memberId}.jpg')"> </div> <span class="name">
                                        ${member.firstName}
                                    </span> </a>
                                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item" href="profile.jsp/?member_id=${member.memberId}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
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

            <!-- Parallax Content -->
            <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/banner2.png');" >
                <article class="container content-browse">
                    <div class="col-md-12">
                        <h1 class="center-text"> การแจ้งเตือน </h1>
                    </div>
                </article>
            </div>
            <!-- Content -->
            <div class="app">
                <!-- Content -->
                <div class="app">
                    <!-- Content -->
                    <article class="container content dashboard-page">

                        <!--Pill Tab : Content-->
                        <section class="section">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="card items">
                                        <div class="card-block">
                                            <!--List of Funded Projects-->
                                            <div data-exclude="xs,sm,lg">
                                                <!-- Table Content -->
                                                <ul class="item-list striped">
                                                    <!-- Item : Loop here -->

                                                    <c:forEach var="noti" items="${allNoti}">
                                                        <li class="item">
                                                            <div class="item-row">
                                                                <div class="item-col fixed item-col-img md">
                                                                    <a href="item-editor.html">
                                                                        <div class="item-img rounded" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                                    </a>
                                                                </div>
                                                                <!--Name of Supporter-->
                                                                <div class="item-col item-col-center no-overflow no-underline">
                                                                    <div>
                                                                        <a href="error-404.html" class="center-text">
                                                                            ${noti.actor} ${noti.action} ${noti.detail}
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!--Amount of Funded-->
                                                                <div class="item-col item-col-center">
                                                                    <div class="item-heading"> จำนวน(บาท) </div>
                                                                    <div class=""> ${noti.timestamp} </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </article>
                </div>

                <!-- Footer -->
                <footer class="footer">
                    <div class="container content">
                        <div class="col-md-4">
                            <p> <h3>เกี่ยวกับเรา</h3> </p>
                            <h6><a href="about-us.jsp">เรื่องราวของปันปัน</a></h6>
                            <h6><a href="team.jsp">ทีมปันปัน</a></h6>
                            <h6><a href="how-it-works.jsp">ขั้นตอนการบริจาค</a></h6>
                            <h6><a href="fee.jsp">ค่าใช้จ่ายในการระดมทุน</a></h6>
                        </div>
                        <div class="col-md-4">
                            <p> <h3>โครงการทั้งหมด</h3> </p>
                            <sql:query var="category" dataSource="punpun">
                                SELECT * FROM project_categories
                            </sql:query>
                            <h6><a href="browse.jsp?category=0&sort=0">ทั้งหมด</a></h6>
                            <c:forEach var="data3" items="${category.rows}">
                                <h6><a href="browse.jsp?category=${data3.project_category_id}&sort=0">${data3.name}</a></h6>

                            </c:forEach>

                        </div>
                        <div class="col-md-4">
                            <p> <h3>การติดต่อ</h3> </p>
                            <h6><a href="mailto:punpunproject@gmail.com?Subject=หัวข้อ%20เรื่องที่ติดต่อ" target="_top"> <i class="fa fa-envelope" style="color: #28ab60;"> </i> <span> อีเมล </span> </a> </h6>
                            <h6><a href="https://www.facebook.com/punpunproject/"> <i class="fa fa-facebook-square" style="color: #4267b2;"> </i> <span> Facebook </span> </a></h6>
                            <h6><a href="https://twitter.com"> <i class="fa fa-twitter" style="color: #1da1f2;"> </i> <span> Twitter </span> </a></h6>
                        </div>

                        <div class="col-md-12 want-top" style="border-top: 1px solid #64798d;margin-top: 20px;">
                            <div class="footer-block author" style="margin-top: 20px;">
                                <ul>
                                    <li> Theme by <a href="https://github.com/modularcode"> ModularCode </a> </li>
                                    <li> Created by <a href="#"> Disanuwat & Kanokwan </a> </li>
                                    <li> <a href="http://www.it.kmitl.ac.th"> IT KMITL </a> </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </footer>

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

            <!-- jQuery and jQuery UI are required dependencies. -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    </body>
</html>
