<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function adminChange() {

		var form = document.adminChange_fm;
		form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="adminCom_firstDiv">
		<jsp:include page="/WEB-INF/views/adminCom/adminComLeftList.jsp" />
		<div class="adminCom_SecDiv">
			<h1>멤버내용~</h1>
			<form name="adminChange_fm" action="adminChange.do">
				<table border="1" cellspacing="0">
					<c:forEach var="i" items="${list }">
						<tr>
							<th>번호</th>
							<td id="idxTd">
							<input type="text" name="mem_no" value="${i.MNO }" readonly="readonly" id="memNo_id"> 
							<input type="hidden" name="com_no" value="${i.COMNO }" readonly="readonly" id="comNo_id"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id="eamilTd"><input type="text" name="mem_Email"
								value="${i.MEMAIL }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td id="nameTd"><input type="text" name="mem_Name"
								value="${i.MNAME }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>가입일</th>
							<td id="dateTd"><input type="text" name="mem_Date"
								value="${i.MDATE }" readonly="readonly"></td>
						</tr>
						<tr>
							<th>관리자</th>
							<td id="adminTd"><input type="text" name="memGrade"
								value="${i.GRA }" readonly="readonly">
								<a href="#" onclick="adminChange()">[변경]</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="2"><input type="button" value="닫기"
							onclick="divClose()"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>