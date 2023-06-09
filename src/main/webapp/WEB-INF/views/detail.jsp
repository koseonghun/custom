<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Elements | Klorofil - Free Bootstrap Dashboard Template</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>

<style>
	.text_css{
 	 width: 300px;
 	 height:30px;
	}
</style>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a>THE CusTom</a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="lnr lnr-arrow-left-circle"></i>
					</button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><img src="assets/img/user.png"
								class="img-circle" alt="Avatar"> <span>${user.custom_user_nick}</span>
								<i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul></li>
						<li><a class="update-pro" title="Upgrade to Pro"
							target="_blank">
								<button type="button" class="btn btn-success update-pro"
									onclick="location.href='logout'">
									<span>로그아웃</span>
								</button>
						</a></li>
						</if>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index" class=""><i
								class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a onclick="location.href='board'" class="active"><i
								class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a onclick="location.href='jqgrid'" class=""><i
								class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a onclick="location.href='api'" class=""><i
								class="lnr lnr-linearicons"></i> <span>API</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6-KO">
							<!-- INPUTS -->
							<div class="panel" style="height:550px;">
								<div class="panel-heading">
									<h3 class="panel-title">RegBoard</h3>
											<input type="button" value="수정" onclick="location.href='modify?board_seq=${detail.board_seq}'" class="btn btn-success update-pro" style="float:right; background-color:green; color:white;"/>
											<input type="button" onclick="location.href='boardlist'" class="btn btn-success update-pro" style="float:right; background-color:blue; color:white;" value="목록"/>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>내용</th>
												<th>작성자</th>
												<th>첨부파일</th>
												<th>작성일자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${detail.board_seq}</td>
												<td>${detail.board_title}</td>
												<td class="text_css">${detail.board_text}</td>
												<td>${detail.board_writer}</td>
												<td><a href="download?board_img_path=${detail.board_img_path}">${detail.board_img_path}</a></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detail.board_reg_date}" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- END INPUTS -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright"> Shared by <i class="fa fa-love"></i>
				<a href="https://bootstrapthemes.co">BootstrapThemes</a>
				</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>
</html>
