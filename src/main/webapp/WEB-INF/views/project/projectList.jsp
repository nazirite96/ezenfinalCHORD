<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 떠다니는 메뉴 -->

<script type="text/javascript">
 var stmnLEFT = 10; // 오른쪽 여백 
 var stmnGAP1 = 0; // 위쪽 여백 
 var stmnGAP2 = 50; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
 var stmnBASE = 50; // 스크롤 시작위치 
 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
 var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
 var stmnTimer; 
 
 function RefreshStaticMenu() { 
  var stmnStartPoint, stmnEndPoint; 
  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
  if (stmnStartPoint != stmnEndPoint) { 
   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
   stmnRefreshTimer = stmnScrollSpeed; 
   }
  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
  } 
 function InitializeStaticMenu() {
  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
  RefreshStaticMenu();
  }
</script>

<style type="text/css">
#STATICMENU {
	margin: 0pt;
	padding: 0pt;
	position: absolute;
	right: 0px;
	top: 0px;
}
</style>

<title>Insert title here</title>
</head>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<!-- Custom styles for this template -->
	
	<link rel="stylesheet" href="/chord/resources/css/style_margin.css">
	<link rel="stylesheet" href="/chord/resources/css/style_padding.css">
	<!-- Air datepicker css -->
	<link
		href="<%=request.getContextPath()%>/resources/css/datepicker.min.css"
		rel="stylesheet" type="text/css" media="all">	
	
	
	
	<!-- Air datepicker css -->
	
	

</head>
  <body>
    <jsp:include page="/WEB-INF/views/header.jsp"/>
   <link rel="stylesheet" href="/chord/resources/css/GwCss.css">
	<script type="text/javascript">
	$(function() {
		// 탭메뉴 설정 : 탭메뉴(li)에 설정된 data-id 값과 같은 id값을 가진 content box 노출
		$("ul.tabs li").on("click", function() {
			var tab_id = $(this).attr("data-id");
			$("ul.tabs li").removeClass("active");
			$(".tabs-content").removeClass("active");

			$(this).addClass("active");
			$("#" + tab_id).addClass("active");
		});
	});
</script>
<script src="https://unpkg.com/feather-icons"></script>
	

	<!-- taksFilesjs -->
	<script type="text/javascript" src="/chord/resources/js/taksFiles.js"></script>
	<!-- Air datepicker js -->
	<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
	<!-- 달력 한글 추가를 위해 커스텀 -->
	<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
	<!-- textArea 자동 높이 설정 -->
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
	<!-- sungtak -->
	<script>
