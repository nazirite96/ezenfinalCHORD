<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.body{
		background-color:#FCF6F5;
	}
	.txtTD_css{
		padding-bottom:12px;
	}
	/*테이블*/
	.memJoin_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;
	}
	/*모든텍스트창*/
	.alltxt_css{
		width:300px;
		height:37px;
		border: 1px solid #ccc;
	}
	/*다음 버튼*/
	.send_css{
		width: 298px;
	    height: 40px;
	    font-size: 12pt;
	    background-color: black;
	    border: 1px solid black;
	    color: white;	
	}
	/*메일중복확인 text*/
	.mail_css{
		width:200px;
		height:37px;
		border: 1px solid #ccc;
		background-color:#e4e4e4;
	}
	/*메일 중복확인 bt*/
	.mailcheckbt_css{
		width: 100px;
	    height: 38px;
	    font-size: 12pt;
	    background-color: #7b9acc;
	    border: 1px solid #7b9acc;
	    color: white;
	}
	
</style>
<script>
	/*이메일 중복확인*/
	function showup(){
		window.open('emailChkForm.do','emailChk','width=500,height=200,top=100,left=100');
	}
	
	/*비밀번호 확인*/
	function confirm(pwd_one,mem_pwd){
		
		var one = pwd_one.value;
		var two = mem_pwd.value;
		var mail = document.getElementById('email_id').value;
		var name = document.getElementById('name_id').value;
		
		
		
		if(one=="" || two=="" || mail=="" || name==""){
			window.alert('빈칸을 채워주세요.');
			location.href='memJoinForm.do';
		}else if(one!=two){
			window.alert('비밀번호를 다시 입력해주세요');
			location.href='memJoinForm.do';
		}else if(one==two){
			var form = document.memJoin_fm;
			form.submit();
		}
	}	
</script>
</head>
<body class="body">
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<form name="memJoin_fm" action="memJoinEmailSendForm.do" method="post">
		<table class="memJoin_css">
			<tr>
				<td><b>이메일</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="email" name="mem_email" placeholder="email@gmail.com" readonly="readonly" id="email_id" class="mail_css">
				<input type="button" onclick="showup()" value="중복확인" class="mailcheckbt_css"></td>
			</tr>
			<tr>
				<td><b>이름</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="mem_name" placeholder="이름" id="name_id" class="alltxt_css"></td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="password" name="pwd_one" placeholder="비밀번호" class="alltxt_css"></td>
			</tr>
			<tr>
				<td><b>비밀번호 확인</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="password" name="mem_pwd" placeholder="비밀번호 재입력" class="alltxt_css"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="txtTD_css"><input type="button" onclick="confirm(pwd_one,mem_pwd)" value="다음" id="sendbt" class="send_css"></td>
			</tr>
		</table>
	</form>
</body>
</html>