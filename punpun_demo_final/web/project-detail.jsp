<%--
    Document   : project-detail
    Created on : May 15, 2017, 1:46:56 AM
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

        <!--Main-->
        <div class="main-wrapper header-fixed">

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
                            <a href="ViewAllServlet" class="btn btn-none-shadow header-btn"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
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
                                <a href="login.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                            </li>
                        </c:if>
                        <c:if test="${member != null }">

                            <!-- notification -->
                            <li class="notifications new">
                                <a href="" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <sup>
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

                            <!-- profile -->
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

            <!-- Content -->

            <div class="app">
                <!-- Content -->
                <article class="container content dashboard-page">

                    <!--Profile Card-->
                    <section class="section">
                        <div class="row sameheight-container">
                            <div class="col-md-12 stats-col">
                                <div class="card sameheight-item stats" data-exclude="xs">
                                    <div class="card-block">
                                        <div class="title-block">
                                            <div class="col-md-9 col-sm-6">
                                                <h1 class="title" style="font-size: 150%"> ${project.name} </h1>

                                                <p class="title-description"> โดย Kanokwan Muutamara </p>

                                                <div class="">


                                                    <!-- Project TAG HERE
                                                    <p><i class="fa fa-tag" > </i> <span>
                                                    <a href="#"> อุปกรณ์การเรียน </a>
                                                     <a href="#"> ทุรกันดาร </a>
                                                    </span></p>-->

                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 social-block">
                                                <ul>
                                                    <li><a href="signup.html" class="want-top btn btn-sm btn-oval btn-primary-outline"> <i class="fa fa-star"></i> </a></li>
                                                    <li><a href="signup.html" class="want-top btn btn-sm btn-oval btn-primary-outline"> <i class="fa fa-facebook"></i> </a></li>
                                                    <li><a href="signup.html" class="want-top btn btn-sm btn-oval btn-primary-outline"> <i class="fa fa-twitter"></i> </a></li>
                                                    <li><a href="signup.html" class="want-top btn btn-sm btn-oval btn-primary-outline"> <i class="fa fa-share-alt"></i> </a></li>
                                                </ul>
                                            </div>

                                        </div>
                                        <div class="row row-sm stats-container">

                                            <!--Image-->
                                            <div class="col-md-8 col-xs-12  stat-col">
                                                <div class="project-img-container">
                                                    <div class="image-project-no-opacity" style="background-image: url('assets/img/Project_Pic/${project.projectId}/${project.projectId}.jpg')"></div>

                                                </div>
                                            </div>

                                            <!--Icon Stat-->
                                            <div class="col-md-4 col-xs-12">
                                                <!--Total Outcome-->
                                                <div class="col-xs-12 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-money"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${project.funded} </div>
                                                        <div class="name"> ยอดรวมการรระดมทุน </div>
                                                    </div>
                                                </div>

                                                <!--Followers-->
                                                <div class="col-xs-12 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-user"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${project.supporterSize} </div>
                                                        <div class="name"> ผู้ร่วมระดมทุน </div>
                                                    </div>
                                                </div>

                                                <!--Interester Projects-->
                                                <div class="col-xs-12 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-star"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 2 </div>
                                                        <div class="name"> ถูกติดดาว </div>
                                                    </div>
                                                </div>

                                                <!--Shared Projects-->
                                                <div class="col-xs-12 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-share-alt"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> 3 </div>
                                                        <div class="name"> แบ่งปัน </div>
                                                    </div>
                                                </div>

                                                <!--End Date-->
                                                <div class="col-xs-12 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-calendar"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${project.endDate} </div>
                                                        <div class="name"> สิ้นสุดโครงการ </div>
                                                    </div>
                                                </div>

                                                <!--Countdown End Date-->
                                                <div class="col-xs-12 stat-col">
                                                    <div class="stat-icon"> <i class="fa fa-clock-o"></i> </div>
                                                    <div class="stat">
                                                        <div class="value"> ${project.fundingDuration} </div>
                                                        <div class="name"> วัน </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <!--Progress Bar-->
                                            <div class="col-xs-12 col-md-8 stat-col">
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

                                            <div class="col-xs-12 col-md-4 stat-col-level want-bottom">

                                                <a href="donate.jsp?id=${project.projectId}"><button class="want-top btn btn-block btn-lg btn-primary">สนับสนุนโครงการ</button></a>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!--Pill Tab : Menu-->
                    <section class="section">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="" class="nav-link active" data-target="#details-pills" aria-controls="details-pills" data-toggle="tab" role="tab">รายละเอียดโครงการ</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#wishlist-pills" aria-controls="wishlist-pills" data-toggle="tab" role="tab">สิ่งที่ต้องการ</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#supporters-pills" aria-controls="supporters-pills" data-toggle="tab" role="tab">ผู้ร่วมระดมทุน</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#comments-pills" aria-controls="comments-pills" data-toggle="tab" role="tab">ความคิดเห็น</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#updates-pills" aria-controls="updates-pills" data-toggle="tab" role="tab">ความคืบหน้า</a> </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.card-block -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </section>

                    <!--Pill Tab : Content-->
                    <section class="section">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card items">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <!--Detail Tab-->
                                        <div class="tab-pane fade in active" id="details-pills">
                                            <div class="card-block">
                                                ${project.story}
                                                <h1>ทีมดูแลโครงการ</h1>
                                                <!--List of Teams-->
                                                <div data-exclude="xs,sm,lg">
                                                    <!-- Table Content -->
                                                    <ul class="item-list striped">
                                                        ${project.teamCollection}
                                                        <c:forEach var="teamMember" items="${project.teamCollection}">
                                                            <!-- Team Item : Loop here -->
                                                            <li class="item">
                                                                <div class="item-row">
                                                                    <div class="item-col fixed item-col-img md">
                                                                        <a href="item-editor.html">
                                                                            <div class="item-img rounded" style="background-image: url('assets/img/profile/0000${teamMember.memberId}.jpg')"></div>
                                                                        </a>
                                                                    </div>
                                                                    <!--Name of Team-->
                                                                    <div class="item-col item-col-title no-overflow no-underline">
                                                                        <div>
                                                                            <a href="error-404.html" class="center-text">
                                                                                ${teamMember.firstName} ${teamMember.lastName}
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <!--Position-->
                                                                    <div class="item-col item-col-center">
                                                                        <div class="item-heading"> ตำแหน่ง </div>
                                                                        <div> ${teamMember.position} </div>
                                                                    </div>

                                                                </div>
                                                            </li>
                                                        </c:forEach>



                                                    </ul>
                                                </div>
                                                <div class="alert alert-danger want-top" role="alert">
                                                    หากพบความผิดปกติ สามารถรายงานโครงการที่ต้องสงสัยได้
                                                    <a class="alert-link" href="report-ban.jsp?id=${param.id}">ที่นี่</a>!
                                                </div>
                                            </div>
                                        </div>
                                        <!--Wishlist Tab-->
                                        <div class="tab-pane fade" id="wishlist-pills">
                                            <div class="card-block">
                                                <!--List of Member Projects-->
                                                <div data-exclude="xs,sm,lg">
                                                    <!-- Table Content -->
                                                    <form>
                                                        <ul class="item-list striped">
                                                            <!-- Head of Table -->
                                                            <li class="item item-list-header hidden-sm-down">
                                                                <div class="item-row">
                                                                    <div class="item-col item-col-header item-col-title">
                                                                        <div class="center-text"> <span>รายการ</span> </div>
                                                                    </div>
                                                                    <div class="item-col item-col-header item-col-center">
                                                                        <div> <span>ยอดเงินที่ได้รับ</span> </div>
                                                                    </div>
                                                                    <div class="item-col item-col-header item-col-center">
                                                                        <div> <span>ยอดเงินเป้าหมาย</span> </div>
                                                                    </div>
                                                                </div>
                                                            </li>


                                                            <!-- Wishlist item -->
                                                            <li class="item">
                                                                <c:forEach var="item" items="${project.projectItemsCollection}">
                                                                    <div class="item-row">
                                                                        <!--Name of Team-->
                                                                        <div class="item-col item-col-title no-overflow no-underline">
                                                                            <div>
                                                                                <div class="center-text">
                                                                                    ${item.items.name}
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <!--Position-->
                                                                        <div class="item-col item-col-center">
                                                                            <div class="item-heading"> ยอดที่ได้รับ </div>
                                                                            <div>${item.funded} </div>
                                                                        </div>
                                                                        <!--Join Date-->
                                                                        <div class="item-col item-col-center">
                                                                            <div class="item-heading"> ยอดเงินเป้าหมาย </div>
                                                                            <div> ${item.amount} </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>

                                                            </li>




                                                        </ul>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Supporter Tab-->
                                        <div class="tab-pane fade" id="supporters-pills">
                                            <div class="card-block">
                                                <!--List of Funded Projects-->
                                                <div data-exclude="xs,sm,lg">
                                                    <!-- Table Content -->
                                                    <ul class="item-list striped">

                                                        <c:forEach var="supporter" items="${project.supporter}">
                                                            <!-- Item : Loop here -->
                                                            <li class="item">
                                                                <div class="item-row">
                                                                    <div class="item-col fixed item-col-img md">
                                                                        <a href="item-editor.html">
                                                                            <div class="item-img rounded" style="background-image: url('assets/img/profile/0000${supporter.memberId}.jpg')"></div>
                                                                        </a>
                                                                    </div>
                                                                    <!--Name of Supporter-->
                                                                    <div class="item-col item-col-center no-overflow no-underline">
                                                                        <div>

                                                                            <a href="error-404.html" class="center-text">
                                                                                ${supporter.firstName}  ${supporter.lastName}
                                                                            </a>


                                                                        </div>
                                                                    </div>
                                                                    <!--Amount of Funded-->
                                                                    <div class="item-col item-col-center">
                                                                        <div class="item-heading"> จำนวน(บาท) </div>
                                                                        <div class=""> ${supporter.funded} </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>


                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Comments Tab-->
                                        <div class="tab-pane fade" id="comments-pills">
                                            <c:forEach var="comment" items="${project.commentsCollection}">
                                                <!-- Comment Card -->
                                                <div class="col-md-12">
                                                    <div class="card card-default">
                                                        <div class="card-block card-block-comment">
                                                            <div style="border-bottom: 1px solid #e9edf0;">
                                                                <h5>ความคิดเห็น</h5>
                                                                <p>${comment.text}</p>
                                                            </div>
                                                            <!-- Stat Footer -->
                                                            <div class="want-top">
                                                                <!-- Pic -->
                                                                <div class="col-md-2">
                                                                    <div class="images-container images-container-center">
                                                                        <!--Put Image link Here-->
                                                                        <img src="assets/img/profile/0000${comment.memberId.memberId}.jpg" alt=""/>
                                                                    </div>
                                                                </div>
                                                                <!--Progress Percent-->
                                                                <div class="col-md-8">
                                                                    <h5>${comment.memberId.firstName} ${comment.memberId.lastName}</h5>
                                                                    <p>1${comment.date}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                            <!-- New Comment Form Card -->
                                            <div class="col-md-12">
                                                <div class="card card-default">
                                                    <div class="card-block form-group">
                                                        <form action="commentSerlvet">
                                                            <label class="control-label">ความคิดเห็น</label>
                                                            <textarea rows="3" class="form-control boxed" placeholder="...แสดงความคิดเห็นของคุณที่นี่..." name="text"></textarea>
                                                            <input type="submit" class="btn btn-primary want-top" value="แสดงความคิดเห็น" >
                                                            <a href="profile.html" class="btn btn-link want-top"></a>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Updates Tab-->
                                        <div class="tab-pane fade" id="updates-pills">
                                            <div class="card-block">
                                                <!-- Update Card -->
                                                <div class="col-md-12">
                                                    <div class="card">
                                                        <div class="card-block">
                                                            <div class="timeline">

                                                                <!-- Update Item : Green -->
                                                                <div class="timeline-item">
                                                                    <div class="timeline-point timeline-point-default">
                                                                        <i class="fa fa-circle"></i>
                                                                    </div>
                                                                    <div class="timeline-event timeline-event-default">
                                                                        <div class="timeline-heading">
                                                                            <h4>เริ่มสร้างโครงการในปันปัน</h4>
                                                                        </div>
                                                                        <div class="timeline-body">
                                                                            <p>เปิดรับการระดมทุน โดยผ่านเว็บไซต์การระดมทุนจากมวลชนที่มีชื่อว่า PUNPUN.COM</p>
                                                                        </div>
                                                                        <div class="timeline-footer">
                                                                            <p class="text-right">${project.startDate}</p>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                                <span class="timeline-label">
                                                                    <button class="btn btn-oval btn-danger"><i class="fa fa-flag"></i> เริ่มโครงการ</button>
                                                                </span>
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

                    <div class="col-xs-12">
                        <form action="donate.html">
                            <button class="want-top btn btn-block btn-lg btn-primary">สนับสนุนโครงการ</button>
                        </form>
                    </div>

                </article>
            </div>

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
