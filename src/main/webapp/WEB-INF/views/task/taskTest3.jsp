<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/jjtest/datepicker.css">
<!-- 값 제어를 위해 jquery-->
<script	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script> 
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
<link href="<%=request.getContextPath()%>/resources/css/JeCss2.css" rel="stylesheet" type="text/css">
<!-- task jquery-->
<script	src="<%=request.getContextPath()%>/resources/js/task_custom2.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_margin.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_padding.css">
</head>
<body>
<!-- 타임라인 출력 -->
<div class="timeline-article con-task">

	<!-- 업무명:s -->
	<div class="input-box">
		<input type="text" class="font-bold size-18" placeholder="업무명을 입력하세요." value="${timeLine.taskDTO.task_title }" readonly>
	</div>
	<!-- 업무명:f -->
		
	<!-- 업무상태:s -->
	<div class="input-box martop-15">
		<dl>
			<dt class="maright-20"><i class="fas fa-user-clock"></i></dt>
			<dd>
				<input type="hidden" class="edit-confirm" data-taskno="${timeLine.taskVo.task_no }">
				<div class="task-state-list">
				
					<c:set var="sReq" value=""/>
					<c:set var="sPro" value=""/>
					<c:set var="sFee" value=""/>
					<c:set var="sCom" value=""/>
					<c:set var="sHol" value=""/>
					
					<c:choose>
						<c:when test="${timeLine.taskDTO.task_state == '요청' }">
							<c:set var="sReq" value="checked"/>
						</c:when>
						<c:when test="${timeLine.taskDTO.task_state == '진행' }">
							<c:set var="sPro" value="checked"/>
						</c:when>
						<c:when test="${timeLine.taskDTO.task_state == '피드백' }">
							<c:set var="sFee" value="checked"/>
						</c:when>
						<c:when test="${timeLine.taskDTO.task_state == '완료' }">
							<c:set var="sCom" value="checked"/>
						</c:when>
						<c:when test="${timeLine.taskDTO.task_state == '보류' }">
							<c:set var="sHol" value="checked"/>
						</c:when>
					</c:choose>
					<label class="${sReq }" onchange="fn_editTaskState(this)">
						요청<input type="radio" name="edit-task-state" value="요청" class="dis-none task-re">
					</label>
					<label class="${sPro }" onchange="fn_editTaskState(this)">
						진행<input type="radio" name="edit-task-state" value="진행" class="dis-none task-pr">
					</label>
					<label class="${sFee }" onchange="fn_editTaskState(this)">
						피드백<input type="radio" name="edit-task-state" value="피드백" class="dis-none task-fb">
					</label>
					<label class="${sCom }" onchange="fn_editTaskState(this)">
						완료<input type="radio" name="edit-task-state" value="완료" class="dis-none task-sc">
					</label>
					<label class="${sHol }" onchange="fn_editTaskState(this)">
						보류<input type="radio" name="edit-task-state" value="보류" class="dis-none task-hd">
					</label>
				</div>
				
			</dd>
		</dl>
	</div>	
	<!-- 업무상태:f -->
		
	<!-- 담당자:s -->
	<div class="input-box martop-15" style="height:inherit">
		<dl>
			<dt class="maright-20"><i class="fas fa-user-plus"></i></dt>
			<dd class="posi-re">
				
				<!-- 담당자 리스트 -->
				<div class="task-user-list">
					<c:if test="${timeLine.tuList.size() == 0 }">
						<p class="mar-0 pad-0">담당자 없음</p>
					</c:if>
					<c:forEach items="${timeLine.tuList }" var="tuVo">
						<div class="name-tag">
							<img src="/mem/pic?mem_id=${tuVo.tu_mem_id }" width="24">
							<strong class="marleft-10">${tuVo.mem_nick }</strong>
							<i class="fas fa-times-circle marleft-15" style="display:none"></i>
							<input type="hidden" name="tu_mem_id" value="${tuVo.tu_mem_id }">
						</div>
					</c:forEach>
				</div>
			</dd>
		</dl>
	</div>
	<!-- 담당자:f -->
		
	<!-- 시작일:s -->
	<div class="input-box martop-15 add-item-box">
		<dl>
			<dt class="maright-20"><i class="flow-icon icon-task icon-sDate"></i></dt>
			<dd class="posi-re">
				<input type="text" placeholder="시작일" value="${timeLine.taskDTO.time_start_date }" readonly/>
			</dd>
		</dl>
	</div>
	<!-- 시작일:f -->
	
	<!-- 마감일:s -->
	<div class="input-box martop-15 add-item-box">
		<dl>
			<dt class="maright-20"><i class="flow-icon icon-task icon-fDate"></i></dt>
			<dd class="posi-re">
				<input type="text" placeholder="마감일" value="${timeLine.taskDTO.time_end_date }" readonly/>
			</dd>
		</dl>
	</div>
	<!-- 마감일:f -->
		
	<!-- 우선순위:s -->
	<div class="input-box martop-15 add-item-box">
		<dl>
			<dt class="maright-20"><i class="fas fa-flag"></i></dt>
			<dd class="posi-re">
				<span class="task-rank">
					<c:choose>
						<c:when test="${timeLine.taskDTO.task_priority == null}">
							<p class="mar-0 pad-0 color-gray">우선순위</p>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${timeLine.taskDTO.task_priority == '낮음'}">
									<i class="flow-icon rank-icon icon-low"></i>${timeLine.taskDTO.task_priority }
								</c:when>
								<c:when test="${timeLine.taskDTO.task_priority == '보통'}">
									<i class="flow-icon rank-icon icon-basic"></i>${timeLine.taskDTO.task_priority }
								</c:when>
								<c:when test="${timeLine.taskDTO.task_priority == '높음'}">
									<i class="flow-icon rank-icon icon-high"></i>${timeLine.taskDTO.task_priority }
								</c:when>
								<c:when test="${timeLine.taskDTO.task_priority == '긴급'}">
									<i class="flow-icon rank-icon icon-emer"></i>${timeLine.taskDTO.task_priority }
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</span>
			</dd>
		</dl>
	</div>
	<!-- 우선순위:f -->
	
	<button type="button" class="add-item-btn" onclick="fn_addItem(this)"><i class="fas fa-angle-down maright-10"></i> 추가 항목 입력</button>
	
	<!-- 내용:s -->
	<div class="article-txt martop-50">
		<pre>${timeLine.taskDTO.task_content }</pre>
	</div>
	<!-- 내용:f -->
	
	<!-- 이미지:s -->
	<div class="article-img martop-20">
		<div class="swiper-container-img">
			<div class="swiper-wrapper">
				<c:forEach items="${timeLine.filesList }" var="filesVo">
					<c:if test="${filesVo.files_kind == 'img' }">
						<div class="swiper-slide img-con" style="background-image:url('/files/view?files_no=${filesVo.files_no}')"></div>
					</c:if>
				</c:forEach>
			</div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
	<!-- 이미지:f -->
	
	<!-- 파일리스트:s -->
	<div class="article-file martop-20">
		<c:forEach items="${timeLine.filesList }" var="filesVo">
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
		</c:forEach>
	</div>
	<!-- 파일리스트:f -->
</div>
</body>
</html>
