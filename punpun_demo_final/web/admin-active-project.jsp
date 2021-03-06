<%--
    Document   : admin-active-project
    Created on : May 28, 2017, 11:55:59 PM
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
        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/logo/gift.png"/>
        <!-- Bootstrap 4 -->
        <!--<link href="css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>-->
        <!-- Vendor CSS File -->
        <link rel="stylesheet" href="assets/css/vendor.css">
        <!-- Custom CSS -->
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
                                <li class="profile dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                        <div class="img" style="background-image: url('assets/img/profile/${member.memberId}.jpg')"> </div> <span class="name">
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
                                <li> <a href="dashboard-account-setting.jsp">         <i class="fa fa-gear"></i> ตั้งค่าบัญชีผู้ใช้ </a></li>
                                <li> <hr> </li>
                                <li>                <a href="admin-dashboard.jsp">       <i class="fa fa-dashboard"></i> แดชบอร์ดของแอดมิน </a></li>
                                <li>                <a href="admin-payment-control.jsp">         <i class="fa fa-money"></i> หลักฐานการโอนเงิน </a></li>
                                <li class="active">                <a href="admin-active-project.jsp">         <i class="fa fa-gift"></i> โครงการที่กำลังระดมทุน </a></li>
                                <li>                <a href="admin-pending-project.jsp">  <i class="fa fa-legal"></i> โครงการที่รอการอนุมัติ </a></li>
                                <li>                <a href="admin-reported-project.jsp">    <i class="fa fa-exclamation-triangle"></i> โครงการที่ถูกรายงาน </a></li>
                                <li> <a href="admin-banned-project.jsp">         <i class="fa fa-ban"></i> โครงการที่ถูกระงับ </a></li>
                            </ul>
                        </nav>

                    </div>
                </aside>
                <div class="sidebar-overlay" id="sidebar-overlay"></div>

                <!-- Content -->
                <article class="content items-list-page">

                    <!-- Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> โครงการที่กำลังรับระดมทุน </h3>
                                    <p class="title-description"> </p>
                                </div>
                            </div>
                        </div>
                        <div class="items-search">
                            <form class="form-inline">
                                <div class="input-group"> <input type="text" class="form-control rounded-s" placeholder="Search for..."> <span class="input-group-btn">
                                        <button class="btn btn-secondary rounded-s" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span> </div>
                            </form>
                        </div>
                    </div>

                    <!-- Table of Project -->
                    <div class="card items">
                        <ul class="item-list striped">

                            <!-- Header of Table -->
                            <li class="item item-list-header hidden-sm-down">
                                <div class="item-row">
                                    <div class="item-col item-col-header fixed item-col-img md">
                                        <div> <span>รูป</span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-title">
                                        <div class="center-text"> <span>ชื่อโครงการ</span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-sales">
                                        <div> <span>จำนวนเงิน</span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-category">
                                        <div class="no-overflow"> <span>ประเภท</span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-author">
                                        <div class="no-overflow"> <span>เจ้าของโครงการ</span> </div>
                                    </div>
                                    <div class="item-col item-col-header item-col-date">
                                        <div> <span>สิ้นสุดโครงการ</span> </div>
                                    </div>
                                    <div class="item-col item-col-header fixed item-col-actions-dropdown"> </div>
                                </div>

                            </li>
                            <sql:query var="result" dataSource="punpun">
                                SELECT *  FROM projects
                            </sql:query>


                            <c:forEach var="project_" items="${result.rows}">

                                <!-- Item -->
                                <li class="item">
                                    <div class="item-row">

                                        <!--Edit at class="item-title" Not item-heading-->
                                        <div class="item-col fixed item-col-img md">
                                            <a href="dashboard-project-details.jsp">
                                                <div class="item-img rounded" style="background-image: url('assets/img/projectPic/${project_.project_id}.jpg')"></div>
                                            </a>
                                        </div>
                                        <div class="item-col fixed pull-left item-col-title">
                                            <div class="item-heading">ชื่อโครงการ</div>
                                            <div>
                                                <a href="project-detail.jsp" class="center-text">
                                                    <h4 class="item-title"> ${project_.name} </h4>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="item-col item-col-sales">
                                            <div class="item-heading">จำนวนเงิน</div>
                                            <div> ${project_.budget} </div>
                                        </div>
                                        <div class="item-col item-col-category no-overflow">
                                            <div class="item-heading">ประเภท</div>
                                            <div class="no-overflow"> <a href="">${project_.project_category_id}</a> </div>
                                        </div>
                                        <div class="item-col item-col-author">
                                            <div class="item-heading">เจ้าของโครงการ</div>
                                            <div class="no-overflow"> <a href="dashboard-profile.jsp"> ${project_.team_id}</a> </div>
                                        </div>
                                        <div class="item-col item-col-date">
                                            <div class="item-heading">สิ้นสุดโครงการ</div>
                                            <div class="no-overflow"> ${project_.end_date} </div>
                                        </div>
                                        <!--Option For this Item-->
                                        <div class="item-col fixed item-col-actions-dropdown">
                                            <div class="item-actions-dropdown">
                                                <a class="item-actions-toggle-btn"> <span class="inactive">
                                                        <i class="fa fa-cog"></i>
                                                    </span> <span class="active">
                                                        <i class="fa fa-chevron-circle-right"></i>
                                                    </span> </a>
                                                <div class="item-actions-block">
                                                    <ul class="item-actions-list">
                                                        <li>
                                                            <a class="remove" href="#" data-toggle="modal" data-target="#confirm-modal"> <i class="fa fa-trash-o "></i> </a>
                                                        </li>
                                                        <li>
                                                            <a class="edit" href="item-editor.jsp"> <i class="fa fa-pencil"></i> </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                            </c:forEach>



                        </ul>
                    </div>

                    <!--Pagination-->
                    <nav class="text-xs-right">
                        <ul class="pagination">
                            <li class="page-item"> <a class="page-link" href="">
                                    Prev
                                </a> </li>
                            <li class="page-item active"> <a class="page-link" href="">
                                    1
                                </a> </li>
                            <li class="page-item"> <a class="page-link" href="">
                                    2
                                </a> </li>
                            <li class="page-item"> <a class="page-link" href="">
                                    3
                                </a> </li>
                            <li class="page-item"> <a class="page-link" href="">
                                    4
                                </a> </li>
                            <li class="page-item"> <a class="page-link" href="">
                                    5
                                </a> </li>
                            <li class="page-item"> <a class="page-link" href="">
                                    Next
                                </a> </li>
                        </ul>
                    </nav>

                </article>

                <!-- Footer -->
                <footer class="footer">
                    <div class="footer-block buttons"> <iframe class="footer-github-btn" src="https://ghbtns.com/github-btn.jsp?user=modularcode&repo=modular-admin-html&type=star&count=true" frameborder="0" scrolling="0" width="140px" height="20px"></iframe> </div>
                    <div class="footer-block author">
                        <ul>
                            <li> created by <a href="https://github.com/modularcode">ModularCode</a> </li>
                            <li> <a href="https://github.com/modularcode/modular-admin-html#get-in-touch">get in touch</a> </li>
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
        <!-- vendor.js first!! Don't change it. -->
        <script src="assets/js/vendor.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>

    </body>
</html>

