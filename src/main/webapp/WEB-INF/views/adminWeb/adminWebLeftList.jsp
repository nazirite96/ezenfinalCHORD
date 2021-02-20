<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.adminWeb_firstDiv{
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
				<a class="nav-link active" href="adminWebForm.do"> 
				MEMBER LOG</a></li>
				
				<li class="nav-item"><a class="nav-link" href="adminFileForm.do"> 
				FILE DOWN LOG</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>