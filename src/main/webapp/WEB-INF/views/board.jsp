<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Tables | Klorofil - Free Bootstrap Dashboard Template</title>
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
.text_css {
	max-width: calc(100% - 50px);
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	width: 150px;
	height: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function deletebtn() {

		/* var check = $("input[name='checkbox']:checked").val(); */
		var checkArr = [];
		
		$("input[name='checkbox']:checked").each(function() {
			checkArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
			console.log(checkArr);
		})
		
		if(checkArr==""){
			alert("삭제 할 게시물을 선택하세요.")
		}else{
		$.ajax({
			url : "delete",
			type : "GET",
			data : {
				checkArr : checkArr
			},

			success : function(result) {
				alert("게시물을 삭제했습니다.")
				location.href= "board";
			},
			error : function() {
				alert("실패")
			}
		})
		}
	}

	function searchbtn() {

		var keyword = $("#keyword").val();
		var type = $("#type").val();

		if (keyword == "") {
			location.href = "board";
		} else if (type == "") {
			location.href = "board";
		} else {
			$.ajax({
						url : "search",
						type : "GET",
						data : $("form[name=search-form]").serialize(),
						success : function(result) {
							$('#boardtable > tbody').empty();
							if (result.length >= 1) {
								result
										.forEach(function(item) {
											str = '<tr>'
											str += "<td>"
													+ "<input type='checkbox'>"
													+ "</td>";
											str += "<td>" + item.board_seq
													+ "</td>";
											str += "<td><a href='detail?board_seq="
													+ item.board_seq
													+ "'style='text-decoration-line:underline;  text-decoration-style: double;'>"
													+ item.board_title
													+ "</a></td>";
											str += "<td><a class='text_css'>"
													+ item.board_text
													+ "</a></td>";
											str += "<td>" + item.board_writer
													+ "</td>";
											str += "</tr>"
											$('#boardtable').append(str);
										})
							}
						}

					})
		}
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
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="assets/img/user.png"	class="img-circle" alt="Avatar"> 
								<span>${user.custom_user_nick}</span>
									<i class="icon-submenu lnr lnr-chevron-down"></i>
						</a>
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
						<li><a href="index" class=""><i class="lnr lnr-home"></i>
								<span>Dashboard</span></a></li>
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
							<!-- TABLE NO PADDING -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">BoardList</h3>
									<form name="search-form" onsubmit="return false"
										class="navbar-form navbar-left">
										<div class="input-group">
											<select name="type" id="type">
												<option selected value="">검색 내용 선택</option>
												<option value="board_title">제목</option>
												<option value="board_text">내용</option>
												<option value="board_writer">작성자</option>
											</select> 
											<input type="text" name="keyword" id="keyword" class="form-control" placeholder="Search"> 
											<span class="input-group-btn"> 
											<input type="button" class="form-control" onclick="javascript:searchbtn()" style="background-color: green; color: white; height: 55px;" value="검색" />
											</span>
										</div>
									</form>
								</div>
								<div>
									<button type="button" style="float: right;" class="btn btn-success update-pro" onclick="javascript:deletebtn()">
										<span>삭제</span>
									</button>
								</div>
								<div>
									<button type="button"
										style="float: right; background-color: blue;"
										class="btn btn-success update-pro"
										onclick="location.href='writepage'">
										<span>글쓰기</span>
									</button>
								</div>
								<div class="panel-body no-padding">
									<table class="table" id="boardtable">
										<thead>
											<tr>
												<th>선택</th>
												<th>번호</th>
												<th>제목</th>
												<th>내용</th>
												<th>작성자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${boardlist}" var="board">
												<tr>
													<td><input type="checkbox" id="checkbox"
														name="checkbox" value="${board.board_seq}" /></td>
													<td>${board.board_seq}</td>
													<td><a href="detail?board_seq=${board.board_seq}"
														style="text-decoration-line: underline; text-decoration-style: double;">${board.board_title}</a></td>
													<td><a class="text_css"> ${board.board_text}</a></td>
													<td>${board.board_writer}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<ul class="paging" style="text-align: center;">
										<c:if test="${paging.prev}">
											<span> 
											<a href='<c:url value="board?page=${paging.startPage-1}"/>'>◀[이전]</a>&nbsp&nbsp
											</span>
										</c:if>
										<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
											<span> 
											<a href='<c:url value="board?page=${num}"/>'>${num}</a>&nbsp&nbsp
											</span>
										</c:forEach>
										<c:if test="${paging.next && paging.endPage>0}">
											<span> 
											<a href='<c:url value="board?page=${paging.endPage+1}"/>'>[다음]▶</a>
											</span>
										</c:if>
									</ul>
								</div>
							</div>
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
					Shared by <i class="fa fa-love"></i> <a
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
