/*******************************************
* Note : task state change
* 설명 : 업무상태 설정 - 해당 업무상태 선택시, 각 업무상태에 맞게 색상 변경 클래스 추가
*******************************************/
function fn_checkTaskState(el){
	var item = $(el);
	var stateList = item.parent('.task-state-list');
	
	stateList.find('label').removeClass('checked');
	item.addClass('checked');
}

/*******************************************
* Note : task start & end date reset
* 설명 : 업무시작일 및 종료일 값 초기화
*******************************************/
function fn_dateReset(el){
	var item = $(el);
	var dateInput = item.siblings('input.datepicker-here');
	
	dateInput.val('');
	dateInput.onFocus.value('');
}

/*******************************************
* Note : task rank list box show & hide(input)
* 설명 : input태그에 focus되었을 때, 업무 우선순위 리스트 박스 show & hide
*******************************************/
function fn_taskRankFocus(el){
	var item = $(el);
	var taskRankList = item.siblings('.task-rank-list');
	
	taskRankList.fadeIn();
	item.on('blur', function(){
		taskRankList.fadeOut();
	});
}


/*******************************************
* Note : task rank list box show & hide(span)
* 설명 : span태그 클릭시 input태그에 focus처리,
* 		업무 우선순위 리스트 박스 show & hide
*******************************************/
function fn_taskRankClick(el){
	var item = $(el);
	var taskRankInput = item.siblings('.task-rank-input');
	
	taskRankInput.focus();
}


/*******************************************
* Note : task rank select function
* 설명 : 업무 우선순위 선택시 선택한 우선순위 표시
*******************************************/
function fn_taskRankSelect(el){
	var item = $(el);
	var iconClass = item.find('i').attr('class').split(' ')[2];
	var taskRank = item.parent('ul').siblings('span.task-rank');
	var input = item.parent('ul').siblings('.task-rank-input');
	
	taskRank.css('right', '0');
	taskRank.html(
		"<i class=\"flow-icon rank-icon " + iconClass + "\"></i>"
		+ item.text()
		+ "<i class=\"fas fa-times-circle marleft-15 color-gray\" style=\"cursor:pointer\"></i>"
		+ "<input type=\"hidden\" name=\"task-rank\" value=\"" + item.text() + "\">"
	);
	input.val(item.text());
	
	taskRank.find("i.fas.fa-times-circle").on("click", function(){
		taskRank.html('');
		taskRank.css("right", "100%");
	});
}

/*******************************************
* Note : task add item box show
* 설명 : '추가항목입력' 버튼 클릭시 추가항목 박스 보이기
*******************************************/
function fn_addItem(el){
	var item = $(el);
	var addItemBox = item.siblings('.add-item-box');

	item.fadeOut(1);
	addItemBox.fadeIn();
}


