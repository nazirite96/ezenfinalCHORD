<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;			
	}
	/*모든텍스트창*/
	.alltxt_css{
		width:100px;
		height:38px;
		border: 1px solid #ccc;	
	}
	/*submit 버튼*/
	.send_css{
		width: 100px;
	    height: 38px;
	    font-size: 12pt;
	    background-color: black;
	    border: 1px solid black;
	    color: #FCF6F5;	
	}
</style>
</head>
<body style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
<form name="" action="exComPwd.do" method=post>
<table class="table_css">
	<tr>
		<td colspan="3" align="center">회사 비밀번호를 입력해 주세요
		<input type="hidden" value="${emailData}" name="mem_email">
		</td>
	</tr>
	<tr>
		<td><input type="password" name="com_no" placeholder="앞자리" class="alltxt_css"></td>
		<td><input type="password" name="com_pwd" placeholder="뒷자리" class="alltxt_css"></td>
		<td colspan="2" align="right"><input type="submit" value="확인" class="send_css" ></td>
	</tr>
</table>
</form>
</body>
</html>