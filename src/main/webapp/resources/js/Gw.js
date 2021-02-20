/*******************************************
*
* Category : TimeLine
*
*******************************************/
//얼럿
function alertCustom(text, className){
	var alertBox = $('.alert');
	
	alertBox.html(text);
	alertBox.addClass(className);
	alertBox.css('margin-left', -(alertBox.outerWidth()/2));
	alertBox.fadeIn();
	setTimeout(function(){alertBox.fadeOut()}, 3000);
}




//팝업



$(function() {

	// check color : 현재 프로젝트 색상과 같은 색상리스트를 찾아 체크표시
	var backColor = $("#proTitle").attr("class").split(' ').pop(); // 현재 적용된 색상명(클래스명)
	$(".edit-color-box").find("div").each(function(i, e) {
		var selectColor = $(this).attr("class").split(' ').pop();

		if (backColor == selectColor) {
			$(this).addClass("select-color");
		}
	});

	// 다른 색상을 선택했을 때 색상바꾸기
	$(".edit-color-box").find("div").on("click", function() {
		var changeColor = $(this).attr("class").split(' ').pop();
		var pro_no = $(this).parent().data("prono")
		var mem_no = $(this).parent().data("memno")
		$("#proTitle").removeClass(backColor);
		$("#proTitle").addClass(changeColor);
		backColor = changeColor;

		$.ajax({

			url: "updateProUserColor.do",
			method: "get",
			data: { pro_user_color: changeColor ,pro_no: pro_no, mem_no: mem_no  },
			dataType: "json",
			success: function(data) {
				if (data == 1) {
					alertCustom("변경되었습니다.", "alert-warning");
				}
			}
		});

		$(this).addClass("select-color");
		$(".edit-color-box").find("div").not(this).removeClass("select-color");

	});
});

// 프로젝트 보관함 popup
function boxProEdit() {
	// 				$(".proFolderEdit-form #pro_no").val("1");
	layer_popup("#proFolderEdit");
}

// 프로젝트 수정 popup
function proUpdate() {
	layer_popup("#editProject");
}

// 프로젝트 나가기 popup
function deleteProUser() {
	layer_popup("#deleteProUser");
}

// 프로젝트 삭제 popup
function deletePro() {
	layer_popup("#deletePro");
}


/*******************************************
*
* Category : TimeLine 댓글 삭제
*
*******************************************/

/*******************************************
* Note : comment edit button clicked
* 설명 : '댓글' 수정 버튼 클릭시 이벤트 발생
*******************************************/
function fn_commentEdit(el) {

	var item = $(el);
	var commentUserInfo = item.parent().siblings('.comment-user-info');
	var commentTxt = item.parent().siblings('.article-txt');
	var commentEditBtn = item.parent();
	var commentEditBox = item.parent().siblings('.comment-edit-box');
	var editTextarea = commentEditBox.find('textarea');

	commentUserInfo.hide();
	commentTxt.hide();
	commentEditBtn.hide();
	commentEditBox.show();
	editTextarea.val(commentTxt.find('pre').text()).focus();
	editTextarea.focus();
	
}

/*******************************************
* Note : comment edit key event
* 설명 : '댓글' 수정시 키보드를 눌렀을 때 이벤트 처리
*******************************************/
function fn_keyDownEsc(event, el) {
	var key = event.keyCode;
	var item = $(el);

	var commentEditBox = item.parent().parent().parent('.comment-edit-box');
	var commentUserInfo = commentEditBox.siblings('.comment-user-info');
	var commentTxt = commentEditBox.siblings('.article-txt');
	var commentEditBtn = commentEditBox.siblings('.comment-edit-btn');


	if (key == "13" && !event.shiftKey) {	// Enter 키 입력시

		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		if (!event.shiftKey) {
			commentEditBox.children('form').submit();
		}

	} else if (key == "27") {	// ESC 키 입력시

		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		commentEditBox.hide();
		commentUserInfo.show();
		commentTxt.show();
		commentEditBtn.show();

	}
}


/*******************************************
* Note : comment insert key event
* 설명 : '댓글' 등록시 키보드를 눌렀을 때 이벤트 처리
*******************************************/
function fn_commentKeyDown(event, el) {

	var key = event.keyCode;
	
	var item = $(el);
	var commentInsertBox = item.parent().parent().parent().parent('.comment-insert-box');
	var commentInsertForm = commentInsertBox.parent('form');
	var commentWrap = commentInsertForm.parent();
	var timelineFooter = commentWrap.parent();
	var dataTimNo = timelineFooter.siblings('.col-no').attr('data-no');
	
	var inputTimeNo = commentInsertBox.siblings('.timeline_no');
	inputTimeNo.val(dataTimNo);

	if (key == "13") {	// Enter 키 입력시

		if (!event.shiftKey) {
			if (item.val() == "" || item.val() == null) {
				alertCustom("댓글 내용을 작성해주세요", "alert-danger");
				return false;
			}

			commentInsertForm.submit();
		}

	}
}





/*******************************************
*
* Category : TimeLine 타임라인 삭제
*
*******************************************/
/*******************************************
*******************************************/



/*******************************************
* Note : layer pop-up
* 설명 : <a> 태그 버튼 클릭시 경로(href)에 지정된
* 		아이디값과 동일한 아이디를 가진 박스를 layer 팝업으로 띄워라
*******************************************/

// 새 비밀번호 설정(NEW PASSWORD)
$('.find-pw-btn').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

// 보관함(MY FOLDER)
$('.add-folder-pop-btn').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

// 보관함 수정(MY FOLDER > EDIT)
$('.folder-edit').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

// 보관함 삭제(MY FOLDER > DELETE)
$('.folder-delete').click(function() {
	var $href = $(this).attr('href');
	var box_no = $(this).data("boxno");
	alert(box_no);
	$("#deleteFolder").children().children("input[id=box_no]").val(box_no);
	layer_popup($href);
});

// 프로젝트 추가(ADD PROJECT > INSERT)
$('.add-pro-link').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});
$('.updateCont').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

// 프로젝트 보관함 설정
$('.pro-folder-edit-btn').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

//채팅 팝업 동료 탭에서 내 프로필 클릭시 자세히보기
$('.my-pop').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

// 기본 layer popup
function layer_popup(el) {

	var $el = $(el);        //레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
	var layer = $el.parent('.dim-layer');

	isDim ? layer.fadeIn() : $el.fadeIn();

	var $elWidth = ~~($el.outerWidth()),
		$elHeight = ~~($el.outerHeight()),
		docWidth = $(document).width(),
		docHeight = $(document).height();

	// 화면의 중앙에 레이어를 띄운다.
	if ($elHeight < docHeight || $elWidth < docWidth) {
		$el.css({
			marginTop: -$elHeight / 2,
			marginLeft: -$elWidth / 2
		})
	} else {
		$el.css({ top: 0, left: 0 });
	}

	$el.find('.btn-close').click(function() {
		$el.find('input[type=text]').val('');
		$el.find('input[type=password]').val('');
		
		$el.find('input[type=radio]').prop('checked', false);
		$el.find('textarea').val('');
		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		return false;
	});

	$('.layer .dimBg').click(function() {
		$('.dim-layer').fadeOut();
		return false;
	});

}



// task 상태 수정 팝업
function fn_editTaskState(el) {

	var item = $(el);
	var stateList = item.parent('.task-state-list');
	var layerPopCon = $("#editTaskState");
	
	// task_no & task_state
	var task_no = stateList.siblings(".edit-confirm").data("taskno");
	var pro_no = stateList.siblings(".edit-confirm").data("prono");
	
	
	$("#editTaskState .pro_no").val(pro_no);

	var task_state = item.children().val();
	
	// 값 이동
	layerPopCon.children('form').children("input[name=task_no]").val(task_no);
	layerPopCon.children('form').children("input[name=pro_no]").val(pro_no);
	layerPopCon.children('form').children("input[name=task_state]").val(task_state);

	layer_popup(layerPopCon);

}

// task 진척도 수정 
function fn_timeProgressSelect(el) {
	var item = $(el);
	var task_rate = item.children('span').text();
	var task_no = item.siblings('input').data("taskno");

	$(".edit-rate-form").children("input[name=task_no]").val(task_no);
	$(".edit-rate-form").children("input[name=task_rate]").val(task_rate);

	$(".edit-rate-form").submit();
}

// 이모티콘 유저 리스트 팝업
function fn_emoUserPop(count) {
	layer_popup("#emoUser_" + count);
}

