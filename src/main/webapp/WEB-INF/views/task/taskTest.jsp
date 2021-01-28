<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>
<style>

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
<div class="timeline-article con-task">

	<!-- 업무명 value="${timeLine.taskDTO.task_title}" readonly-->
	<div class="input-box">
		<input type="text" placeholder="업무명을 입력하세요.">
	</div>
	
	<div class="input-box martop-15">
		<dl>
			<dt calss="maright-20"><i class="fas fa-user-clock"></i></dt>
			<dd>
				<input type="hidden" class="edit-confirm" data-taskno="${timeLine.taskDTO.task_no}">
				<div class="task-state-list">
					
					<c:set var="sReq" value=""></c:set>
					<c:set var="sPro" value=""></c:set>
					<c:set var="sFee" value=""></c:set>
					<c:set var="sCom" value=""></c:set>
					<c:set var="sHol" value=""></c:set>
					
					<c:choose>
						<c:when test="${timeLine.taskDTO.task.sate == '요청'}">
							<c:set var="sReq" value="checked"></c:set>
						</c:when>
						<c:when test="${timeLine.taskDTO.task.sate == '진행'}">
							<c:set var="sPro" value="checked"></c:set>
						</c:when>
						<c:when test="${timeLine.taskDTO.task.sate == '피드백'}">
							<c:set var="sFee" value="checked"></c:set>
						</c:when>
						<c:when test="${timeLine.taskDTO.task.sate == '완료'}">
							<c:set var="sCom" value="checked"></c:set>
						</c:when>
						<c:when test="${timeLine.taskDTO.task.sate == '보류'}">
							<c:set var="sHol" value="checked"></c:set>
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

</div>

<a href="taskTest2.do">dfsdf</a>
</body>
</html>