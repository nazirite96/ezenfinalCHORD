<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.adminCom_firstDiv{
		display:grid;
    	grid-template-columns: 200px 1fr;
	}
	.adminCom_SecDiv{
		padding-left: 50px;
   	 	padding-top: 10px;
	}
	.adminCom_firstDiv ul {
	    font-size: 20px;
	    border-right:2px dashed gray;
	    width:150px;
	    margin:0px;
	    padding:35px;
  }
</style>
</head>
<body>
	<ul>
		<li><a href="adminCompanyForm.do?com_no=${sessionScope.comNo }">회사 관리</a></li>
		<li><a href="adminProListForm.do?com_no=${sessionScope.comNo }">프로젝트 관리</a></li>
		<li><a href="adminMemManagementForm.do?com_no=${sessionScope.comNo }">회원 관리</a></li>
		<c:url var="mailSendUrl" value="adminMailSendForm.do">
			<c:param name="com_no">${sessionScope.comNo }</c:param>
			<c:param name="com_pwd">${sessionScope.comPwd }</c:param>
		</c:url>
		<li><a href="${mailSendUrl }">회원초대</a></li>
	</ul>
</body>
</html>