<%--
    Document   : dashboard-project-update-info
    Created on : May 28, 2017, 11:29:30 PM
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

        <!-- <script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script> -->
        <script type="text/javascript" src='assets/js/tinymce/tinymce.min.js'></script>
        <script type="text/javascript" src='assets/js/tinymce/jquery.tinymce.min.js'></script>
        <script>
            tinymce.init({
                selector: 'textarea',
                plugins: [
                    "advlist autolink lists link image charmap print preview anchor textcolor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media contextmenu paste imagetools "
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | forecolor backcolor",
                imagetools_cors_hosts: ['www.tinymce.com', 'codepen.io'],
                content_css: [
                    'css/app-seagreen.css', 'css/vendor.css'
                ]
            });
        </script>

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

                    <!--Pill Tab-->
                    <section class="section">
                        <div class="row">
                            <div class="col-xl-12 stat-col">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="" class="nav-link active" data-target="#detail-pills" aria-controls="detail-pills" data-toggle="tab" role="tab"> รายละเอียดโครงการ </a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#team-pills" aria-controls="team-pills" data-toggle="tab" role="tab"> ทีมดูแลโครงการ </a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#image-pills" aria-controls="image-pills" data-toggle="tab" role="tab"> รูปภาพของโครงการ </a> </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <!-- Detail Tab -->
                                            <div class="tab-pane fade in active" id="detail-pills">
                                                <div class="card card-block">
                                                    <h4>รายละเอียดโครงการ</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                    <form role="form" name="divEditor" method="get" action="error-404.jsp">
                                                        <textarea id="mytextarea" name="detail">Hello, World!</textarea>
                                                        <!--Button-->
                                                        <input type="submit" class="btn btn-primary btn-block" onclick='submitForm()'  value="Submit"  />
                                                        <input type="submit" class="btn btn-secondary btn-block" onclick='submitForm()'  value="Cancel"  />
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- Teams Tab -->
                                            <div class="tab-pane fade" id="team-pills">
                                                <div class="card card-block">
                                                    <h4>จัดทีมที่จะมาช่วยคุณ</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                    <!--List of Member Projects-->
                                                    <div data-exclude="xs,sm,lg">
                                                        <!-- Table Content -->
                                                        <form>
                                                            <ul class="item-list striped">
                                                                <!-- Head of Table -->
                                                                <li class="item item-list-header hidden-sm-down">
                                                                    <div class="item-row">
                                                                        <div class="item-col item-col-header item-col-title">
                                                                            <div class="center-text"> <span>ชื่อ - นามสกุล</span> </div>
                                                                        </div>
                                                                        <div class="item-col item-col-header item-col-center">
                                                                            <div> <span>ตำแหน่ง</span> </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <!-- Project Owner : Do not Repeat this!!-->
                                                                <li class="item">
                                                                    <div class="item-row">
                                                                        <!--Name of Team-->
                                                                        <div class="item-col item-col-title no-overflow no-underline">
                                                                            <div>
                                                                                <a href="error-404.jsp" class="center-text">
                                                                                    เจ้าของ โครงการจ๊ะ
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <!--Position-->
                                                                        <div class="item-col item-col-center">
                                                                            <div class="item-heading"> ตำแหน่ง </div>
                                                                            <div> เจ้าโครงการ </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <!-- Team Item : Loop here -->
                                                                <li class="item">
                                                                    <div class="item-row">
                                                                        <!--Name of Team-->
                                                                        <div class="item-col item-col-title no-overflow no-underline">
                                                                            <div>
                                                                                <input type="text" name="name" class="form-control boxed" placeholder="ตัวอย่าง : กนกวรรณ มุตตามระ">
                                                                            </div>
                                                                        </div>
                                                                        <!--Position-->
                                                                        <div class="item-col item-col-center">
                                                                            <div class="item-heading"> ตำแหน่ง </div>
                                                                            <select class="c-select form-control boxed">
                                                                                <option disabled selected>เลือกตำแหน่ง</option>
                                                                                <option value="1">ผู้ดูแลโครงการ</option>
                                                                                <option value="2">ผู้ช่วยโครงการ</option>
                                                                                <option value="3">คนใช้</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                            <!--Button-->
                                                            <div class="want-top">
                                                                <input type="submit" class="btn btn-primary btn-block"  value="Submit"  />
                                                                <input type="submit" class="btn btn-secondary btn-block"  value="Cancel"  />
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Project Image Tab -->
                                            <div class="tab-pane fade" id="image-pills">
                                                <div class="card card-block">
                                                    <h4>รูปภาพของโครงการ</h4>
                                                    <p>รูปนี้จะโชว์ไปทั่วทุกที่ในเว็บนาจา เลือกดีๆ อัตราส่วนภาพควรเป็น 16:9 และมีขนาดที่ไม่เล็กเกินไป ไม่งั้นภาพแตกน้า เพื่อความสวยงามก็เลือก ๆ หน่อยนาจา</p>
                                                    <form name="item">
                                                        <a href="#" class="add-image" data-toggle="modal" data-target="#modal-media">
                                                            <div class="project-img-container want-bottom">
                                                                <div class="image-project" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                                <div class="middle-project">
                                                                    <!--Button-->
                                                                    <input type="submit" class="btn btn-warning btn-lg"  value="+ อัพโหลดรูปภาพ"  />
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <!--Button-->
                                                        <input type="submit" class="btn btn-primary btn-block" onclick='submitForm()'  value="Submit"  />
                                                        <input type="submit" class="btn btn-secondary btn-block" onclick='submitForm()'  value="Cancel"  />
                                                    </form>
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
                                    <li class="nav-item"> <a class="nav-link active" href="#upload" data-toggle="tab" role="tab">Upload</a> </li>
                                </ul>
                                <div class="tab-content modal-tab-content">
                                    <div class="tab-pane fade active in" id="upload" role="tabpanel">
                                        <div class="upload-container">
                                            <div id="dropzone">

                                                <!--Form Upload-->
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


