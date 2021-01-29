<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.memJoin_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 15pt;
	}
</style>
<script>
	/*이메일 중복확인*/
	function showup(){
		window.open('emailChkForm.do','emailChk','width=500,height=350,top=100,left=100');
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
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<form name="memJoin_fm" action="memJoinEmailSendForm.do" method="post">
		<table class="memJoin_css">
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="email" name="mem_email" placeholder="이메일" readonly="readonly" id="email_id"></td>
				<td><input type="button" onclick="showup()" value="중복확인"></td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" name="mem_name" placeholder="이름" id="name_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="pwd_one" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
			</tr>
			<tr>
				<td><input type="password" name="mem_pwd" placeholder="비밀번호 재입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" onclick="confirm(pwd_one,mem_pwd)" value="다음" id="sendbt"></td>
			</tr>
		</table>
	</form>
</body>
</html>