$(function() {

	// 상단 고정 버튼 클릭시
	$(".pick-check-btn").click(function() {

		// layer pop up show
		var $href = $(this).attr('href');
		layer_popup($href);

		// layer pop text show & hide
		var item = $(this);
		var icon = item.children();
		var layerWrap = $($href);

		var timeline_col = $(this).parents(".timeline-box").children(".col-no").data("no");
		window.alert(timeline_col);
		// 고정되어있는 글
		if (item.hasClass('fixed')) {
			alert("있다~");
			var fixedCon = item.parent().parent().parent().parent();
			var fixedTop = fixedCon.siblings(".article-fix-top");
			var colNo = fixedTop.children().children(".col-no");

			timeline_col = colNo.data("col");
			timeline_no = colNo.data("no");
		}

		$(".fix-form .timeline_no").val(timeline_col);

		if (icon.hasClass('pick-active')) {		// 고정되어있음
			layerWrap.find('p.fix-n').hide();
			layerWrap.find('p.fix-y').show();	// 해제
		} else {
			layerWrap.find('p.fix-y').hide();
			layerWrap.find('p.fix-n').show();	// 고정
		}
	});

	// 좋아요 클릭 이벤트
	$(".emoticon-box li").click(function() {
		var item = $(this);
		var emo_no = $(this).data("emono");
		var timeline_col = $(this).parents(".timeline-box").children(".col-no").data("col");
		var timeline_no = $(this).parents(".timeline-box").children(".col-no").data("no");

		var emoticonAfterBtn = $(this).parents(".dropdown-menu").siblings(".emoticon-after-btn");
		var likeResult = item.parents(".article-etc-menu").siblings(".like-result");
		var likeImg = likeResult.children("img");
		var likeMem = likeResult.children(".like-mem");
		var size = likeMem.data("size");

		var emoUserListPop = likeResult.siblings(".dim-layer");
		var popCon = emoUserListPop.children(".pop-layer").children(".pop-con");
		var emoUserCntSpan = popCon.children("ul").find("span");
		var emoUserCnt = Number(popCon.children("ul").find("span").text());

		var likeCountList = popCon.children(".like-count-list");
		var simplebarCon = likeCountList.children(".simplebar-scroll-content").children(".simplebar-content");

		$.ajax({
			url: "/emoUser/insert",
			method: "get",
			data: { emo_no: emo_no, timeline_col: timeline_col, timeline_no: timeline_no },
			dataType: "json",
			success: function(data) {
				fn_emoticon(item);
				emoticonAfterBtn.data("emouser", data);

				// 이모티콘 이미지
				if (likeImg.length < 3) {
					likeResult.prepend("<img src=\"/emo/view?emo_no=" + emo_no + "\" data-no=" + data + " width=\"20\" class=\"maright-10\">");
				}

				// 좋아요 누른 회원
				if (size > 0) {
					likeMem.html("<strong>${memVo.mem_nick }</strong> 님  외" + size + "명");
				} else {
					likeMem.html("<strong class=\"me\">${memVo.mem_nick }</strong> 님");
				}

				// data-size : +1
				likeMem.data("size", size + 1);

				// append 내용
				var str = "<dl data-id=\"${memVo.mem_id }\">"
					+ "<dt class=\"posi-re\">"
					+ "<i class=\"icon-circle circle-s\"></i>"
					+ "</dt>"
					+ "<dd>"
					+ "<div class=\"like-user-name\">${memVo.mem_nick }</div>"
					+ "<div class=\"like-user-emoticon\"><img src=\"/emo/view?emo_no=" + emo_no + "\" width=\"40\"></div>"
					+ "</dd>"
					+ "</dl>";

				emoUserCntSpan.html(emoUserCnt + 1);	// 인원수 추가
				simplebarCon.append(str);			// 리스트 추가

			}
		});
	});

	// 이모티콘 취소 이벤트
	$(".emoticon-after-btn").click(function() {
		var item = $(this);
		var emo_user_no = item.data("emouser");

		var likeResult = item.parents(".article-etc-menu").siblings(".like-result");
		var likeImg = likeResult.children("img");
		var likeMem = likeResult.children(".like-mem");
		var size = likeMem.data("size");

		var emoUserListPop = likeResult.siblings(".dim-layer");
		var popCon = emoUserListPop.children(".pop-layer").children(".pop-con");
		var emoUserCntSpan = popCon.children("ul").find("span");
		var emoUserCnt = Number(popCon.children("ul").find("span").text());

		var likeCountList = popCon.children(".like-count-list");
		var simplebarCon = likeCountList.children(".simplebar-scroll-content").children(".simplebar-content");
		var emoUserOne = simplebarCon.children("dl");

		$.ajax({
			url: "/emoUser/delete",
			method: "get",
			data: { emo_user_no: emo_user_no },
			dataType: "json",
			success: function(data) {
				fn_emoResultBtn(item);
				item.data("emouser", "");

				// 이모티콘 이미지
				likeImg.each(function(i, e) {
					if (likeImg.eq(i).data("no") == emo_user_no) {
						likeImg.eq(i).remove();
					}
				});

				// 좋아요 누른 회원
				if (size == 1 && likeMem.children("strong").hasClass("me")) {
					likeMem.html("");
				} else if (size > 0) {
					likeMem.html(size - 1 + "명");
				} else {
					likeMem.html("");
				}

				// data-size : -1
				likeMem.data("size", size - 1);

				emoUserCntSpan.html(emoUserCnt - 1);	// 인원수 감소
				emoUserOne.each(function(i, e) {		// 리스트 삭제
					if (emoUserOne.eq(i).data("id") == '${memVo.mem_id }') {
						emoUserOne.eq(i).remove();
					}
				});
			}
		});
	});

	// 담아두기 버튼 이벤트
	$(".coll-btn").click(function() {

		var item = $(this);
		
		var tim_no = $(this).parents(".timeline-box").children(".col-no").data("no");
		var mem_no = $(this).data("memno");
		var pro_no = $(this).data("prono");
																												
		if (item.hasClass('default-color')) {		// 취소					

			$.ajax({
				url: "deleteColl.do",
				method: "get",
				data: { tim_no: tim_no ,mem_no:mem_no,pro_no:pro_no},
				dataType: "json",
				success: function(data) {
					
				}
			});

		} else {									// 등록

			$.ajax({
				url: "insertColl.do",
				method: "get",
				data: { mem_no : mem_no, tim_no: tim_no,pro_no:pro_no },
				dataType: "json",
				success: function(data) {
					
				}
			});
		}

		fn_likeChange(item);
	});

	// 타임라인 글 삭제 이벤트
	$(".timeline-delete-btn").click(function() {
		
		
		var timeline_no = $(this).parents(".timeline-box").children(".col-no").data("no");
		var timeline_kind = $(this).parents(".timeline-box").children(".col-kind").data("kind");
		var timeline_kindno = $(this).parents(".timeline-box").children(".col-kindno").data("kindno");
		var timeline_prono = $(this).parents(".timeline-box").children(".col-prono").data("prono");
		
		$("#deleteTimeLine .timeline_no").val(timeline_no);
		$("#deleteTimeLine .content_kind").val(timeline_kind);
		$("#deleteTimeLine .content_no").val(timeline_kindno);
		$("#deleteTimeLine .project_no").val(timeline_prono);

		// layer pop up show
		layer_popup("#deleteTimeLine");
	});

	// 댓글 삭제 이벤트
	$(".reply-delete").click(function() {
		var item = $(this);
		var commentListBox = item.parent().parent().parent().parent();
		var rep_no = commentListBox.data("repno");
		var pro_no = commentListBox.data("prono");

		$("#deleteReply .rep_no").val(rep_no);
		$("#deleteReply .pro_no").val(pro_no);
		// layer pop up show
		layer_popup("#deleteReply");

	});

	// 첨부파일 이미지 바꾸기
	$(".upload-file-info").each(function(i, e) {
		var iconTag = $(this).find("i.dis-inblock");
		var dataName = iconTag.attr("data-name");
		fileExCheck(iconTag);
	});

	// '할 일' 항목 개수에 따라 각 항목 % 정하기
	var percent = 0;
	$(".todo-content").each(function(i, e) {
		if ($(this).children("dl").length == 1) {
			percent = 100;
			$(this).children("dl").find('.todo-percent-txt').html(percent);
		} else if ($(this).children("dl").length == 2) {
			percent = 50;
			$(this).children("dl").find('.todo-percent-txt').html(percent);
		} else if ($(this).children("dl").length == 3) {
			percent = 33;
			$(this).children("dl").find('.todo-percent-txt').html(percent);
			$(this).children("dl").eq(2).find('.todo-percent-txt').html(percent + 1);
		} else if ($(this).children("dl").length == 4) {
			percent = 25;
			$(this).children("dl").find('.todo-percent-txt').html(percent);
		} else if ($(this).children("dl").length == 5) {
			percent = 20;
			$(this).children("dl").find('.todo-percent-txt').html(percent);
		}
	});

	// '할 일' 완료 % 및 개수, 전체 개수 구하기
	$(".todo-content").each(function(i, e) {
		var todoItemLength = $(this).find('dl').length;					// 할일 항목 개수
		var todoItemSuccess = $(this).find('dl[data-chk=y]').length;	// 할일 항목 완료 개수
		var todoPercent = $(this).siblings('.todo-info').find('.todo-percent-cnt');		// 할일 완료 %
		var todoAllCount = $(this).siblings('.todo-info').find('.todo-all-cnt');		// 할일 항목 전체 개수
		var todoFinishCount = $(this).siblings('.todo-info').find('.todo-finish-cnt');	// 할일 항목 완료 개수
		var todoRange = $(this).siblings('.todo-progress-bar').find('.todo-range');		// 할일 % 게이지 바

		todoAllCount.text(todoItemLength);
		todoFinishCount.text(todoItemSuccess);

		var itemPcnt = Math.floor(100 / todoItemLength);
		var successPcnt = itemPcnt * todoItemSuccess;
		todoPercent.html(successPcnt);
		todoRange.css("width", successPcnt + "%");
	});

	// 상단 고정글 항목 우측 화살표 아이콘 변경
	var fixTopLink = $(".article-fix-top a");
	fixTopLink.on("click", function() {
		if (!$(this).parent().siblings(".panel-collapse").hasClass("in")) {
			fixTopLink.find("i.icon-arrow").removeClass("fa-angle-down");
			fixTopLink.find("i.icon-arrow").addClass("fa-angle-left");
			$(this).find("i.icon-arrow").removeClass("fa-angle-left");
			$(this).find("i.icon-arrow").addClass("fa-angle-down");
		} else {
			$(this).find("i.icon-arrow").removeClass("fa-angle-down");
			$(this).find("i.icon-arrow").addClass("fa-angle-left");
		}
	});

	// 투표 상태바 처리
	$(".time-vote-con").each(function(i, e) {
		var voteCount = 0;
		var voteCountResult = $(this).find(".vote-count-result").text();

		voteCount += parseInt(voteCountResult);
		var votePercent = parseInt(voteCountResult);
		var pcntResult = (votePercent / voteCount) * 100;

		$(this).find(".vote-range").css("width", pcntResult + '%');
	});

});