function submitgogo(){
	var schd_date = $('#schdtime').val();
	if(schd_date.length<=16){
		alert('일정의 마감시간을 설정해주삼 :>')
	}else{
		document.schdfrm.submit();
	}
}
</script>
<div class="container-fluid">
  <div class="row">
    <%@ include file="../sidebarMenu.jsp" %>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>
	<div id="proTitle" class="ccc ddd"></div>

      <h2>Section title</h2>
      <div class="table-responsive">
        
      </div>
     <div class="container">
     <div class="body-right-panel">
      <section class="content main" style="padding-left:0px;padding-right:0px;">

	<!-- alertCustom -->
	<input type="hidden" class="alert-msg" value="${msg }">
	<input type="hidden" class="alert-className" value="${className }">
	<script type="text/javascript">
		$(function(){
			var msg = $(".alert-msg").val();
			var className = $(".alert-className").val();
			
			if(msg.length != 0){
				alertCustom(msg, className);
				<%
					session.setAttribute("msg", "");
					session.setAttribute("className", "");
				%>
			}
		});
	</script>

	<!-- total count -->
	<h1>전체(${proList.size() })</h1>
	
	<!-- project list:s -->
	<div class="project-wrap">
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
			<a href="#addProject" class="project-box add-project add-pro-link">
				<i class="flow-icon icon-plus"></i>
				<strong class="dis-block martop-10 size-24 color-blue-l text-center">프로젝트 만들기</strong>
			</a>
		</div>
		
		<c:forEach items="${proList }" var="dto">
			<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 float-left">
				<div class="project-box">
					<!-- project title box -->
					<div class="pro-tit-box ${dto.pro_user_color }">
						<c:choose>
							<c:when test="${dto.imp_chk eq dto.pro_no}">
							<div class="check-import" data-prono="${dto.pro_no }" data-boxno="${imp_no }" data-proname="${dto.pro_name }"><i class="fas fa-star size-20 color-yellow cursor-point"></i></div>	
							</c:when>
							<c:otherwise>
							<div class="check-import" data-prono="${dto.pro_no }" data-boxno="${imp_no }" data-proname="${dto.pro_name }"><i class="fas fa-star size-20 color-gray-l cursor-point"></i></div>
							
							</c:otherwise>
						</c:choose>
						<span class="dis-block size-24 color-white text-center cursor-point pro-click">${dto.pro_name }</span>
					</div>
					
					<!-- project member list -->
					<div class="pro-mem-list-box dis-block cursor-point pro-click-mem">
						<ul class="pro-mem-photo">
								<li>
									<i class="icon-circle circle-s"></i>
									<img src="/chord/resources/img/user-pic-sample.png" width="40">
								</li>								
						</ul>
						<div class="pro-mem-info">
							<c:choose>
								<c:when test="${proList.size()-1 == 0 }">
									<strong>${memNo }번</strong>님 참여중
								</c:when>
								
								<c:otherwise>
									<strong>${memNo }번</strong>님 외 ${proList.size()-1 }명
								</c:otherwise>								
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<form id="detailFom" action="timeLine.do" method="get">
		<input type="hidden" id="prono" name="pro_no" value="" >
		<input type="hidden" id="memno" name="mem_no" value="${memNo }" >
		<input type="hidden" id="proname" name="pro_name" value="" >
		
	</form>
	
	<script type="text/javascript">
	$(function(){
		
		// 프로젝트 타이틀 길이에 따라 위치 다르게 적용하기
		$(".pro-click").each(function(){
			var height = $(this).height();
			var result = -(height / 2) + 10;
			$(this).css("margin-top", result+"px");
		});
		
		// project import check(main page)
		$(".check-import").on("click", function(){
			if($(this).children().hasClass("color-gray-l")){
				$(this).children().removeClass("color-gray-l");
				$(this).children().addClass("color-yellow");				
				
				var pro_no = $(this).data("prono");	
				var box_no = $(this).data("boxno");
				$.ajax({					
					url : "insertBoxPro.do",
					method : "get",
					data : {pro_no:pro_no,box_no:box_no},
					dataType : "json",
					success : function(data){
						if(data==1){
							alertCustom("변경되었습니다.", "alert-warning");
						}
					}
				});
			} else {
				$(this).children().removeClass("color-yellow");
				$(this).children().addClass("color-gray-l");
				
				var pro_no = $(this).data("prono");			
				var box_no = $(this).data("boxno");
				$.ajax({					
					
					url : "deleteBoxPro.do",
					method : "get",
					data : {pro_no:pro_no,box_no:box_no},
					dataType : "json",
					success : function(data){
						if(data==1){
							alertCustom("변경되었습니다.", "alert-warning");
						}
					}
				});
			}
		});
		
		// pro-click 클릭이벤트
		$(".pro-click").click(function(){
			var pro_no = $(this).siblings(".check-import").data("prono");
			var pro_name = $(this).siblings(".check-import").data("proname");
			$("#prono").val(pro_no);
			$("#proname").val(pro_name);
			$("#detailFom").submit();
		});
		
		// pro-click-mem 클릭이벤트
		$(".pro-click-mem").click(function(){
			var item = $(this);
			var proClick = item.siblings(".pro-tit-box").children(".pro-click");
			proClick.click();
		});
		
	});
	</script>
	<!-- project list:f -->
	
</section>
<%@include file="layerPopCon.jsp"%>
      </div>
      </div>
      
      
      
      
      
      
      
      
    </main>
  </div>
</div>

     <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
    <script type="text/javascript" src="/chord/resources/js/Gw.js"></script>
    <script>
			feather.replace()
	</script>
  </body>
</html>