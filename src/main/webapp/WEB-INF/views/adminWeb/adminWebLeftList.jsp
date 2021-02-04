<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.adminWeb_firstDiv{
		display:grid;
    	grid-template-columns: 200px 1fr;
	}
	.adminWeb_SecDiv{
		padding-left: 50px;
   	 	padding-top: 10px;
	}
	.adminWeb_firstDiv ul {
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
		<li><a href="adminWebForm.do">리스트</a></li>
		<li><a href="adminFileForm.do">파일 다운 이력</a></li>
	</ul>
</body>
</html>