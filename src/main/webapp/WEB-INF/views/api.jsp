<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>API</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">

<style>
	.text_css{
	 max-width: calc(100% - 50px);
	  overflow: hidden;
	  text-overflow: ellipsis;
 	  display: -webkit-box;
 	 -webkit-line-clamp: 1;
 	 -webkit-box-orient: vertical;
 	 width: 150px;
 	 height:30px;
	}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>


function deletebtn(){
	
	var array;
	var seq = $("input[name='checkbox']");
	
	for(var i=0; i<seq.length; i++){
		if(seq[i].checked){
			array.push(seq[i].value);
		}
	}
	if (array.length == 0){
		alert("선택된 글이 없습니다.")
	}else{
		var chk = confirm("정말 삭제하시겠습니까?")
	
		$.ajax({
			url : "delete",
			type : "POST",
			data : {
				array : array,
			},
			datatype : "json",
			success : function(result){
				if(result==''){
					alert("삭제실패!")
				}else{
					window.location.href="redirect:board";
				}
			},error : function(){
				alert("에러!")
			}
			
		});
	}
		
}

function search(){
	
	var text = 
	
	$.ajax({
		url : "search",
		type : "POST",
		data : {
			text : text
		},
		datatype : "json",
		success : function(search){
			alert("성공")
		},error : function(){
			alert("에러!")
		}
	})
}

</script>

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
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My
											Profile</span></a></li>
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
						<li><a onclick="location.href='board'" class=""><i
								class="lnr lnr-dice"></i> <span>Board</span></a></li>
						<li><a onclick="location.href='jqgrid'" class=""><i
								class="lnr lnr-text-format"></i> <span>JqGrid</span></a></li>
						<li><a onclick="location.href='api'" class="active"><i
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
							<!-- TABLE NO PADDING -->
						
							<!-- END TABLE NO PADDING -->
						</div>
					</div>
					<!-- END CONDENSED TABLE -->
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>
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
