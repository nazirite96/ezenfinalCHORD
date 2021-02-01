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
<script>
/*******************************************
* Note : task add item box show
* 설명 : '추가항목입력' 버튼 클릭시 추가항목 박스 보이기
*******************************************/
function fn_addItem(el){
	var item = $(el);
	var addItemBox = item.siblings('.add-item-box');

	item.fadeOut("fast");
	addItemBox.fadeIn();
}
function fn_checkTaskState(el){
	var item = $(el);
	var stateList = item.parent('.task-state-list');
	
	stateList.find('label').removeClass('checked');
	item.addClass('checked');
}
</script>
<style>
/* tab con box */
.tabs-box .tabs-container .tabs-content .tab-con-box {float:left;width:100%;padding:20px}
.tabs-box .tabs-container .tabs-content .tab-con-box textarea {overflow-y:hidden;width:100%;height:120px;border:0}
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box {float:left;width:100%;min-height:40px;padding:0 5px 10px;border-bottom:1px solid #efefef}
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box dl {width:100%;min-height:30px;margin:0;color:#999} 
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box dl dt,
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box dl dd {float:left;min-height:30px;line-height:30px}
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box dl dt {width:20px}
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box dl dd {
	width:-webkit-calc(100% - 40px);
	width:-moz-calc(100% - 40px);
	width:-o-calc(100% - 40px);
	width:calc(100% - 40px);
}
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box dl dd label {margin:0}
.tabs-box .tabs-container .tabs-content .tab-con-box .input-box input {width:100%}
.tabs-box .tabs-container .tabs-content .tab-con-box input {height:30px;line-height:30px;border:0}

/* tab dn box */
.tabs-box .tabs-container .tabs-content .tab-dn-box {float:left;width:100%;height:60px;padding:10px 20px;border-top:1px solid #ccc}
.tabs-box .tabs-container .tabs-content .tab-dn-box label {height:40px;color:#999;line-height:40px;cursor:pointer}
.tabs-box .tabs-container .tabs-content .tab-dn-box .article-submit-btn {float:right;width:100px;height:40px;line-height:40px;border-radius:5px}
.martop-15 {margin-top:15px}
.maright-20 {margin-right:20px}

/* 추가 항목 입력 버튼 */
.con-task button.add-item-btn {margin-top:15px;padding:5px 15px;color:#999;border:1px solid #999;border-radius:20px}
.con-task button.add-item-btn:hover {color:#333;border-color:#333}

/* 추가 항목 박스 */
.add-item-box {display:none}
.add-item-box input {width:40% !important}

/* 시작일, 마감일 */
.con-task i.icon-task {display:block;overflow:hidden;width:18px;height:20px;margin-top:5px;text-indent:-5000px}
.con-task i.icon-task.icon-sDate {background-position:-200px -300px}
.con-task i.icon-task.icon-fDate {background-position:-300px -300px}
.con-task input#sdate,
.con-task input#fdate {
	width:-webkit-calc(100% - 80px);
	width:-moz-calc(100% - 80px);
	width:-o-calc(100% - 80px);
	width:calc(100% - 80px);
}

/* 진척도 */
.work-range {position:relative;width:200px;height:20px;margin-top:5px;background-color:#ccc;border-radius:10px;text-align:center}
.work-range span.work-percent {position:absolute;top:0;left:0;right:0;z-index:2;height:20px;font-size:12px;line-height:20px}
.work-range .pcnt-bar {position:absolute;top:0;left:0;bottom:0;z-index:1;background-color:#45aaf2;border-radius:10px}
.work-range .pcnt-btn {position:absolute;width:20%;top:0;bottom:-10px;z-index:3;cursor:pointer}
.work-range .pcnt-btn span {display:none}
.work-range .pcnt-btn.pcnt-20 {left:0}
.work-range .pcnt-btn.pcnt-40 {left:20%}
.work-range .pcnt-btn.pcnt-60 {left:40%}
.work-range .pcnt-btn.pcnt-80 {left:60%}
.work-range .pcnt-btn.pcnt-100 {left:80%}

/* 우선순위 */
.task-rank {position:absolute;top:0;left:0px;z-index:99;height:30px;color:#333;background-color:#fff}
.task-rank-list {
	display:none;
	position:absolute;
	top:34px;
	z-index:99;
	width:150px;
	background-color:#fff;
	border:1px solid #ddd;
	border-radius:5px;
	box-shadow:0 2px 5px rgba(0, 0, 0, 0.15)
}
.task-rank-list li {width:100%;height:34px;padding:0 10px;color:#333;line-height:34px;cursor:pointer}
.task-rank-list li:hover {background-color:#efefef}
.task-rank i.rank-icon,
.task-rank-list li i.rank-icon {overflow:hidden;display:inline-block;width:8px;height:14px;margin:10px 10px 0 0;text-indent:-5000px}
.task-rank i.rank-icon.icon-low,
.task-rank-list li i.rank-icon.icon-low {background-position:-100px -350px}
.task-rank i.rank-icon.icon-basic,
.task-rank-list li i.rank-icon.icon-basic {height:10px;background-position:-200px -350px}
.task-rank i.rank-icon.icon-high,
.task-rank-list li i.rank-icon.icon-high {background-position:-300px -350px}
.task-rank i.rank-icon.icon-emer,
.task-rank-list li i.rank-icon.icon-emer {background-position:-400px -350px}
.task-rank i.rank-icon {margin-top:8px}


/* 업무상태 */
.con-task .task-state-list label {float:left;height:30px;padding:0 20px;border:1px solid #ccc;border-width:1px 1px 1px 0;cursor:pointer}
.con-task .task-state-list label:first-child {border-left:1px solid #ccc;border-radius:5px 0 0 5px}
.con-task .task-state-list label:last-child {border-radius:0 5px 5px 0}
.con-task .task-state-list label.checked {color:#fff}
.con-task .task-state-list label:first-child.checked {background-color:#45aaf2;border-color:#45aaf2}
.con-task .task-state-list label:nth-child(2).checked {background-color:#26de81;border-color:#26de81}
.con-task .task-state-list label:nth-child(3).checked {background-color:#e67e22;border-color:#e6722}
.con-task .task-state-list label:nth-child(4).checked {background-color:#2b3991;border-color:#2b3991}
.con-task .task-state-list label:nth-child(5).checked {background-color:#8d8e90;border-color:#8d8e90}
</style>
</head>
<body>
	<h1>제진공간</h1>
	
<form action="/chord/task/insert" method="post" enctype="multipart/form-data">	
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
					<input type="text" name="time_kind" placeholder="시작일설정"
						class="datepicker-here">
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
					<input type="text" name="time_kind" placeholder="마감일설정"
						class="datepicker-here">
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
		<button type="button" class="add-item-btn" onclick="fn_addItem(this)">
			<i class="fas fa-angle-down maright-10"></i> 추가 항목 입력
		</button>

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