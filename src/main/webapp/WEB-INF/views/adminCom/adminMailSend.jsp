<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
	td {
		padding-bottom: 12px;
	}
	/*테이블*/
	.table_css {
		margin-top: 130px;
		margin-left: auto;
		margin-right: auto;
		font-size: 12pt;
	}
	/*수정가능 창*/
	.txt1_css{
		width:300px;
		height:40px;
		border: 1px solid #ccc;
	}
	/*전송 버튼*/
	.btCss{
	    width: 300px;
	    height: 42px;
	    font-size: 12pt;
	    background-color: #7b9acc;
	    border: 1px solid #7b9acc;
	    color: #FCF6F5;		
	}
	.mailInfo_css{
		font-size:10pt;
		color:#ccc;
	}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminCom_firstDiv">
		<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp" />
		<main role="main" class="ml-3 mt-3 col-lg-10">
			<div class="adminCom_SecDiv">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">회원 초대하기</h1>
				</div>
				<form name="mailSend" action="adminMailSend.do" method="post">
					<table class="table_css">
						<tr>
							<td class="mailInfo_css">* 보내실 메일 주소를 적어주세요 *</td>
							<td><input type="hidden" name="com_no" value="${com_no }"></td>
							<td><input type="hidden" name="com_pwd" value="${com_pwd }"></td>
						</tr>
						<tr>
							<td><input type="email" name="receiveMail" aria-describedby="emailHelp" placeholder="email@gmail.com" class="txt1_css"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="보내기" class="btCss"></td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>

</body>
</html>