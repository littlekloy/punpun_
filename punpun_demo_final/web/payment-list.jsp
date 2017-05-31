<%--
    Document   : payment-list
    Created on : May 31, 2017, 5:42:58 AM
    Author     : kanok
--%>

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
        <link rel="shortcut icon" href="assets/logo/gift.png" />
        <!-- Animation CSS File. "Please, Don't Touch it" - Ice -->
        <link rel="stylesheet" href="assets/css/vendor.css">
        <!-- Custom CSS. Bootstrap 4 already there. -->
        <link href="assets/css/app_vistor.css" rel="stylesheet" type="text/css" />

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
                            <a href="ViewAllServlet" class="btn btn-none-shadow header-btn" id="browse-link"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
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
                                <a href="login.jsp" class="btn btn-none-shadow header-btn" id="login-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                            </li>
                        </c:if>
                        <c:if test="${member != null }">

                            <!-- notification -->
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
                                                        <div class="img" style="background-image: url('assets/img/profile/${noti.memberId}.jpg')"></div>
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
                                    <div class="img" style="background-image: url('assets/img/profile/${member.memberId}.jpg')"> </div> <span class="name">
                                        ${member.firstName}
                                    </span> </a>
                                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item" href="viewProfileServlet?id=${member.memberId}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
                                    <a class="dropdown-item" href="dashboardServlet?id=${member.memberId}"> <i class="fa fa-user icon"></i> แดชบอร์ด </a>
                                    <a class="dropdown-item" href="payment-list.jsp?memberId=${member.memberId}"> <i class="fa fa-bell icon"></i> การระดมทุนของคุณ </a>
                                    <a class="dropdown-item" href="dashboard-account-setting.jsp"> <i class="fa fa-gear icon"></i> ตั้งค่าบัญชีผู้ใช้ </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logoutServlet"> <i class="fa fa-power-off icon"></i> ลงชื่อออก </a>
                                </div>
                            </li>


                        </c:if>
                    </ul>
                </div>
            </header>


            <!-- Search Content -->
            <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/banner2.png');">
                <article class="container content-browse items-list-page">
                    <!-- Title -->
                    <div class="col-md-12">
                        <h1 class="center-text"> รายการการชำระเงิน </h1>
                    </div>
                </article>
            </div>

            <!-- Project List -->
            <div class="app">
                <!-- Content -->
                <article class="content items-list-page">

                    <!-- Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> รายการการชำระเงิน </h3>
                                    <p class="title-description" style="color: transparent;"> . </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Table of Project -->
                    <div class="card items">
                        <!--Table-->
                        <ul class="item-list striped">

                            <!-- Head of Table -->
                            <li class="item item-list-header hidden-sm-down">
                                <div class="item-row">
                                    <div class="item-col item-col-header item-col-sales">
                                        <div> <span>Donation ID</span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title ">
                                        <div class="center-text"> <span> ชื่อโครงการ </span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-stats">
                                        <div > <span> จำนวนเงิน </span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-stats">
                                        <div > <span> สถานะ </span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-stats">
                                        <div > <span> ผลการอนุมัติ </span> </div>
                                    </div>
                                </div>
                            </li>

                            <!-- Donator Item : Loop here -->
                            <li class="item">
                                <div class="item-row">
                                    <div class="item-col item-col-sales">
                                        <div class="item-heading">Donation ID</div>
                                        <div> 46323 </div>
                                    </div>
                                    <!-- Donator -->
                                    <div class="item-col item-col-title">
                                        <div>
                                            <a href="project-preview.html" class="center-text" >
                                                ช่วยเหลือผู้ประสบภัยน้ำท่วม ภาคใต้
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Value -->
                                    <div class="item-col item-col-stats">
                                        <div class="item-heading"> จำนวนเงิน </div>
                                        <div> 1000 </div>
                                    </div>
                                    <!-- Name of Donator -->
                                    <div class="item-col item-col-stats no-underline">
                                        <div class="item-heading">สถานะ</div>
                                        <div>สำเร็จ</div>
                                    </div>
                                    <!-- Setting Button -->
                                    <div class="item-col  item-col-stats">
                                        <div class="item-actions-dropdown">
                                            <a class="btn btn-primary btn-block" href="admin-approve-payment.html"> ตรวจสอบ </a>
                                            <a class="btn btn-danger-outline btn-block" href="mailto:punpunproject@gmail.com?Subject=แจ้งปัญหา:%20การชำระเงินของ%20ID" target="_top"> แจ้งปัญหา </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- Donator Item : Loop here -->
                            <li class="item">
                                <div class="item-row">
                                    <div class="item-col item-col-sales">
                                        <div class="item-heading">Donation ID</div>
                                        <div> 46323 </div>
                                    </div>
                                    <!-- Donator -->
                                    <div class="item-col item-col-title">
                                        <div>
                                            <a href="project-preview.html" class="center-text" >
                                                ช่วยเหลือผู้ประสบภัยน้ำท่วม ภาคใต้
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Value -->
                                    <div class="item-col item-col-stats">
                                        <div class="item-heading"> จำนวนเงิน </div>
                                        <div> 1000 </div>
                                    </div>
                                    <!-- Name of Donator -->
                                    <div class="item-col item-col-stats no-underline">
                                        <div class="item-heading">สถานะ</div>
                                        <div>สำเร็จ</div>
                                    </div>
                                    <!-- Setting Button -->
                                    <div class="item-col  item-col-stats">
                                        <div class="item-actions-dropdown">
                                            <a class="btn btn-primary btn-block" href="admin-approve-payment.html"> ตรวจสอบ </a>
                                            <a class="btn btn-danger-outline btn-block" href="mailto:punpunproject@gmail.com?Subject=แจ้งปัญหา:%20การชำระเงินของ%20ID" target="_top"> แจ้งปัญหา </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- Donator Item : Loop here -->
                            <li class="item">
                                <div class="item-row">
                                    <div class="item-col item-col-sales">
                                        <div class="item-heading">Donation ID</div>
                                        <div> 46323 </div>
                                    </div>
                                    <!-- Donator -->
                                    <div class="item-col item-col-title">
                                        <div>
                                            <a href="project-preview.html" class="center-text" >
                                                ช่วยเหลือผู้ประสบภัยน้ำท่วม ภาคใต้
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Value -->
                                    <div class="item-col item-col-stats">
                                        <div class="item-heading"> จำนวนเงิน </div>
                                        <div> 1000 </div>
                                    </div>
                                    <!-- Name of Donator -->
                                    <div class="item-col item-col-stats no-underline">
                                        <div class="item-heading">สถานะ</div>
                                        <div>สำเร็จ</div>
                                    </div>
                                    <!-- Setting Button -->
                                    <div class="item-col  item-col-stats">
                                        <div class="item-actions-dropdown">
                                            <a class="btn btn-primary btn-block" href="admin-approve-payment.html"> ตรวจสอบ </a>
                                            <a class="btn btn-danger-outline btn-block" href="mailto:punpunproject@gmail.com?Subject=แจ้งปัญหา:%20การชำระเงินของ%20ID" target="_top"> แจ้งปัญหา </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- Donator Item : Loop here -->
                            <li class="item">
                                <div class="item-row">
                                    <div class="item-col item-col-sales">
                                        <div class="item-heading">Donation ID</div>
                                        <div> 46323 </div>
                                    </div>
                                    <!-- Donator -->
                                    <div class="item-col item-col-title">
                                        <div>
                                            <a href="project-preview.html" class="center-text" >
                                                ช่วยเหลือผู้ประสบภัยน้ำท่วม ภาคใต้
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Value -->
                                    <div class="item-col item-col-stats">
                                        <div class="item-heading"> จำนวนเงิน </div>
                                        <div> 1000 </div>
                                    </div>
                                    <!-- Name of Donator -->
                                    <div class="item-col item-col-stats no-underline">
                                        <div class="item-heading">สถานะ</div>
                                        <div>สำเร็จ</div>
                                    </div>
                                    <!-- Setting Button -->
                                    <div class="item-col  item-col-stats">
                                        <div class="item-actions-dropdown">
                                            <a class="btn btn-primary btn-block" href="admin-approve-payment.html"> ตรวจสอบ </a>
                                            <a class="btn btn-danger-outline btn-block" href="mailto:punpunproject@gmail.com?Subject=แจ้งปัญหา:%20การชำระเงินของ%20ID" target="_top"> แจ้งปัญหา </a>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </article>
            </div>

            <!-- Footer -->
            <footer class="footer">
                <div class="container content">
                    <div class="col-md-4">
                        <p><h3>เกี่ยวกับเรา</h3></p>
                        <h6><a href="about-us.html">เรื่องราวของปันปัน</a></h6>
                        <h6><a href="about-us.html">ทีมปันปัน</a></h6>
                        <h6><a href="about-us.html">ขั้นตอนการบริจาค</a></h6>
                        <h6><a href="about-us.html">ค่าใช้จ่ายในการระดมทุน</a></h6>
                    </div>
                    <div class="col-md-4">
                        <p><h3>โครงการทั้งหมด</h3></p>
                        <h6><a href="about-us.html">ทั้งหมด</a></h6>
                        <h6><a href="about-us.html">ทีมปันปัน</a></h6>
                        <h6><a href="about-us.html">ขั้นตอนการบริจาค</a></h6>
                        <h6><a href="about-us.html">ค่าใช้จ่ายในการระดมทุน</a></h6>
                        <h6><a href="about-us.html">ทีมปันปัน</a></h6>
                        <h6><a href="about-us.html">ขั้นตอนการบริจาค</a></h6>
                        <h6><a href="about-us.html">ค่าใช้จ่ายในการระดมทุน</a></h6>
                        <h6><a href="about-us.html">ทีมปันปัน</a></h6>
                        <h6><a href="about-us.html">ขั้นตอนการบริจาค</a></h6>
                        <h6><a href="about-us.html">ค่าใช้จ่ายในการระดมทุน</a></h6>
                    </div>
                    <div class="col-md-4">
                        <p><h3>การติดต่อ</h3> </p>
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
        <script src="assets/js/jquery-3.2.1.min.js"></script>

    </body>

</html>
