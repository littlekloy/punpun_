<%--
    Document   : profile
    Created on : May 29, 2017, 12:27:36 AM
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

        <!-- Main -->
        <div class="main-wrapper">
            <div class="app" id="app">


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

                                <!-- profile -->
                                <li class="profile dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                        <div class="img" style="background-image: url('assets/img/profile/0000${member.memberId}.jpg')"> </div> <span class="name">
                                            ${member.firstName}
                                        </span> </a>
                                    <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item" href="viewProfileServlet?id=${member.memberId}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
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

                <!-- Content -->
                <article class="content dashboard-page">

                    <!--Profile Card-->
                    <section class="section">
                        <div class="row">
                            <!--Profile Card : xs up-->
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 clearfix">
                                <div class="card card-block-bg" style="background-image: url('assets/backgrounds/banner2.png') ">
                                    <!--Image-->
                                    <div class="images-container images-container-center">
                                        <!--Put Image link Here-->
                                        <img src="assets/img/profile/0000${memberProfile.memberId}.jpg" alt=""/>
                                    </div>
                                    <!--Username-->
                                    <h2 class="center-text white-text">${memberProfile.firstName} ${memberProfile.lastName}</h2>
                                    <!--Level of Member-->
                                    <div class="card stats" data-exclude="xs">
                                        <div class="card-block">
                                            <div class="row row-sm stats-container">
                                                <div class="col-xs-8 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-flag"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${memberProfile.point} / 100 </div>
                                                    </div>
                                                    <progress class="progress stat-progress" value="${memberProfile.point}" max="100">
                                                        <div class="progress">
                                                            <span class="progress-bar" style="width: 75%;"></span>
                                                        </div>
                                                    </progress>
                                                </div>

                                                <div class="col-xs-4 stat-col-level">
                                                    <h4><i class="stat-icon hidden-xs-down fa fa-flag"></i> LV. ${memberProfile.level}</h4>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!--Summary Profile-->
                    <section class="section">
                        <div class="row sameheight-container">

                            <!--Personal Info-->
                            <div class="col col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <h4 class="title"> ข้อมูลส่วนตัว </h4>
                                            <p class="title-description"></p>
                                        </div>

                                        <div class="row row-sm stats-container">

                                            <!--Email-->
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-envelope"></i> </div>
                                                <div class="stat">
                                                    <div class="name"> อีเมล </div>
                                                    <div class="value"> ${memberProfile.email} </div>
                                                </div>
                                            </div>

                                            <!--Website-->
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-globe"></i> </div>
                                                <div class="stat">
                                                    <div class="name"> เว็บไซต์ </div>
                                                    <div class="value"> <a href="profile.jsp?id=${memberProfile.memberId}">punpun.com/profile/${member.memberId}</a> </div>
                                                </div>
                                            </div>

                                            <!--Tags-->
                                            <div class="col-xs-12 col-sm-12 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-tags"></i> </div>
                                                <div class="stat">
                                                    <div class="name"> ความสนใจ </div>
                                                    <div class="value">
                                                        <div>
                                                            <a href="#" class="btn btn-link"> เทคโนโลยี </a>
                                                            <a href="#" class="btn btn-link"> คอมพิวเตอร์ </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--Following Stats : xs up-->
                            <div class="col col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <!--Stat Icon-->
                                        <div class="row row-sm stats-container">

                                            <ul class="item-list">
                                                <li>
                                                    <!--Interesting Projects-->
                                                    <div class="col-xs-12 col-sm-8 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-star"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 97 </div>
                                                            <div class="name"> โครงการที่กำลังติดตาม </div>
                                                        </div>
                                                    </div>

                                                </li>

                                                <li>
                                                    <!--Following-->
                                                    <div class="col-xs-12 col-sm-8 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 124 </div>
                                                            <div class="name"> คนที่คุณกำลังติดตาม </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <!--Followers-->
                                                    <div class="col-xs-12 col-sm-8 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 157 </div>
                                                            <div class="name"> คนที่ติดตามคุณ </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!--Summary Funded Projects-->
                    <section class="section">
                        <div class="row sameheight-container">

                            <!--List of Funded Projects-->
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
                                <div class="card items" data-exclude="xs,sm,lg">

                                    <!-- Table Title-->
                                    <div class="card-header bordered">
                                        <div class="header-block">
                                            <h3 class="title"> โครงการที่ร่วมระดมทุนล่าสุด </h3>
                                        </div>
                                        <div class="header-block pull-right">
                                            <label class="search">
                                                <input class="search-input" placeholder="ค้นหา...">
                                                <i class="fa fa-search search-icon"></i>
                                            </label>
                                        </div>
                                    </div>

                                    <!-- Table Content -->
                                    <ul class="item-list striped">

                                        <!-- Head of Table -->
                                        <li class="item item-list-header hidden-sm-down">
                                            <div class="item-row">
                                                <div class="item-col item-col-header fixed item-col-img xs"></div>
                                                <div class="item-col item-col-header item-col-title">
                                                    <div> <span>ชื่อโครงการ</span> </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-sales">
                                                    <div> <span>จำนวนเงิน</span> </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-category">
                                                    <div class="no-overflow"> <span>ประเภท</span> </div>
                                                </div>
                                                <div class="item-col item-col-header item-col-date">
                                                    <div> <span>วันที่ระดมทุน</span> </div>
                                                </div>
                                            </div>
                                        </li>

                                        <!-- Item : Loop here -->
                                        <li class="item">
                                            <div class="item-row">
                                                <!--Image of Project-->
                                                <div class="item-col fixed item-col-img xs">
                                                    <a href="">
                                                        <div class="item-img xs rounded" style="background-image: url(https://s3.amazonaws.com/uifaces/faces/twitter/brad_frost/128.jpg)"></div>
                                                    </a>
                                                </div>
                                                <!--Name of Project-->
                                                <div class="item-col item-col-title no-overflow">
                                                    <div>
                                                        <a href="" class="">
                                                            <h4 class="item-title no-wrap"> 12 Myths Uncovered About IT &amp; Software </h4>
                                                        </a>
                                                    </div>
                                                </div>
                                                <!--Amount of Funded-->
                                                <div class="item-col item-col-sales">
                                                    <div class="item-heading"> จำนวนเงินที่ระดมทุน </div>
                                                    <div> 4958 </div>
                                                </div>
                                                <!--Category-->
                                                <div class="item-col item-col-category no-overflow">
                                                    <div class="item-heading"> ประเภท </div>
                                                    <div class="no-overflow"> <a href="">สัตว์</a> </div>
                                                </div>
                                                <!--Date-->
                                                <div class="item-col item-col-date">
                                                    <div class="item-heading"> วันที่ระดมทุน </div>
                                                    <div> 21 SEP 10:47 </div>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                            <!--Following Stats-->
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-4 stats-col">
                                <div class="card stats" data-exclude="xs">
                                    <div class="card-block">

                                        <!--Stat Icon-->
                                        <div class="row row-sm stats-container">
                                            <ul class="item-list">
                                                <li>
                                                    <!--Score-->
                                                    <div class="col-xs-12 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-trophy"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 5407 </div>
                                                            <div class="name"> คะแนน </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <!--Total Outcome-->
                                                    <div class="col-xs-12 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-money"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 54070 </div>
                                                            <div class="name"> ยอดรวมการรระดมทุน </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <!--Funded Projects-->
                                                    <div class="col-xs-12 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-heart"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 64 </div>
                                                            <div class="name"> โครงการที่ร่วมระดมทุน </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>

                </article>
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

                <!-- Modal -->
                <div class="modal fade" id="modal-media">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">Media Library</h4>
                            </div>
                            <div class="modal-body modal-tab-container">
                                <ul class="nav nav-tabs modal-tabs" role="tablist">
                                    <li class="nav-item"> <a class="nav-link" href="#gallery" data-toggle="tab" role="tab">Gallery</a> </li>
                                    <li class="nav-item"> <a class="nav-link active" href="#upload" data-toggle="tab" role="tab">Upload</a> </li>
                                </ul>
                                <div class="tab-content modal-tab-content">
                                    <div class="tab-pane fade" id="gallery" role="tabpanel">
                                        <div class="images-container">
                                            <div class="row"> </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade active in" id="upload" role="tabpanel">
                                        <div class="upload-container">
                                            <div id="dropzone">
                                                <form action="/" method="POST" enctype="multipart/form-data" class="dropzone needsclick dz-clickable" id="demo-upload">
                                                    <div class="dz-message-block">
                                                        <div class="dz-message needsclick"> Drop files here or click to upload. </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer"> <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary">Insert Selected</button> </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                <div class="modal fade" id="confirm-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title"><i class="fa fa-warning"></i> Alert</h4>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure want to do this?</p>
                            </div>
                            <div class="modal-footer"> <button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button> <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button> </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

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
        <!-- vendor.js first!! Don't change it. -->
        <script src="assets/js/vendor.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>

    </body>
</html>

