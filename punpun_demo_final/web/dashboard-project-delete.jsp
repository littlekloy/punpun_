<%--
    Document   : dashboard-project-delete
    Created on : May 28, 2017, 11:14:49 PM
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
                                    <div class="img" style="background-image: url('https://avatars3.githubusercontent.com/u/3959008?v=3&s=40')"> </div>
                                    <span class="name">
                                        John Doe
                                    </span>
                                </a>
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
                                <div class="image-container logo"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div>
                            </div>
                        </div>
                        <!--Menu-->
                        <nav class="menu">
                            <ul class="nav metismenu" id="sidebar-menu">
                                <li>                <a href="dashboard.jsp">       <i class="fa fa-home"></i> แดชบอร์ด </a></li>
                                <li>                <a href="dashboard-profile.jsp">         <i class="fa fa-user"></i> โปรไฟล์ </a></li>
                                <li>                <a href="dashboard-following.jsp">       <i class="fa fa-bell"></i> การติดตาม </a></li>
                                <li>                <a href="dashboard-funded-project.jsp">  <i class="fa fa-thumbs-up"></i> โครงการที่เคยร่วมระดมทุน </a></li>
                                <li class="active">                <a href="dashboard-project-list.jsp">    <i class="fa fa-th-list"></i> จัดการโครงการของคุณ </a></li>
                                <li> <a href="dashboard-account-setting.jsp">         <i class="fa fa-gear"></i> ตั้งค่าบัญชีผู้ใช้ </a></li>
                                <li> <hr> </li>
                                <li>                <a href="admin-dashboard.jsp">       <i class="fa fa-dashboard"></i> แดชบอร์ดของแอดมิน </a></li>
                                <li>                <a href="admin-payment-control.jsp">         <i class="fa fa-money"></i> หลักฐานการโอนเงิน </a></li>
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
                <article class="content dashboard-page">

                    <!--Profile Card-->
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col col-md-12">
                                <div class="card sameheight-item stats">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <h1 class="title" style="font-size: 150%"> โครงการปล่อยช้างกลับป่า </h1>
                                        </div>
                                        <!-- Project Short Description -->
                                        <div class="row row-sm stats-container">
                                            <!--Image-->
                                            <div class="col-sm-6 col-xs-12  stat-col">
                                                <div class="project-img-container">
                                                    <div class="image-project-no-opacity" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                </div>
                                            </div>
                                            <!--Icon Stat-->
                                            <div class="col-sm-6 col-xs-12">
                                                <p class=""> Fitzroy Crossing is very remote. It is very expensive to get anything there, and even more expensive to buy things there. Bawoorrooga is 500KM from Broome, and over 2000km from Perth. We need as much as we can to help get these guys back on their feet again </p>
                                            </div>
                                        </div>
                                        <form role="form">
                                            <!-- Money Transfer Form Card -->
                                            <div class="col-md-12">
                                                <div class="card card-default">
                                                    <div class="card-block form-group">
                                                        <div class="title-block">
                                                            <h3 class="title">เงินที่ได้จากการระดมทุนจะมอบให้กับใคร</h3>
                                                            <p class="title-description">** ถ้าเคยเปิดระดมทุนแล้ว</p>
                                                        </div>

                                                        <div class="form-group">
                                                            <select class="form-control boxed" onchange="">
                                                                <option disabled selected value="0"> -- เลือกเหตุผล --</option>
                                                                <option value="1">แจ้งอะไรก็ไม่ชัด งง</option>
                                                                <option value="2">ใช้เงินเยอะเกินความจำเป็น เอาไปสร้างจรวดหรอ</option>
                                                                <option value="3">มัน-อแหล ก๊อปคนอื่นมา</option>
                                                                <option value="4">อื่น ๆ</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <textarea rows="2" class="form-control boxed" placeholder="... อื่นๆ กรอกที่นี่ ..."></textarea>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Delete Form Card -->
                                            <div class="col-md-12">
                                                <div class="card card-default">
                                                    <div class="card-block form-group">
                                                        <div class="title-block">
                                                            <h3 class="title">ทำไมโครงการนี้ถึงต้องการลบโครงการนี้</h3>
                                                        </div>
                                                        <div class="form-group">
                                                            <select class="form-control boxed" onchange="">
                                                                <option disabled selected value="0"> -- เลือกเหตุผล --</option>
                                                                <option value="1">แจ้งอะไรก็ไม่ชัด งง</option>
                                                                <option value="2">ใช้เงินเยอะเกินความจำเป็น เอาไปสร้างจรวดหรอ</option>
                                                                <option value="3">มัน-อแหล ก๊อปคนอื่นมา</option>
                                                                <option value="4">อื่น ๆ</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <textarea rows="2" class="form-control boxed" placeholder="... อื่นๆ กรอกที่นี่ ..."></textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="submit" class="btn btn-danger" value="ยืนยันการลบโครงการ" name="comment">
                                                            <a href="project-detail.jsp" class="btn btn-danger-outline">ยกเลิก</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
                // Minimal
                //-------------------------------
                $('#myTags').tagit();

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
                // Tag events
                //-------------------------------
                var eventTags = $('#eventTags');

                var addEvent = function (text) {
                    $('#events_container').append(text + '<br>');
                };

                eventTags.tagit({
                    availableTags: sampleTags,
                    beforeTagAdded: function (evt, ui) {
                        if (!ui.duringInitialization) {
                            addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                        }
                    },
                    afterTagAdded: function (evt, ui) {
                        if (!ui.duringInitialization) {
                            addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                        }
                    },
                    beforeTagRemoved: function (evt, ui) {
                        addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                    },
                    afterTagRemoved: function (evt, ui) {
                        addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                    },
                    onTagClicked: function (evt, ui) {
                        addEvent('onTagClicked: ' + eventTags.tagit('tagLabel', ui.tag));
                    },
                    onTagExists: function (evt, ui) {
                        addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
                    }
                });

                //-------------------------------
                // Read-only
                //-------------------------------
                $('#readOnlyTags').tagit({
                    readOnly: true
                });

                //-------------------------------
                // Tag-it methods
                //-------------------------------
                $('#methodTags').tagit({
                    availableTags: sampleTags
                });

                //-------------------------------
                // Allow spaces without quotes.
                //-------------------------------
                $('#allowSpacesTags').tagit({
                    availableTags: sampleTags,
                    allowSpaces: true
                });

                //-------------------------------
                // Remove confirmation
                //-------------------------------
                $('#removeConfirmationTags').tagit({
                    availableTags: sampleTags,
                    removeConfirmation: true
                });

            });
        </script>

    </body>
</html>