/*******************************************
* 
* Category : Navigation Bar(aside MenuBar)
* 
*******************************************/

/*******************************************
* Note : navigation mouse hover event
* 설명 : aside navigation(메뉴) 중 'MY FOLRDER'에
* 		각 메뉴에 mouseOver & mouseOut시 'edit-box' show() & hide()
*******************************************/
function navOver(nav) {
	var item = $(nav);
	item.find("div.edit-btn").show();
}

function navOut(nav) {
	var item = $(nav);
	item.find("div.edit-btn").hide();
}


/*******************************************
* 
* Category : Project Important check
* 
*******************************************/
function fn_importantChk(el) {
	var item = $(el);

	if (item.hasClass("color-gray-l")) {
		item.removeClass("color-gray-l");
		item.addClass("color-yellow");
	} else {
		item.removeClass("color-yellow");
		item.addClass("color-gray-l");
	}
}




/*******************************************
* 
* Category : Project Title
* 
*******************************************/


/*******************************************
* Note : color edit box show & hide
* 설명 : 프로젝트 색상 설정 박스 보이기 & 감추기
*******************************************/
function fn_editColor(el) {
	var item = $(el);
	var editColorBox = item.siblings(".edit-color-box");
	var editProjectBox = item.parent("li").siblings("li").children(".edit-pro-box");

	if (editColorBox.css("display") == "block") {
		editColorBox.fadeOut();
	} else {
		editColorBox.fadeIn();
	}

}


/*******************************************
* Note : project edit box show & hide
* 설명 : 프로젝트 설정 박스 보이기 & 감추기
*******************************************/
function fn_editProject(el) {
	var item = $(el);
	var editProjectBox = item.siblings(".edit-pro-box");
	var editColorBox = item.parent("li").siblings("li").children(".edit-color-box");

	if (editProjectBox.css("display") == "block") {
		editProjectBox.fadeOut();
	} else {
		editProjectBox.fadeIn();
	}

}


/*******************************************
* 
* Category : Project - task(업무)
* 
*******************************************/


/*******************************************
* Note : task state change
* 설명 : 업무상태 설정 - 해당 업무상태 선택시, 각 업무상태에 맞게 색상 변경 클래스 추가
*******************************************/
function fn_checkTaskState(el) {
	var item = $(el);
	var stateList = item.parent('.task-state-list');

	stateList.find('label').removeClass('checked');
	item.addClass('checked');
}


/*******************************************
* Note : task manager input focus
* 설명 : 업무담당자 input태그에 focus되었을 시에
* 		업무담당자(프로젝트 참여자) 리스트가 노출된다
*******************************************/
function fn_taskManagerFocus(el) {

	var item = $(el);
	var projectUserList = item.siblings(".pro-user-list");

	projectUserList.fadeIn();
	item.blur(function() {
		projectUserList.fadeOut();
	});

}


/*******************************************
* Note : task manager select
* 설명 : 업무담당자(프로젝트 참여자) 리스트에서 담당자를 선택했을 때
* 		담당자리스트에 담당자 추가
*******************************************/
function fn_taskManagerSelect(el) {
	var item = $(el);
	var src = item.find('img').attr('src');
	var name = item.find('.user-no').text();
	var no = item.find('.user-no').data("no");
	var taskUserList = item.parent().siblings('.task-user-list');

	var eqChk = 0;   // 해당 회원이 있는지 체크하는 변수

	taskUserList.find('div').each(function(i, e) {
		if (taskUserList.find('div').eq(i).attr("data-no") == no) {
			eqChk = 1;
		}
	});

	if (eqChk == 1) {
		alert('이미 선택된 참여자를 다시 추가할 수 없습니다.');
	} else {
		taskUserList.addClass('martop-10');
		taskUserList.append(
			"<div class=\"name-tag\" data-no=\"" + no + "\">"
			+ "<img src=\"" + src + "\" width=\"24\">"
			+ "<strong class=\"marleft-10\">" + name + "</strong>"
			+ "<i class=\"fas fa-times-circle marleft-15\" onclick=\"fn_taskUserRemove(this)\"></i>"
			+ "<input type=\"hidden\" name=\"tu_mem_list\" value=\"" + no + "\">"
			+ "</div>"
		);
	}
}

/*******************************************
 * Note : task user remove
 * 설명 : 업무담당자(프로젝트 참여자) 리스트에서 
 * 		 추가된 업무지정자 삭제
 *******************************************/
function fn_taskUserRemove(el) {
	var item = $(el);
	item.parent("div").remove();
}
/*******************************************
 * Note : task user delete
 * 설명 : 업무담당자(프로젝트 참여자) 리스트에서 
 * 		 추가된 업무지정자 삭제
 *******************************************/
function fn_taskUserDelete(el) {
	var item = $(el);
	var task_user_no = item.data("no");
	var frm = item.parents(".article-edit-form");

	frm.prepend("<input type=\"hidden\" name=\"del_task_user_no\" value=\"" + task_user_no + "\">");
	item.parent("div").remove();

}

/*******************************************
* Note : task start & end date reset
* 설명 : 업무시작일 및 종료일 값 초기화
*******************************************/
function fn_dateReset(el) {
	var item = $(el);
	var dateInput = item.siblings('input.datepicker-here');

	dateInput.val('');
}

/*******************************************
* Note : task progress bar select
* 설명 : 작업진척도 progress bar에서 진척도 선택시
*******************************************/
function fn_progressSelect(el) {
	var item = $(el);
	var pcntInfo = item.children('span').text();
	var pcntResult = (100 - pcntInfo) + "%";
	var workPercent = item.siblings('.work-percent');
	var input = item.siblings('input');
	var pcntBar = item.siblings('.pcnt-bar');

	workPercent.html(pcntInfo + "%");
	input.val(pcntInfo);
	pcntBar.css('right', pcntResult);

	if (pcntInfo >= 60) {
		workPercent.addClass("color-white");
		workPercent.removeClass("color-black");
	} else {
		workPercent.removeClass("color-white");
		workPercent.addClass("color-black");
	}

}

