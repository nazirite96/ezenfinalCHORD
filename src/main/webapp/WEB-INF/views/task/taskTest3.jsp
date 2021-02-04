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
<script src="<%=request.getContextPath() %>/resources/js/datepicker2.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/datepicker2.en.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/datepicker2.ko.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/datepicker2.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/flowolf_custom.js"></script>

<!-- Air datepicker css -->
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/jjtest/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_margin.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_padding.css">    
<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font-awesome CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>
<form action="#" method="post" enctype="multipart/form-data">

	<!-- tab-con-box:s -->
	<div class="tab-con-box">
		<!-- 업무명:s -->
		<div class="input-box">
			<input type="text" name="task_title" class="font-bold size-18" placeholder="업무명을 입력하세요." required="required">
		</div>
		<!-- 업무명:f -->
		
		<!-- 업무상태:s -->
		<div class="input-box martop-15">
			<dl>
				<dt class="maright-20"><i class="fas fa-user-clock"></i></dt>
				<dd>
					<div class="task-state-list">						
						<label class="checked" onchange="fn_checkTaskState(this)">
							요청<input type="radio" name="task_state" value="요청" class="dis-none" checked="checked">
						</label>
						<label onchange="fn_checkTaskState(this)">
							진행<input type="radio" name="task_state" value="진행" class="dis-none">
						</label>
						<label onchange="fn_checkTaskState(this)">
							피드백<input type="radio" name="task_state" value="피드백" class="dis-none">
						</label>
						<label onchange="fn_checkTaskState(this)">
							완료<input type="radio" name="task_state" value="완료" class="dis-none">
						</label>
						<label onchange="fn_checkTaskState(this)">
							보류<input type="radio" name="task_state" value="보류" class="dis-none">
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
					<input type="text" id="tu_mem_id" placeholder="담당자 추가" onfocus="fn_taskManagerFocus(this)">
					
					<!-- 담당자 리스트 -->
					<div class="task-user-list">
					</div>
					
					<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):s -->
					<div class="pro-user-list">
						<c:forEach items="${proUserList }" var="proUserVo">
							<div class="pro-user-info" onclick="fn_taskManagerSelect(this)">
								<div class="pro-user-photo maright-10">
									<i class="icon-circle circle-s"></i>
									<img src="/mem/pic?mem_id=${proUserVo.mem_id }" width="40px">
								</div>
								<span class="user-id" data-id="${proUserVo.mem_id }">${proUserVo.mem_nick }</span>
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
				<dt class="maright-20"><i class="flow-icon icon-task icon-sDate"></i></dt>
				<dd class="posi-re">
					<input type="text" name="task_start_date" placeholder="시작일설정" data-language='ko' class="datepicker-here"/>
					<i class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point" onclick="fn_dateReset(this)"></i>
				</dd>
			</dl>
		</div>
		<!-- 시작일:f -->
		
		<!-- 마감일:s -->
		<div class="input-box martop-15 add-item-box">
			<dl>
				<dt class="maright-20"><i class="flow-icon icon-task icon-fDate"></i></dt>
				<dd class="posi-re">
					<input type="text" name="task_end_date" placeholder="마감일설정" data-language='ko' class="datepicker-here"/>
					<i class="fas fa-times-circle martop-8 marleft-15 color-gray cursor-point" onclick="fn_dateReset(this)"></i>
				</dd>
			</dl>
		</div>
		<!-- 마감일:f -->
		
		<!-- 작업진척도:s -->
		<div class="input-box martop-15 add-item-box">
			<dl>
				<dt class="maright-20"><i class="far fa-chart-bar"></i></dt>
				<dd>
					<div class="work-range">
						<input type="hidden" name="task_rate" value="0">
						<span class="work-percent"></span>
						<div class="pcnt-bar"></div>
						<div class="pcnt-btn pcnt-20" onclick="fn_progressSelect(this)" data-toggle="tooltip" data-placement="bottom" title="20"><span>20</span></div>
						<div class="pcnt-btn pcnt-40" onclick="fn_progressSelect(this)" data-toggle="tooltip" data-placement="bottom" title="40"><span>40</span></div>
						<div class="pcnt-btn pcnt-60" onclick="fn_progressSelect(this)" data-toggle="tooltip" data-placement="bottom" title="60"><span>60</span></div>
						<div class="pcnt-btn pcnt-80" onclick="fn_progressSelect(this)" data-toggle="tooltip" data-placement="bottom" title="80"><span>80</span></div>
						<div class="pcnt-btn pcnt-100" onclick="fn_progressSelect(this)" data-toggle="tooltip" data-placement="bottom" title="100"><span>100</span></div>
					</div>
				</dd>
			</dl>
		</div>
		<!-- 작업진척도:f -->
		
		<!-- 우선순위:s -->
		<div class="input-box martop-15 add-item-box">
			<dl>
				<dt class="maright-20"><i class="fas fa-flag"></i></dt>
				<dd class="posi-re">
					<input type="text" name="task_priority" class="task-rank-input" placeholder="우선순위 선택" onfocus="fn_taskRankFocus(this)" readonly="readonly">
					<span class="task-rank" onclick="fn_taskRankClick(this)"></span>
					
					<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):s -->
					<ul class="task-rank-list">
						<li onclick="fn_taskRankSelect(this)"><i class="flow-icon rank-icon icon-low"></i>낮음</li>
						<li onclick="fn_taskRankSelect(this)"><i class="flow-icon rank-icon icon-basic"></i>보통</li>
						<li onclick="fn_taskRankSelect(this)"><i class="flow-icon rank-icon icon-high"></i>높음</li>
						<li onclick="fn_taskRankSelect(this)"><i class="flow-icon rank-icon icon-emer"></i>긴급</li>
					</ul>
				</dd>
			</dl>
		</div>
		<!-- 우선순위:f -->
		
		<button type="button" class="add-item-btn" onclick="fn_addItem(this)"><i class="fas fa-angle-down maright-10"></i> 추가 항목 입력</button>
		
		<!-- 글 -->
		<textarea rows="5" cols="" name="task_cont" class="martop-20" placeholder="글을 작성하세요."></textarea>
		
		<!-- 이미지 목록이 나올부분 -->
		<div class="upload-img-list">
		</div>
		
		<!-- 첨부파일 목록이 나올부분 -->
		<div class="upload-file-list">
		</div>
	</div>
	<!-- tab-con-box:f -->
	
	<!-- tab-dn-box:s -->
	<div class="tab-dn-box">
		<!-- 파일첨부 -->
		<label for="articleFileTask" class="float-left maright-20 marbtm-0 font-thin size-18">
			<i class="fas fa-paperclip maright-10"></i>파일첨부
		</label>
		<input type="file" id="articleFileTask" name="articleFile" class="dis-none" onchange="fileUpload(this)">
		
		<!-- 이미지첨부 -->
		<label for="articleImgTask" class="float-left marbtm-0 font-thin size-18">
			<i class="fas fa-camera maright-10"></i>이미지첨부
		</label>
		<input type="file" id="articleImgTask" name="imageFile" class="dis-none" onchange="imgUpload(this)" accept="image/*">
		
		<!-- 올리기(submit) 버튼 -->
		<input type="submit" value="올리기" class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
	</div>
	<!-- tab-dn-box:f -->
</form>
</html>
