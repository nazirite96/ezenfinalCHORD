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
				<section class="content project-detail">
					<div class="project-wrap">
						<!-- project left content:s -->
						<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 padleft-0">
							<!-- project title(프로젝트 제목):s -->
							<div id="proTitle" class="pro-detail-box project-title default-back-color">
								<div class="pro-tit check-import">
											<i class="fas box-ful size-20 color-gray-l maright-15 cursor-point"></i>
									<span class="size-20 color-white">담아둔 글</span>
								</div>
							</div>
																			<script type="text/javascript"
														src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da2da3e53b6d01f803242012ae94fba6&libraries=services"></script>
						
							<div class="table-responsive"></div>

							<!-- 타임라인 : start -->
							<c:forEach var="dto" items="${list }">
								<div class="timeline-box martop-20">

									<input type="hidden" class="col-no" data-no="${dto.tim_no }">
									<input type="hidden" class="col-kind"
										data-kind="${dto.cont_kind }"> <input type="hidden"
										class="col-kindno" data-kindno="${dto.cont_no }"> <input
										type="hidden" class="col-prono" data-prono="${dto.pro_no }">
									<input type="hidden" class="col-memno"
										data-memno="${dto.mem_no }">
									<!-- timeline header:s -->
									<div class="timeline-header back-color-white">
										<!-- article writer info -->
										<div class="article-writer-info">
											<dl>
												<dt class="posi-re maright-15 cursor-point"
													onclick="fn_openPopup(this)" data-id="${timeLine.mem_id }"
													data-nick="${timeLine.mem_no }" data-my="${memVo.mem_id }">
													<i class="flow-icon icon-circle circle-s"></i> <img
														src="/chord/resources/img/user-pic-sample.png" width="40">
												</dt>
												<dd>
													<strong class="dis-block size-18 color-black">작성자
														: ${dto.mem_no }</strong> <span
														class="dis-block size-14 color-gray-l"> 작성시간
														${dto.tim_date } </span>
												</dd>
											</dl>
										</div>
										<!-- article icon : s -->
										<ul class="article-top-icon">
											
										
										</ul>
										<!-- article icon : f -->
									</div>
									<!-- timeline header:f -->
									<div class="timeline-content">
										<c:choose>
											<c:when test="${dto.cont_kind eq 'post' }">
												<!-- 기본글 : start -->
												<div class="timeline-article con-article">
													<!-- 내용:s -->
													<div class="article-txt">
														<pre>${dto.tim_cont}</pre>
													</div>
													<!-- 내용:f -->

													<!-- 이미지:s -->
													<div class="article-img martop-20">

														<div class="swiper-container-img">
															<div class="swiper-wrapper">
																<!-- 
																<c:forEach items="${timeLine.filesList }" var="filesVo">
																<c:if test="${filesVo.files_kind == 'img' }">
														<div class="swiper-slide img-con"
															style="background-image:url('/files/view?files_no=${filesVo.files_no}')"></div>
														 	</c:if>
															</c:forEach>-->
															</div>
															Add Arrows
															<div class="swiper-button-next"></div>
															<div class="swiper-button-prev"></div>
														</div>

													</div>
													<!-- 이미지:f -->

													<!-- 파일리스트:s -->
													<div class="article-file float-left" style="width: 100%;">
														<!-- 
													<c:forEach items="${timeLine.filesList }" var="filesVo">
														<c:if test="${filesVo.files_kind == 'fil' }">-->
														<div class="upload-file-info float-left martop-20">
															<dl>
																<dt>
																	<i class="dis-inblock file-icon"
																		data-name="${filesVo.files_name }"></i>
																</dt>
																<dd>
																	<span class="dis-block size-18 color-black">${filesVo.files_name }</span>
																	<span class="dis-block martop-5 size-14 color-gray">${filesVo.files_size }</span>
																</dd>
															</dl>
															<a href="/files/download?files_no=${filesVo.files_no }"
																class="file-down-btn"><i
																class="fas fa-download maright-10"></i> 다운로드</a>
														</div>
														<!-- </c:if>
													</c:forEach>-->

													</div>
													<!-- 파일리스트:f -->
												</div>


												
												<!-- 기본글 : finsh -->
											</c:when>
											<c:when test="${dto.cont_kind eq 'task' }">
												<!-- 업무글 : start -->
												<div class="timeline-article con-task">

													<!-- 업무명:s -->
													<div class="input-box">
														<input type="text" class="font-bold size-18"
															placeholder="업무명을 입력하세요." value="${dto.tim_cont }"
															readonly>
													</div>
													<!-- 업무명:f -->
													<!-- 업무상태:s -->
													<div class="input-box martop-15">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-user-clock"></i>
															</dt>
															<dd>
																<input type="hidden" class="edit-confirm"
																	data-taskno="${dto.taskDTO.task_no }">
																<div class="task-state-list">

																	<c:set var="sReq" value="" />
																	<c:set var="sPro" value="" />
																	<c:set var="sFee" value="" />
																	<c:set var="sCom" value="" />
																	<c:set var="sHol" value="" />

																	<c:choose>
																		<c:when test="${dto.taskDTO.task_state == '요청' }">
																			<c:set var="sReq" value="checked" />
																		</c:when>
																		<c:when test="${dto.taskDTO.task_state == '진행' }">
																			<c:set var="sPro" value="checked" />
																		</c:when>
																		<c:when test="${dto.taskDTO.task_state == '피드백' }">
																			<c:set var="sFee" value="checked" />
																		</c:when>
																		<c:when test="${dto.taskDTO.task_state == '완료' }">
																			<c:set var="sCom" value="checked" />
																		</c:when>
																		<c:when test="${dto.taskDTO.task_state == '보류' }">
																			<c:set var="sHol" value="checked" />
																		</c:when>
																	</c:choose>
																	<label class="${sReq }"
																		onchange="fn_editTaskState(this)"> 요청<input
																		type="radio" name="edit-task-state" value="요청"
																		class="dis-none task-re">
																	</label> <label class="${sPro }"
																		onchange="fn_editTaskState(this)"> 진행<input
																		type="radio" name="edit-task-state" value="진행"
																		class="dis-none task-pr">
																	</label> <label class="${sFee }"
																		onchange="fn_editTaskState(this)"> 피드백<input
																		type="radio" name="edit-task-state" value="피드백"
																		class="dis-none task-fb">
																	</label> <label class="${sCom }"
																		onchange="fn_editTaskState(this)"> 완료<input
																		type="radio" name="edit-task-state" value="완료"
																		class="dis-none task-sc">
																	</label> <label class="${sHol }"
																		onchange="fn_editTaskState(this)"> 보류<input
																		type="radio" name="edit-task-state" value="보류"
																		class="dis-none task-hd">
																	</label>
																</div>
															</dd>
														</dl>
													</div>
													<!-- 업무상태:f -->

													<!-- 담당자:s -->
													<div class="input-box martop-15" style="height: inherit">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-user-plus"></i>
															</dt>
															<dd class="posi-re">

																<!-- 담당자 리스트 -->
																<div class="task-user-list">
																	<c:if test="${dto eq null }">
																		<p class="mar-0 pad-0">담당자 없음</p>
																	</c:if>
																	<%-- <c:forEach items="${dto.tuList }" var="tuVo">
						<div class="name-tag">
							<img src="/mem/pic?mem_id=${tuVo.tu_mem_id }" width="24">
							<strong class="marleft-10">${tuVo.mem_nick }</strong>
							<i class="fas fa-times-circle marleft-15" style="display:none"></i>
							<input type="hidden" name="tu_mem_id" value="${tuVo.tu_mem_id }">
						</div>
					</c:forEach> --%>
																</div>
															</dd>
														</dl>
													</div>
													<!-- 담당자:f -->

													<!-- 시작일:s -->
													<div class="input-box martop-15 add-item-box">
														<dl>
															<dt class="maright-20">
																<i class="flow-icon icon-task icon-sDate"></i>
															</dt>
															<dd class="posi-re">
																<input type="text" placeholder="시작일"
																	value="${dto.taskDTO.task_start_date }" readonly />
															</dd>
														</dl>
													</div>
													<!-- 시작일:f -->

													<!-- 마감일:s -->
													<div class="input-box martop-15 add-item-box">
														<dl>
															<dt class="maright-20">
																<i class="flow-icon icon-task icon-fDate"></i>
															</dt>
															<dd class="posi-re">
																<input type="text" placeholder="마감일"
																	value="${dto.taskDTO.task_end_date }" readonly />
															</dd>
														</dl>
													</div>
													<!-- 마감일:f -->

													<!-- 우선순위:s -->
													<div class="input-box martop-15 add-item-box">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-flag"></i>
															</dt>
															<dd class="posi-re">
																<span class="task-rank"> <c:choose>
																		<c:when test="${dto.taskDTO.task_priority == null}">
																			<p class="mar-0 pad-0 color-gray">우선순위</p>
																		</c:when>
																		<c:otherwise>
																			<c:choose>
																				<c:when test="${dto.taskDTO.task_priority == '낮음'}">
																					<i class="flow-icon rank-icon icon-low"></i>${dto.taskDTO.task_priority }
								</c:when>
																				<c:when test="${dto.taskDTO.task_priority == '보통'}">
																					<i class="flow-icon rank-icon icon-basic"></i>${dto.taskDTO.task_priority }
								</c:when>
																				<c:when test="${dto.taskDTO.task_priority == '높음'}">
																					<i class="flow-icon rank-icon icon-high"></i>${dto.taskDTO.task_priority }
								</c:when>
																				<c:when test="${dto.taskDTO.task_priority == '긴급'}">
																					<i class="flow-icon rank-icon icon-emer"></i>${dto.taskDTO.task_priority }
								</c:when>
																			</c:choose>
																		</c:otherwise>
																	</c:choose>
																</span>
															</dd>
														</dl>
													</div>
													<!-- 우선순위:f -->

													<button type="button" class="add-item-btn"
														onclick="fn_addItem(this)">
														<i class="fas fa-angle-down maright-10"></i> 추가 항목 입력
													</button>

													<!-- 내용:s -->
													<div class="article-txt martop-50">
														<pre>${dto.taskDTO.task_content }</pre>
													</div>
													<!-- 내용:f -->

													<!-- 이미지:s -->
													<div class="article-img martop-20">
														<div class="swiper-container-img">
															<div class="swiper-wrapper">
																<%-- <c:forEach items="${dto.filesList }" var="filesVo"> 
					<c:if test="${filesVo.files_kind == 'img' }">
						<div class="swiper-slide img-con" style="background-image:url('/files/view?files_no=${filesVo.files_no}')"></div>
					</c:if>
				</c:forEach>
				--%>
															</div>
															<!-- Add Arrows -->
															<div class="swiper-button-next"></div>
															<div class="swiper-button-prev"></div>
														</div>
													</div>
													<!-- 이미지:f -->

													<!-- 파일리스트:s -->
													<div class="article-file martop-20">
														<%-- <c:forEach items="${dto.filesList }" var="filesVo">
			<c:if test="${filesVo.files_kind == 'fil' }">
				<div class="upload-file-info float-left martop-20">
					<dl>
						<dt>
							<i class="dis-inblock file-icon" data-name="${filesVo.files_name }"></i>
						</dt>
						<dd>
							<span class="dis-block size-18 color-black">${filesVo.files_name }</span>
							<span class="dis-block martop-5 size-14 color-gray">${filesVo.files_size }</span>
						</dd>
					</dl>
					<a href="/files/download?files_no=${filesVo.files_no }" class="file-down-btn"><i class="fas fa-download maright-10"></i> 다운로드</a>
				</div>
			</c:if>
		</c:forEach> --%>
													</div>
													<!-- 파일리스트:f -->

												</div>


												<!-- 업무글 : finsh -->
											</c:when>
											<c:when test="${dto.cont_kind eq 'schd' }">
												<!-- 스케쥴글 : start -->
												<div class="timeline-article con-schedule">
													<div class="container">
														<div class="schedule-header">
															<dl>
																<dt class="maright-15">
																	<span
																		class="dis-block font-thin size-20 color-red text-center">${fn:substring(dto.schdDTO.time_start_date, 5, 7) }월</span>
																	<strong
																		class="dis-block font-bold size-40 color-black text-center">${fn:substring(dto.schdDTO.time_start_date, 8, 10) }</strong>
																</dt>
																<dd class="font-bold size-20 color-black">${dto.schdDTO.tim_cont }</dd>
																<dd class="martop-10 font-bold size-16 color-black">${dto.schdDTO.time_start_date }
																	- ${dto.schdDTO.time_end_date }</dd>
															</dl>
														</div>
											
									
														<div class="input-box martop-15" style="height: inherit">
															<dl>
																<dt class="maright-20">
																	<i class="fas fa-user-plus"></i>
																</dt>
																<dd class="posi-re">

																	<!-- 담당자 리스트 -->
																	<div class="task-user-list">
																		<c:if test="${empty dto.schdDTO.partic}">
																			<p>담당자 없음</p>
																		</c:if>
																		
																		
																		<c:if test="${!empty dto.schdDTO.partic}">
																		<c:forEach items="${dto.schdDTO.partic }" var="tu_mem" >
																			<div class="name-tag">
																			<img src="/chord/resources/img/sample.png" width="24"
                                                                				  class="cursor-point">
																				 <strong class="marleft-10">${tu_mem.mem_name}</strong>
																				<i class="fas fa-times-circle marleft-15"
																					style="display: none"></i> <input type="hidden"
																					name="tu_mem_id" value="${tu_mem.mem_no}">
																			</div>
																		</c:forEach>
																		</c:if>
																	</div>
																</dd>
															</dl>
														</div>

														<!-- 위치 검색:s -->
														<c:choose>
															<c:when test="${dto.schdDTO.schd_loc != null }">
																<div class="input-box">
																	<dl>
																		<dt class="maright-20">
																			<i class="fas fa-map-marker-alt"></i>
																		</dt>
																		<dd>
																			<div class="dis-block marbtm-15">${dto.schdDTO.schd_loc }<a
																					href="https://maps.google.com?q=${dto.schdDTO.schd_loc }"
																					target="google_blank" class="marleft-15">지도보기</a>
																			</div>
																				<div id="map" class="dis-block" style="height: 50px">
																			</div>
																		</dd>
																	</dl>
																</div>
															</c:when>
														</c:choose>
														<!-- 위치 검색:f -->

														<!-- 메모:s -->
														<c:choose>
															<c:when test="${dto.schdDTO.schd_memo != null}">
																<div class="input-box martop-15">
																	<dl>
																		<dt class="maright-20">
																			<i class="fas fa-sticky-note"></i>
																		</dt>
																		<dd>${dto.schdDTO.schd_memo }</dd>
																	</dl>
																</div>
															</c:when>
														</c:choose>
														<!-- 메모:f -->

														<!-- 알람:s -->

														<div class="input-box martop-15" style="border: 0">
															<dl>
																<dt class="maright-20">
																	<i class="fas fa-bell"></i>
																</dt>
																<dd>미리알림 없음</dd>
															</dl>
														</div>
														<!-- 알람:f -->
													</div>
												</div>


												<!-- 일정 수정:s -->
												<form action="schdUpdate.do"
													class="article-edit-form" method="get">
													<input type="hidden" name="schd_no"
														value="${dto.schdDTO.schd_no }"> <input
														type="hidden" name="pro_no" value="${proVo.pro_no }">
													<!-- article edit box:s -->
													<div class="article-edit-box">

														<!-- 일정제목:s -->
														<div class="input-box">
															<input type="text" name="tim_cont"
																class="font-bold size-18"
																value=" ${dto.schdDTO.tim_cont }" required="required">
														</div>
														<!-- 일정제목:f -->

														<!-- 일정 시간 설정:s -->
														<div class="input-box martop-15">
															<dl>
																<dt class="maright-20">
																	<i class="far fa-clock"></i>
																</dt>
																<dd>
																	<input type="hidden"
																		value="${dto.schdDTO.time_start_date }   -   ${dto.schdDTO.time_end_date }"
																		name="defaultDate" data-range="true"
																		data-multiple-dates-separator="   -   "
																		style="width: 100%" data-time-format='hh:ii'/>
																		 <input type="text"
																		placeholder="${dto.schdDTO.time_start_date }   -   ${dto.schdDTO.time_end_date }"
																		data-range="true"
																		data-multiple-dates-separator="   -   "
																		class="datepicker-here" id="datetime" name="datetime"
																		style="width: 100%" data-time-format='hh:ii'/>
																</dd>
															</dl>
														</div>
														<!-- 일정 시간 설정:f -->
														<!-- 위치 검색:s -->
														<div class="input-box martop-15" style="height:inherit">
															<dl>
																<dt class="maright-20"><i class="fas fa-user-plus"></i></dt>
																<dd class="posi-re">
																	<input type="text" id="taskUser" placeholder="담당자 추가" onfocus="fn_taskManagerFocus(this)">
																	
																	<!-- 담당자 리스트 -->
																	<div class="task-user-list">
																		<c:forEach items="${dto.schdDTO.partic }" var="tu_mem">
																			<div class="name-tag">
																				<img src="/chord/resources/img/sample.png" width="24"
												                                                                				  class="cursor-point">
																				<strong class="marleft-10">${tu_mem.mem_name}</strong>
																				<i class="fas fa-times-circle marleft-15" data-no="${tu_mem.mem_no }" onclick="fn_taskUserDelete(this)"></i>
																			</div>
																		</c:forEach>
																	</div>
																</dd>
															</dl>
														</div>
														
														
														
														
														<!-- 위치 검색:f -->
														<div class="input-box martop-15">
															<dl>
																<dt class="maright-20">
																	<i class="fas fa-map-marker-alt"></i>
																</dt>
																<c:choose>
																	<c:when test="${dto.schdDTO.schd_loc != null }">
																		<dd>
																			<input id="searchInput2" name="schd_loc"
																				class="controls" type="text" onkeyup="mapServise2()"
																				value="${dto.schdDTO.schd_loc }" style="width: 90%">
																		
																		</dd>
																	</c:when>
																	<c:otherwise>
																		<dd>
																			<input id="searchInput2" name="schd_loc"
																				class="controls" type="text" style="width: 90%">
																		</dd>
																	</c:otherwise>
																</c:choose>
															</dl>
														</div>



														<script>
			$('.datepicker-here').datepicker({
				timepicker : true,
				language : 'ko',
				startMinute : 0,
				maxMinutes : 50,
				minutesStep : 10,
				autoClose : true
			})
		</script>


														<!-- 메모:s -->
														<div class="input-box martop-15">
															<dl>
																<dt class="maright-20">
																	<i class="fas fa-sticky-note"></i>
																</dt>
																<dd>
																	<c:choose>
																		<c:when test="${dto.schdDTO.schd_memo !=null }">
																			<textarea rows="2" cols="" name="schd_memo">${dto.schdDTO.schd_memo }</textarea>
																		</c:when>
																		<c:otherwise>
																			<textarea rows="2" cols="" name="schd_memo"></textarea>
																		</c:otherwise>
																	</c:choose>
																</dd>
															</dl>
														</div>
														<!-- 메모:f -->

												<!-- 알람:s -->
												<div class="input-box martop-15">
													<dl>
														<dt class="maright-20">
															<i class="fas fa-bell"></i>
														</dt>
														<dd>
															<select id="alert_time"
																onchange="getSelectValue(this.form);">
																<option value="0">없음</option>
															</select>
														</dd>
													</dl>
												</div>
												<!-- 알람:f -->
											</div>
							
											<!-- article edit box:f -->

											<!-- article edit dn:s -->
											<div class="article-edit-dn">
												<!-- submit & cancel 버튼 -->
												<input type="submit" value="수정하기"
													class="article-submit-btn font-bold size-16 color-white text-center default-back-color">
												<input type="button" value="취소"
													onclick="fn_editCancel(this)"
													class="article-submit-btn maright-10 font-bold size-16 color-gray text-center back-color-white"
													style="border: 1px solid #ddd">
											</div>
											<!-- article edit dn:f -->
										</form>


												<!-- 일정 수정:f -->
												<!-- 스케쥴글 : finsh -->
											</c:when>
											
											<c:when test="${dto.cont_kind eq 'todo' }">
												<!-- 할일글 : start -->


												<!-- 할일글 : finsh -->
											</c:when>
										</c:choose>
									</div>
									<!-- timeline footer:s -->
									<div class="timeline-footer">

										<!--댓글 개수:s -->
										<div class="article-etc-info">


											<!-- 댓글 개수 -->
											<div class="comment-count default-back-color color-white">
												<i class="fas fa-comment maright-10"></i>
												${dto.repList.size()}개
											</div>

											<!-- 좋아요 / 댓글작성 / 담아두기 버튼 -->
											<ul class="article-etc-menu martop-10 marbtm-0">
												<li class="cursor-point" onclick="fn_commentFocus(this)"><i
													class="fas fa-comment-alt maright-10"></i> 댓글작성</li>
												<c:choose>
													<c:when test="${dto.coll_chk != dto.tim_no}">
														<li class="cursor-point coll-btn"
															data-prono="${proUserDTO.pro_no }" data-memno="${memNo }"><i
															class="fas fa-bookmark maright-10"></i><span>담아두기</span></li>
													</c:when>
													<c:otherwise>
														<li class="cursor-point coll-btn  default-color"
															data-prono="${proUserDTO.pro_no }" data-memno="${memNo }"><i
															class="fas fa-bookmark maright-10"></i> <span>담아두기 취소</span></li>
													</c:otherwise>
												</c:choose>

											</ul>
										</div>
										<!-- 좋아요 / 댓글 개수:f -->

										<!-- 댓글:s -->
										<div class="timeline-comment-wrap">
											<c:forEach items="${dto.repList }" var="repDTO"
												varStatus="status">
												<!-- 댓글 리스트:s -->
												<div class="comment-list-box" data-repno="${repDTO.rep_no}"
													data-prono="${dto.pro_no }">
													<dl>
														<dt class="posi-re cursor-point"
															onclick="fn_openPopup(this)" data-id="id"
															data-nick="nick" data-my="manager">
															<i class="flow-icon icon-circle circle-s-re"></i> <img
																src="/chord/resources/img/user-pic-sample.png"
																width="40">
														</dt>
														<dd class="posi-re">

															<!-- 댓글 작성자 정보 -->
															<div class="comment-user-info">
																<div
																	class="dis-inblock font-bold size-15 color-black maright-10">${repDTO.mem_no }</div>
																<div class="dis-inblock size-15 color-gray maright-20"></div>
																<!-- 												<div class="dis-inblock size-15 color-gray cursor-point" onclick="fn_likeChange(this)"> -->
																<!-- 													<i class="fas fa-thumbs-up maright-10"></i><span>좋아요</span> -->
																<!-- 												</div> -->
															</div>

															<!-- 댓글내용 -->
															<div class="article-txt martop-5">
																<pre class="font-thin size-16 color-gray">${repDTO.rep_cont }</pre>
															</div>

															<!-- 댓글 이미지 목록 : s 
															<div class="comment-img-list">
																<c:forEach items="${repList['filesList'] }" var="filesVo">
																	<c:if test="${filesVo.files_kind == 'img' }">
																		<div class="upload-img-info martop-20">
																			<div class="upload-img"
																				style="background-image:url('resources/img/sample.png')"></div>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
															-->
															<!-- 댓글 이미지 목록 : f -->

															<!-- 댓글 첨부파일 목록 : s 
															<div class="comment-file-list">
																<c:forEach items="${repList['filesList'] }"
																	var="filesVo">
																	<c:if test="${filesVo.files_kind == 'fil' }">
																		<div class="upload-file-info martop-10">
																			<dl>
																				<dt>
																					<i class="dis-inblock file-icon-s"
																						data-name="${filesVo.files_name }"></i>
																				</dt>
																				<dd>
																					<div class="dis-block size-14 color-black"
																						style="height: 26px; line-height: 26px;">
																						${filesVo.files_name }<span
																							class="marleft-10 color-blue-l">(${filesVo.files_size })</span>
																					</div>
																					<a
																						href="/files/download?files_no=${filesVo.files_no }"
																						class="comment-file-down">다운로드</a>
																				</dd>
																			</dl>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
															-->
															<!-- 댓글 첨부파일 목록 : f -->

															
															<c:if test="${repDTO.mem_no == dto.mem_no }">
																<!-- 댓글 수정,삭제 버튼 -->
																<ul class="comment-edit-btn">
																	
																</ul>
															</c:if>
														</dd>
													</dl>
												</div>
												<!-- 댓글 리스트:f -->
											</c:forEach>

											<!-- 댓글 입력:s -->
											<form action="insertRep.do" method="get"
												enctype="multipart/form-data">
												<input type="hidden" class="timeline_mem_no" name="mem_no"
													value="${proUserDTO.mem_no }"> <input type="hidden"
													class="timeline_no" name="tim_no" value=""> <input
													type="hidden" class="timeline_pro_no" name="pro_no"
													value="${proUserDTO.pro_no }">
												<div class="comment-insert-box">
													<dl>
														<dt class="posi-re">
															<i class="flow-icon icon-circle circle-s-re"></i> <img
																src="/chord/resources/img/user-pic-sample.png"
																width="40">
														</dt>
														<dd>
															<div class="comment-textarea">
																<textarea rows="5" cols="50" class="rep_cont"
																	name="rep_cont"
																	placeholder="댓글을 입력하세요.(Enter는 입력, shift + Enter는 줄바꿈)"
																	onkeyup="autoTextarea(this, 36, 300)"
																	onkeydown="fn_commentKeyDown(event, this)" required></textarea>
															</div>

															<!-- 파일첨부 -->
															<label for="commentFile_${start.count }" class="marbtm-0">
																<i
																class="fas fa-paperclip martop-10 size-24 color-gray cursor-point"></i>
															</label> <input type="file" id="commentFile_${start.count }"
																class="dis-none" onchange="commentFileUpload(this)">

															<!-- 이미지 목록이 나올부분 -->
															<div class="comment-upload-img-list"></div>

															<!-- 첨부파일 목록이 나올부분 -->
															<div class="comment-upload-file-list"></div>

														</dd>
													</dl>
												</div>
											</form>
											<!-- 댓글 입력:f -->
										</div>
										<!-- 댓글:f -->

									</div>
									<!-- timeline footer:f -->


								</div>
							</c:forEach>
							<!-- 타임라인 : finish -->


							<script>
											function getSelectValue(frm) {
												frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
												frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
											}
									</script>

						</div>
						<!-- project left : finish -->
						<!-- project right : start -->

						<!-- 이전화면으로 -->
						<div id="STATICMENU"
							class="col-xs-12 col-sm-12 col-md-3 col-lg-3 padright-0">
							<div class="pro-right-box">
								<a href="proList.do?mem_no=${memNo } "
									class="pro-prev-btn size-18 default-color"> <i
									class="fas fa-angle-left maright-15"></i> 이전화면
								</a>
							</div>

							<!-- 파일함,업무,일정,할일,투표 -->
							<div class="pro-right-box martop-15">
								<ul class="pro-gather-nav">
									<li><a href="#"> <i
											class="fas fa-download color-blue-l"></i> <span
											class="dis-block size-17 color-gray">파일함</span>
									</a></li>
									<li><a href="#"> <i class="fas fa-laptop colo-green-l"></i>
											<span class="dis-block size-17 color-gray">업무</span>
									</a></li>
									<li><a href="#"> <i
											class="far fa-calendar-alt color-red"></i> <span
											class="dis-block size-17 color-gray">일정</span>
									</a></li>
									<li><a href="#todoOnly" class="pro-todo-only"> <i
											class="fas fa-list-ul color-pupple"></i> <span
											class="dis-block size-17 color-gray">할일</span>
									</a></li>
								</ul>
							</div>

							<script type="text/javascript">
