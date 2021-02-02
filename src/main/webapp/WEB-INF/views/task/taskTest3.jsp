<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 값 제어를 위해 jquery-->
<script	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script> 
<!-- Air datepicker css -->
<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker js -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<!-- 달력 영어 추가를 위해 커스텀 -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.en.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/task_custom.js"></script> 
<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font-awesome CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>
<body>
	<div>
		단일 달력<br/> <input type="text" id="datepicker1" class="datepicker-here">
		<i class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point" onclick="fn_dateReset(this)"></i>
		 - <input type="text" id="datepicker2" class="datepicker-here"> 
		 <i class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point" onclick="fn_dateReset(this)"></i>
	</div>
	<br />
	<br />
	<br />
</body>
<script type="text/javascript">
window.alert(${msg});

var date = new Date();
var dp = $('#datepicker1').datepicker({
  //년-월-일
  startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
  language: 'ko',
  autoClose: true,
  //선택한 날짜를 가져옴
  onSelect: function (date) {
      var endNum = date;
      //종료일 datepicker에 최소날짜를 방금 클릭한 날짜로 설정
      $('#datepicker2').datepicker({
          minDate: new Date(endNum),
      });
  }
}).data('datepicker');
var dp2 = $('#datepicker2').datepicker({
  startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),  // 시간, 분은 00으로 초기 설정
  language: 'ko',
  autoClose: true,
  //선택한 날짜를 가져옴
  onSelect: function (date) {
      var startNum = date;
      $('#datepicker1').datepicker({
          //시작일 datepicker에 최대날짜를 방금 클릭한 날짜로 설정
          maxDate: new Date(startNum),
      });
  }
}).data('datepicker');
</script>

</html>