<%--
    Document   : dashboard-project-list
    Created on : May 28, 2017, 11:16:38 PM
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
                <div class="sidebar-overlay" id="sidebar-overlay"></div>

                <!-- Content -->
                <article class="content items-list-page">

                    <!-- Editing Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> โครงการที่กำลังแก้ไข </h3>
                                    <p class="title-description"> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Editing Project Card Group  : Spacebar Sensitive!!!!-->
                    <div class="row">
                        <!--Project Card : Editing-->
                        <div class="col-md-10 offset-md-1">
                            <div class="card tasks">
                                <!--Header-->
                                <div class="card-header bordered" style="background-color: #99ccff">
                                    <div class="header-block">
                                        <a href="dashboard-project-setup-info.jsp"><h3 class="title"> Project's name </h3></a>
                                    </div>
                                    <div class="header-block pull-right">
                                        <h5 class="title">อยู่ระหว่างแก้ไข</h5>
                                    </div>
                                </div>
                                <!--Detail-->
                                <div class="card-block">
                                    <div class="tasks-block">
                                        <ul class="item-list">
                                            <li class="item">
                                                <div class="item-row">

                                                    <!--Image-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <div class="images-container images-container-center">
                                                            <!--Put Image link Here-->
                                                            <img src="assets/backgrounds/profile-card-1.jpg" alt=""/>
                                                        </div>
                                                    </div>

                                                    <!--Project Link-->
                                                    <div class="col-sm-6 col-xs-12">
                                                        <div class="item-col item-col-title">
                                                            <span><h6 class="center-text"><i class="fa fa-link"></i> คลิกที่ลิงก์เพื่อดูโครงการของคุณ </h6></span>
                                                        </div>
                                                        <!--Link-->
                                                        <div class="item-col item-col-title" >
                                                            <span><a href="project-preview.jsp">
                                                                    <p class="center-text">https://punpun.com/project/99999</p>
                                                                </a></span>
                                                        </div>
                                                        <div class="item-col item-col-title hidden-xs-down" >
                                                            <span><a href="dashboard-project-setup-info.jsp" class="btn btn-primary btn-block">แก้ไขข้อมูลโครงการ
                                                                </a></span>
                                                        </div>
                                                    </div>

                                                    <!--Button-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <a href="dashboard-project-setup-info.jsp" class="btn btn-primary btn-block hidden-sm-up">แก้ไขข้อมูลโครงการ</a>
                                                        <a href="dashboard-project-setup-submit.jsp" class="btn btn-danger btn-block">เสนอโครงการ</a>
                                                        <!-- START button group-->
                                                        <div class="btn-group btn-block">
                                                            <button type="button" class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                ตัวเลือก
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="dashboard-project-setup-info.jsp">ทำซ้ำข้อมูลโครงการนี้</a>
                                                                <a class="dropdown-item" href="dashboard-project-setup-team.jsp">เพิ่มสมาชิกในโครงการ</a>
                                                                <div class="dropdown-divider"></div>
                                                                <a class="dropdown-item" href="dashboard-project-delete.jsp">ลบโครงการ</a>
                                                            </div>
                                                        </div>
                                                        <!-- END button group-->
                                                    </div>

                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Waiting Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> โครงการที่กำลังพิจารณา </h3>
                                    <p class="title-description"> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Waiting Project Card Group  : Spacebar Sensitive!!!!-->
                    <div class="row">
                        <!--Project Card : Editing-->
                        <div class="col-md-10 offset-md-1">
                            <div class="card tasks">
                                <!--Header-->
                                <div class="card-header bordered" style="background-color: #87ffcf">
                                    <div class="header-block">
                                        <a href="project-preview.jsp"><h3 class="title"> Project's name </h3></a>
                                    </div>
                                    <div class="header-block pull-right">
                                        <h5 class="title">อยู่ระหว่างพิจารณา</h5>
                                    </div>
                                </div>
                                <!--Detail-->
                                <div class="card-block">
                                    <div class="tasks-block">
                                        <ul class="item-list">
                                            <li class="item">
                                                <div class="item-row">

                                                    <!--Image-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <div class="images-container images-container-center">
                                                            <!--Put Image link Here-->
                                                            <img src="assets/faces/3.jpg" alt=""/>
                                                        </div>
                                                    </div>

                                                    <!--Project Link-->
                                                    <div class="col-sm-6 col-xs-12">
                                                        <div class="item-col item-col-title">
                                                            <span><h6 class="center-text"><i class="fa fa-link"></i> คลิกที่ลิงก์เพื่อดูโครงการของคุณ </h6></span>
                                                        </div>
                                                        <div class="item-col item-col-title" >
                                                            <span><a href="project-preview.jsp">
                                                                    <p class="center-text">https://punpun.com/project/99999</p>
                                                                </a></span>
                                                        </div>
                                                    </div>

                                                    <!--Button-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <a href="project-preview.jsp" class="btn btn-danger btn-block">ดูตัวอย่าง</a>
                                                        <!-- START button group-->
                                                        <!-- <div class="btn-group btn-block">
                                                                <button type="button" class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        ตัวเลือก
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item" href="#">Separated link</a>
                                                                </div>
                                                        </div> -->
                                                        <!-- END button group-->
                                                    </div>

                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Active Project Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> โครงการที่กำลังระดมทุน </h3>
                                    <p class="title-description"> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Active Project Card Group  : Spacebar Sensitive!!!!-->
                    <div class="row">
                        <!--Project Card : Active-->
                        <div class="col-md-10 offset-md-1">
                            <div class="card tasks">
                                <!--Header-->
                                <div class="card-header bordered" style="background-color: #4bcf99">
                                    <div class="header-block">
                                        <a href="dashboard-project-details.jsp"><h3 class="title"> Project's name </h3></a>
                                    </div>
                                    <div class="header-block pull-right">
                                        <h5 class="title">กำลังระดมทุน</h5>
                                    </div>
                                </div>
                                <!--Detail-->
                                <div class="card-block">
                                    <div class="tasks-block">
                                        <ul class="item-list">
                                            <li class="item">
                                                <div class="item-row">
                                                    <!--Image-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <div class="images-container images-container-center">
                                                            <!--Put Image link Here-->
                                                            <img src="assets/faces/3.jpg" alt=""/>
                                                        </div>
                                                    </div>
                                                    <!--Project Link-->
                                                    <div class="col-sm-6 col-xs-12">
                                                        <div class="item-col item-col-title">
                                                            <span><h6 class="center-text"><i class="fa fa-link"></i> คลิกที่ลิงก์เพื่อดูโครงการของคุณ </h6></span>
                                                        </div>
                                                        <div class="item-col item-col-title" >
                                                            <span><a href="project-preview.jsp">
                                                                    <p class="center-text">https://punpun.com/project/99999</p>
                                                                </a></span>
                                                        </div>
                                                        <div class="item-col item-col-title" >
                                                            <span><a href="dashboard-project-setup-info.jsp" class="btn btn-primary btn-block hidden-xs-down">แก้ไขข้อมูลโครงการ
                                                                </a></span>
                                                        </div>
                                                    </div>
                                                    <!--Button-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <a href="dashboard-project-setup-info.jsp" class="btn btn-primary btn-block hidden-sm-up">แก้ไขข้อมูลโครงการ</a>
                                                        <a href="dashboard-project-update-progress.jsp" class="btn btn-danger btn-block">อัปเดตข้อมูล</a>
                                                        <!-- START button group-->
                                                        <div class="btn-group btn-block">
                                                            <button type="button" class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                ตัวเลือก
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="dashboard-supporter.jsp">รายชื่อผู้สนับสนุน</a>
                                                                <a class="dropdown-item" href="dashboard-comment.jsp">ดูความคิดเห็น</a>
                                                                <a class="dropdown-item" href="dashboard-project-setup-info.jsp">ทำซ้ำข้อมูลโครงการนี้</a>
                                                                <a class="dropdown-item" href="dashboard-project-setup-team.jsp">เพิ่มสมาชิกในโครงการ</a>
                                                                <div class="dropdown-divider"></div>
                                                                <a class="dropdown-item" href="dashboard-project-delete.jsp">ลบโครงการ</a>
                                                            </div>
                                                        </div>
                                                        <!-- END button group-->
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Closed Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> โครงการที่เสร็จสิ้นแล้ว </h3>
                                    <p class="title-description"> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Closed Project Card Group  : Spacebar Sensitive!!!!-->
                    <div class="row">
                        <!--Project Card : Closed-->
                        <div class="col-md-10 offset-md-1">
                            <div class="card tasks" data-exclude="xs,sm">

                                <!--Header-->
                                <div class="card-header bordered" style="background-color: #c3c3bb">
                                    <div class="header-block">
                                        <a href="project-preview.jsp"><h3 class="title"> Project's name </h3></a>
                                    </div>
                                    <div class="header-block pull-right">
                                        <h5 class="title">เสร็จสิ้นการระดมทุนแล้ว</h5>
                                    </div>
                                </div>

                                <!--Detail-->
                                <div class="card-block">
                                    <div class="tasks-block">
                                        <ul class="item-list">
                                            <li class="item">
                                                <div class="item-row">

                                                    <!--Image-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <div class="images-container images-container-center">
                                                            <!--Put Image link Here-->
                                                            <img src="assets/faces/3.jpg" alt=""/>
                                                        </div>
                                                    </div>

                                                    <!--Project Link-->
                                                    <div class="col-sm-6 col-xs-12">
                                                        <div class="item-col item-col-title">
                                                            <span><h5 class="center-text"><i class="fa fa-money"></i> 99999 บาท </h5></span>
                                                        </div>
                                                        <div class="item-col item-col-title">
                                                            <span><p class="center-text"><i class="fa fa-calendar"></i> สิ้นสุด 12/12/12 </p></span>
                                                        </div>
                                                        <!--Link-->
                                                        <div class="item-col item-col-title" >
                                                            <span><a href="project-preview.jsp">
                                                                    <p class="center-text">https://punpun.com/project/99999</p>
                                                                </a></span>
                                                        </div>
                                                    </div>

                                                    <!--Button-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <a href="dashboard-project-update-progress.jsp" class="btn btn-danger btn-block">อัปเดตข้อมูล</a>
                                                        <!-- START button group-->
                                                        <div class="btn-group btn-block">
                                                            <button type="button" class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                ตัวเลือก
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="dashboard-supporter.jsp">รายชื่อผู้สนับสุนน</a>
                                                                <a class="dropdown-item" href="dashboard-comment.jsp">ดูความคิดเห็น</a>
                                                                <a class="dropdown-item" href="dashboard-project-setup-info.jsp">ทำซ้ำข้อมูลโครงการนี้</a>
                                                            </div>
                                                        </div>
                                                        <!-- END button group-->
                                                    </div>

                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Reported Title -->
                    <div class="title-search-block">
                        <div class="title-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="title"> โครงการที่ถูกระงับ </h3>
                                    <p class="title-description"> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Reported Project Card Group  : Spacebar Sensitive!!!!-->
                    <div class="row">
                        <!--Project Card : Reported-->
                        <div class="col-md-10 offset-md-1">
                            <div class="card tasks" data-exclude="xs,sm">
                                <!--Header-->
                                <div class="card-header bordered" style="background-color: #FF4444">
                                    <div class="header-block">
                                        <a href="error-404.jsp"><h3 class="title" style="color: #ffffff"> Project's name </h3></a>
                                    </div>
                                    <div class="header-block pull-right">
                                        <h5 class="title" style="color: #ffffff" >ถูกระงับโครงการ</h5>
                                    </div>
                                </div>
                                <!--Detail-->
                                <div class="card-block">
                                    <div class="tasks-block">
                                        <ul class="item-list">
                                            <li class="item">
                                                <div class="item-row">

                                                    <!--Image-->
                                                    <div class="col-sm-3 col-xs-12">
                                                        <div class="images-container images-container-center">
                                                            <!--Put Image link Here-->
                                                            <img src="assets/faces/3.jpg" alt=""/>
                                                        </div>
                                                    </div>

                                                    <!--Project Link-->
                                                    <div class="col-sm-6 col-xs-12">
                                                        <div class="item-col item-col-title">
                                                            <span><h5 class="center-text"><i class="fa fa-money"></i> 99999 บาท </h5></span>
                                                        </div>
                                                        <div class="item-col item-col-title">
                                                            <span><p class="center-text"><i class="fa fa-calendar"></i> สิ้นสุด 12/12/12 </p></span>
                                                        </div>
                                                        <!--Link-->
                                                        <div class="item-col item-col-title" >
                                                            <span><a href="project-preview.jsp">
                                                                    <p class="center-text">https://punpun.com/project/99999</p>
                                                                </a></span>
                                                        </div>
                                                    </div>

                                                    <!--Button-->
                                                    <div class="col-sm-3 col-xs-12">

                                                        <!-- START button group-->
                                                        <div class="btn-group btn-block">
                                                            <button type="button" class="btn btn-success btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                ตัวเลือก
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="dashboard-supporter.jsp">รายชื่อผู้สนับสุนน</a>
                                                                <a class="dropdown-item" href="dashboard-comment.jsp">ดูความคิดเห็น</a>
                                                                <a class="dropdown-item" href="dashboard-project-setup-info.jsp">ทำซ้ำข้อมูลโครงการนี้</a>
                                                            </div>
                                                        </div>
                                                        <!-- END button group-->
                                                    </div>

                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

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
        <!-- vendor.js first!! Don't change it. -->
        <script src="assets/js/vendor.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>

    </body>
</html>
