<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.table_css{
		font-size: 12pt;
	}
	.allTxt_css{
		width:220px;
		height:36px;
		border: 1px solid #ccc;
	}
/*확인 버튼*/
	.chkbt_css{
		width: 100px;
	    height: 38px;
	    font-size: 12pt;
	    background-color: #7b9acc;
	    border: 1px solid #7b9acc;
	    color: white;
	}
	.info_css{
		font-size: 10px;
		color : gray;
	}

</style>
</head>
<body style="">
<h4 align="center">이메일 확인</h4><br>
<form name="emailChk_fm" action="emailCheck.do" method="post">
	<table align="center" class="table_css">
		<tr>
			<td><input type="email" name="chkEmail" class="allTxt_css" placeholder="email@gmail.com"></td>
			<td><input type="submit"  name="chkMailBt"  value="중복확인" class="chkbt_css"></td>
		</tr>
		<tr>
			<td colspan="2" align="center" class="info_css">이메일을 입력해주세요.</td>
		</tr>		
	</table>
</form>
</body>
</html>