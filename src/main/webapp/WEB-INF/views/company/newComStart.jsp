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
</style>
</head>
<body style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
<form action="startChord.do" method=post>
	<table class="table_css">
		<tr>
			<td>
				<input type="hidden" value="${getMemEmail}" name="mem_email">
				<input type="hidden" value="${getComName}" name="com_name">
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인 페이지 이동!" class="btn btn-dark btn-lg"></td>
		</tr>
	</table>	
</form>
</body>
</html>