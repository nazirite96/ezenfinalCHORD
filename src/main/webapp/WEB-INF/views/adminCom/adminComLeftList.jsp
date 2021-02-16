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
	.adminCom_firstDiv{
		display:grid;
    	grid-template-columns:250px 1fr;
    	height:675px;
	}
	.sidebar{
		background-color:#FCF6F5;
	}
</style>

</head>
<body>
	<nav id="sidebarMenu"
		class="d-md-block sidebar collapse">
		<div class="sidebar-sticky">
			<ul class="mt-4 ml-3 nav flex-column">
				<li class="nav-item">
				<a class="nav-link active" href="adminCompanyForm.do?com_no=${sessionScope.comNo }"> 
				<span data-feather="home"></span>COMPANY</a></li>
				
				<li class="nav-item"><a class="nav-link" href="adminProListForm.do?com_no=${sessionScope.comNo }"> 
				<span data-feather="file"></span>PROJECT</a></li>
				
				<li class="nav-item"><a class="nav-link" href="adminMemManagementForm.do?com_no=${sessionScope.comNo }"> 
				<span data-feather="shopping-cart"></span>MEMBER</a></li>
					<c:url var="mailSendUrl" value="adminMailSendForm.do">
						<c:param name="com_no">${sessionScope.comNo }</c:param>
						<c:param name="com_pwd">${sessionScope.comPwd }</c:param>
					</c:url>				
				<li class="nav-item"><a class="nav-link" href="${mailSendUrl }"> 
				<span data-feather="users"></span>INVITATION
				</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>