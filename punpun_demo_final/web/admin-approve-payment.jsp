<%--
    Document   : admin-approve-payment
    Created on : May 28, 2017, 11:57:06 PM
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
                            <li class="notifications new">
                                <a href="" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <sup>
                                        <span class="counter">8</span>
                                    </sup> </a>
                                <div class="dropdown-menu notifications-dropdown-menu">
                                    <ul class="notifications-container">
                                        <li>
                                            <a href="" class="notification-item">
                                                <div class="img-col">
                                                    <div class="img" style="background-image: url('assets/faces/3.jpg')"></div>
                                                </div>
                                                <div class="body-col">
                                                    <p> <span class="accent">Zack Alien</span> pushed new commit: <span class="accent">Fix page load performance issue</span>. </p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="notification-item">
                                                <div class="img-col">
                                                    <div class="img" style="background-image: url('assets/faces/5.jpg')"></div>
                                                </div>
                                                <div class="body-col">
                                                    <p> <span class="accent">Amaya Hatsumi</span> started new task: <span class="accent">Dashboard UI design.</span>. </p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="notification-item">
                                                <div class="img-col">
                                                    <div class="img" style="background-image: url('assets/faces/8.jpg')"></div>
                                                </div>
                                                <div class="body-col">
                                                    <p> <span class="accent">Andy Nouman</span> deployed new version of <span class="accent">NodeJS REST Api V3</span> </p>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <footer>
                                        <ul>
                                            <li> <a href="">
                                                    View All
                                                </a> </li>
                                        </ul>
                                    </footer>
                                </div>
                            </li>
                            <li class="profile dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    <div class="img" style="background-image: url('https://avatars3.githubusercontent.com/u/3959008?v=3&s=40')"> </div> <span class="name">
                                        John Doe
                                    </span> </a>
                                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item" href="dashboard-profile.jsp"> <i class="fa fa-user icon"></i> โปรไฟล์ </a>
                                    <a class="dropdown-item" href="dashboard-project-list.jsp"> <i class="fa fa-bell icon"></i> โครงการของคุณ </a>
                                    <a class="dropdown-item" href="dashboard-account-setting.jsp"> <i class="fa fa-gear icon"></i> ตั้งค่าบัญชี </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login.jsp"> <i class="fa fa-power-off icon"></i> ลงชื่อออก </a>
                                </div>
                            </li>
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
                                <div class="image-container logo"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div></div>
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
                                <li class="active">                <a href="admin-payment-control.jsp">         <i class="fa fa-money"></i> หลักฐานการโอนเงิน </a></li>
                                <li>                <a href="admin-active-project.jsp">         <i class="fa fa-gift"></i> โครงการที่กำลังระดมทุน </a></li>
                                <li>                <a href="admin-pending-project.jsp">  <i class="fa fa-legal"></i> โครงการที่รอการอนุมัติ </a></li>
                                <li>                <a href="admin-reported-project.jsp">    <i class="fa fa-exclamation-triangle"></i> โครงการที่ถูกรายงาน </a></li>
                                <li> <a href="admin-banned-project.jsp">         <i class="fa fa-ban"></i> โครงการที่ถูกระงับ </a></li>
                            </ul>
                        </nav>

                    </div>
                </aside>
                <div class="sidebar-overlay" id="sidebar-overlay"></div>

                <!-- Content -->
                <article class="container content">
                    <!--Profile Card-->
                    <section class="section">
                        <div class="col-md-12">
                            <!-- Project Name -->
                            <div class="card card-block">
                                <form role="form" method="GET" name="bank-transfer" action="">
                                    <!-- Bank -->
                                    <div class="col-md-12">
                                        <!-- Bank 1 -->
                                        <div class="card card-block">
                                            <h2>บัญชีธนาคาร</h2>
                                            <div class="card-block col-xs-12">
                                                <div class="project-img-container">
                                                    <div class="image-project-no-opacity" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                </div>
                                            </div>
                                            <div class="card-block col-xs-12 col-sm-6 col-md-8">
                                                <div class="want-top">
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> Donation ID </label>
                                                        <div class="col-sm-8"> <h4> 989-9-09000-90-8</h4> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> ชื่อโครงการ </label>
                                                        <div class="col-sm-8"> <h4> โครงการช่วยเด็กอ้วนม้วนเสื่อขาย</h4> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> จำนวนเงินที่โอน </label>
                                                        <div class="col-sm-8"> <p> 98742.00 บาท </p> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> ธนาคาร </label>
                                                        <div class="col-sm-8"> <p> กู้ร้อยดอกล้าน </p> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> ชื่อผู้โอน </label>
                                                        <div class="col-sm-4"> <p> กนกวรรณ </p> </div>
                                                        <div class="col-sm-4"> <p> มุตตามระ </p> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> ที่อยู่ </label>
                                                        <div class="col-sm-8"> <p> 2131/169 ม.7 </p> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> ตำบล </label>
                                                        <div class="col-sm-8"> <p> อนุบาล </p> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> อำเภอ </label>
                                                        <div class="col-sm-8"> <p> ประถม </p> </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 form-control-label text-xs-right"> จังหวัด </label>
                                                        <div class="col-sm-4"> <p> มัธยม </p> </div>
                                                        <div class="col-sm-4"> <p> 10270 </p> </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <!--Button-->
                                    <button type="submit" class="btn btn-primary btn-block"  value="Submit"> <i class="fa fa-check"> </i> ยืนยัน </button>
                                    <a href="mailto:punpunproject@gmail.com?Subject=หัวข้อ%20เรื่องที่ติดต่อ" target="_top" class="btn btn-secondary btn-block"> <i class="fa fa-ban"> </i> แจ้งปัญหา </a>
                                </form>
                            </div>
                        </div>
                    </section>
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
