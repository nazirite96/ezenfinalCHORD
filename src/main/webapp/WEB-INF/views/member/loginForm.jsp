<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>LOGIN</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/dashboard/">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
	
<!--아이콘 -->
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
<style type="text/css">
	.body{
		
	}	
	td{
		padding-bottom:12px;
	}
	/*테이블*/
	.login_css{
		margin-top: 170px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;	
	}
	/*모든 텍스트 창*/
	.alltxt_css{
		width:330px;
		height:50px;
		border: 1px solid #ccc;
	}
	/*로그인 버튼*/
	.btCss{
	    width: 130px;
	    height: 52px;
	    font-size: 12pt;
	    background-color: #7b9acc;
	    border: 1px solid #7b9acc;
	    color: #FCF6F5;		
	}

	
</style>		
</head>
<body class="text-center" style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
<section>
	<form name="login" action="login.do" method="post">
		<table class="login_css">
			<tr>
				<td><b>이메일</b></td>
				<td><input type="email" name="mem_email" value="${cookie.saveEmail.value }" required="required" aria-describedby="emailHelp" class="alltxt_css"></td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				<td><input type="password" name="mem_pwd" required="required" class="alltxt_css"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="ckbx" value="on" ${empty cookie.saveEmail.value?'':'checked' }>&nbsp;이메일 기억하기
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="로그인" class="btCss"></td>
			</tr>
		</table>
	</form>
	<br>
	<div><a href="memJoinForm.do">아직 회원이 아니신가요?</a></div>
</section>

</body>
</html>