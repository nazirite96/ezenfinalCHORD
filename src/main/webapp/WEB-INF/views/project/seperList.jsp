<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    
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

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/header.jsp"/>
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
<script src="/chord/resources/js/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<!-- custom -->
<link rel="stylesheet" href="/chord/resources/css/style_margin.css">
<link rel="stylesheet" href="/chord/resources/css/style_padding.css">
<!-- icon  -->
<script src="https://kit.fontawesome.com/1a984316ef.js"
	crossorigin="anonymous"></script>
<!-- gwjs -->
<script type="text/javascript" src="/chord/resources/js/Gw.js"></script>
<!-- taksFilesjs -->
<script type="text/javascript" src="/chord/resources/js/taksFiles.js"></script>

<!-- Air datepicker css -->
<link
	href="<%=request.getContextPath()%>/resources/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker js -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<script
	src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font-awesome CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- textArea 자동 높이 설정 -->
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<!-- Air datepicker css -->
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css"
	rel="stylesheet" type="text/css">
<!-- sungtak -->
<!-- kakaomap -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da2da3e53b6d01f803242012ae94fba6&libraries=services"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/JeCss2.css"
	rel="stylesheet" type="text/css">
<!-- tak -->
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" style="z-index : 2"
    class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="#">
              <span data-feather="home"></span>
              	목록보기<span class="sr-only">(current)</span>
            </a>
            <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>project</span>
        </h1>
          </li>
          <li class="nav-item"><a class="nav-link" href="proList.do?mem_no=${memNo }"><span data-feather="file"></span>전체</a></li>
          <c:forEach items="${boxList }" var="dto">
          <c:if test="${ dto.box_name eq '중요' }">
          	<c:set var="imp_no" value="${dto.box_no }" />
          	<li class="nav-item"><a class="nav-link" href="seperateList.do?box_no=${dto.box_no }&mem_no=${memNo}"><span data-feather="star"></span>중요</a></li>
          </c:if>
          
          </c:forEach>
          
          <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>collection</span></h1>
          
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="users"></span>전체업무</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="bar-chart-2"></span>전체일정</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>전체파일</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>담아둔글</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>내 게시글</a></li>
        </ul>

        <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>BOX</span>
        <a class="d-flex align-items-center text-muted add-folder-pop-btn" href="#addFolder" aria-label="Add a new report">
           <span data-feather="plus-circle"></span> 
         </a>
        </h1>
        <ul class="nav flex-column mb-2">
        <c:forEach items="${boxList }" var="dto" >
        <c:if test="${dto.box_name != '중요' }">
          <li class="nav-item" style="height: 35px;">
            <a class="nav-link col-lg-10 col-md-10" href="seperateList.do?box_no=${dto.box_no }&mem_no=${memNo}" style="display: inline-block;">
              <span data-feather="box"></span>
              ${dto.box_name }
            </a>
           <a href="#deleteFolder" class="folder-delete cursor-point" data-boxno="${dto.box_no}"><span data-feather="minus-circle"></span></a>
          </li>
        </c:if>
        </c:forEach>  
        
        </ul>
      </div>
    </nav>

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
      <section class="content main">

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
		<c:forEach items="${proList }" var="dto">
			<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 float-left">
				<div class="project-box">
					<!-- project title box -->
					<div class="pro-tit-box ${dto.pro_user_color }">
						<c:choose>
							<c:when test="${dto.imp_chk eq dto.pro_no}">
							<div class="check-import" data-prono="${dto.pro_no }" data-boxno="${imp_no }"><i class="fas fa-star size-20 color-yellow cursor-point"></i></div>	
							</c:when>
							<c:otherwise>
							<div class="check-import" data-prono="${dto.pro_no }" data-boxno="${imp_no }"><i class="fas fa-star size-20 color-gray-l cursor-point"></i></div>
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

<link href="/chord/resources/css/dashboard.css" rel="stylesheet">
     <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<script src="/chord/resources/js/dashboard.js"></script>
    <script src="/chord/resources/js/dashboard.js"></script>
    <script type="text/javascript" src="/chord/resources/js/Gw.js"></script>
  </body>
</html>