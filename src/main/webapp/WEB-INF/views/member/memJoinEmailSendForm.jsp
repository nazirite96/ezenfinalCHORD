<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function memberJoin(){
		var form = document.realMemJoin_fm;
		form.submit();
	}
</script>
<style type="text/css">
	/*테이블*/
	.memjoinemailsend_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;	
	}
	.txtTD_css{
		padding-bottom:12px;
	}
	/*모든텍스트창*/
	.txt1_css{
		width:200px;
		height:38px;
		border: 1px solid #ccc;
		background-color:#e4e4e4;	
	}
	.txt2_css{
		width:300px;
		height:38px;
		border: 1px solid #ccc;
	}
	/*인증번호 bt*/
	.authenticationbt_css{
		width: 100px;
	    height: 38px;
	    font-size: 12pt;
	    background-color: #7b9acc;
	    border: 1px solid #7b9acc;
	    color: #FCF6F5;
	}
	/*회원가입 버튼*/
	.send_css{
		width: 300px;
	    height: 40px;
	    font-size: 12pt;
	    background-color: black;
	    border: 1px solid black;
	    color: #FCF6F5;	
	}
</style>
</head>
<body style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<form name="realMemJoin_fm" action="memJoin.do" method="post">
		<table class="memjoinemailsend_css">
			<tr>
				<td><input type="hidden" name="mem_name" value="${emailDto.mem_name}"></td>
				<td><input type="hidden" name="mem_pwd" value="${emailDto.mem_pwd}"></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="email" name="mem_email" placeholder="email@gmail.com" readonly="readonly" value="${emailDto.mem_email}" class="txt1_css">
				<input type="submit" value="인증번호" formaction="memJoinEmailSend.do" class="authenticationbt_css"></td>
			</tr>
			<tr>
				<td>인증번호 입력</td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="checkNum" placeholder="인증번호" class="txt2_css"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" onclick="memberJoin()" value="회원가입" class="send_css"></td>
			</tr>
		</table>
	</form>
</body>
</html>