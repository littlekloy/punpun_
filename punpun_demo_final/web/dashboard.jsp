<%--
    Document   : dashboard
    Created on : May 15, 2017, 4:57:27 AM
    Author     : kanok
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Punpun.com เว็บไซต์การระดมทุนจากมวลชลแบบแจกแจงรายการ</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/logo/gift.png"/>
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
                <div class="sidebar-overlay" id="sidebar-overlay"></div>
                <form>
                    <!-- Content -->
                    <article class="content dashboard-page">

                        <!--Summary My Project-->
                        <div class="title-block">
                            <h3 class="title"> ภาพรวมโครงการของคุณ </h3>
                            <p class="title-description">    </p>
                        </div>
                        <section class="section">
                            <div class="row sameheight-container">
                                <!--Stat for My project-->
                                <div class="col-md-7 hidden-md-down clearfix sameheight-item">
                                    <div class="row sameheight-container">
                                        <!-- Active -->
                                        <a style="display:block" href="#">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card card-activeproject sameheight-item">
                                                    <div class="card-header">
                                                        <div class="header-block">
                                                            <p class="title"> กำลังระดมทุน </p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block hover-effect">
                                                        <h3 class="center-text"> ${accept.size()} </h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- Closed -->
                                        <a style="display:block" href="#">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card card-close sameheight-item">
                                                    <div class="card-header">
                                                        <div class="header-block">
                                                            <p class="title"> เสร็จสิ้นแล้ว </p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block hover-effect">
                                                        <h3 class="center-text"> 0 </h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- Banned -->
                                        <a style="display:block" href="#">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card card-danger sameheight-item">
                                                    <div class="card-header">
                                                        <div class="header-block">
                                                            <p class="title" style="color: white"> ถูกระงับ </p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block hover-effect">
                                                        <h3 class="center-text"> ${delete.size()} </h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- Draft -->
                                        <a style="display:block" href="#">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card card-info sameheight-item">
                                                    <div class="card-header">
                                                        <div class="header-block">
                                                            <p class="title"> แบบร่าง </p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block hover-effect">
                                                        <h3 class="center-text"> ${draft.size()} </h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- Wait For Approve -->
                                        <a style="display:block" href="#">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card card-success sameheight-item">
                                                    <div class="card-header">
                                                        <div class="header-block">
                                                            <p class="title"> รอการอนุมัติ </p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block hover-effect">
                                                        <h3 class="center-text"> ${pending.size()} </h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <!-- Template -->
                                        <a style="display:block" href="#">
                                            <div class="col-md-6 col-xl-4">
                                                <div class="card card-draft sameheight-item">
                                                    <div class="card-header">
                                                        <div class="header-block">
                                                            <p class="title"> โครงการที่ปฏิเสธ </p>
                                                        </div>
                                                    </div>
                                                    <div class="card-block hover-effect">
                                                        <h3 class="center-text"> ${eject.size()} </h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <!--List of Funded Projects-->
                                <div class="col-sm-12 col-md-12 col-lg-5 sameheight-item">
                                    <div class="card sameheight-item items" data-exclude="xs,sm,lg">
                                        <!-- Table Title-->
                                        <div class="card-header bordered">
                                            <div class="header-block">
                                                <h3 class="title"> โครงการของคุณ </h3> <a href="dashboard-project-list.jsp" class="btn btn-primary btn-sm rounded">ดูเพิ่มเติม</a>
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
                                                </div>
                                            </li>
                                            <c:forEach var="yourProject" items="${yoursProject}">
                                                <!--Item : Loop here-->
                                                <li class="item">
                                                    <div class="item-row">

                                                        <div class="item-col item-col-title no-overflow">
                                                            <div>
                                                                <a href="" class="">

                                                                    <h4 class="item-title no-wrap"> ${yourProject.name} </h4>
                                                                </a>
                                                            </div>
                                                        </div>

                                                        <div class="item-col item-col-sales">
                                                            <div class="item-heading"> จำนวนเงินที่ระดมทุน </div>
                                                            <div>   ${yourProject.funded} </div>
                                                        </div>
                                                    </div>
                                                </li>

                                            </c:forEach>


                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!--Summary Stats-->
                        <div class="title-block">
                            <h3 class="title"> ภาพรวมการร่วมระดมทุนของคุณ </h3>
                            <p class="title-description">  </p>
                        </div>
                        <section class="section">
                            <div class="row sameheight-container">
                                <div class="col col-xs-12 col-sm-12 col-md-12 col-xl-12 stats-col">
                                    <div class="card sameheight-item stats" data-exclude="xs">
                                        <div class="card-block">
                                            <div class="title-block">
                                                <h4 class="title"> ภาพรวมของบัญชี </h4>
                                                <p class="title-description"> </p>
                                            </div>
                                            <div class="row row-sm stats-container">

                                                <!--Score-->
                                                <div class="col-xs-12 col-sm-6 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-trophy"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 17000 </div>
                                                        <div class="name"> แต้มบุญ </div>
                                                    </div>
                                                </div>

                                                <!--Total Outcome-->
                                                <div class="col-xs-12 col-sm-6 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-money"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 1700 </div>
                                                        <div class="name"> ยอดรวมการรระดมทุน </div>
                                                    </div>
                                                </div>

                                                <!--Interesting Projects-->
                                                <div class="col-xs-12 col-sm-6 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-star"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 0 </div>
                                                        <div class="name"> โครงการที่ติดตาม </div>
                                                    </div>
                                                </div>

                                                <!--Funded Projects-->
                                                <div class="col-xs-12 col-sm-6 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-heart"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${fundedDonations.size()} </div>
                                                        <div class="name"> โครงการที่ร่วมระดมทุน </div>
                                                    </div>
                                                </div>

                                                <!--Following-->
                                                <div class="col-xs-12 col-sm-6 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 1 </div>
                                                        <div class="name"> กำลังติดตาม </div>
                                                    </div>
                                                </div>

                                                <!--Followers-->
                                                <div class="col-xs-12 col-sm-6 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 1 </div>
                                                        <div class="name"> ผู้ติดตาม </div>
                                                    </div>
                                                </div>

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
                                <div class="col-md-12">
                                    <div class="card sameheight-item items" data-exclude="xs,sm,lg">

                                        <!-- Table Title-->
                                        <div class="card-header bordered">
                                            <div class="header-block">
                                                <h3 class="title"> โครงการที่ร่วมระดมทุน </h3>
                                                <a href="dashboard-funded-project.jsp" class="btn btn-primary btn-sm rounded"> ดูเพิ่มเติม </a></div>
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
                                            <c:forEach var="fundedDonation" items="${fundedDonations}">
                                                <!-- Item : Loop here -->
                                                <li class="item">
                                                    <div class="item-row">
                                                        <!--Image of Project-->
                                                        <div class="item-col fixed item-col-img xs">
                                                            <a href="">
                                                                <div class="item-img xs rounded" style="background-image:  url('assets/img/projectPic/${fundedDonation.projectId.projectId}.jpg')"></div>
                                                            </a>
                                                        </div>
                                                        <!--Name of Project-->
                                                        <div class="item-col item-col-title no-overflow">
                                                            <div>
                                                                <a href="" class="">
                                                                    <h4 class="item-title no-wrap"> ${fundedDonation.projectId.name} </h4>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <!--Amount of Funded-->
                                                        <div class="item-col item-col-sales">
                                                            <div class="item-heading"> จำนวนเงิน</div>
                                                            <div> ${fundedDonation.amount} </div>
                                                        </div>
                                                        <!--Category-->
                                                        <div class="item-col item-col-category no-overflow">
                                                            <div class="item-heading"> ประเภท </div>
                                                            <div class="no-overflow"> <a href="">${fundedDonation.projectId.projectCategory.name}</a> </div>
                                                        </div>
                                                        <!--Date-->
                                                        <div class="item-col item-col-date">
                                                            <div class="item-heading"> วันที่ระดมทุน </div>
                                                            <div>${fundedDonation.date}  </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>



                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </section>

                    </article>
                </form>


                <!-- Footer -->
                <footer class="footer">
                    <div class="footer-block buttons"> </div>
                    <div class="footer-block author">
                        <ul>
                            <li> Theme by <a href="https://github.com/modularcode"> ModularCode </a> </li>
                            <li> Created by <a href=""> Disanuwat & Kanokwan </a> </li>
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
        <!-- vendor.js first!! Don't change it. -->
        <script src="assets/js/vendor.js" type="text/javascript"></script>
        <script src="assets/js/app.js" type="text/javascript"></script>

    </body>
</html>

