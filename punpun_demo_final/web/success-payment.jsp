<%--
    Document   : success-payment
    Created on : May 28, 2017, 11:49:40 PM
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
                        <form role="search" action="searchServlet">
                            <div class="input-container">
                                <div>
                                    <i class="fa fa-search"></i> <input type="search" name="keyword" placeholder="...ค้นหาโครงการ...">
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
                                <a href="ViewAllServlet" class="btn btn-none-shadow header-btn" id="browse-link"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
                            </li>
                            <li class="header-block header-block-buttons">
                                <a href="how-it-works.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-list-ul"></i> <span> ขั้นตอนการบริจาค </span> </a>
                            </li>
                            <li class="header-block header-block-buttons">
                                <a href="dashboard-project-setup-info.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-plus"></i> <span> สร้างโครงการ </span> </a>
                            </li>
                            <c:if test="${empty member}">
                                <!-- login -->
                                <li class="header-block header-block-buttons">
                                    <a href="login.jsp" class="btn btn-none-shadow header-btn" id="login-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                                </li>
                            </c:if>
                            <c:if test="${member != null }">

                                <!-- notification -->
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

                                <!-- profile -->
                                <li class="profile dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                        <div class="img" style="background-image: url('assets/img/profile/${member.memberId}.jpg')"> </div> <span class="name">
                                            ${member.firstName}
                                        </span> </a>
                                    <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item" href="viewProfileServlet?id=${member.memberId}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
                                        <a class="dropdown-item" href="dashboardServlet?id=${member.memberId}"> <i class="fa fa-user icon"></i> แดชบอร์ด </a>
                                        <a class="dropdown-item" href="payment-list.jsp?memberId=${member.memberId}"> <i class="fa fa-bell icon"></i> การระดมทุนของคุณ </a>
                                        <a class="dropdown-item" href="dashboard-account-setting.jsp"> <i class="fa fa-gear icon"></i> ตั้งค่าบัญชีผู้ใช้ </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logoutServlet"> <i class="fa fa-power-off icon"></i> ลงชื่อออก </a>
                                    </div>
                                </li>


                            </c:if>
                        </ul>
                    </div>
                </header>

                <!-- Search Content -->
                <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/profile-card-1.jpg');" >
                    <article class="container content-browse items-list-page">
                        <!-- Title -->
                        <div class="title-block">
                            <div class="col-md-12">
                                <h1 class="center-text"> ขอบคุณที่ร่วมระดมทุนให้</h1>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h3 class="center-text"> ${project.name} </h3>
                        </div>
                    </article>
                </div>

                <!-- Content -->
                <article class="container content dashboard-page">
                    <!--Profile Card-->
                    <section class="section">
                        <div class="col-md-12 stats-col">
                            <div class="card stats" data-exclude="xs">
                                <div class="card-block">
                                    <!-- Project Name -->
                                    <div class="title-block">
                                        <div class="col-md-9 col-sm-6">
                                            <h1 class="title" style="font-size: 150%"> ${project.name} </h1>
                                            <p class="title-description">โดย Kanokwan Muttamara</p>
                                            <!--  <div class="">
                                                  <p><i class="fa fa-tag" > </i> <span>
                                                          <a href="#"> Tag1 </a>
                                                          <a href="#"> Tag2 </a>
                                                      </span></p>
                                              </div> -->
                                        </div>
                                    </div>
                                    <!-- Project Short Description -->
                                    <div class="row row-sm stats-container">

                                        <!--Image-->
                                        <div class="col-md-6 col-xs-12  stat-col">
                                            <div class="project-img-container">
                                                <div class="image-project-no-opacity" style="background-image: url('assets/img/projectPic/${project.projectId}.jpg')"></div>
                                            </div>
                                        </div>

                                        <!--Icon Stat-->
                                        <div class="col-md-6 col-xs-12">
                                            <p class=""> ${project.shortDescription} </p>
                                        </div>

                                        <!--Progress Bar-->
                                        <div class="col-xs-12 col-md-6 stat-col">
                                            <div class="stat-icon"> <i class="fa fa-flag"></i> </div>
                                            <div class="stat">
                                                <div class="value"> ${project.funded} / ${project.budget} </div>
                                            </div>
                                            <progress class="progress stat-progress" value="${project.percent}" max="100">
                                                <div class="progress">
                                                    <span class="progress-bar" style="width: 75%;"></span>
                                                </div>
                                            </progress>
                                        </div>
                                    </div>
                                    <!-- Share Button Group -->
                                    <div class="col-xs-12 col-md-12 social-block want-bottom">

                                        <ul>
                                            <li> <h4>แบ่งปันการบริจาคของคุณ : </h4> </li>
                                            <li> <h4> </h4> </li>
                                            <li><a href="signup.jsp" class="btn btn-oval btn-primary-outline"> <i class="fa fa-star"></i> </a></li>
                                            <li><a href="signup.jsp" class="btn btn-oval btn-primary-outline"> <i class="fa fa-facebook"></i> </a></li>
                                            <li><a href="signup.jsp" class="btn btn-oval btn-primary-outline"> <i class="fa fa-twitter"></i> </a></li>
                                            <li><a href="signup.jsp" class="btn btn-oval btn-primary-outline"> <i class="fa fa-share-alt"></i> </a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-12 want-bottom">
                                        <a href="ViewAllServlet" class="btn btn-block btn-info">ดูโครงการอื่น ๆ</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </article>

                <!-- Footer -->
                <footer class="footer">
                    <div class="container content">
                        <div class="col-md-4">
                            <p> <h3>เกี่ยวกับเรา</h3> </p>
                            <h6><a href="about-us.jsp">เรื่องราวของปันปัน</a></h6>
                            <h6><a href="team.jsp">ทีมปันปัน</a></h6>
                            <h6><a href="how-it-works.jsp">ขั้นตอนการบริจาค</a></h6>
                            <h6><a href="fee.jsp">ค่าใช้จ่ายในการระดมทุน</a></h6>
                        </div>
                        <div class="col-md-4">
                            <p> <h3>โครงการทั้งหมด</h3> </p>
                            <sql:query var="category" dataSource="punpun">
                                SELECT * FROM project_categories
                            </sql:query>
                            <h6><a href="browse.jsp?category=0&sort=0">ทั้งหมด</a></h6>
                            <c:forEach var="data3" items="${category.rows}">
                                <h6><a href="browse.jsp?category=${data3.project_category_id}&sort=0">${data3.name}</a></h6>

                            </c:forEach>

                        </div>
                        <div class="col-md-4">
                            <p> <h3>การติดต่อ</h3> </p>
                            <h6><a href="mailto:punpunproject@gmail.com?Subject=หัวข้อ%20เรื่องที่ติดต่อ" target="_top"> <i class="fa fa-envelope" style="color: #28ab60;"> </i> <span> อีเมล </span> </a> </h6>
                            <h6><a href="https://www.facebook.com/punpunproject/"> <i class="fa fa-facebook-square" style="color: #4267b2;"> </i> <span> Facebook </span> </a></h6>
                            <h6><a href="https://twitter.com"> <i class="fa fa-twitter" style="color: #1da1f2;"> </i> <span> Twitter </span> </a></h6>
                        </div>

                        <div class="col-md-12 want-top" style="border-top: 1px solid #64798d;margin-top: 20px;">
                            <div class="footer-block author" style="margin-top: 20px;">
                                <ul>
                                    <li> Theme by <a href="https://github.com/modularcode"> ModularCode </a> </li>
                                    <li> Created by <a href="#"> Disanuwat & Kanokwan </a> </li>
                                    <li> <a href="http://www.it.kmitl.ac.th"> IT KMITL </a> </li>
                                </ul>
                            </div>
                        </div>

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
