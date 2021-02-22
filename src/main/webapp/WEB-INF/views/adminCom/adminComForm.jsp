<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style type="text/css">	
	td{
		padding-bottom:12px;
	}
	/*테이블*/
	.table_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;	
	}
	/*수정가능 창*/
	.txt1_css{
		width:230px;
		height:37px;
		border: 1px solid #ccc;
	}
	/*수정불가 창*/
	.txt2_css{
		width:230px;
		height:37px;
		border: 1px solid #ccc;
		background-color:#e4e4e4;
	}
	/*수정 버튼*/
	.btCss{
	    width: 300px;
	    height: 40px;
	    font-size: 12pt;
	    background-color: #7b9acc;
	    border: 1px solid #7b9acc;
	    color: #FCF6F5;		
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="adminCom_firstDiv">
<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp"/>
<main role="main" class="ml-3 mt-3 col-lg-10">

	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">관리자 페이지</h1>
	</div>
	<div class="table-responsive">
		<form action="adminComUpdate.do">
			<table class="table_css">
				<tr>
					<th>회사명
					<input type="hidden" name="com_no" value="${comResult.com_no }">
					</th>
					<td><input type="text" name="com_name" value="${comResult.com_name }" readonly="readonly" class="txt2_css"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="com_pwd" value="${comResult.com_pwd }" class="txt1_css"></td>
				</tr>
				<tr>
					<th>회사업종</th>
					<td><input type="text" name="com_sector" value="${comResult.com_sector }" readonly="readonly" class="txt2_css"></td>
				</tr>	
				<tr>
				<td colspan="2"><input type="submit" value="정보수정" class="btCss"></td>
				</tr>	
			</table>
		</form>
	</div>
	
</main>	
</div>

</body>
</html>