/*******************************************
* Note : task progress bar select edit
* 설명 : '타임라인' 작업진척도 progress bar에서 진척도 선택시(수정)
*******************************************/

/*******************************************
* Note : task rank list box show & hide(input)
* 설명 : input태그에 focus되었을 때, 업무 우선순위 리스트 박스 show & hide
*******************************************/
function fn_taskRankFocus(el) {
	var item = $(el);
	var taskRankList = item.siblings('.task-rank-list');

	taskRankList.fadeIn();
	item.on('blur', function() {
		taskRankList.fadeOut();
	});
}

/*******************************************
* Note : task rank list box show & hide(span)
* 설명 : span태그 클릭시 input태그에 focus처리,
* 		업무 우선순위 리스트 박스 show & hide
*******************************************/
function fn_taskRankClick(el) {
	var item = $(el);
	var taskRankInput = item.siblings('.task-rank-input');

	taskRankInput.focus();
}


/*******************************************
* Note : task rank select function
* 설명 : 업무 우선순위 선택시 선택한 우선순위 표시
*******************************************/
function fn_taskRankSelect(el) {
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

	taskRank.find("i.fas.fa-times-circle").on("click", function() {
		taskRank.html('');
		taskRank.css("right", "100%");
	});
}


/*******************************************
* Note : task add item box show
* 설명 : '추가항목입력' 버튼 클릭시 추가항목 박스 보이기
*******************************************/
function fn_addItem(el) {
	var item = $(el);
	var addItemBox = item.siblings('.add-item-box');

	item.fadeOut("fast");
	addItemBox.fadeIn();
}


/*******************************************
* 
* Category : Project - to do (할일) / vote (투표)
* 
*******************************************/


/*******************************************
* Note : remove to-do line (tab)
* 설명 : '-'버튼 클릭시 해당 to-do 삭제
*******************************************/
function removeTodo(el) {
	var item = $(el);
	var inputBox = item.parent("dt").parent("dl").parent("div");
	var length = inputBox.find("dl").length;

	item.parents("dl").remove();
	length -= 1;
}

/*******************************************
* Note : remove todoItem line (timeline)
* 설명 : '-'버튼 클릭시 해당 todoItem 삭제
*******************************************/
function removeTodoItem(el) {
	var item = $(el);
	var ti_no = item.data("no");
	var inputBox = item.parent("dt").parent("dl").parent("div");
	var frm = inputBox.parent().parent();

	item.parents("dl").remove();
	frm.prepend("<input type=\"hidden\" name=\"del_ti_no\" value=\"" + ti_no + "\">");
}

/*******************************************
* Note : remove voteItem line
* 설명 : '-'버튼 클릭시 해당 voteItem 삭제
*******************************************/
function removeVoteItem(el) {
	var item = $(el);
	var vi_no = item.data("no");
	var inputBox = item.parent("dt").parent("dl").parent("div");
	var frm = inputBox.parent().parent();

	item.parents("dl").remove();
	frm.prepend("<input type=\"hidden\" name=\"del_vi_no\" value=\"" + vi_no + "\">");
}


/*******************************************
* Note : TO DO add to-do button clicked
* 설명 : '할일 추가'버튼 클릭시 '할 일'내용을 복제하여 아래에 추가한다.
*******************************************/
function fn_addTodo(el) {

	var item = $(el);
	var todoBox = item.parent("div").siblings(".todo-box");
	var cloneItem = todoBox.children("dl").eq(0);
	var length = todoBox.find("dl").length;

	if (length < 5) {

		// 0번째 복사 >> 마지막으로 붙혀넣기
		cloneItem.clone().appendTo(todoBox);

		// input name ++
		todoBox.find("dl").last().find(".todo-input").attr('name', 'tiList[' + length + '].todo_item_content');
		todoBox.find("dl").last().find(".todo-date").attr('name', 'tiList[' + length + '].todo_item_date');
		todoBox.find("dl").last().find(".todo-mem").attr('name', 'tiList[' + length + '].ti_mem_no');

		// 내용 reset
		todoBox.find("dl").last().find("input[type=text]").val('');

		// date pick id count++
		todoBox.find("dl").last().find("i.todo-date-icon").attr("id", "dateResult" + (length + 1));
		todoBox.find("dl").last().find(".dropdown-menu").attr("aria-labelledby", "dateResult" + (length + 1));

		// date reset
		todoBox.find("dl").last().find("i.todo-date-icon").html('');
		todoBox.find("dl").last().find("i.todo-date-icon").addClass('flow-icon todo-icon icon-calendar-plus').css("width", "20px");

		// datepicker inline delete
		todoBox.find("dl").last().find(".dropdown-menu.datepicker-here").children("div").eq(0).remove();

		// user toggle id count++
		todoBox.find("dl").last().find(".user-add-btn").attr("id", "todoManager" + (length + 1));
		todoBox.find("dl").last().find(".dropdown-menu").attr("aria-labelledby", "todoManager" + (length + 1));

		// user(manager) select button reset
		todoBox.find("dl").last().find(".user-add-btn i.icon-circle").addClass("dis-none");
		todoBox.find("dl").last().find(".user-add-btn i.icon-circle").siblings("i").addClass("flow-icon todo-icon icon-user-plus");
		todoBox.find("dl").last().find(".user-add-btn i.icon-circle").siblings("i").css({
			"display": "",
			"width": "",
			"height": "",
			"margin-left": "",
			"background": "",
			"background-size": "",
			"background-positoin": ""
		});

		// 할일 내용 개수 + 1
		length += 1;
	} else {
		alert("할일은 5개까지만 등록 가능합니다.");
	}
}



/*******************************************
* Note : Enter or Tab key event
* 설명 : '할일' 및 '투표' input 에서 Enter or Tab 키를 눌렀을 때,
* 		'할일' 및 '투표' 내용을 복제하여 아래에 추가한다.
*******************************************/
function fn_keyDown(event, el) {
	var key = event.keyCode;
	var inputBox = $(el).parent("dd").parent("dl").parent("div");
	var cloneItem = inputBox.children("dl").eq(0);
	var length = inputBox.find("dl").length;

	if (key == "13" || key == "9") { // Enter or Tab 키 입력시
		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		if (length < 5) {

			// 0번째 복사 >> 마지막으로 붙혀넣기
			cloneItem.clone().appendTo(inputBox);

			// 내용 reset
			inputBox.find("dl").last().find("input[type=text]").val('').focus();

			// date pick id count++
			inputBox.find("dl").last().find("i.todo-date-icon").attr("id", "dateResult" + (length + 1));
			inputBox.find("dl").last().find(".dropdown-menu").attr("aria-labelledby", "dateResult" + (length + 1));

			// date reset
			inputBox.find("dl").last().find("i.todo-date-icon").html('');
			inputBox.find("dl").last().find("i.todo-date-icon").addClass('flow-icon todo-icon icon-calendar-plus').css("width", "20px");

			// datepicker inline delete
			inputBox.find("dl").last().find(".dropdown-menu.datepicker-here").children("div").eq(0).remove();

			// user toggle id count++
			inputBox.find("dl").last().find(".user-add-btn").attr("id", "todoManager" + (length + 1));
			inputBox.find("dl").last().find(".dropdown-menu").attr("aria-labelledby", "todoManager" + (length + 1));

			if (inputBox.hasClass("todo-box")) {

				// input name ++
				inputBox.find("dl").last().find(".todo-input").attr('name', 'tiList[' + length + '].todo_item_content');
				inputBox.find("dl").last().find(".todo-chk").val('n').attr('name', 'tiList[' + length + '].todo_item_chk');
				inputBox.find("dl").last().find(".todo-date").attr('name', 'tiList[' + length + '].todo_item_date');
				inputBox.find("dl").last().find(".todo-mem").attr('name', 'tiList[' + length + '].ti_mem_no');

				// user(manager) select button reset
				inputBox.find("dl").last().find(".user-add-btn i.icon-circle").addClass("dis-none");
				inputBox.find("dl").last().find(".user-add-btn i.icon-circle").siblings("i").addClass("flow-icon todo-icon icon-user-plus");
				inputBox.find("dl").last().find(".user-add-btn i.icon-circle").siblings("i").css({
					"display": "",
					"width": "",
					"height": "",
					"margin-left": "",
					"background": "",
					"background-size": "",
					"background-positoin": ""
				});

				inputBox.find("dl").last().find("dt i").attr('data-no', '');
				inputBox.find("dl").last().find("dt i").attr('onclick', 'removeTodo(this)');

			} else if (inputBox.hasClass("vote-box")) {

				// input name ++
				inputBox.find("dl").last().find(".vote-input").attr('name', 'viList[' + length + '].vi_cont');

				// i data-no , onclick reset
				inputBox.find("dl").last().find("dt i").attr('data-no', '');
				inputBox.find("dl").last().find("dt i").attr('onclick', 'removeTodo(this)');

			}

			// 내용 개수 + 1
			length += 1;

		} else {
			if (inputBox.hasClass("todo-box")) {
				alert("할일은 5개까지만 등록 가능합니다.");
			} else if (inputBox.hasClass("vote-box")) {
				alert("투표는 5개까지만 등록 가능합니다.");
			}
		}
	}
}


