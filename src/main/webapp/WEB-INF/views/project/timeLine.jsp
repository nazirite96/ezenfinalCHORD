<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!-- jQuery 3.3.1 -->
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
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
<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker js -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font-awesome CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- textArea 자동 높이 설정 -->
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<!-- Air datepicker css -->
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css" rel="stylesheet" type="text/css">
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
<!-- Custom styles for this template -->
<link href="/chord/resources/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="/chord/resources/css/GwCss.css">
</head>
<body id="contentBody" onload="InitializeStaticMenu();">
	>

	<nav
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Company
			name</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-toggle="collapse" data-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign
					out</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="sidebar-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="#">
								<span data-feather="home"></span> 목록보기<span class="sr-only">(current)</span>
						</a>
							<h1
								class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
								<span>project</span> <a
									class="d-flex align-items-center text-muted" href="#"
									aria-label="Add a new report"> <span
									data-feather="plus-circle"></span>
								</a>
							</h1></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="file"></span>전체</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="shopping-cart"></span>중요</a></li>
						<h1
							class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
							<span>collection</span><a
								class="d-flex align-items-center text-muted" href="#"
								aria-label="Add a new report"><span
								data-feather="plus-circle"></span></a>
						</h1>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="users"></span>전체업무</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="bar-chart-2"></span>전체일정</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="layers"></span>전체파일</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="layers"></span>담아둔글</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><span
								data-feather="layers"></span>내 게시글</a></li>
					</ul>

					<h1
						class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
						<span>Saved reports</span><a
							class="d-flex align-items-center text-muted" href="#"
							aria-label="Add a new report"> <span
							data-feather="plus-circle"></span>
						</a>
					</h1>
					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Current month
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Last quarter
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Social engagement
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file-text"></span> Year-end sale
						</a></li>
					</ul>
				</div>
			</nav>

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
							<div id="proTitle"
								class="pro-detail-box project-title ${proUserDTO.pro_user_color }">
								<div class="pro-tit">

									<c:choose>
										<c:when test="${proVo.imp_chk == 1 }">
											<i
												class="fas fa-star size-20 color-yellow maright-15 cursor-point"
												data-prono="22"></i>
										</c:when>
										<c:otherwise>
											<i
												class="fas fa-star size-20 color-gray-l maright-15 cursor-point"
												data-prono="22"></i>
										</c:otherwise>
									</c:choose>
									<span class="size-20 color-white">${proUserDTO.pro_name }</span>
								</div>
								<ul class="pro-edit-nav">
									<li><i
										class="fas fa-palette size-30 color-white cursor-point edit-color-btn"
										onclick="fn_editColor(this)"></i>
										<div class="edit-box edit-color-box"
											data-prono="${proUserDTO.pro_no}"
											data-memno="${proUserDTO.mem_no }">
											<div class="color-sample default-back-color">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-red">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-pink">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-orange">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-yellow-d">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-green">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-green-l">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-blue-l">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-blue-d">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-pupple">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-pupple-l">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-gray">
												<i class="fas fa-check-circle size-16"></i>
											</div>
											<div class="color-sample back-color-black">
												<i class="fas fa-check-circle size-16"></i>
											</div>
										</div></li>
									<li>
										<button id="projectEdit" type="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
											<i class="fas fa-ellipsis-v size-30 color-white"></i>
										</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="projectEdit">
											<li class="drop-tit">프로젝트 설정</li>
											<li class="cursor-point" onclick="boxProEdit()">보관함 설정</li>
											<li class="cursor-point" onclick="deleteProUser()">프로젝트
												나가기</li>
											<c:choose>
												<c:when test="${proUserDTO.pro_user_man_chk eq 'manager' }">
													<li class="cursor-point" onclick="proUpdate()">프로젝트 수정</li>
													<li class="cursor-point color-red" onclick="deletePro()">프로젝트
														삭제</li>
												</c:when>
											</c:choose>
										</ul>
									</li>
								</ul>
							</div>

							<!-- project title(프로젝트 제목):f -->
							<div class="pro-detail-box pro-tab-box martop-20">
								<div class="tabs-box">
									<ul class="tabs">
										<li data-id="tab-1" class="active"><i
											class="fas fa-edit maright-10"></i>글쓰기</li>
										<li data-id="tab-2"><i class="fas fa-laptop maright-10"></i>업무</li>
										<li data-id="tab-3"><i
											class="far fa-calendar-alt maright-10"></i>일정</li>
										<li data-id="tab-4"><i class="fas fa-list maright-10"></i>할일</li>
									</ul>
									<div class="tabs-container">
										<!-- 글쓰기:s -->
										<div id="tab-1" class="tabs-content active">
											<form id="uploadForm" action="insertTim.do" method="post" enctype="multipart/form-data">
												<input type="hidden" name="mem_no" value="${mem_no}">
												<input type="hidden" name="pro_no" value="${proUserDTO.pro_no }"> 
												<input type="hidden" name="cont_kind" value="post"> 
												<input type="hidden" name="cont_no" value="0">
												
												<div id="dropZone" class="tab-con-box" >
													<textarea rows="5" cols="50" placeholder="글을 작성하세요."
														name="tim_cont" onkeyup="autoTextarea(this, 120, 500)"
														required="required"></textarea>

													<!-- 이미지 목록이 나올부분 -->
													<div id="uploadImgForm" class="upload-img-list"></div>

													<!-- 첨부파일 목록이 나올부분 -->
													<div id="uploadFileForm" class="upload-file-list"></div>
													<div class="tab-dn-box">
														<!-- 파일첨부 -->
														<label for="ex_file2"
															class="float-left maright-20 marbtm-0 font-thin size-18">
															<i class="fas fa-paperclip maright-10"></i>파일첨부
														</label> 
														<input type="file" multiple="multiple" id="ex_file2" name="articleFile"
															class="dis-none upload-hidden uploadInputFile">

														<!-- 이미지첨부  -->
														<label for="article-img"
															class="float-left marbtm-0 font-thin size-18"> <i
															class="fas fa-camera maright-10"></i>이미지첨부
														</label> 
														<input type="file" id="article-img" name="imageFile"
															class="dis-none"
															accept="image/*">
															
														<!-- 올리기(submit) 버튼 -->
														<input type="button" value="올리기" onclick="uploadFile()"
															class="article-submit-btn font-bold size-18 color-white text-center default-back-color">
													</div>
												</div>

											</form>
										</div>
										<!-- 글쓰기:f -->

										<!-- 업무:s -->
										<div id="tab-2" class="tabs-content con-task">
											<form action="taskInsert.do" name="TaskDTO"
												enctype="multipart/form-data">
												<input type="hidden" name="mem_no" value="${memNo }">
												<input type="hidden" name="pro_no" value="${proUserDTO.pro_no }">

												<div class="tab-con-box">
													<!-- 업무명 s -->
													<div class="input-box">
														<input type="text" name="task_title"
															placeholder="업무명을 입력하세요." required="required">
													</div>
													<!-- 업무명 e -->
													<!-- dl : 용어를 설명하는 목록
		 dt : 용어의 제목 
		 dd : 용어를 설명 -->
													<!-- 업무상태 s -->
													<div class="input-box martop-15">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-user-clock"></i>
															</dt>
															<dd>
																<div class="task-state-list">
																	<label class="checked"
																		onchange="fn_checkTaskState(this)"> 요청<input
																		type="radio" name="task_state" value="요청"
																		class="dis-none" checked>
																	</label> <label onchange="fn_checkTaskState(this)"> 진행<input
																		type="radio" name="task_state" value="진행"
																		class="dis-none">
																	</label> <label onchange="fn_checkTaskState(this)"> 피드백<input
																		type="radio" name="task_state" value="피드백"
																		class="dis-none">
																	</label> <label onchange="fn_checkTaskState(this)"> 완료<input
																		type="radio" name="task_state" value="완료"
																		class="dis-none">
																	</label> <label onchange="fn_checkTaskState(this)"> 보류<input
																		type="radio" name="task_state" value="보류"
																		class="dis-none">
																	</label>
																</div>
															</dd>
														</dl>
													</div>

													<!-- 담당자 s -->
													<div class="input-box martop-15" style="height: inherit">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-user-plus"></i>
															</dt>
															<dd class="posi-re">
																<!-- 담당자 추가 input -->
																<input type="text" id="mem_no" placeholder="담당자 추가"
																	onfocus="fn_taskManagerFocus(this)" />

																<!-- 담당자 리스트 -->
																<div class="task-user-list"></div>

																<!-- 프로젝트 참여자 리스트(담당자 설정 리스트) s -->
																<div class="pro-user-list"></div>
																<!-- 프로젝트 참여자 리스트(담당자 설정 리스트) e -->
															</dd>
														</dl>
													</div>
													<!-- 담당자 e -->

													<!-- 시작일 s -->
													<div class="input-box martop-15 add-item-box">
														<dl>
															<dt class="maright-20">
																<i class="far fa-calendar-plus"></i>
															</dt>
															<dd class="posi-re">
																<input type="text" name="task_start_date"
																	placeholder="시작일설정" id="datepicker1"
																	class="datepicker-here" data-timepicker="true"
																	data-time-format='hh:ii' readonly>
															</dd>
														</dl>
													</div>
													<!-- 시작일 e -->

													<!-- 마감일 s -->
													<div class="input-box martop-15 add-item-box">
														<dl>
															<dt class="maright-20">
																<i class="far fa-calendar-minus"></i>
															</dt>
															<dd class="posi-re">
																<input type="text" name="task_end_date"
																	placeholder="마감일설정" id="datepicker2"
																	class="datepicker-here" data-timepicker="true"
																	data-time-format='hh:ii' readonly>
															</dd>
														</dl>
													</div>
													<!-- 마감일 e -->

													<!-- 우선순위 s -->
													<div class="input-box martop-15 add-item-box">
														<dl>
															<dt class="maright-20">
																<i class="far fa-flag"></i>
															</dt>
															<dd class="posi-re">
																<input type="text" name="task_priority"
																	class="task-rank-input" placeholder="우선순위 선택"
																	onfocus="fn_taskRankFocus(this)" readonly="readonly">
																<span class="task-rank" onclick="fn_taskRankClick(this)"></span>


																<!-- 우선순위 리스트(우선순위 설정 리스트) s -->
																<ul class="task-rank-list">
																	<li onclick="fn_taskRankSelect(this)"><i
																		class="flow-icon rank-icon icon-low"></i>낮음</li>
																	<li onclick="fn_taskRankSelect(this)"><i
																		class="flow-icon rank-icon icon-basic"></i>보통</li>
																	<li onclick="fn_taskRankSelect(this)"><i
																		class="flow-icon rank-icon icon-high"></i>높음</li>
																	<li onclick="fn_taskRankSelect(this)"><i
																		class="flow-icon rank-icon icon-emer"></i>긴급</li>
																</ul>

																<!-- 우선순위 리스트(우선순위 설정 리스트) e -->
															</dd>
														</dl>
													</div>
													<!-- 우선순위 e -->

													<!-- 추가 항목입력 버튼 -->
													<button type="button" class="add-item-btn"
														onclick="fn_addItem(this)">
														<i class="fas fa-angle-down maright-10"></i> 추가 항목 입력
													</button>
													<!-- 글 ${fn.trim(dto.content)}-->
													<textArea rows="5" cols="" name="task_content"
														class="autosize" onkeyup="resize(this)"
														placeholder="글을 작성하세요."></textArea>

													<!-- 이미지 목록 나올부분 -->
													<div class="upload-img-list"></div>

													<!-- 첨부파일 목록 나올부분 -->
													<div class="upload-file-list"></div>
												</div>
												<!-- 본문부분 끝 -->

												<!-- file icon, img icon, 올리기 버튼 있는 부분 -->
												<div class="tab-dn-box">
													<!-- 파일첨부 -->
													<label class="articleFileTask"
														class="float-left maright-20 marbtm-0 font-thin size-18">
														<i class="fas fa-paperclip maright-10"></i>파일첨부
													</label> <input type="file" id="articleFileTask" name="articleFile"
														class="dis-none">

													<!-- 이미지첨부 -->
													<label class="articleImgTask"
														class="float-left marbtm-0 font-thin size-18"> <i
														class="fas fa-camera maright-10"></i>이미지첨부
													</label> <input type="file" id="articleImgTask" name="imageFile"
														class="dis-none"
														accept="image/*">

													<!-- 올리기 버튼 -->
													<input type="submit" value="올리기"
														class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
												</div>
											</form>

										</div>
										<!-- 업무:f -->
										<div id="tab-3" class="tabs-content con-schedule">
											<!-- 일정:s -->
											<form action="#" name="frm" method="POST">
												<!-- tab-con-box:s -->
												<input type="hidden" name="pro_no" value="${proVo.pro_no }">
												<div class="tab-con-box">
													<!-- 일정제목:s -->
													<div class="input-box">
														<input type="text" class="font-bold size-18"
															name="schd_title" placeholder="일정 제목을 입력하세요."
															required="required" style="width: 90%">
													</div>
													<!-- 일정제목:f -->

													<!-- 일정 시간 설정:s -->
													<div class="input-box martop-15">
														<dl>
															<dt class="maright-20">
																<i class="far fa-clock"></i>
															</dt>
															<dd>
																<input type="text" required="required"
																	placeholder="시작날짜 - 종료날짜" data-range="true"
																	data-multiple-dates-separator="   -   "
																	class="datepicker-here" id="datetime" name="datetime"
																	style="width: 100%" />
															</dd>
														</dl>
													</div>
													<!-- 일정 시간 설정:f -->


													<!-- 위치 검색:s -->
													<div class="input-box martop-15">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-map-marker-alt"></i>
															</dt>
															<dd>
																<input id="searchInput" name="schd_loc" class="controls"
																	type="text" placeholder="장소를입력하세요" style="width: 90%">
																<div id="map"></div>
																<input type="hidden" id="schd_lat" name="schd_lat">
																<input type="hidden" id="schd_lon" name="schd_lon">
															</dd>
														</dl>
													</div>
													<!-- 위치 검색:f -->

													<!-- 메모:s -->
													<div class="input-box martop-15">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-sticky-note"></i>
															</dt>
															<dd>
																<textarea rows="2" cols="" placeholder="메모를 입력하세요."
																	name="schd_memo"></textarea>
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
																<select name="alert_time"
																	onchange="getSelectValue(this.form);">
																	<option value="0">없음</option>
																	<option value="10">10분전 미리알림</option>
																	<option value="30">30분전 미리알림</option>
																	<option value="60">1시간전 미리알림</option>
																	<option value="120">2시간전 미리알림</option>
																	<option value="180">3시간전 미리알림</option>
																	<option value="1440">1일전</option>
																	<option value="2880">2일전</option>
																	<option value="10080">7일전</option>
																</select>
															</dd>
														</dl>
													</div>
													<!-- 알람:f -->

												</div>
												<!-- tab-con-box:f -->

												<!-- tab-dn-box:s -->
												<div class="tab-dn-box">
													<!-- 올리기(submit) 버튼 -->

													<input type="submit" value="올리기"
														class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
												</div>
												<!-- tab-dn-box:f -->

											</form>
											<!-- 일정:f -->
										</div>
										<!-- 할일:s -->
										<div id="tab-4" class="tabs-content con-todo">
											<form action="/flowolf/todo/insert" method="post">

												<!-- tab-con-box:s -->
												<div class="tab-con-box">
													<!-- 할일제목:s -->
													<div class="input-box">
														<input type="text" name="todo_title"
															class="font-bold size-18" placeholder="할일 제목을 입력하세요.(선택)">
													</div>
													<!-- 할일제목:f -->

													<!-- 할일 내용:s -->
													<div class="input-box todo-box">
														<dl>
															<dt class="maright-20">
																<i class="fas fa-minus-circle color-red cursor-point"
																	onclick="removeTodo(this)"></i>
															</dt>
															<dd class="posi-re">
																<!-- 할일 내용 입력 input -->
																<input type="text" name="texe" class="todo-input"
																	placeholder="할일 입력(Enter or Tab 입력시 아래에 할일 입력 추가됨)"
																	onkeydown="fn_keyDown(event, this)" required="required">

																<!-- 날짜, 담당자 아이콘박스 : s -->
																<div class="todo-icon-box">

																	<!-- todo date : 날짜추가 : s -->
																	<div class="posi-re dis-inblock float-left maright-15">
																		<!-- date icon button -->
																		<i id="dateResult"
																			class="flow-icon todo-icon icon-calendar-plus cursor-point todo-date-icon"
																			data-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false" onclick="datePick(this)"></i>
																		<!-- 							<input type="hidden" name="tiList[0].ti_date" class="todo-date"> -->
																		<input type="hidden" name="tiList[0].ti_date"
																			class="todo-date">

																		<!-- date-picker box -->
																		<div class="dropdown-menu datepicker-here"
																			aria-labelledby="dateResult"></div>
																	</div>
																	<!-- todo date : 날짜추가 : f -->


																	<!-- todo add manager : 담당자추가 : s -->
																	<div
																		class="posi-re dis-inblock float-left todo-add-manager">

																		<!-- 담당자 추가 버튼 -->
																		<div id="todoManager"
																			class="user-add-btn posi-re cursor-point"
																			data-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false">
																			<i class="icon-circle circle-xs dis-none"></i> <i
																				class="flow-icon todo-icon icon-user-plus"></i> <input
																				type="hidden" name="tiList[0].ti_mem_id"
																				class="todo-mem" value="${memVo.mem_id }">
																		</div>

																		<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):s -->
																		<div class="dropdown-menu todo-pro-user-list"
																			role="menu" aria-labelledby="todoManager">
																			<div class="pro-user-info" onclick="userSelect(this)">
																				<div class="pro-user-photo maright-10">
																					<i class="icon-circle circle-s"></i>
																				</div>
																				<span class="user-id">${proUserVo.mem_id }</span>
																			</div>
																		</div>
																		<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):f -->

																	</div>
																	<!-- todo add manager : 담당자추가 : f -->

																</div>
																<!-- 날짜, 담당자 아이콘박스 : f -->
															</dd>
														</dl>
													</div>
													<!-- 할일 내용:f -->

													<div class="input-box martop-15">
														<a class="color-black cursor-point"
															onclick="fn_addTodo(this)"><i
															class="fas fa-plus maright-15 default-color"></i>할일 추가</a>
													</div>
												</div>
												<!-- tab-con-box:f -->

												<!-- tab-dn-box:s -->
												<div class="tab-dn-box">
													<!-- 올리기(submit) 버튼 -->
													<input type="submit" value="올리기"
														class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
												</div>
												<!-- tab-dn-box:f -->
											</form>
										</div>
										<!-- 할일:f -->

									</div>
								</div>
							</div>
							
							<div class="table-responsive"></div>
							<!-- 타임라인 : start -->
							<c:forEach var="dto" items="${list }">
								<!-- basic 글 : start -->
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
											<c:if test="${proUserDTO.pro_user_man_chk eq 'manager' }">
												<!-- article pick button -->
												<li><a href="#fixCheck" class="pick-check-btn"> <c:choose>
															<c:when test="${ProUserDTO.pro_user_man_chk == 'y' }">
																<i
																	class="fas fa-map-pin size-24 cursor-point pick-active"></i>
															</c:when>
															<c:otherwise>
																<i class="fas fa-map-pin size-24 cursor-point"></i>
															</c:otherwise>
														</c:choose>
												</a></li>
											</c:if>
											<!-- article edit : s -->
											<c:if test="${proUserDTO.mem_no == dto.mem_no }">
												<li class="posi-re float-left">
													<button id="articleEdit" type="button"
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<i class="fas fa-ellipsis-v size-24 color-gray"></i>
													</button>
													<ul class="dropdown-menu" role="menu"
														aria-labelledby="articleEdit">

														<li class="cursor-point" onclick="fn_editArticle(this)">글
															수정</li>
														<li class="cursor-point timeline-delete-btn">글 삭제</li>
													</ul>
												</li>
											</c:if>
											<!--  article edit : f -->
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
														<!-- <c:forEach items="${timeLine.filesList }" var="filesVo">
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


										<!-- 일반 게시글 수정:s -->
										<form action="updateTim.do" method="post"
											class="article-edit-form" enctype="multipart/form-data">
											<input type="hidden" name="tim_no" value="${dto.tim_no }">
											<input type="hidden" name="pro_no" value="${dto.pro_no }">
											<!-- article edit box:s -->
											<div class="article-edit-box">
												<textarea rows="5" cols="50" placeholder="글을 작성하세요."
													name="tim_cont" onkeyup="autoTextarea(this, 120, 500)"
													required="required">${dto.tim_cont}</textarea>

												<!-- 이미지 목록이 나올부분 -->
												<div class="upload-img-list">
													<!-- <c:forEach items="${timeLine.filesList }" var="filesVo">
															<c:if test="${filesVo.files_kind == 'img' }"> -->
													<div class="upload-img-info martop-20"
														data-no="${filesVo.files_no }">
														<div class="upload-img"
															style="background-image:url('/files/view?files_no=${filesVo.files_no}')"></div>
														<i class="fas fa-times-circle img-close-btn"
															onclick="fileDelete(this)"></i>
													</div>
													<!--</c:if>
														</c:forEach>-->
												</div>
												-->
												<!-- 첨부파일 목록이 나올부분  -->
												<div class="upload-file-list">
													<!-- <c:forEach items="${timeLine.filesList }" var="filesVo">
															<c:if test="${filesVo.files_kind == 'fil' }"> -->
													<div class="upload-file-info martop-20"
														data-no="${filesVo.files_no }">
														<dl>
															<dt>
																<i class="dis-inblock file-icon"
																	data-name="${filesVo.files_name }"></i>
															</dt>
															<dd>
																<span class="dis-block size-18 color-black">파일이름</span>
																<span class="dis-block martop-5 size-14 color-gray">파일크기</span>
															</dd>
														</dl>
														<i class="far fa-times-circle file-close-btn"
															onclick="fileDelete(this)"></i>
													</div>
													<!--</c:if>
														</c:forEach>-->
												</div>

											</div>

											<!-- article edit box:f -->

											<!-- article edit dn:s -->
											<div class="article-edit-dn">
												<!-- 파일첨부 -->
												<label for="articleEditFile_b${dto.tim_no }"
													class="float-left maright-20 marbtm-0 font-thin size-18">
													<i class="fas fa-paperclip maright-10"></i>파일첨부
												</label> <input type="file" name="articleFile"
													id="articleEditFile_b${dto.tim_no }" class="dis-none"
													>

												<!-- 이미지첨부 -->
												<label for="articleEditImg_b${dto.tim_no }"
													class="float-left marbtm-0 font-thin size-18"> <i
													class="fas fa-camera maright-10"></i>이미지첨부
												</label> <input type="file" name="imageFile"
													id="articleEditImg_b${dto.tim_no }" class="dis-none"
													 accept="image/*">

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
										<!-- 일반 게시글 수정:f -->
									<!-- 기본글 : finsh -->
									
										</c:when>
										<c:when test="${dto.cont_kind eq 'task' }">
										<!-- 업무글 : start -->
										
										
										
										<!-- 업무글 : finsh -->
										</c:when>
										<c:when test="${dto.cont_kind eq 'schd' }">
										<!-- 스케쥴글 : start -->
										
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

										<!-- 좋아요 / 댓글 개수:s -->
										<div class="article-etc-info">



											<!-- 좋아요 선택 시 이모티콘 나올 부분 -->
											<div class="like-result cursor-point"
												onclick="fn_emoUserPop(${start.index })">
												<c:forEach items="${timeLine.emoUserList }" var="emoUserVo"
													end="2">
													<img src="/emo/view?emo_no=${emoUserVo.emo_no }"
														data-no="${emoUserVo.emo_user_no }" width="20"
														class="maright-10">
												</c:forEach>
												<div class="like-mem dis-inblock"
													data-size="${timeLine.emoUserList.size() }">
													<c:choose>
														<c:when test="${emo_user_chk}">
															<strong class="me">${memVo.mem_no }</strong>	님
										<c:if test="${timeLine.emoUserList.size()-1 != 0 }">
											  외 ${timeLine.emoUserList.size()-1 }명
										</c:if>
														</c:when>
														<c:otherwise>
															<c:if test="${timeLine.emoUserList.size() != 0 }">
											${timeLine.emoUserList.size() }명
										</c:if>
														</c:otherwise>
													</c:choose>
												</div>
											</div>

											<!-- 이모티콘 사용자 리스트 팝업:f -->

											<!-- 댓글 개수 -->
											<div class="comment-count default-back-color color-white">
												<i class="fas fa-comment maright-10"></i>
												${dto.repList.size()}개
											</div>

											<!-- 좋아요 / 댓글작성 / 담아두기 버튼 -->
											<ul class="article-etc-menu martop-10 marbtm-0">
												<li class="posi-re cursor-point"><c:choose>
														<c:when test="${emo_user_chk }">
															<!-- like button : s -->
															<div id="emoticonToggle"
																class="emoticon-btn cursor-point" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false"
																style="display: none">
																<i class="fas fa-thumbs-up maright-10"></i>좋아요
															</div>
															<!-- like button : f -->

															<!-- Chagned like button : s -->
															<div class="emoticon-after-btn cursor-point"
																data-emouser="${my_emo_user_no }" style="display: block">
																<img src="/emo/view?emo_no=${my_emo_no }" width="20"
																	class="maright-10"> <span
																	class="size-14 default-color">${my_emo_name }</span>
															</div>
															<!-- Chagned like button : f -->
														</c:when>
														<c:otherwise>
															<!-- like button : s -->
															<div id="emoticonToggle"
																class="emoticon-btn cursor-point" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false">
																<i class="fas fa-thumbs-up maright-10"></i>좋아요
															</div>
															<!-- like button : f -->

															<!-- Chagned like button : s -->
															<div class="emoticon-after-btn cursor-point"
																data-emouser="">
																<img src="" width="20" class="maright-10"> <span
																	class="size-14 default-color"></span>
															</div>
															<!-- Chagned like button : f -->
														</c:otherwise>
													</c:choose> <!-- Emoticon list box -->
													<div class="dropdown-menu emoticon-box"
														aria-labelledby="emoticonToggle">
														<ul>
															<c:forEach items="${emoList }" var="emo">
																<li class="posi-re" data-emono="${emo.emo_no }"><img
																	src="/emo/view?emo_no=${emo.emo_no }"> <span>${emo.emo_name }</span>
																</li>
															</c:forEach>
														</ul>
													</div></li>
												<li class="cursor-point" onclick="fn_commentFocus(this)"><i
													class="fas fa-comment-alt maright-10"></i> 댓글작성</li>
												<c:choose>
													<c:when test="${timeLine.coll_chk != 0 }">
														<li class="cursor-point coll-btn default-color"
															data-collno="${timeLine.coll_chk }"><i
															class="fas fa-bookmark maright-10"></i> <span>담아두기
																취소</span></li>
													</c:when>
													<c:otherwise>
														<li class="cursor-point coll-btn"
															data-collno="${timeLine.coll_chk }"><i
															class="fas fa-bookmark maright-10"></i> <span>담아두기</span>
														</li>
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
																<div class="dis-inblock size-15 color-gray maright-20">
																</div>
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

															<!-- 댓글 수정 박스 -->
															<div class="comment-edit-box">
																<form action="updateRep.do" method="get"
																	class="comment-edit-form" enctype="multipart/form-data">
																	<input type="hidden" name="rep_no"
																		value="${repDTO.rep_no }"> <input
																		type="hidden" name="pro_no" value="${dto.pro_no }">
																	<div class="comment-textarea">
																		<textarea rows="5" cols="50" class="rep_cont"
																			name="rep_cont" onkeyup="autoTextarea(this, 40, 300)"
																			onkeydown="fn_keyDownEsc(event, this)" required>${repDTO.rep_cont }</textarea>
																	</div>
																	<div
																		class="dis-block float-left martop-5 marbtm-10 size-13 color-gray"
																		style="width: 100%">
																		<span class="default-color">취소</span> 하실려면 <span
																			class="color-red">Esc</span>키를 누르세요.
																	</div>

																	<!-- 파일첨부 -->
																	<label for="commentEditFile_${status.count }"
																		class="marbtm-0"> <i
																		class="fas fa-paperclip martop-10 size-24 color-gray cursor-point"></i>
																	</label> <input type="file"
																		id="commentEditFile_${status.count }" class="dis-none"
																		onchange="commentFileUpload(this)">

																	<!-- 이미지 목록이 나올부분 
																	<div class="comment-upload-img-list">
																		<c:forEach items="${repList['filesList'] }"
																			var="filesVo">
																			<c:if test="${filesVo.files_kind == 'img' }">
																				<div class="upload-img-info martop-20"
																					data-no="${filesVo.files_no }">
																					<div class="upload-img"
																						style="background-image:url('/files/view?files_no=${filesVo.files_no}')"></div>
																					<i class="fas fa-times-circle img-close-btn"
																						onclick="commentFileDelete(this)"></i>
																				</div>
																			</c:if>
																		</c:forEach>
																	</div>
																			-->
																	<!-- 첨부파일 목록이 나올부분 
																	<div class="comment-upload-file-list">
																		<c:forEach items="${repList['filesList'] }"
																			var="filesVo">
																			<c:if test="${filesVo.files_kind == 'fil' }">
																				<div class="upload-file-info martop-10"
																					data-no="${filesVo.files_no }">
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
																						</dd>
																					</dl>
																					<i class="far fa-times-circle file-close-btn"
																						onclick="commentFileDelete(this)"></i>
																				</div>
																			</c:if>
																		</c:forEach>
																	</div>
																	-->
																</form>
															</div>
															<c:if test="${repDTO.mem_no == dto.mem_no }">
																<!-- 댓글 수정,삭제 버튼 -->
																<ul class="comment-edit-btn">
																	<li class="cursor-point" onclick="fn_commentEdit(this)">수정</li>
																	<li class="cursor-point reply-delete">삭제</li>
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
									class="fas fa-comments maright-10"></i>프로젝트 채팅
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

						<form action="/flowolf/chat/insertMulti" method="get"
							id="chatInsertMulti" name="chatInsertMulti">
							<c:forEach items="${proUserList }" var="list">
								<c:if test="${list.mem_id ne memVo.mem_id }">
									<input type="hidden" value="${list.mem_id }" name="ptn">
								</c:if>
							</c:forEach>
							<input type="hidden" value="${memVo.mem_id }" name="mem_id">
						</form>

						<script type="text/javascript">
		$("#proChat").on("click", function() {
			var check =document.chatInsertMulti;
			window.open('', 'new', "width=467,height=640,top=100,left=100");
			check.action='/flowolf/chat/insertMulti';
			check.target='new';
			check.submit();
		});
	</script>

					</div>
					<!-- 프로젝트 참여자 리스트 : f -->



					<!-- 초대하기  layer pop up : s -->
					<div class="dim-layer">
						<div class="dimBg"></div>

						<div id="invitePop" class="pop-layer">

							<!-- pop header -->
							<header class="pop-top border-box text-center">
								<a href="#"
									class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
								<strong class="dis-block size-28 color-black text-center">${proUserDTO.pro_name }</strong>
							</header>

							<!-- pop con -->
							<section class="pop-con border-box">

								<div class="invite-kind-box back-color-white cursor-point"
									data-id="invitePartner" onclick="fn_subPopOpen(this)">
									<dl>
										<dt class="maright-20 padtop-5 back-color-green-l">
											<i class="fas fa-building size-30 color-white"></i>
										</dt>
										<dd>
											<strong class="dis-block size-24 color-black">동료 초대</strong>
											<strong class="dis-block size-18 color-gray-l">동료를
												초대할 수 있습니다.</strong>
										</dd>
									</dl>
								</div>




							</section>

							<!-- 동료초대 :s -->
							<div id="invitePartner" class="popup-sub-box">
								<form action="insertProUser.do" method="get">
									<input type="hidden" name="pro_no"
										value="${proUserDTO.pro_no }">


									<!-- top : pop invite partner : s -->
									<div class="pop-top-sub">
										<i class="fas fa-arrow-left size-20 cursor-point"
											onclick="fn_popupBack(this)"></i> 동료 초대하기 <i
											class="flow-icon icon-close cursor-point"
											onclick="fn_popSubClose(this)"></i>
									</div>
									<!-- top : pop invite partner : f -->

									<!-- content : pop invite partner : s -->
									<div class="pop-con-sub">

										<!-- 추가된 동료 리스트가 나올 부분 -->
										<div class="select-user-list">
											<span class="user-all-del" onclick="fn_userListDelete(this)">전체
												삭제</span>
										</div>

										<!-- user list:s -->
										<div class="invite-user-list over-y-scroll">
											<c:forEach items="${notInvitedProUserList }"
												var="notInvitedUser">
												<dl class="pop-user-list"
													data-memno="${notInvitedUser.mem_no }"
													data-no="${proUserDTO.pro_no }"
													onclick="fn_inviteUserAdd(this)">
													<dt class="maright-10">
														<i class="icon-circle circle-s"></i> <img
															src="/chord/resources/img/sample.png" width="40">
													</dt>
													<dd>
														<strong class="dis-block size-20 color-black">${notInvitedUser.mem_no }</strong>
														<span class="dis-block size-14 color-gray-l">${notIinvitedUser.mem_no }</span>
														<button type="button" class="invite-add-btn">
															<i class="fas fa-plus maright-15"></i> <span>추가</span>
														</button>
													</dd>
												</dl>
											</c:forEach>
										</div>
										<!-- user list:f -->

									</div>
									<!-- content : pop invite partner : f -->

									<!-- footer : pop invite partner : s -->
									<div class="pop-footer-sub">
										<input type="button"
											class="invate-frm-submit submit-btn color-white default-back-color "
											value="초대">
									</div>
									<!-- footer : pop invite partner : f -->

								</form>

							</div>
							<!-- 동료초대 :f -->




						</div>
						<!-- 초대하기 List pop : f -->

					</div>
					<!-- 초대하기  layer pop up : f -->

					<script type="text/javascript">
$(function(){

	// 초대하기 layerPop 띄우기
	$(".invite-btn").click(function(){
		var $href = $(this).attr('href');
		layer_popup($href);
	});
	
	// 화상회의 layerPop 띄우기
	$(".face-chat-btn").click(function(){
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
		<!-- project right : finish -->
	</div>
	</section>
	<div>
		<%@include file="layerPopCon.jsp"%>
	</div>
	</main>
	</div>

	</div>
	<div class="alert flowolf-alert"></div>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
	<script src="/chord/resources/js/dashboard.js"></script>
	<!-- jjpicker -->
<script type="text/javascript" src="/chord/resources/js/jjpicker.js"></script>
</body>
</html>