<%--
    Document   : dashboard-project-setup-info
    Created on : May 28, 2017, 11:22:10 PM
    Author     : kanok
--%>
<%@page import="model.ProjectCategories"%>
<%@page import="utilities.ProjectUtil"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.ArrayList"%>
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
                                <li class="active">                <a href="dashboard-project-list.jsp">    <i class="fa fa-th-list"></i> จัดการโครงการของคุณ </a></li>
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
                            <div class="col-xl-12 stat-col">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="dashboard-project-setup-info.jsp" class="nav-link active"> ข้อมูลเบื้องต้น </a> </li>
                                            <li class="nav-item"> <a href="dashboard-project-setup-team.jsp" class="nav-link"> ทีมดูแลโครงการ </a> </li>
                                            <li class="nav-item"> <a href="dashboard-project-setup-detail.jsp" class="nav-link"> รายละเอียดโครงการ </a> </li>
                                            <li class="nav-item"> <a href="dashboard-project-setup-image.jsp" class="nav-link"> รูปภาพของโครงการ </a> </li>
                                            <li class="nav-item"> <a href="dashboard-project-setup-wishlist.jsp" class="nav-link"> รายการสิ่งที่ต้องการ </a> </li>
                                            <li class="nav-item"> <a href="dashboard-project-setup-submit.jsp" class="nav-link"> เสนอโครงการ </a> </li>
                                            <li class="nav-item"> <a href="project-preview.jsp" class="nav-link"> ดูตัวอย่าง </a> </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <!--Basic Tab-->
                                            <div class="tab-pane fade in active" id="basic-pills">
                                                <c:if test="${empty newProject}">

                                                    <form name="item" action="setupInfoServlet">
                                                        <!--Title Form Card-->
                                                        <div class="card card-block">
                                                            <h4>สร้างโครงการของคุณ</h4>
                                                            <p>กรอกข้อมูลและรายละเอียดต่าง ๆ ของโครงการของคุณ</p>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> ชื่อโครงการ : </label>
                                                                <div class="col-sm-6"> <input type="text" required name="projectName" class="form-control boxed" placeholder="ตัวอย่าง 'ปั่นยังไงให้เสร็จในหนึ่งเดือน' "> </div>
                                                            </div>
                                                        </div>

                                                        <!--Category Form Card-->

                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> เลือกประเภท : </label>
                                                                <div class="col-sm-6">
                                                                    <select class="c-select form-control boxed" name="category">
                                                                        <option disabled selected>เลือกประเภท</option>
                                                                        <% HttpSession session2 = request.getSession();
                                                                            ServletContext context = getServletContext();
                                                                            DataSource ds = (DataSource) context.getAttribute("dataSource");

                                                                            ProjectUtil projectUtil = new ProjectUtil(ds);
                                                                            projectUtil.connect();
                                                                            ArrayList<ProjectCategories> category = projectUtil.getAllCategory();
                                                                            session2.setAttribute("category", category);%>
                                                                        <c:forEach var="cate" items="${category}">
                                                                            <option value="${cate.projectCategoryId}">${cate.name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--Target Form Card-->

                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> คำอธิบายโครงการอย่างย่อ : </label>
                                                                <div class="col-sm-6"> <textarea type="number" required name="description" class="form-control boxed" min="0" placeholder=" คำอธิบายโครงการ "></textarea> </div>
                                                            </div>
                                                        </div>
                                                        <!--Target Form Card-->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> จำนวนเงิน : </label>
                                                                <div class="col-sm-6"> <input type="number" required name="amount" class="form-control boxed" min="0" placeholder=" จำนวนเงินที่ต้องการ "> </div>
                                                            </div>
                                                        </div>

                                                        <!--Duration Form Card-->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> ระยะเวลา : </label>
                                                                <div class="col-sm-6"> <input type="number" required name="duration" class="form-control boxed" name="duration" min="3" max="90" placeholder="ระบุจำนวนวัน" value="90"> </div>
                                                            </div>
                                                        </div>

                                                        <!-- Tag Form Card -->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> แท๊ก : </label>
                                                                <div class="col-sm-6">
                                                                    <ul id="myULTags">
                                                                        <li>การศึกษา</li>
                                                                        <li>ชาวเขา</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!--Button-->
                                                        <div class="col-sm-6 offset-sm-3">
                                                            <input type="submit" class="btn btn-primary btn-block"  value="บันทึก"  />
                                                            <input type="submit" class="btn btn-secondary btn-block"  value="ยกเลิก"  />
                                                        </div>
                                                    </form>
                                                </c:if>
                                                <c:if test="${newProject != null}">

                                                    <form name="item" action="setupInfoServlet">
                                                        <!--Title Form Card-->
                                                        <div class="card card-block">
                                                            <h4>สร้างโครงการของคุณ</h4>
                                                            <p>กรอกข้อมูลและรายละเอียดต่าง ๆ ของโครงการของคุณ</p>
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> ชื่อโครงการ : </label>
                                                                <div class="col-sm-6"> <input type="text" required name="projectName" class="form-control boxed" placeholder="ตัวอย่าง 'ปั่นยังไงให้เสร็จในหนึ่งเดือน' " value="${newProject.name}"> </div>
                                                            </div>
                                                        </div>

                                                        <!--Category Form Card-->

                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> เลือกประเภท : </label>
                                                                <div class="col-sm-6">
                                                                    <select class="c-select form-control boxed" name="category">

                                                                        <% HttpSession session3 = request.getSession();
                                                                            ServletContext context2 = getServletContext();
                                                                            DataSource ds2 = (DataSource) context2.getAttribute("dataSource");

                                                                            ProjectUtil projectUtil2 = new ProjectUtil(ds2);
                                                                            projectUtil2.connect();
                                                                            ArrayList<ProjectCategories> category2 = projectUtil2.getAllCategory();
                                                                            session3.setAttribute("category", category2);%>
                                                                        <c:forEach var="cate" items="${category}">
                                                                            <c:if test="${newProject.projectCategoryId == cate.projectCategoryId}">
                                                                                <option selected value="${cate.projectCategoryId}">${cate.name}</option
                                                                            </c:if>
                                                                            <option value="${cate.projectCategoryId}">${cate.name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--Target Form Card-->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> คำอธิบายโครงการอย่างย่อ : </label>
                                                                <div class="col-sm-6"> <textarea type="number" required name="description" class="form-control boxed" min="0" placeholder=" คำอธิบายโครงการ "> ${newProject.shortDescription}</textarea> </div>
                                                            </div>
                                                        </div>
                                                        <!--Target Form Card-->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> จำนวนเงิน : </label>
                                                                <div class="col-sm-6"> <input type="number" required name="amount" class="form-control boxed" min="0" placeholder=" จำนวนเงินที่ต้องการ " value="${newProject.budget}"> </div>
                                                            </div>
                                                        </div>

                                                        <!--Duration Form Card-->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> ระยะเวลา : </label>
                                                                <div class="col-sm-6"> <input type="number" required name="duration" class="form-control boxed" name="duration" min="3" max="90" placeholder="ระบุจำนวนวัน" value="90"> </div>
                                                            </div>
                                                        </div>

                                                        <!-- Tag Form Card -->
                                                        <div class="card card-block">
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 offset-sm-1 form-control-label text-xs-right"> แท๊ก : </label>
                                                                <div class="col-sm-6">
                                                                    <ul id="myULTags">
                                                                        <li>การศึกษา</li>
                                                                        <li>ชาวเขา</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!--Button-->
                                                        <div class="col-sm-6 offset-sm-3">
                                                            <input type="submit" class="btn btn-primary btn-block"  value="บันทึก"  />
                                                            <input type="submit" class="btn btn-secondary btn-block"  value="ยกเลิก"  />
                                                        </div>
                                                    </form>
                                                </c:if>
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

