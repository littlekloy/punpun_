<%--
    Document   : dashboard-profile
    Created on : May 28, 2017, 11:11:02 PM
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

        <link href="assets/css/jquery.tagit.css" rel="stylesheet" type="text/css">
        <link href="assets/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">

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
                                <li class="active">                <a href="dashboard-profile.jsp">         <i class="fa fa-user"></i> โปรไฟล์ </a></li>
                                <li>                <a href="dashboard-following.jsp">       <i class="fa fa-bell"></i> การติดตาม </a></li>
                                <li>                <a href="dashboard-funded-project.jsp">  <i class="fa fa-thumbs-up"></i> โครงการที่เคยร่วมระดมทุน </a></li>
                                <li>                <a href="dashboard-project-list.jsp">    <i class="fa fa-th-list"></i> จัดการโครงการของคุณ </a></li>
                                <li> <a href="dashboard-account-setting.jsp">         <i class="fa fa-gear"></i> ตั้งค่าบัญชีผู้ใช้ </a></li>
                                <li> <hr> </li>
                                <li>                <a href="admin-dashboard.jsp">       <i class="fa fa-dashboard"></i> แดชบอร์ดของแอดมิน </a></li>
                                <li>                <a href="admin-payment-control.jsp">         <i class="fa fa-money"></i> หลักฐานการโอนเงิน </a></li>
                                <li >                <a href="admin-active-project.jsp">         <i class="fa fa-gift"></i> โครงการที่กำลังระดมทุน </a></li>
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

                    <!--Profile Card-->
                    <section class="section">
                        <div class="row sameheight-container">
                            <!--Profile Card : xs up-->
                            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 clearfix">
                                <div class="card card-block-bg sameheight-item " style="background-image: url('assets/backgrounds/banner2.png') ">
                                    <!--Image-->
                                    <div class="images-container images-container-center">
                                        <!--Put Image link Here-->
                                        <img src="assets/img/profile/0000${member.memberId}.jpg" alt=""/>
                                    </div>
                                    <!--Username-->
                                    <h2 class="center-text white-text">${member.firstName} ${member.lastName}</h2>
                                    <!--Level of Member-->
                                    <div class="card stats" data-exclude="xs">
                                        <div class="card-block">
                                            <div class="row row-sm stats-container">
                                                <div class="col-xs-8 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-flag"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${member.point} / 100  </div>
                                                    </div>
                                                    <progress class="progress stat-progress" value="${member.point}" max="100">
                                                        <div class="progress">
                                                            <span class="progress-bar" style="width: 75%;"></span>
                                                        </div>
                                                    </progress>
                                                </div>

                                                <div class="col-xs-4 stat-col-level">
                                                    <h4><i class="stat-icon hidden-xs-down fa fa-flag-checkered"></i> LV. ${member.level}</h4>
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

                            <div class="col col-xs-12 col-sm-12 col-md-8 col-lg-8 col-xl-8 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <h4 class="title"> ข้อมูลส่วนตัว </h4>
                                            <p class="title-description"> </p>
                                        </div>
                                        <!--Personal Info-->
                                        <div class="row row-sm stats-container">

                                            <!--Email-->
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-envelope"></i> </div>
                                                <div class="stat">
                                                    <div class="name"> อีเมล </div>
                                                    <div class="value"> ${member.email}</div>
                                                </div>
                                            </div>

                                            <!--Website-->
                                            <div class="col-xs-12 col-sm-6 stat-col">
                                                <div class="stat-icon"> <i class="fa fa-globe"></i> </div>
                                                <div class="stat">
                                                    <div class="name"> เว็บไซต์ </div>
                                                    <div class="value"> <a href=profile.jsp?id=${member.memberId}">punpun.com/profile/${member.memberId}</a> </div>
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
                                                    <div class="col-xs-12 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-star"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 97 </div>
                                                            <div class="name"> โครงการที่กำลังติดตาม </div>
                                                        </div>
                                                    </div>

                                                </li>

                                                <li>
                                                    <!--Following-->
                                                    <div class="col-xs-12 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 124 </div>
                                                            <div class="name"> คนที่คุณกำลังติดตาม </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <li>
                                                    <!--Followers-->
                                                    <div class="col-xs-12 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 157 </div>
                                                            <div class="name"> คนที่ติดตามคุณ </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>

                                        </div>
                                        <!--Button-->
                                        <div style="padding-bottom: 10px;">
                                            <a href="dashboard-following.jsp" class="btn btn-primary btn-block rounded"> ดูเพิ่มเติม </a>
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
                                <div class="card sameheight-item items" data-exclude="xs,sm,lg">

                                    <!-- Table Title-->
                                    <div class="card-header bordered">
                                        <div class="header-block">
                                            <h3 class="title"> โครงการที่เคยร่วมระดมทุนล่าสุด </h3>
                                            <a href="dashboard-funded-project.jsp" class="btn btn-primary btn-sm rounded">ดูเพิ่มเติม</a>
                                        </div>
                                        <div class="header-block pull-right">

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
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <!--Stat Icon-->
                                        <div class="row row-sm stats-container">
                                            <ul class="item-list">
                                                <li>
                                                    <!--Score-->
                                                    <div class="col-xs-12 col-sm-4 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-trophy"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 5407 </div>
                                                            <div class="name"> คะแนน </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <!--Total Outcome-->
                                                    <div class="col-xs-12 col-sm-4 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-money"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 54070 </div>
                                                            <div class="name"> ยอดรวมการรระดมทุน </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <!--Funded Projects-->
                                                    <div class="col-xs-12 col-sm-4 stat-col">
                                                        <div class="stat-icon"> <i class="fa fa-heart"></i> </div>
                                                        <div class="stat">
                                                            <div class="value"> 64 </div>
                                                            <div class="name"> โครงการที่ร่วมระดมทุน </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div style="padding-bottom: 10px;">
                                            <a href="dashboard-funded-project.jsp" class="btn btn-primary btn-block rounded"> ดูเพิ่มเติม </a>
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

                <!-- Modal -->
                <div class="modal fade" id="modal-media">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

        <!-- Script -->
        <!-- vendor.js first!! Don't change it. -->
        <script src="assets/js/vendor.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>

        <!-- jQuery and jQuery UI are required dependencies. -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

        <!-- The real Tag -->
        <script src="assets/js/tag-it.js" type="text/javascript" charset="utf-8"></script>

        <!-- Tag -->
        <script>
            $(function () {
                var sampleTags = ['c++', 'java', 'php', 'coldfusion', 'javascript', 'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell', 'perl', 'erlang', 'apl', 'cobol', 'go', 'lua'];


                //-------------------------------
                // Preloading data in markup
                //-------------------------------
                $('#myULTags').tagit({
                    availableTags: sampleTags, // this param is of course optional. it's for autocomplete.
                    // configure the name of the input field (will be submitted with form), default: item[tags]
                    itemName: 'item',
                    fieldName: 'tags'
                });
                //-------------------------------
                // Read-only
                //-------------------------------
                $('#readOnlyTags').tagit({
                    readOnly: true
                });

            });
        </script>

    </body>
</html>
