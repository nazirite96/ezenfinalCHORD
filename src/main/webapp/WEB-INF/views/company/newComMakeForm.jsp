<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.table_css{
		margin-top: 130px;
    	margin-left: auto;
    	margin-right:auto;
    	font-size: 12pt;			
	}
	.txtTD_css{
		padding-bottom:12px;
	}
	/*모든텍스트창*/
	.alltxt_css{
		width:300px;
		height:37px;
		border: 1px solid #ccc;
	}
	/*submint 버튼*/
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
	<form name="" action="makeNewCompany.do" method=post>
		<table class="table_css">
			<tr>
				<td><b>회사명</b>
					<input type="hidden" value="${hiddenEmail}" name="mem_email">
				</td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="com_name" placeholder="회사명" class="alltxt_css"></td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="password" name="com_pwd" placeholder="비밀번호" class="alltxt_css"></td>
			</tr>
			<tr>
				<td><b>업종</b></td>
			</tr>
			<tr>
				<td class="txtTD_css"><input type="text" name="com_sector" placeholder="업종 입력" class="alltxt_css"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회사 설립" class="send_css"></td>
			</tr>
		</table>
	</form>	
</body>
</html>