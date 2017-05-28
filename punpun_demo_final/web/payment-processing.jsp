<%--
    Document   : payment-processing
    Created on : May 28, 2017, 11:39:13 PM
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

        <link href="assets/css/jquery.tagit.css" rel="stylesheet" type="text/css">
        <link href="assets/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">

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
                        <form role="search" action="">
                            <div class="input-container">
                                <div>
                                    <i class="fa fa-search"></i> <input type="search" placeholder="...ค้นหาโครงการ...">
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
                                <a href="browse.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
                            </li>
                            <li class="header-block header-block-buttons">
                                <a href="browse.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-list-ul"></i> <span> ขั้นตอนการบริจาค </span> </a>
                            </li>
                            <li class="header-block header-block-buttons">
                                <a href="dashboard-project-setup-info.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-plus"></i> <span> สร้างโครงการ </span> </a>
                            </li>
                            <li class="header-block header-block-buttons">
                                <a href="login.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
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

                <!-- Search Content -->
                <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/profile-card-1.jpg');" >
                    <article class="container content-browse items-list-page">
                        <!-- Title -->
                        <div class="title-block">
                            <div class="col-md-12">
                                <h1 class="center-text"> ยืนยันการโอนเงิน </h1>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h5 class="center-text"> หลังจากที่ผู้บริจาคทำการโอนเงินแล้ว กรุณายืนยันด้วยแบบฟอร์มด้านล่าง หรือจากลิงก์ที่ได้รับจากอีเมล example@example.com</h5>
                        </div>
                    </article>
                </div>

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
                                            <div class="card-block col-xs-12 col-sm-6 col-md-4">
                                                <div class="project-img-container">
                                                    <div class="image-project-no-opacity" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                </div>
                                            </div>
                                            <div class="card-block col-xs-12 col-sm-6 col-md-8">
                                                <div class="want-top">
                                                    <h5>ธนาคาร กู้ร้อยดอกล้าน</h5>
                                                    <p>ชื่อบัญชี นายหมี สีซอ</p>
                                                    <h3>010-0-99999-9</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Bank 2 -->
                                        <div class="card card-block">
                                            <div class="card-block col-xs-12 col-sm-6 col-md-4">
                                                <div class="project-img-container">
                                                    <div class="image-project-no-opacity" style="background-image: url('assets/backgrounds/profile-card-2.jpg')"></div>
                                                </div>
                                            </div>
                                            <div class="card-block col-xs-12 col-sm-6 col-md-8">
                                                <div class="want-top">
                                                    <h5>ธนาคาร ผลัดวันรับประกันตีน</h5>
                                                    <p>ชื่อบัญชี นายกระทิง ซิ่งแหกด่าน</p>
                                                    <h3>060-0-69696-2</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label text-xs-right"> ชื่อโครงการ : </label>
                                        <div class="col-sm-10"> <h4> โครงการช่วยเด็กอ้วนม้วนเสื่อขาย</h4> </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label text-xs-right"> ยอดเงินบริจาค : </label>
                                        <div class="col-sm-10"> <p> 98742.00 บาท </p> </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label text-xs-right"> ธนาคาร </label>
                                        <div class="col-sm-8">
                                            <select class="form-control">
                                                <option>jj</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label text-xs-right"> จำนวนเงินที่โอน : </label>
                                        <div class="col-sm-8"> <input type="number" class="form-control" name="amount" placeholder="-- กรุณาใส่จำนวนเงินที่โอน --" value=""> </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 form-control-label text-xs-right"> หลักฐานการโอนเงิน : </label>
                                        <div class="col-sm-8"> <input type="file" class="form-control" name="donation_id"> </div>
                                    </div>

                                    <!--Button-->
                                    <button type="submit" class="btn btn-primary btn-block"  value="Submit"> <i class="fa fa-lock"> </i> ยืนยันการชำระเงิน </button>
                                    <input type="submit" class="btn btn-secondary btn-block"  value="Cancel"  />
                                </form>
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

        <!-- Script -->
        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>

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