/*******************************************
* Note : Date-picker
* 설명 : '할 일' 달력아이콘을 눌렀을 때, 노출되는 Date-picker의 Option 설정
*******************************************/

// Create start date
var start = new Date();

function datePick(el) {

	var item = $(el);
	var datePickBox = item.siblings(".dropdown-menu.datepicker-here");

	datePickBox.find(".datepicker--time").addClass("dis-none");

	datePickBox.datepicker({
		timepicker: false,
		language: 'ko',
		startDate: start,
		dateFormat: 'mm/dd',
		minHours: 23,
		minMinutes: 59,
		onSelect: function(fd, d, picker) {
			// Do nothing if selection was cleared
			if (!d) {
				item.addClass("flow-icon todo-icon icon-calendar-plus").css("width", "20px").html('');
			} else {
				item.html(fd);
				item.siblings('input').val(fd);

				item.removeClass("flow-icon todo-icon icon-calendar-plus");
				if (start > d) {
					item.removeClass("color-gray").addClass("color-red").css("width", "40px");
				} else {
					item.removeClass("color-red").addClass("color-gray").css("width", "40px");
				}
			}
		}
	});
}


/*******************************************
* Note : user(manager) clicked
* 설명 : '할 일' 내용에서 담당자 선택시
* 		선택한 담당자의 프로필사진이 담당자 추가 버튼(아이콘)에
* 		background-image로 들어간다.
*******************************************/

function userSelect(el) {
	var item = $(el);
	var userList = item.parents(".todo-pro-user-list");
	var iconCircle = userList.siblings("div.user-add-btn").children("i.icon-circle");
	var userImgPlace = iconCircle.siblings("i");
	
	var userImgSrc = item.children(".pro-user-photo").children("img").attr("src");
	var userId = item.find(".user-no").data("memno");
	window.alert(userId);
	var userIdInput = userImgPlace.siblings("input");

	iconCircle.removeClass("dis-none");	// 사진 이미지 원형으로 보이게 해주는 태그를 보이게 한 후,
	userImgPlace.removeClass();	// 유저의 이미지가 들어갈 태그에 클래스들을 지워주고,
	userImgPlace.css({
		"display": "block",
		"overflow": "hidden",
		"width": "24px",
		"height": "24px",
		"background": "url('" + userImgSrc + "')",
		"background-repeat": "no-repeat",
		"background-size": "cover",
		"background-position": "center center"
	});	// 유저의 이미지가 들어가도록 style을 넣어준 후,

	userIdInput.val(userId);
}


/*******************************************
* 
* Category : Project timeline
* 
*******************************************/

/*******************************************
* Note : pick icon clicked >> add class
* 설명 : 상단 고정글 아이콘 클릭시 'pick-active'클래스 추가
*******************************************/
function fn_pickActive(el) {
	var item = $(el);

	if (!item.hasClass('pick-active')) {
		item.addClass('pick-active');
	}
}


/*******************************************
* Note : emoticon click function
* 설명 : 이모티콘 클릭시 선택한 이모티콘 이미지 적용
*******************************************/
function fn_emoticon(el) {
	var item = $(el);	// emoticon li
	var emoticonBtn = item.parent('ul').parent('div').siblings('div.emoticon-btn');	// emoticon default btn
	var emoticonAfterBtn = item.parent('ul').parent('div').siblings('.emoticon-after-btn');	// emoticon after btn
	var emoticonImg = item.children('img');
	var emoticonTxt = item.children('span').text();
	//var likeResult = $(".like-result");

	// 이모티콘 버튼을 선택한 이모티콘의 이미지와 텍스트로 변경
	emoticonBtn.hide();
	emoticonAfterBtn.show();
	emoticonAfterBtn.children('img').attr('src', emoticonImg.attr('src'));
	emoticonAfterBtn.children('span').html(emoticonTxt);

	// 이모티콘 버튼 위 '좋아요 OOO외 0명' 공간에 선택한 이모티콘 이미지배치
	//likeResult.show();
	//likeResult.prepend("<img src=\"" + emoticonImg.attr('src') + "\" width=\"20\" class=\"maright-10\">");
	//likeResult.children('img').attr('src', emoticonImg.attr('src'));

}


/*******************************************
* Note : emoticon result button
* 설명 : 이모티콘 선택시 '이모티콘 리스트 버튼' show(),
* 		선택한 이모티콘이 들어간 버튼 hide()
*******************************************/
function fn_emoResultBtn(el) {
	var item = $(el);
	var emoticonBtn = item.siblings('div.emoticon-btn');	// emoticon default btn

	item.hide();
	emoticonBtn.show();
}


/*******************************************
* Note : comment textarea focus
* 설명 : '댓글작성'버튼 클릭시 댓글 입력란 focus
*******************************************/
function fn_commentFocus(el) {
	var item = $(el);
	var commentWrap = item.parent().parent().siblings('.timeline-comment-wrap');
	var textarea = commentWrap.find('textarea');

	textarea.focus();
}


/*******************************************
* Note : click change color
* 설명 : '담아두기', '좋아요' 클릭시 색상 변경 및 text 변경
*******************************************/
function fn_likeChange(el) {
	var item = $(el);
	var text = item.children('span').text().split(' ')[0];
	
	if (item.hasClass('default-color')) {		// 취소
		item.removeClass('default-color');
		item.children('span').text(text);
	} else {								// 등록
		item.addClass('default-color');
		item.children('span').text(text + " 취소");
	}
}


/*******************************************
* Note : textarea auto height
* 설명 : textarea 높이값 자동으로 늘어나도록 하는 기능
* 		(limit - 높이 최대값)
*******************************************/
function autoTextarea(obj, start, limit) {
	obj.style.height = start;
	if (limit >= obj.scrollHeight) {
		obj.style.height = (obj.scrollHeight) + "px";
	} else {
		obj.style.height = (20 + limit) + "px";
	}
}


