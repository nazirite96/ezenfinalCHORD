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
<!-- custom -->
<!-- jQuery 3.3.1 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			$(function(){
				// 탭메뉴 설정 : 탭메뉴(li)에 설정된 data-id 값과 같은 id값을 가진 content box 노출
				$("ul.tabs li").on("click", function(){
					var tab_id = $(this).attr("data-id");
					$("ul.tabs li").removeClass("active");
					$(".tabs-content").removeClass("active");
					
					$(this).addClass("active");
					$("#"+tab_id).addClass("active");
				});
			});
			</script>
<!-- Custom styles for this template -->
<link href="/chord/resources/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="/chord/resources/css/GwCss.css">
</head>
<body>

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
					<h1 class="h2">Dashboard</h1>
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
								<form action="insertTim.do" method="post">
									<input type="hidden" name="mem_no" value="${mem_no}"> <input
										type="hidden" name="pro_no" value="${pro_no }"> <input
										type="hidden" name="cont_kind" value="post"> <input
										type="hidden" name="cont_no" value="0">
									<div class="tab-con-box">
										<textarea rows="5" cols="50" placeholder="글을 작성하세요."
											name="tim_cont" onkeyup="autoTextarea(this, 120, 500)"
											required="required"></textarea>

										<!-- 이미지 목록이 나올부분 -->
										<div class="upload-img-list"></div>

										<!-- 첨부파일 목록이 나올부분 -->
										<div class="upload-file-list"></div>
										<div class="tab-dn-box">
											<!-- 파일첨부 -->
											<label for="articleFile"
												class="float-left maright-20 marbtm-0 font-thin size-18">
												<i class="fas fa-paperclip maright-10"></i>파일첨부
											</label> <input type="file" id="articleFile" name="articleFile"
												class="dis-none" onchange="fileUpload(this)">

											<!-- 이미지첨부  -->
											<label for="article-img"
												class="float-left marbtm-0 font-thin size-18"> <i
												class="fas fa-camera maright-10"></i>이미지첨부
											</label> <input type="file" id="article-img" name="imageFile"
												class="dis-none" onchange="imgUpload(this)" accept="image/*">
											<!-- 올리기(submit) 버튼 -->
											<input type="submit" value="올리기"
												class="article-submit-btn font-bold size-18 color-white text-center default-back-color">
										</div>
									</div>

								</form>
							</div>
							<!-- 글쓰기:f -->

							<!-- 업무:s -->
							<div id="tab-2" class="tabs-content con-task">
								<form action="/flowolf/task/insert" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="mem_id" value="${memVo.mem_id }">
									<input type="hidden" name="pro_no" value="${proVo.pro_no }">
									<!-- tab-con-box:s -->
									<div class="tab-con-box">
										<!-- 업무명:s -->
										<div class="input-box">
											<input type="text" name="task_title"
												class="font-bold size-18" placeholder="업무명을 입력하세요."
												required="required">
										</div>
										<!-- 업무명:f -->

										<!-- 업무상태:s -->
										<div class="input-box martop-15">
											<dl>
												<dt class="maright-20">
													<i class="fas fa-user-clock"></i>
												</dt>
												<dd>
													<div class="task-state-list">
														<label class="checked" onchange="fn_checkTaskState(this)">
															요청<input type="radio" name="task_state" value="요청"
															class="dis-none" checked="checked">
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
										<!-- 업무상태:f -->

										<!-- 담당자:s -->
										<div class="input-box martop-15" style="height: inherit">
											<dl>
												<dt class="maright-20">
													<i class="fas fa-user-plus"></i>
												</dt>
												<dd class="posi-re">
													<input type="text" id="tu_mem_id" placeholder="담당자 추가"
														onfocus="fn_taskManagerFocus(this)">

													<!-- 담당자 리스트 -->
													<div class="task-user-list"></div>

													<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):s -->
													<div class="pro-user-list">
														<c:forEach items="${proUserList}" var="proUserDTO">
															<div class="pro-user-info"
																onclick="fn_taskManagerSelect(this)">
																<div class="pro-user-photo maright-10">
																	<i class="icon-circle circle-s"></i>
																	${proUserDTO.mem_id }
																</div>
																<span class="user-id">${proUserDTO.mem_id }</span>
															</div>
														</c:forEach>
													</div>
													<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):f -->
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
													<input type="text" name="task_start_date"
														placeholder="시작일설정" data-language='ko'
														class="datepicker-here" /> <i
														class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point"
														onclick="fn_dateReset(this)"></i>
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
													<input type="text" name="task_end_date" placeholder="마감일설정"
														data-language='ko' class="datepicker-here" /> <i
														class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point"
														onclick="fn_dateReset(this)"></i>
												</dd>
											</dl>
										</div>
										<!-- 마감일:f -->

										<!-- 작업진척도:s -->
										<div class="input-box martop-15 add-item-box">
											<dl>
												<dt class="maright-20">
													<i class="far fa-chart-bar"></i>
												</dt>
												<dd>
													<div class="work-range">
														<input type="hidden" name="task_rate" value="0"> <span
															class="work-percent"></span>
														<div class="pcnt-bar"></div>
														<div class="pcnt-btn pcnt-20"
															onclick="fn_progressSelect(this)" data-toggle="tooltip"
															data-placement="bottom" title="20">
															<span>20</span>
														</div>
														<div class="pcnt-btn pcnt-40"
															onclick="fn_progressSelect(this)" data-toggle="tooltip"
															data-placement="bottom" title="40">
															<span>40</span>
														</div>
														<div class="pcnt-btn pcnt-60"
															onclick="fn_progressSelect(this)" data-toggle="tooltip"
															data-placement="bottom" title="60">
															<span>60</span>
														</div>
														<div class="pcnt-btn pcnt-80"
															onclick="fn_progressSelect(this)" data-toggle="tooltip"
															data-placement="bottom" title="80">
															<span>80</span>
														</div>
														<div class="pcnt-btn pcnt-100"
															onclick="fn_progressSelect(this)" data-toggle="tooltip"
															data-placement="bottom" title="100">
															<span>100</span>
														</div>
													</div>
												</dd>
											</dl>
										</div>
										<!-- 작업진척도:f -->

										<!-- 우선순위:s -->
										<div class="input-box martop-15 add-item-box">
											<dl>
												<dt class="maright-20">
													<i class="fas fa-flag"></i>
												</dt>
												<dd class="posi-re">
													<input type="text" name="task_priority"
														class="task-rank-input" placeholder="우선순위 선택"
														onfocus="fn_taskRankFocus(this)" readonly="readonly">
													<span class="task-rank" onclick="fn_taskRankClick(this)"></span>

													<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):s -->
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
												</dd>
											</dl>
										</div>
										<!-- 우선순위:f -->

										<button type="button" class="add-item-btn"
											onclick="fn_addItem(this)">
											<i class="fas fa-angle-down maright-10"></i> 추가 항목 입력
										</button>

										<!-- 글 -->
										<textarea rows="5" cols="" name="task_cont" class="martop-20"
											placeholder="글을 작성하세요."></textarea>

										<!-- 이미지 목록이 나올부분 -->
										<div class="upload-img-list"></div>

										<!-- 첨부파일 목록이 나올부분 -->
										<div class="upload-file-list"></div>
									</div>
									<!-- tab-con-box:f -->

									<!-- tab-dn-box:s -->
									<div class="tab-dn-box">
										<!-- 파일첨부 -->
										<label for="articleFileTask"
											class="float-left maright-20 marbtm-0 font-thin size-18">
											<i class="fas fa-paperclip maright-10"></i>파일첨부
										</label> <input type="file" id="articleFileTask" name="articleFile"
											class="dis-none" onchange="fileUpload(this)">

										<!-- 이미지첨부 -->
										<label for="articleImgTask"
											class="float-left marbtm-0 font-thin size-18"> <i
											class="fas fa-camera maright-10"></i>이미지첨부
										</label> <input type="file" id="articleImgTask" name="imageFile"
											class="dis-none" onchange="imgUpload(this)" accept="image/*">

										<!-- 올리기(submit) 버튼 -->
										<input type="submit" value="올리기"
											class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
									</div>
									<!-- tab-dn-box:f -->
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
															<div class="dropdown-menu todo-pro-user-list" role="menu"
																aria-labelledby="todoManager">
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

							<!-- 투표:s -->
							<div id="tab-5" class="tabs-content con-vote"></div>
							<!-- 투표:f -->
						</div>
					</div>
				</div>
		</div>

		<div>

			<script>
				function getSelectValue(frm) {
					frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
					frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
				}
			</script>
			

		</div>




		<c:forEach var="dto" items="${list }">
			<div>${dto.tim_no },${dto.cont_kind },${dto.tim_cont }</div>
		</c:forEach>


		<h2>Section title</h2>
		<div class="table-responsive"></div>
		</main>
	</div>
	</div>
	<div></div>

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script src="/chord/resources/js/dashboard.js"></script>
</body>
</html>