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
	<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">	
	
	
	
	<!-- Air datepicker css -->
	
	

</head>
<body id="contentBody" onload="InitializeStaticMenu();">
	<jsp:include page="/WEB-INF/views/header.jsp" />
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

	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
			
    <link href="/chord/resources/css/JeCss2.css" rel="stylesheet">
    
    	
		

	
	<script src="/chord/resources/js/getDate.js"></script>
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
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Project</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group mr-2">
							<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
						</div>
						<button type="button"
							class="btn btn-sm btn-outline-secondary dropdown-toggle">
							<span data-feather="calendar"></span> This week
						</button>
					</div>
				</div>

				<div>타임라인</div>
<section class="content">

	<!-- task all content : s -->
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	
		<!-- task all title -->
		<strong class="dis-block marbtm-20 size-20 color-gray">전체 업무(${taskList.size() })</strong>
		
		<!-- task select toggle navigation button -->
		<a href="#taskAllCollapse" class="task-all-collapse" data-toggle="collapse" aria-expanded="false" aria-controls="taskAllCollapse">
			<i class="fas fa-list-ul maright-10"></i> 보기설정
		</a>
		
		<!-- task all select -->
		<div id="taskAllCollapse" class="task-collapse-box collapse marbtm-20">
		
			<!-- 업무구분 -->
			<div class="coll-select-box">
				<strong class="size-18 default-color">업무구분</strong>
				<ul>
					<li>
					<!-- data-id=memDTO.mem_nick -->
						<input type="radio" name="allTaskKind" id="taskAll-my" class="custom-radio-input schd-radio"
						onchange="fn_checkTaskList(this)" data-id="#">
						<label for="taskAll-my">내 업무</label>
					</li>
					<li>
						<input type="radio" name="allTaskKind" id="taskAll-re" class="custom-radio-input schd-radio"
						onchange="fn_checkTaskList(this)" data-id="#">
						<label for="taskAll-re">요청한 업무</label>
					</li>
					<li>
						<input type="radio" name="allTaskKind" id="taskAll-all" class="custom-radio-input schd-radio"
						onchange="fn_checkTaskList(this)" checked>
						<label for="taskAll-all">전체 업무</label>
					</li>
				</ul>
			</div>
			
			<script type="text/javascript">
			// 내 업무, 요청한 업무, 전체 업무 check function
			function fn_checkTaskList(el){
				var item = $(el);
				var dataId = item.attr('data-id');
				var manager = $('.table').find('.task-manager');
				var managerUser = manager.children('span');
				var writer = $('.table').find('.task-writer');
				
				$('.table tbody tr').css('display', 'none');	// 전체 tr 숨기기
				
				// 내 업무 체크시
				if(item.attr('id')=='taskAll-my') {
					managerUser.each(function(i, e){
						if(managerUser.eq(i).text() == dataId 
								&& managerUser.eq(i).parent().parent('tr').css('display') == 'none'){
							managerUser.eq(i).parent().parent('tr').show();
						}
					});
				} else if(item.attr('id') == 'taskAll-re'){	// 요청한 업무 체크시
					writer.each(function(i, e){
						if(writer.eq(i).text() == dataId
								&& writer.eq(i).parent().css('display') == 'none'){
							writer.eq(i).parent().show();
						}
					});
				} else {
					$('.table tbody tr').show();
				}
				
			}
			</script>
		
			<!-- 상태 -->
			<div class="coll-select-box martop-15">
				<strong class="size-18 default-color">상태</strong>
				<ul>
					<li>
						<input type="checkbox" id="taskAll-state-request" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-state-request">요청</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-state-progress" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-state-progress">진행</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-state-feedback" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-state-feedback">피드백</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-state-success" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-state-success">완료</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-state-hold" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-state-hold">보류</label>
					</li>
				</ul>
			</div>
		
			<!-- 우선순위 -->
			<div class="coll-select-box martop-15">
				<strong class="size-18 default-color">우선순위</strong>
				<ul>
					<li>
						<input type="checkbox" id="taskAll-pri-emergency" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-pri-emergency">긴급</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-pri-high" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-pri-high">높음</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-pri-normal" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-pri-normal">보통</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-pri-low" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-pri-low">낮음</label>
					</li>
					<li>
						<input type="checkbox" id="taskAll-pri-null" onchange="fn_checkTaskAll(this)" class="custom-check-input" checked>
						<label for="taskAll-pri-null">없음</label>
					</li>
				</ul>
			</div>
		
			<!-- 시작일 -->
			<div class="coll-select-box martop-15">
				<strong class="size-18 default-color">시작일</strong>
				<ul>
					<li>
						<input type="radio" name="startDate" id="taskAll-start-date" class="custom-radio-input schd-radio" 
						onchange="fn_checkStartDate(this)" checked>
						<label for="taskAll-start-date">전체</label>
					</li>
					<li>
						<input type="radio" name="startDate" id="taskAll-start-today" class="custom-radio-input schd-radio" 
						onchange="fn_checkStartDate(this)">
						<label for="taskAll-start-today">오늘</label>
					</li>
					<li>
						<input type="radio" name="startDate" id="taskAll-start-week" class="custom-radio-input schd-radio" 
						onchange="fn_checkStartDate(this)">
						<label for="taskAll-start-week">이번주</label>
					</li>
					<li>
						<input type="radio" name="startDate" id="taskAll-start-month" class="custom-radio-input schd-radio" 
						onchange="fn_checkStartDate(this)">
						<label for="taskAll-start-month">이번달</label>
					</li>
					<li>
						<input type="radio" name="startDate" id="taskAll-start-null" class="custom-radio-input schd-radio" 
						onchange="fn_checkStartDate(this)">
						<label for="taskAll-start-null">날짜미정</label>
					</li>
				</ul>
			</div>
		
			<!-- 마감일 -->
			<div class="coll-select-box martop-15" style="padding:0;border:0">
				<strong class="size-18 default-color">마감일</strong>
				<ul>
					<li>
						<input type="radio" name="endDate" id="taskAll-end-date" class="custom-radio-input schd-radio" 
						onchange="fn_checkEndDate(this)" checked>
						<label for="taskAll-end-date">전체</label>
					</li>
					<li>
						<input type="radio" name="endDate" id="taskAll-end-today" class="custom-radio-input schd-radio" 
						onchange="fn_checkEndDate(this)">
						<label for="taskAll-end-today">오늘까지</label>
					</li>
					<li>
						<input type="radio" name="endDate" id="taskAll-end-week" class="custom-radio-input schd-radio" 
						onchange="fn_checkEndDate(this)">
						<label for="taskAll-end-week">이번주까지</label>
					</li>
					<li>
						<input type="radio" name="endDate" id="taskAll-end-month" class="custom-radio-input schd-radio" 
						onchange="fn_checkEndDate(this)">
						<label for="taskAll-end-month">이번달까지</label>
					</li>
					<li>
						<input type="radio" name="endDate" id="taskAll-end-null" class="custom-radio-input schd-radio" 
						onchange="fn_checkEndDate(this)">
						<label for="taskAll-end-null">날짜미정</label>
					</li>
				</ul>
			</div>
			
		</div>
	
		<!-- collection content wrap : s -->
		<div class="collection-con-wrap" style="font-size:0.89rem;">
			
			<table class="table marbtm-0 text-center">
				<colgroup>
					<col width="5%">
					<col width="8%">
					<col width="10%">
					<col width="35%">
					<col width="10%">
					<col width="10%">
					<col width="7%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<td>번호</td>
						<td>상태</td>
						<td>우선순위</td>
						<td>제목</td>
						<td>담당자</td>
						<td>작성자</td>
						<td>마감일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${taskList }" var="taskDTO" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>
							<c:choose>
								<c:when test="${taskDTO['taskDTO'].task_state == '요청' }">
									<c:set var="stateClass" value="back-color-blue-l"/>
									<c:set var="dataId" value="taskAll-state-request"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_state == '진행' }">
									<c:set var="stateClass" value="back-color-green-l"/>
									<c:set var="dataId" value="taskAll-state-progress"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_state == '피드백' }">
									<c:set var="stateClass" value="back-color-orange"/>
									<c:set var="dataId" value="taskAll-state-feedback"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_state == '완료' }">
									<c:set var="stateClass" value="default-back-color"/>
									<c:set var="dataId" value="taskAll-state-success"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_state == '보류' }">
									<c:set var="stateClass" value="back-color-gray"/>
									<c:set var="dataId" value="taskAll-state-hold"/>
								</c:when>
							</c:choose>
							<span class="task-state-box ${stateClass }" data-id="${dataId }">${taskDTO['taskDTO'].task_state }</span>
						</td>
						<td>
							<c:choose>
								<c:when test="${taskDTO['taskDTO'].task_priority == '긴급' }">
									<c:set var="priClass" value="icon-emer"/>
									<c:set var="dataId" value="taskAll-pri-emergency"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_priority == '높음' }">
									<c:set var="priClass" value="icon-high"/>
									<c:set var="dataId" value="taskAll-pri-high"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_priority == '보통' }">
									<c:set var="priClass" value="icon-basic"/>
									<c:set var="dataId" value="taskAll-pri-normal"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_priority == '낮음' }">
									<c:set var="priClass" value="icon-low"/>
									<c:set var="dataId" value="taskAll-pri-low"/>
								</c:when>
								<c:when test="${taskDTO['taskDTO'].task_priority == null }">
									<c:set var="dataId" value="taskAll-pri-null"/>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${taskDTO['taskDTO'].task_priority != null }">
									<span class="task-all-rank flow-icon ${priClass }" data-id="${dataId }">${taskDTO['taskDTO'].task_priority }</span>
								</c:when>
								<c:otherwise>
									<span data-id="${dataId }">-</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td class="task-td-con">
							<span class="dis-block size-16 color-black">${taskDTO['taskDTO'].tim_cont }</span>
							<span class="dis-block size-12 color-gray">${taskDTO['taskDTO'].pro_name }</span>
						</td>
						<td class="task-manager">
						<c:choose>
							<c:when test="${taskDTO['taskUserList'].size() == 0 }">
							-
							</c:when>
							<c:when test="${taskDTO['taskUserList'].size() == 1 }">
								${taskDTO['taskUserList'][0].mem_name }
							</c:when>
							<c:otherwise>
								${taskDTO['taskUserList'][0].mem_name }님 외 ${taskDTO['taskUserList'].size()-1 }명
							</c:otherwise>
						</c:choose>
						<c:forEach items="${taskDTO['taskUserList'] }" var="taskUserVo">
							<span class="dis-none">${taskUserDTO.mem_name }</span>
						</c:forEach>
						</td>
						<td class="task-writer">${taskDTO['taskDTO'].mem_name }</td>
						<td>
							<span class="task-start-date dis-none">${taskDTO['taskDTO'].task_start_date }</span>
							<span class="task-end-date">${taskDTO['taskDTO'].task_end_date }</span>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<!-- collection content wrap : f -->
	
	</div>
	<!-- task all content : f -->
	
	<script type="text/javascript">
	// 업무 '상태', '우선순위' 체크시 리스트 show & hide
	function fn_checkTaskAll(el){
		var item = $(el);
		var id = item.attr('id');
		var stateBox = $('.table').find('span');
		
		stateBox.each(function(i, e){
			if(stateBox.eq(i).attr('data-id') == id){
				if(stateBox.eq(i).parent().parent('tr').css('display') == 'none'){
					stateBox.eq(i).parent().parent('tr').show();
				} else {
					stateBox.eq(i).parent().parent('tr').hide();
				}
			}
		});
	}
	</script>

</section>
				<!-- project right : finish -->

				<div>
				</div>
			</main>
		</div>

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
			if($(this).children("i").hasClass("color-gray-l")){
				$(this).children("i").removeClass("color-gray-l");
				$(this).children("i").addClass("color-yellow");				
				
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
				$(this).children("i").removeClass("color-yellow");
				$(this).children("i").addClass("color-gray-l");
				
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
	<!-- gwjs -->
	<script type="text/javascript" src="/chord/resources/js/Gw.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
		<!-- jjpicker -->
		<script type="text/javascript" src="/chord/resources/js/jjpicker.js"></script>
		<script>
			feather.replace()
		</script>
		</div>
</body>
</html>