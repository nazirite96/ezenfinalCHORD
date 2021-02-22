<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script type="text/javascript">
	function adminChange() {

		var form = document.adminChange_fm;
		form.submit();
	}
</script>
<style type="text/css">
	/*모든텍스트창*/
	.alltxt_css{
		width:200px;
		border: 0px solid white;
	}
	.info_css{
		font-size:10pt;
		color:#ccc;
	}
</style>
</head>
<body>
<main role="main" class="ml-3 mt-3">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">회원 상세 정보 보기</h1>
	</div>
	<form name="adminChange_fm" action="adminChange.do">
		<div class="table-responsive">
		<table class="table table-hover">
			<c:forEach var="i" items="${list }">
				<tr>
					<th>번호</th>
					<td id="idxTd">
					<input type="text" name="mem_no" value="${i.MNO }" readonly="readonly" class="alltxt_css"> 
					<input type="hidden" name="com_no" value="${i.COMNO }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td id="eamilTd"><input type="text" name="mem_Email"
						value="${i.MEMAIL }" readonly="readonly" class="alltxt_css"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td id="nameTd"><input type="text" name="mem_Name"
						value="${i.MNAME }" readonly="readonly" class="alltxt_css"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td id="dateTd"><input type="text" name="mem_Date"
						value="${i.MDATE }" readonly="readonly" class="alltxt_css"></td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td id="dateTd">
					<input type="text" name="mem_info_phone" value="${i.MPHONE }" readonly="readonly" class="alltxt_css">
					<input type="hidden" name="mem_info_no" value="${i.MINFONO }" readonly="readonly" class="alltxt_css">			
					</td>
				</tr>
				<tr>
					<th>직책 *</th>
					<td id="dateTd"><input type="text" name="mem_info_position"
						value="${i.MPOSITION }" class="alltxt_css"></td>
				</tr>
				<tr>
					<th>부서 *</th>
					<td id="dateTd"><input type="text" name="mem_info_dept"
						value="${i.MDEPT }" class="alltxt_css"></td>
				</tr>
				<tr>
					<th>관리자 *</th>
					<td id="adminTd">
					<input type="text" name="memGrade" value="${i.GRA }" readonly="readonly" class="alltxt_css"> 
					<a href="#" onclick="adminChange()">[ 관리자변경 ]</a></td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="2" align="center" class="info_css">별표시로 된 부분은 수정 가능합니다.</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" formaction="adminMemInfoChange.do" value="수정하기" class="btn btn-dark btn-lg"></td>
				</tr>
		</table>
		</div>
	</form>
</main>
</body>
</html>