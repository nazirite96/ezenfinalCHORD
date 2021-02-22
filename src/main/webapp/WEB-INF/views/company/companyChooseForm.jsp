<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script>
	window.alert('${msg}');
</script>
<style type="text/css">
	.table_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;		
	}
	.btTD_css{
		padding-right:30px;
	}
</style>
</head>
<body style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
<br>
<h5 align="center">회사를 설정 해 주세요.</h5>
<form name="" method="post">
<table class="table_css">
	<tr>
		<td class="btTD_css"><input type="submit" value="새 회사 설립" formaction="makeNewCompanyForm.do" class="btn btn-dark btn-lg"></td>
		<td><input type="submit" value="기존 회사 들어가기" formaction="exComPwdInputForm.do" class="btn btn-dark btn-lg"></td>
	</tr>
	<tr>
		<td><input type="hidden" value="${getEmail}" name="hiddenEmail"></td>
	</tr>
</table>
</form>
</body>
</html>