$(function(){
	// 우측 '할일'모아보기 아이콘 클릭 시
	$(".pro-todo-only").on("click", function(){
		var tabBox = $(".pro-tab-box");			// 상단 탭박스
		var fixBox = $(".top-fixed-article");	// 고정글 박스
		var timelineBox = $(".timeline-box");	// 전체 타임라인 박스
		var collTodoTit = $(".coll-todo-tit");	// '할일'모아보기 제목
		var collVoteTit = $(".coll-vote-tit");	// '투표'모아보기 제목
		var timeTodo = $(".con-todo").parent().parent(".timeline-box");		// '할일'박스
		var timeVote = $(".con-vote").parent().parent(".timeline-box");		// '투표'박스
		
		tabBox.hide();			// 탭박스 가리기
		fixBox.hide();			// 고정글 가리기
		collVoteTit.hide();		// '투표' 모아보기 제목 가리기
		collTodoTit.fadeIn();	// '할일' 모아보기 제목 보이기
		timelineBox.hide();		// 전체 타임라인 박스 가리기
		timeTodo.fadeIn();		// '할일'박스 보이기
		timeVote.hide();		// '투표'박스 가리기
	});
	
	// 우측 '투표'모아보기 아이콘 클릭 시
	$(".pro-vote-only").on("click", function(){
		var tabBox = $(".pro-tab-box");			// 상단 탭박스
		var fixBox = $(".top-fixed-article");	// 고정글 박스
		var timelineBox = $(".timeline-box");	// 전체 타임라인 박스
		var collTodoTit = $(".coll-todo-tit");	// '할일'모아보기 제목
		var collVoteTit = $(".coll-vote-tit");	// '투표'모아보기 제목
		var timeTodo = $(".con-todo").parent().parent(".timeline-box");		// '할일'박스
		var timeVote = $(".con-vote").parent().parent(".timeline-box");		// '투표'박스
		
		tabBox.hide();			// 탭박스 가리기
		fixBox.hide();			// 고정글 가리기
		collVoteTit.fadeIn();	// '투표' 모아보기 제목 보이기
		collTodoTit.hide();		// '할일' 모아보기 제목 가리기
		timelineBox.hide();		// 전체 타임라인 박스 가리기
		timeTodo.hide();		// '할일'박스 가리기
		timeVote.fadeIn();		// '투표'박스 보이기
	});
	
});