/*******************************************
* Note : todo check box color change
* 설명 : '할일' 체크박스 선택시 체크아이콘 색상변경
*******************************************/
function fn_checkBoxLabel(el) {
	var item = $(el);	// label
	var checkBox = item.children('input'); 	// checkbox input
	var checkIcon = item.children('i');		// check icon

	var pcntTxt = parseInt(item.children('span').text());	// 할일 항목 하나의 % 값
	var range = item.parents('.todo-content').siblings('.todo-progress-bar').children('.todo-range');	// 할일 % 게이지 바
	var endCount = item.parents('.todo-content').siblings('.todo-info').find('.todo-finish-cnt');		// 완료 개수
	var pcntCount = item.parents('.todo-content').siblings('.todo-info').children('.todo-percent-cnt');	// 완료 %

	var todoNo = item.parents('.todo-content').siblings('#todo_no');
	var todoTitle = item.parents('.todo-content').siblings('.todo-title').children('strong');	// 할일 제목
	var todoItem = item.parent().siblings('dd').children('span');		// 할일 항목 내용
	var todoDate = item.parent().siblings('dd').children('.ti-date');	// 할일 항목 날짜

	// if문안에 ajax처리해주세요
	if (checkBox.is(':checked')) {
		var resultPcnt = parseInt(pcntCount.text());
		resultPcnt += pcntTxt;
		var resultCount = parseInt(endCount.text()) + 1;

		// update 시에 필요한 값 가져오기
		var ti_no = item.attr('data-no');
		var ti_chk = 'y';
		var todo_item_content = todoItem.text();
		var todo_no = todoNo.val();

		$.ajax({
			url: "tiChkUpdate.do",
			method: "get",
			data: { todo_item_no: ti_no, todo_item_chk: ti_chk, todo_item_content: todo_item_content, todo_no: todo_no },
			dataType: "json",					// server로 부터 받을 data type
			success: function(data) {
				if (data == 1) {
					checkIcon.removeClass('color-gray-l');
					checkIcon.addClass('default-color');

					endCount.html(resultCount);
					pcntCount.html(resultPcnt);
					range.css('width', resultPcnt + '%');
					todoItem.addClass('todo-success');
					todoDate.addClass('todo-success');
					return false;
				} else {
					alert("fail");
				}
			},
			error: function(data) {
				alert("error");
			}
		});


	} else {
		var resultPcnt = parseInt(pcntCount.text());
		resultPcnt -= pcntTxt;
		var resultCount = parseInt(endCount.text()) - 1;

		var ti_no = item.attr('data-no');
		var ti_chk = 'n';
		var todo_item_content = todoItem.text();
		var todo_no = todoNo.val();
		var tim_cont = todoTitle.text();

		$.ajax({
			url: "tiChkUpdate.do",
			method: "get",
			data: { todo_item_no: ti_no, todo_item_chk: ti_chk, todo_item_content: todo_item_content, todo_no: todo_no, tim_cont: tim_cont },
			dataType: "json",					// server로 부터 받을 data type
			success: function(data) {
				if (data == 1) {
					checkIcon.removeClass('default-color');
					checkIcon.addClass('color-gray-l');

					endCount.html(resultCount);
					pcntCount.html(resultPcnt);
					range.css('width', resultPcnt + '%');
					todoItem.removeClass('todo-success');
					todoDate.removeClass('todo-success');
					return false;
				} else {
					alert("fail");
				}
			},
			error: function(data) {
				alert("error");
			}
		});

	}
}


/*******************************************
* Note : vote submit
* 설명 : '다시 투표하기' 버튼 클릭시 처리
*******************************************/
function fn_voteSubmit(el) {
	var item = $(el);	// 다시 투표하기 btn
	var submitBtn = item.siblings('input[type=submit]');	// 투표하기 button
	var cancelBtn = item.siblings('.vote-cancel');			// 취소 button
	var conVote = item.parents('.con-vote');				// con-vote
	var voteRadio = conVote.find('input[type=radio]');		// radio button

	item.hide();
	submitBtn.fadeIn();
	cancelBtn.fadeIn();
	voteRadio.each(function(i, e) {
		if (voteRadio.eq(i).prop('checked')) {
			var checked = voteRadio.eq(i).attr('id');
			cancelBtn.attr('data-id', checked);
		}
		voteRadio.removeAttr('disabled');
	});
}

/*******************************************
* Note : vote cancel
* 설명 : '투표 취소하기' 버튼 클릭시 처리
*******************************************/
function fn_voteCancel(el) {
	var item = $(el);	// 취소 btn
	var submitBtn = item.siblings('input[type=submit]');	// 투표하기 button
	var reVoteBtn = item.siblings('input[type=button]');	// 다시 투표하기 button
	var conVote = item.parents('.con-vote');				// con-vote
	var voteRadio = conVote.find('input[type=radio]');		// radio button
	var checkId = item.attr('data-id');

	var checkRadio = conVote.find("#" + checkId);

	item.hide();
	submitBtn.hide();
	reVoteBtn.fadeIn();
	voteRadio.each(function(i, e) {
		voteRadio.attr('checked', false);
		checkRadio.prop('checked', true);
		voteRadio.attr('disabled', 'disabled');
	});
}

/*******************************************
* Note : vote edit datepicker
* 설명 : '투표하기' 수정시 마감날짜 datepicker 수정
*******************************************/
function fn_voteDateClick(el) {
	var item = $(el);
	var dateInput = item.next('input');
	item.hide();
	dateInput.focus();
}


/*******************************************
* Note : article edit
* 설명 : 게시글 수정버튼 클릭시
*******************************************/
function fn_editArticle(el) {
	var item = $(el);
	var timelineHeader = item.parents(".timeline-header");	// timeline header
	var timelineContent = timelineHeader.siblings(".timeline-content");	// timeline content
	var timelineFooter = timelineHeader.siblings(".timeline-footer");	// timeline footer
	var timelineEditForm = timelineContent.children(".article-edit-form");	// timeline edit form
	var timelineEditBox = timelineEditForm.children(".article-edit-box");	// timeline edit box
	var timelineEditDn = timelineEditForm.children(".article-edit-dn");		// timeline edit dn
	var timelineArticle = timelineContent.children('.timeline-article');	// timeline article

	timelineHeader.hide();
	timelineFooter.hide();

	timelineArticle.hide();
	timelineEditForm.fadeIn();

	timelineEditBox.children('textarea').focus();
	timelineEditDn.fadeIn();

}

/*******************************************
* Note : article edit cancel
* 설명 : 게시글 수정 취소 버튼 클릭시
*******************************************/
function fn_editCancel(el) {
	var item = $(el);
	var timelineEditForm = item.parent().parent("form");
	var timelineArticle = timelineEditForm.siblings(".timeline-article");
	var timelineHeader = timelineArticle.parent().siblings(".timeline-header");
	var timelineFooter = timelineArticle.parent().siblings(".timeline-footer");

	timelineEditForm.hide();

	timelineHeader.fadeIn();
	timelineFooter.fadeIn();
	timelineArticle.fadeIn();

}



/*******************************************
* Note : comment edit key event
* 설명 : '댓글' 수정시 키보드를 눌렀을 때 이벤트 처리
*******************************************/
function fn_keyDownEsc(event, el) {
	var key = event.keyCode;
	var item = $(el);

	var commentEditBox = item.parent().parent().parent('.comment-edit-box');
	var commentUserInfo = commentEditBox.siblings('.comment-user-info');
	var commentTxt = commentEditBox.siblings('.article-txt');
	var commentEditBtn = commentEditBox.siblings('.comment-edit-btn');


	if (key == "13" && !event.shiftKey) {	// Enter 키 입력시

		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		if (!event.shiftKey) {
			commentEditBox.children('form').submit();
		}

	} else if (key == "27") {	// ESC 키 입력시

		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		commentEditBox.hide();
		commentUserInfo.show();
		commentTxt.show();
		commentEditBtn.show();

	}
}



/*******************************************
* 
* Category : Project right contents
* 
*******************************************/

/*******************************************
* Note : invite link copy to the clipboard
* 설명 : '초대' 팝업창에서 '초대링크'클릭시 클립보드로 링크복사하기
*******************************************/
function copyToClipboard(val) {
	var t = document.createElement("textarea");
	document.body.appendChild(t);
	t.value = val;
	t.select();
	document.execCommand('copy');
	document.body.removeChild(t);
	alertCustom('초대링크를 클립보드에 복사했습니다!', 'alert-success');
}

/*******************************************
* Note : invite pop con sub open
* 설명 : '초대' 팝업창안에서 각 초대방법 클릭시
* 		해당 초대방법에 따른 contents 보이기
*******************************************/
function fn_subPopOpen(el) {
	var item = $(el);
	var id = item.attr('data-id');
	var pop = item.parent().parent('.pop-layer');
	var header = item.parent().siblings('header');
	var section = item.parent('section');

	header.hide();
	section.hide();
	$('#' + id).show();
}

/*******************************************
* Note : invite pop con sub back button clicked
* 설명 : '초대' 서브 팝업창에서 '뒤로가기'버튼 클릭시
*******************************************/
function fn_popupBack(el) {
	var item = $(el);
	var popSub = item.parent().parent().parent();
	var header = popSub.siblings('header');
	var section = popSub.siblings('section');

	popSub.hide();
	header.show();
	section.show();
}

