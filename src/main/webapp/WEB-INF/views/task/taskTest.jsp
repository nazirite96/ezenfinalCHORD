<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
 		
		<!-- font-awesome CSS -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
		
		<!-- bootstrap CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
		
		<!-- fileEx JS -->
		<script src="<%=request.getContextPath() %>/resources/js/fileEx.js"></script>
		
		 
 		<!-- jQuery 3.3.1 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
		
		<!-- jQuery UI JS 
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
		
		<!-- jQuery UI CSS -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
 	
 		<!-- bootstrap-theme CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<!-- FLOWOLF CUSTOM JS -->
		<script src="<%=request.getContextPath() %>/resources/js/flowolf_custom.js"></script>
		
		
		<!-- datepicker CSS & JS 
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/datepicker.min.css">
		<script src="<%=request.getContextPath() %>/resources/js/datepicker.min.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/datepicker.en.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/datepicker.ko.js"></script>
		<script src="<%=request.getContextPath() %>/resources/js/datepicker.js"></script>
-->
		<!-- custom style -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/common.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_margin.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_padding.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_collection.css">
		
		<script	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
		<!-- 값 제어를 위해 jquery -->
		<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
		<!-- Air datepicker css -->
		<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
		<!-- Air datepicker js -->
		<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
		<!-- 달력 한글 추가를 위해 커스텀 -->
<script>
	datePickerSet($("#datepicker1"), $("#datepicker2"), true);
	$("#datepicker").datepicker({
		language : 'ko'
	});

	function datePickerSet(sDate, eDate, flag) {

		//시작 ~ 종료 2개 짜리 달력 datepicker	
		if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
				&& eDate.length > 0) {
			var sDay = sDate.val();
			var eDay = eDate.val();

			if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

				var edp = eDate.datepicker().data("datepicker");
				edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			//시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(eDay)) {
				sDate.datepicker({
					maxDate : new Date(eDay.replace(/-/g, "/"))
				});
			}
			sDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
			if (!isValidStr(sDay)) {
				eDate.datepicker({
					minDate : new Date(sDay.replace(/-/g, "/"))
				});
			}
			eDate.datepicker({
				language : 'ko',
				autoClose : true,
				onSelect : function() {
					datePickerSet(sDate, eDate);
				}
			});

			//한개짜리 달력 datepicker
		} else if (!isValidStr(sDate)) {
			var sDay = sDate.val();
			if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
				var sdp = sDate.datepicker().data("datepicker");
				sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
			}

			sDate.datepicker({
				language : 'ko',
				autoClose : true
			});
		}

		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	}
</script>
</head>
<body>
	<h1>제진공간</h1>
	
<form action="#" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="mem_no" >
	<input type="hidden" name="pro_no" >
	<div class="tab-con-box">

		<!-- 업무명 s -->
		<div class="input-box">
			<input type="text" placeholder="업무명을 입력하세요.">
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
						<label class="checked" onchange="fn_checkTaskState(this)">
							요청<input type="radio" name="task_state" value="요청"
							class="dis-none" checked>
						</label> <label onchange="fn_checkTaskState(this)"> 진행<input
							type="radio" name="task_state" value="진행" class="dis-none">
						</label> <label onchange="fn_checkTaskState(this)"> 피드백<input
							type="radio" name="task_state" value="피드백" class="dis-none">
						</label> <label onchange="fn_checkTaskState(this)"> 완료<input
							type="radio" name="task_state" value="완료" class="dis-none">
						</label> <label onchange="fn_checkTaskState(this)"> 보류<input
							type="radio" name="task_state" value="보류" class="dis-none">
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
					<input type="text" name="time_kind" placeholder="시작일설정"  id="datepicker1">
					<i class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point" onclick="fn_dateReset(this)"></i>
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
					<input type="text" name="time_kind" placeholder="마감일설정" id="datepicker2">
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
					<input type="text" name="task_priority" class="task-rank-input"
						placeholder="우선순위 선택" onfocus="fn_taskRankFocus(this)"
						readonly="readonly"> <span class="task-rank"
						onclick="fn_taskRankClick(this)"></span>

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
		<button type="button" class="add-item-btn" onclick="fn_addItem(this)"><i class="fas fa-angle-down maright-10"></i> 추가 항목 입력</button>
		<!-- 글 -->
		<textarea rows="5" cols="" name="task_content" class="martop-20"
			placeholder="글을 작성하세요."></textarea>

		<!-- 이미지 목록 나올부분 -->
		<div class="upload-img-list"></div>

		<!-- 첨부파일 목록 나올부분 -->
		<div class="upload-file-list"></div>
	</div>
	<!-- 본문부분 끝 -->

	<!-- file icon, img icon, 올리기 버튼 있는 부분 -->
	<div class="tab-dn-box">
		<!-- 파일첨부 -->
		<label class="articleFileTask" class="float-left maright-20 marbtm-0 font-thin size-18">
			<i class="fas fa-paperclip maright-10"></i>파일첨부
		</label>
		<input type="file" id="articleFileTask" name="articleFile" class="dis-none" onchange="fileUpload(this)">
		
		<!-- 이미지첨부 -->
		<label class="articleImgTask" class="float-left marbtm-0 font-thin size-18">
			<i class="fas fa-camera maright-10"></i>이미지첨부
		</label>
		<input type="file" id="articleImgTask" name="imageFile" class="dis-none" onchange="imgUpload(this)" accept="image/*">
		
		<!-- 올리기 버튼 -->
		<input type="submit" value="올리기" class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
	</div>
</form>	





	<a href="taskTest2.do">dfsdf</a>
</body>
</html>