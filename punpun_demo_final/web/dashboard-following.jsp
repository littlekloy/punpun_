<%--
    Document   : dashboard-following
    Created on : May 28, 2017, 11:08:04 PM
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
        <!--<link href="css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>-->
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
                                <li class="active">                <a href="dashboard-following.jsp">       <i class="fa fa-bell"></i> การติดตาม </a></li>
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

                    <!--Pill Tab-->
                    <section class="section">
                        <div class="row">

                            <!-- Title -->
                            <div class="col-md-12">
                                <div class="card card-block">
                                    <!-- <div class="title-block"> -->
                                    <h2> การติดตาม </h2>
                                    <p> ผู้ใช้สามารถติดตามสมาชิกคนอื่น เพื่อรับช่าวสารการสร้างโครงการการกุศลที่น่าสนใจของเขา หรือรับการแจ้งเตือน เมื่อผู้ที่คุณสนใจร่วมระดมทุนกับโครงการต่าง ๆ </p>
                                    <!-- </div> -->
                                </div>
                            </div>

                            <!-- Tab -->
                            <div class="col-md-12">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="" class="nav-link active"    data-target="#project-following-pills"  aria-controls="project-following-pills" data-toggle="tab" role="tab">โครงการที่กำลังติดตาม</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link"           data-target="#following-pills"          aria-controls="following-pills"         data-toggle="tab" role="tab">คนที่คุณกำลังติดตาม</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link"           data-target="#followers-pills"           aria-controls="followers-pills"          data-toggle="tab" role="tab">คนที่กำลังติดตามคุณ</a> </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <!--Project Following Tab-->
                                            <div class="tab-pane fade in active" id="project-following-pills">

                                                <p> คุณสามารถกดติดตามโครงการที่สนใจได้ที่หน้ารายละเอียดโครงการ</p>
                                                <!--List of Following-->
                                                <div data-exclude="xs,sm,lg">
                                                    <!-- Table Content -->
                                                    <ul class="item-list striped">

                                                        <!-- Head of Table -->
                                                        <!-- <li class="item item-list-header hidden-sm-down">
                                                            <div class="item-row">
                                                                <div class="item-col item-col-header item-col-center">
                                                                    <div> <span>ผู้ร่วมระดมทุน</span> </div>
                                                                </div>
                                                                <div class="item-col item-col-header item-col-center">
                                                                    <div class="center-text"> <span>จำนวนเงิน</span> </div>
                                                                </div>
                                                            </div>
                                                        </li> -->

                                                        <!-- Item : Loop here -->
                                                        <li class="item">
                                                            <div class="item-row">
                                                                <!--Name of Following-->
                                                                <div class="item-col item-col-center no-overflow no-underline">
                                                                    <div>
                                                                        <a href="#" class="center-text">
                                                                            Rice for Good ส่งข้าวให้เด็กที่ห่างไกล
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!--Following Button-->
                                                                <div class="item-col item-col-center">
                                                                    <div class=""> <a href="item-editor.jsp" class="btn btn-success-outline rounded"> เลิกติดตาม </a> </div>
                                                                </div>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <!--Following Tab-->
                                            <div class="tab-pane fade" id="following-pills">

                                                <p></p>
                                                <!--List of Following-->
                                                <div data-exclude="xs,sm,lg">
                                                    <!-- Table Content -->
                                                    <ul class="item-list striped">

                                                        <!-- Head of Table -->
                                                        <!-- <li class="item item-list-header hidden-sm-down">
                                                            <div class="item-row">
                                                                <div class="item-col item-col-header item-col-center">
                                                                    <div> <span>ผู้ร่วมระดมทุน</span> </div>
                                                                </div>
                                                                <div class="item-col item-col-header item-col-center">
                                                                    <div class="center-text"> <span>จำนวนเงิน</span> </div>
                                                                </div>
                                                            </div>
                                                        </li> -->

                                                        <!-- Item : Loop here -->
                                                        <li class="item">
                                                            <div class="item-row">
                                                                <!--Name of Following-->
                                                                <div class="item-col item-col-center no-overflow no-underline">
                                                                    <div>
                                                                        <a href="#" class="center-text">
                                                                            กนกวรรณ มุตตามระ
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!--Following Button-->
                                                                <div class="item-col item-col-center">
                                                                    <div class=""> <a href="dashboard-profile.jsp" class="btn btn-success-outline rounded"> เลิกติดตาม </a> </div>
                                                                </div>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <!--Followers Tab-->
                                            <div class="tab-pane fade" id="followers-pills">

                                                <!--List of Following-->
                                                <div data-exclude="xs,sm,lg">
                                                    <!-- Table Content -->
                                                    <ul class="item-list striped">

                                                        <!-- Head of Table -->
                                                        <!-- <li class="item item-list-header hidden-sm-down">
                                                            <div class="item-row">
                                                                <div class="item-col item-col-header item-col-center">
                                                                    <div> <span>ผู้ร่วมระดมทุน</span> </div>
                                                                </div>
                                                                <div class="item-col item-col-header item-col-center">
                                                                    <div class="center-text"> <span>จำนวนเงิน</span> </div>
                                                                </div>
                                                            </div>
                                                        </li> -->

                                                        <!-- Item : Loop here -->
                                                        <li class="item">
                                                            <div class="item-row">
                                                                <!--Name of Following-->
                                                                <div class="item-col item-col-center no-overflow no-underline">
                                                                    <div>
                                                                        <a href="#" class="center-text">
                                                                            กนกวรรณ มุตตามระ
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <!--Following Button-->
                                                                <div class="item-col item-col-center">
                                                                    <div class=""> <a href="#" class="btn btn-success-outline rounded"> เลิกติดตาม </a> </div>
                                                                </div>
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-block -->
                                </div>
                                <!-- /.card -->
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
        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>

    </body>
</html>

