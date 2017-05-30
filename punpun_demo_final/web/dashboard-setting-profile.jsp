<%--
    Document   : dashboard-setting-profile
    Created on : May 28, 2017, 11:34:56 PM
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
                                <li class="active"> <a href="dashboard-account-setting.jsp">         <i class="fa fa-gear"></i> ตั้งค่าบัญชีผู้ใช้ </a></li>
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
                                    <h2> ตั้งค่าบัญชีและโปรไฟล์ของคุณ</h2>
                                    <p>  </p>
                                    <!-- </div> -->
                                </div>
                            </div>
                            <!-- Tab -->
                            <div class="col-md-12">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="dashboard-account-setting.jsp" class="nav-link"> ตั้งค่าบัญชี </a> </li>
                                            <li class="nav-item"> <a href="dashboard-setting-profile.jsp" class="nav-link active" > จัดการโปรไฟล์ </a> </li>
                                            <li class="nav-item"> <a href="dashboard-setting-payment.jsp" class="nav-link"> การชำระเงิน </a> </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <!--Profile Tab-->
                                            <div class="tab-pane fade in active" id="profile-setting-pills">
                                                <!-- Image Profile -->
                                                <div class="col-md-6">
                                                    <form name="item">
                                                        <!--Category Form Card-->
                                                        <div class="card card-block">
                                                            <h4>รูปภาพของคุณ</h4>
                                                            <p></p>

                                                            <a href="#" class="add-image" data-toggle="modal" data-target="#modal-media">
                                                                <div class=" project-img-container">
                                                                    <div class="image-project" style="background-image: url('assets/img/profile/${member.memberId}.jpg');"></div>
                                                                    <div class="middle-project">
                                                                        <!--Button-->
                                                                        <input type="submit" class="btn btn-warning btn-lg"  value="+ อัพโหลดรูปภาพ"  />
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>

                                                        <!--Button-->
                                                        <input type="submit" class="btn btn-primary btn-block" onclick='submitForm()'  value="บันทึก"  />
                                                    </form>
                                                </div>
                                                <!-- Edit Info -->
                                                <div class="col-md-6 stats-col">
                                                    <div class="card sameheight-item stats" data-exclude="xs,sm">
                                                        <div class="card-block">
                                                            <div class="title-block">
                                                                <h4> ข้อมูลส่วนตัว </h4>
                                                                <p></p>
                                                            </div>
                                                            <!--Personal Info-->
                                                            <div class="row row-sm stats-container">
                                                                <form role="form">
                                                                    <!--Website-->
                                                                    <div class="col-xs-12 col-sm-12 stat-col">
                                                                        <div class="name"> <i class="fa fa-globe"></i> เว็บไซต์ </div>
                                                                        <div class="value"><input type="text" class="form-control" placeholder="ตัวอย่าง 'www.facebook.com/punpun'" value="punpun.com/profile?id=${member.memberId}"></div>
                                                                    </div>
                                                                    <!--Tags-->
                                                                    <div class="col-xs-12 col-sm-12 stat-col">
                                                                        <div class="name"> <i class="fa fa-tags"></i> ความสนใจ </div>

                                                                        <div class="form-group">
                                                                            <ul id="myULTags">
                                                                                <li>เด็ก</li>
                                                                                <li>สัตว์</li>
                                                                            </ul>
                                                                        </div>

                                                                    </div>
                                                                    <!--Button-->
                                                                    <input type="submit" class="btn btn-primary btn-block" value="บันทึก"  />
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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

