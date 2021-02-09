<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
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
	/*텍스트창*/
	.txt1_css{
		width:300px;
		height:37px;
		border: 1px solid #ccc;	
		background-color:#e4e4e4;
	}
	/*텍스트창*/
	.txt2_css{
		width:300px;
		height:37px;
		border: 1px solid #ccc;
	}
	/*수정 버튼*/
	.send_css{
		width: 298px;
	    height: 40px;
	    font-size: 12pt;
	    background-color: black;
	    border: 1px solid black;
	    color: white;	
	}
</style>
</head>
<body style="background-color:#FCF6F5;">
<jsp:include page="/WEB-INF/views/header.jsp"/>
	<form name="memUpdate_fm" action="memUpdate.do" method="post">
		<table class="memJoin_css">
			<tr>
				<td><b>회원번호</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="mem_no" value="${memResult.mem_no }" readonly="readonly" class="txt1_css"></td>
			</tr>
			<tr>
				<td><b>메일</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="mem_email" value="${memResult.mem_email }" readonly="readonly" class="txt1_css"></td>
			</tr>
			<tr>
				<td><b>이름</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="mem_name" value="${memResult.mem_name }" class="txt2_css"></td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="mem_pwd" value="${memResult.mem_pwd }" class="txt2_css"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="txtTD_css"><input type="submit" value="수정하기" class="btn btn-dark btn-lg"></td>
			</tr>
		</table>
	</form>
</body>
</html>