/*******************************************
* Note : invite pop con sub close
* 설명 : '초대' 서브 팝업창에서 '닫기'버튼 클릭시
*******************************************/
function fn_popSubClose(el) {
	var item = $(el);

	// 동료 추가 목록, 이메일 입력 초기화
	var popTopSub = item.parent();
	var popConSub = popTopSub.siblings('.pop-con-sub');
	var userList = popConSub.children('.invite-user-list').children('.pop-user-list');
	var addBtn = userList.children('dd').children('.invite-add-btn');	// 추가버튼
	var addBtnIcon = addBtn.children('i');								// 추가버튼 아이콘
	var selectUserList = popConSub.children('.select-user-list');		// 선택한 유저 목록이 나올 박스
	var emailInput = popConSub.find('input#emailName');						// 이메일 입력란

	selectUserList.children('.select-user-box').remove();
	selectUserList.hide();
	userList.removeClass('select');
	addBtnIcon.removeClass('fa-times');
	addBtnIcon.addClass('fa-plus');
	addBtn.children('span').text('추가');
	emailInput.val('');

	// 전체 팝업 닫기
	var popSub = popTopSub.parent().parent();
	var header = popSub.siblings('header');
	var section = popSub.siblings('section');

	$("#invitePop").prev().hasClass('dimBg') ? $('.dim-layer').hide() : $("#invitePop").hide();
	popSub.hide();
	header.show();
	section.show();
}

/*******************************************
* Note : partner invite user add
* 설명 : '초대' 팝업창 중 '동료초대'에서 동료리스트를 클릭했을 때
*******************************************/
//invite user add
function fn_inviteUserAdd(el) {
	var item = $(el);
	var nick = item.children('dd').children('strong').text();		// 닉네임
	var id = item.children('dd').children('span').text();			// id
	var addBtn = item.children('dd').children('.invite-add-btn');	// 추가버튼
	var addBtnIcon = addBtn.children('i');							// 추가버튼 아이콘
	var selectUserList = item.parent().siblings('.select-user-list');				// 선택한 유저 목록이 나올 박스

	if (addBtn.children('span').text() == '추가') {

		$.ajax({
			url: "chkProUser.do?pro_no=" + item.data("no") + "&mem_no=" + item.data("memno"),
			dataType: "json",
			success: function(data) {
				if (data == 1) {
					alertCustom("프로젝트에 이미 참여중인 회원입니다.", "alert-danger");
					return false;
				} else {

					item.addClass('select');
					selectUserList.show();
					selectUserList.append(
						"<div class=\"select-user-box\" data-id=\"" + id + "\">"
						+ "<div class=\"posi-re float-left maright-5\">"
						+ "<i class=\"icon-circle circle-xs-re\"></i>"
						+ "<img src=\"/chord/resources/img/sample.png\"  width=\"24\">"
						+ "</div>"
						+ "<strong class=\"float-left size-14 color-black\">" + nick + "</strong>"
						+ "<i class=\"fas fa-times float-left marleft-10 padtop-5 cursor-point\" onclick=\"fn_userDelete(this)\"></i>"
						+ "<input type=\"hidden\" name=\"mem_no\" value=\"" + item.data("memno") + "\"/>"
						+ "</div>"
					);

					addBtnIcon.removeClass('fa-plus');
					addBtnIcon.addClass('fa-times');
					addBtn.children('span').text('취소');
				}
			}
		});

	} else {
		item.removeClass('select');
		var userBox = selectUserList.children(".select-user-box");
		for (var index = 0; index < userBox.length; index++) {
			if (userBox.eq(index).data("id") == item.data("id")) {
				userBox.eq(index).remove();
			}
		}

		addBtnIcon.removeClass('fa-times');
		addBtnIcon.addClass('fa-plus');
		addBtn.children('span').text('추가');
	}

	// 선택한 유저가 없을경우 유저박스 hide()
	if (selectUserList.children('div').length == 0) {
		selectUserList.hide();
	}
}


/*******************************************
* Note : partner invite select user box delete
* 설명 : '초대'팝업창 중 '동료초대'에서
* 		추가된 동료리스트박스의 'x'버튼 클릭시
*******************************************/
function fn_userDelete(el) {
	var item = $(el);
	var selectBox = item.parent('.select-user-box');
	var dataId = selectBox.attr('data-id');

	var userList = item.parent().parent().siblings('.invite-user-list').children('.pop-user-list');
	var selectUserList = userList.parent().siblings('.select-user-list');

	userList.each(function(i, e) {
		if (userList.eq(i).data('id') == dataId) {
			userList.eq(i).removeClass('select');
			userList.eq(i).children('dd').find('.invite-add-btn i').removeClass('fa-times');
			userList.eq(i).children('dd').find('.invite-add-btn i').addClass('fa-plus');
			userList.eq(i).children("dd").find('.invite-add-btn span').text('추가');
		}
	});

	selectBox.remove();

	// 선택한 유저가 없을경우 유저박스 hide()
	if (selectUserList.children('div').length == 0) {
		selectUserList.hide();
	}
}


/*******************************************
* Note : partner invite select user all delete
* 설명 : '초대'팝업창 중 '동료초대'에서
* 		추가된 동료리스트박스의 '전체삭제'버튼 클릭시
*******************************************/
function fn_userListDelete(el) {
	var item = $(el);
	var userList = item.parent().siblings('.pop-user-list');
	var addBtn = userList.children('dd').children('.invite-add-btn');	// 추가버튼
	var addBtnIcon = addBtn.children('i');							// 추가버튼 아이콘
	var selectUserList = item.parent('.select-user-list');			// 선택한 유저 목록이 나올 박스

	selectUserList.children('.select-user-box').remove();
	selectUserList.hide();
	userList.removeClass('select');
	addBtnIcon.removeClass('fa-times');
	addBtnIcon.addClass('fa-plus');
	addBtn.children('span').text('추가');
}


/*******************************************
* Note : email invite input value delete
* 설명 : '초대'팝업창 중 '이메일초대'에서
* 		'삭제'버튼 클릭시 input 값 초기화
*******************************************/
function fn_emailInputDel(el) {
	var item = $(el);
	var input = item.parent().siblings('dt').children('input');

	input.val('');
}




/*******************************************
* 
* Category : Admin member edit
* 
*******************************************/


/*******************************************
* Note : input member info at member edit box
* 설명 : 회원리스트에서 회원클릭시 회원수정박스 show & value input
*******************************************/
function fn_memberInfoInput(el) {
	var item = $(el);
	var infoBox = item.parents('.mem-list-box').siblings('.mem-edit-box');
	var memId = item.find('.mem_id').text();			// 아이디
	var memPw = item.find('.mem_pw').val();				// 비밀번호
	var memName = item.find('.mem_name').text();		// 이름
	var memNick = item.find('.mem_nick').text();		// 닉네임
	var memDate = item.find('.mem_date').text();		// 가입일
	var memPhone = item.find('.mem_phone').val();		// 휴대폰번호
	var memHowjoin = item.find('.mem_howjoin').text();	// 가입방법
	var memChk = item.find('.mem_chk').text();			// 활성화유무

	infoBox.find('img').attr('src', '/mem/pic?mem_id=' + memId);
	infoBox.find('#mem_id').val(memId);
	infoBox.find('#mem_pw').val(memPw);
	infoBox.find('#mem_name').val(memName);
	infoBox.find('#mem_nick').val(memNick);
	infoBox.find('#mem_date').text(memDate);
	infoBox.find('#mem_phone').val(memPhone);
	infoBox.find('#mem_howjoin').text(memHowjoin);
	infoBox.find('#mem_chk').text(memChk);
	infoBox.fadeIn();

}

/*******************************************
* Note : (admin page)member info edit button clicked
* 설명 : 회원정보 수정 버튼 클릭시 input 태그 활성화
*******************************************/
function fn_memEditActive(el) {
	var item = $(el);
	var fileBtn = item.parent().siblings('dt').find('.file-btn-box');
	var submitBtn = item.siblings('.mem-edit-save');		// 저장버튼

	if (submitBtn.css('display') == 'none') {
		item.parent('dd').find('input').attr('readonly', false).addClass('active');
		fileBtn.fadeIn();
		submitBtn.fadeIn();
	} else {
		item.parent('dd').find('input').attr('readonly', true).removeClass('active');
		fileBtn.fadeOut();
		submitBtn.fadeOut();
	}

}


/*******************************************
 * Note : (admin page)member info close button clicked
 * 설명 : 회원정보 닫기 버튼 클릭시 회원정보박스 hide()
 *******************************************/
function fn_memEditClose(el) {
	var item = $(el);
	var editBox = item.parents('.mem-edit-box');
	var submitBtn = item.siblings('.mem-edit-save');		// 저장버튼

	submitBtn.fadeOut();
	editBox.find('form').find('input').attr('readonly', true).removeClass('active');
	editBox.fadeOut();
}



/*******************************************
* 
* Category : Admin Project Management
* 
*******************************************/

