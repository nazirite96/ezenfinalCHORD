<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css" rel="stylesheet" type="text/css">
<!-- task jquery-->
<script	src="<%=request.getContextPath()%>/resources/js/task_custom.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_margin.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_padding.css">
</head>
<body>
<!-- 
	<div>
		단일 달력<br/> <input type="text" id="datepicker1"> - <input type="text" id="datepicker2">
	</div>
	<br />
	<br />
	<br />
	<input type="hidden" name="mem_no" >
	<input type="hidden" name="pro_no" >
	 -->
<form action="taskInsert.do" name="TaskDTO" enctype="multipart/form-data">	
	<div class="tab-con-box">
		<!-- 업무명 s -->
		<div class="input-box">
			<input type="text" name="task_title" placeholder="업무명을 입력하세요." required="required">
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
					<input type="text" id="mem_no" placeholder="담당자 추가" onfocus="fn_taskManagerFocus(this)" />

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
					<input type="text" name="time_date" placeholder="시작일설정"  id="datepicker1" class="datepicker-here" data-timepicker="true" data-time-format='AA hh:ii:ss'>
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
					<input type="text" name="time_date" placeholder="마감일설정" id="datepicker2" class="datepicker-here"data-timepicker="true" data-time-format='AA hh:ii:ss'>
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
					<input type="text" name="task_priority" class="task-rank-input"	placeholder="우선순위 선택" onfocus="fn_taskRankFocus(this)" readonly="readonly"> 
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
		<button type="button" class="add-item-btn" onclick="fn_addItem(this)"><i class="fas fa-angle-down maright-10"></i> 추가 항목 입력</button>
		<!-- 글 -->
		<textArea rows="5" cols="" name="task_content" class="autosize" onkeyup="resize(this)"
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

<script>
datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

/*
    * 달력 생성기
    * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
    * @example   datePickerSet($("#datepicker"));
    * 
    * 
    * @param sDate, 
    * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
    * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
    */
function datePickerSet(sDate, eDate, flag) {

    //시작 ~ 종료 2개 짜리 달력 datepicker	
    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
        var sDay = sDate.val();
        var eDay = eDate.val();

        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
            var sdp = sDate.datepicker().data("datepicker");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

            var edp = eDate.datepicker().data("datepicker");
            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
        }

        //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(eDay)) {
            sDate.datepicker({
                maxDate: new Date(eDay.replace(/-/g, "/"))
            });
        }
        sDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
            }
        });

        //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(sDay)) {
            eDate.datepicker({
                minDate: new Date(sDay.replace(/-/g, "/"))
            });
        }
        eDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
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
            language: 'ko',
            autoClose: true,
        });
    }


    function isValidStr(str) {
        if (str == null || str == undefined || str == "")
            return true;
        else
            return false;
    }
}
	
function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (obj.scrollHeight)+"px";
	}
	  
</script>	
</body>
</html>