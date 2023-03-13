<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function pwcheck(){
	$("#custom_user_pswd2").keyup(function(){
		
		var pswd=$("#custom_user_pswd").val();
		var pswd2=$("#custom_user_pswd2").val();
			if(pswd!==pswd2){
				$("#checkpw").html("비밀번호가 일치하지 않습니다.")
				$("#checkpw").attr("color","red")
			}else{
				$("#checkpw").html("비밀번호가 일치합니다.");
				$("#checkpw").attr("color","green")
			}

	});
})

$(function idcheck(){
	$("#custom_user_nick").keyup(function(){
		
		var id =$("#custom_user_nick").val();
		
		$.ajax({
			url : "idcheck",
			type : "POST",
			data : {
				id : id
			},
			datatype : "json",
			success : function(idcheck){
				if(idcheck==1){
					$("#checkid").html("중복된 아이디 입니다.")
					$("#checkid").attr("color","red")
					$("input[name=inputcheck]").attr("value",idcheck)
				}else if(idcheck==0){
					$("#checkid").html("사용 가능한 아이디입니다.")
					$("#checkid").attr("color","green")
					$("input[name=inputcheck]").attr("value",idcheck)
				}
			}, error : function(){
				alert("에러!")
			}
		})
	});
})


function signupbtn(){
	var name = $("#custom_user_name").val();
	var nick = $("#custom_user_nick").val();
	var pswd = $("#custom_user_pswd").val();
	var pswd2 = $("#custom_user_pswd2").val();
	var email = $("#custom_user_email").val();
	var birth = $("#custom_user_birth").val();
	var phone = $("#custom_user_phone").val();
	var address = $("#custom_user_address").val();
	var pwcheck = $("#pwcheck").val();
	var inputcheck = $("#inputcheck").val();
	
	if(name==""){
		alert("이름을 입력하세요.")
	}else if(nick==""){
		alert("닉네임을 입력하세요.")
	}else if(pswd==""){
		alert("비밀번호를 입력하세요.")
	}else if(pswd2==""){
		alert("비밀번호를 재입력하세요.")
	}else if(pswd!==pswd2){
		alert("비밀번호가 일치하지않습니다.")
	}else if(email==""){
		alert("이메일을 입력하세요.")
	}else if(birth==""){
		alert("생년월일을 입력하세요.")
	}else if(phone==""){
		alert("휴대폰 번호를 입력하세요.")
	}else if(address==""){
		alert("주소를 입력하세요.")
	}else if(inputcheck==1){
		alert("아이디가 중복되었습니다.")
	}else{
		signup.submit();
	}
	
	
}

</script>
<body>
<form id="signup" class="signup" action="signup" method="POST">
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
								<div class="form-group">
									<input type="text" class="form-control" id="custom_user_name" name = "custom_user_name" placeholder="Name">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="custom_user_nick" name = "custom_user_nick" placeholder="Nick">
									<input type="hidden" name="inputcheck" id ="inputcheck" value=""/>
									<font id="checkid" size="2"></font>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="custom_user_pswd" name = "custom_user_pswd" placeholder="Pwd">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="custom_user_pswd2" name="custom_user_pswd2" placeholder="RepeatPwd">
									<font id="checkpw" size="2"></font>
								</div>
								<div class="form-group">
									<input type="email" class="form-control" id="custom_user_email" name="custom_user_email" placeholder="Email">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="custom_user_birth" name = "custom_user_birth" placeholder="Birth">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="custom_user_phone" name="custom_user_phone" placeholder="Phone">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="custom_user_address" name="custom_user_address" placeholder="Addr">
								</div>
								<button type="button" class="btn btn-primary btn-lg btn-block" onclick="javascript:signupbtn()">JOIN</button>
						</div>
					</div>
					<div class="right">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>