// '할일', '투표' 모아보기 제목 클릭시
function fn_collCancel(){
	var timeline = $(".timeline-box");
	var timeTodo = $(".con-todo").parent().parent(".timeline-box");
	var timeVote = $(".con-vote").parent().parent(".timeline-box");
	var timeTodoTit = $(".coll-todo-tit");
	var timeVoteTit = $(".coll-vote-tit");
	var fixBox = $(".top-fixed-article");
	var tabBox = $(".pro-tab-box");

	timeTodo.hide();
	timeVote.hide();
	timeTodoTit.hide();
	timeVoteTit.hide();
	timeline.fadeIn();
	fixBox.fadeIn();
	tabBox.fadeIn();
}
</script>

							<!-- 초대하기 button : s -->
							<div class="pro-right-box martop-15">
								<a href="#invitePop"
									class="right-link-btn invite-btn default-back-color color-white">
									<i class="fas fa-user-plus maright-10"></i>초대하기
								</a>
							</div>
							<!-- 초대하기 button : f -->



							<!-- 프로젝트 채팅 button : s -->
							<div class="pro-right-box martop-15">
								<a class="right-link-btn back-color-green-l color-white"
									id="proChat" style="cursor: pointer;"> <i
									class="fas fa-comments maright-10"></i>프로젝트 참여자
								</a>
							</div>
							<!-- 프로젝트 채팅 button : f -->

							<!-- 프로젝트 참여자 리스트 : s -->
							<div class="pro-right-box pro-right-user-list" data-simplebar>
								<!-- 프로젝트 관리자 : s -->
								<ul class="nav flex-column block">
									<li class="nav-item"><span
										class="dis-block marbtm-5 padleft-15 padright-15 color-gray size-16">프로젝트
											관리자</span></li>
									<li class="nav-item"><c:forEach
											items="${invitedProUserList }" var="manager">
											<c:if test="${manager.pro_user_man_chk == 'manager' }">
												<dl class="marbtm-0 cursor-point"
													onclick="fn_openPopup(this)" data-id="${manager.mem_no }"
													data-nick="${manager.mem_no }" data-my="${manager.mem_no }">
													<dt class="posi-re">
														<i class="icon-circle circle-xs cursor-point"></i> <img
															src="/chord/resources/img/sample.png" width="24"
															class="cursor-point">
													</dt>
													<dd>
														<span class="size-18 color-gray">${manager.mem_no }번
															이름</span>
														<!-- <i class="far fa-comment size-18 cursor-point"></i> -->
													</dd>
												</dl>
											</c:if>
										</c:forEach></li>
									<!-- 프로젝트 관리자 : f -->
									<!-- 프로젝트 참여자 : s -->
									<li class="nav-item"><span
										class="dis-block float-left martop-15 marbtm-5 padleft-15 padright-15 color-gray size-16">프로젝트
											참여자(${invitedProUserList.size()-1 })</span></li>
									<li class="nav-item"><c:forEach
											items="${invitedProUserList }" var="invitedUser">
											<c:if test="${invitedUser.pro_user_man_chk == 'normal' }">
												<dl class="marbtm-0 cursor-point"
													onclick="fn_openPopup(this)"
													data-id="${invitedUser.mem_no }번 id"
													data-nick="${invitedUser.mem_no }"
													data-my="${invitedUser.mem_no }">
													<dt class="posi-re">
														<i class="icon-circle circle-xs cursor-point"></i> <img
															src="/chord/resources/img/sample.png" width="24"
															class="cursor-point">
													</dt>
													<dd>
														<span class="size-18 color-gray">${invitedUser.mem_no }번
															이름</span>
														<!-- <i class="far fa-comment size-18 cursor-point"></i> -->
													</dd>
												</dl>
											</c:if>
										</c:forEach></li>
								</ul>

							</div>
						</div>
						<!-- 프로젝트 참여자 : f -->

						

						<script type="text/javascript">
		
	</script>

						<!-- 프로젝트 참여자 리스트 : f -->



						
					

						<script type="text/javascript">
$(function(){

	// 초대하기 layerPop 띄우기
	$(".invite-btn").click(function(){
		var $href = $(this).attr('href');
		layer_popup($href);
	});
	
	
	
	// 초대하기 버튼 클릭 이벤트
	$(".invate-frm-submit").click(function(){
		var item = $(this);
		var popCon = item.parent().siblings(".pop-con-sub");
		var selectUserList = popCon.children(".select-user-list");
		var ptnInviteForm = popCon.parent("form");
		
		// 초대한 회원이 없을 때
		if(selectUserList.children("div").length == 0){
			alertCustom("초대할 회원을 선택해주세요","alert-danger");
			return false;
		}
		
		// submit
		ptnInviteForm.submit();
		
	});

});
</script>
					</div>
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