/*******************************************
 * Note : project kind delete check button clicked
 * 설명 : '관리자 > 프로젝트 관리' 에서
 * 		 '프로젝트 분류' 삭제처리 버튼 클릭시 이벤트 발생
 *******************************************/
function fn_delChk(el) {
	var item = $(el);
	var iconCircle = item.children('i');
	var kindNo = item.children("input").val();

	if (iconCircle.hasClass('on')) {
		var kindDelChk = 'y';
		$.ajax({
			url: "/kind/kindDelChk",
			data: { kind_no: kindNo, kind_del_chk: kindDelChk },
			dataType: 'json',
			type: 'POST',
			success: function(data) {
			},
			error: function(data) {
			}
		});

		iconCircle.removeClass('on');
		iconCircle.addClass('off');
		item.removeClass('back-color-green');
		item.addClass('back-color-red');
	} else {
		var kindDelChk = 'n';

		$.ajax({
			url: "/kind/kindDelChk",
			data: { kind_no: kindNo, kind_del_chk: kindDelChk },
			dataType: 'json',
			type: 'POST',
			success: function(data) {
			},
			error: function(data) {
			}
		});

		iconCircle.removeClass('off');
		iconCircle.addClass('on');
		item.removeClass('back-color-red');
		item.addClass('back-color-green');
	}
}




/*******************************************
* 
* Category : user page member edit
* 
*******************************************/



/*******************************************
* Note : (user page)member info edit button clicked
* 설명 : 회원정보 수정 버튼 클릭시 input 태그 활성화
*******************************************/
function fn_userMemEditActive(el) {
	var item = $(el);
	var editTable = item.parent().siblings('section').find('table');
	var submitBtn = item.siblings('.submit-btn');		// 저장버튼
	var cancelBtn = item.siblings('.mem-edit-cancel')		// 취소버튼

	editTable.find('input').removeAttr('readonly').addClass('active');
	submitBtn.fadeIn();
	cancelBtn.fadeIn();
	item.hide();

}


/*******************************************
 * Note : (user page)member info close button clicked
 * 설명 : 회원정보 취소 버튼 클릭시 회원정보박스 hide()
 *******************************************/
function fn_userMemEditCancel(el) {
	var item = $(el);
	var popWrap = item.parent().parent().parent();
	var editTable = popWrap.find('table');
	var submitBtn = popWrap.find('.submit-btn');		// 저장버튼
	var editBtn = popWrap.find('.mem-edit-btn');		// 수정하기 버튼
	var cancelBtn = popWrap.find('.mem-edit-cancel');		// 취소 버튼

	editTable.find('input').attr('readonly', 'readonly').removeClass('active');
	submitBtn.hide();
	cancelBtn.hide();
	editBtn.fadeIn();

	popWrap.prev().hasClass('dimBg') ? popWrap.parent('.dim-layer').hide() : popWrap.show();
}






/*******************************************
* 
* Category : notice & QnA post
* 
*******************************************/



/*******************************************
* Note : post comment edit box show & hide
* 설명 : 게시판 댓글 수정박스 활성화 & 비활성화
*******************************************/
function fn_postCommentEdit(el) {
	var item = $(el);
	var commentUserInfo = item.parent();
	var articleTxt = commentUserInfo.siblings('.article-txt');
	var commentEditBox = commentUserInfo.siblings('.comment-edit-box');

	if (commentEditBox.css('display') == 'none') {
		commentEditBox.fadeIn();
		commentEditBox.find('textarea').focus();
		articleTxt.hide();
	} else {
		commentEditBox.hide();
		articleTxt.fadeIn();
	}
}


/*******************************************
* Note : post comment edit key event
* 설명 : 게시판 '댓글' 수정시 key event
*******************************************/
function fn_keyDownEscPost(event, el) {
	var key = event.keyCode;
	var item = $(el);
	var commentEditBox = item.parent().parent().parent('.comment-edit-box');
	var commentTxt = commentEditBox.siblings('.article-txt');

	if (key == "13" && !event.shiftKey) {	// Enter 키 입력시

		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		if (!event.shiftKey) {
			commentEditBox.children('form').submit();
		}

	} else if (key == "27") {	// ESC 키 입력시

		event.preventDefault(); // Enter 키 값 초기화(submit event reset)

		commentEditBox.hide();
		commentTxt.show();

	}
}




/*******************************************
* 
* Category : Search Function
* Note : 검색창에 입력시 입력한 값에 따라 list 변경
* 
*******************************************/

function filter(el) {
	var item = $(el);	// input

	// 파일함 페이지 일 때,
	if (item.parent().hasClass('file-search-box')) {
		var fileSearchBox = item.parent();
		var collectionTop = fileSearchBox.parent();
		var collectionCon = collectionTop.siblings('.files-con-wrap');
		var table = collectionCon.children('table');
		var tbody = table.find('tbody');

		if (item.val() == "") {
			tbody.find("tr").css("display", "");
		} else {
			tbody.find("tr").css("display", "none");
			tbody.find("tr[data-name*='" + item.val() + "']").css("display", "");
		}
		return false;
	}
	// top 채팅 > '채팅'탭 일 때,
	else if (item.parent().hasClass('chat-search-chk')) {
		var chatSearchBox = item.parent();
		var chatBoxWrap = chatSearchBox.siblings(".chat-box-wrap");

		if (item.val() == "") {
			chatBoxWrap.find("div.chat-box").css("display", "");
		} else {
			chatBoxWrap.find("div.chat-box").css("display", "none");
			chatBoxWrap.find("div.chat-box[data-name*='" + item.val() + "']").css("display", "");
		}
		return false;
	}
	// top 채팅 > '동료'탭 일 때,
	else if (item.parent().hasClass('ptn-search-chk')) {
		var chatSearchBox = item.parent();
		var chatBoxWrap = chatSearchBox.siblings('.chat-box-wrap');

		if (item.val() == "") {
			chatBoxWrap.find("div.friend-list").css("display", "block");
			chatBoxWrap.find("div.all-mem-list").css("display", "none");
		} else {
			chatBoxWrap.find("div.friend-list").css("display", "none");
			chatBoxWrap.find("div.all-mem-list").css("display", "none");
			chatBoxWrap.find("div.all-mem-list[data-name*='" + item.val() + "']").css("display", "block");
			chatBoxWrap.find("div.all-mem-list[data-id*='" + item.val() + "']").css("display", "block");
		}
		return false;
	}
	// top 채팅 > '프로젝트'탭 일 때,
	else if (item.parent().hasClass('pro-search-chk')) {
		var chatSearchBox = item.parent();
		var chatBoxWrap = chatSearchBox.siblings('.chat-box-wrap');

		if (item.val() == "") {
			chatBoxWrap.find("div.friend-list").css("display", "");
		} else {
			chatBoxWrap.find("div.friend-list").css("display", "none");
			chatBoxWrap.find("div.friend-list[data-name*='" + item.val() + "']").css("display", "");
			chatBoxWrap.find("div.friend-list[data-id*='" + item.val() + "']").css("display", "");
		}
		return false;
	}
	// creat chat > '동료'탭 일 때,
	else if (item.parent().hasClass('creat-ptn-search-chk')) {
		var chatSearchBox = item.parent();
		var chatBoxWrap = chatSearchBox.siblings('form#chatInsertMulti').children('.chat-box-wrap');

		if (item.val() == "") {
			chatBoxWrap.find("div.chat-profile-box").css("display", "");
		} else {
			chatBoxWrap.find("div.chat-profile-box").css("display", "none");
			chatBoxWrap.find("div.chat-profile-box[data-id*='" + item.val() + "']").css("display", "");
			chatBoxWrap.find("div.chat-profile-box[data-name*='" + item.val() + "']").css("display", "");
		}
		return false;
	}
	// creat chat > '프로젝트 참여자'탭 일 때,
	else if (item.parent().hasClass('creat-pro-search-chk')) {
		var chatSearchBox = item.parent();
		var chatBoxWrap = chatSearchBox.siblings('form#chatInsertMulti').children('.chat-box-wrap');

		if (item.val() == "") {
			chatBoxWrap.find("div.chat-profile-box").css("display", "");
		} else {
			chatBoxWrap.find("div.chat-profile-box").css("display", "none");
			chatBoxWrap.find("div.chat-profile-box[data-id*='" + item.val() + "']").css("display", "");
			chatBoxWrap.find("div.chat-profile-box[data-name*='" + item.val() + "']").css("display", "");
		}
		return false;
	}
}

