/**
 * 실시간 기능 구현 
 */
// 1. 채팅방 실시간 이벤트
// 1-1. 채팅방 실시간 메세지 목록 갱신- chatroom.jsp
function receiveMessage(receiveMsg){
	var messageType = receiveMsg.messageType;
	// 채팅 
	if(messageType == 'talk'){
		var className = mem_no == receiveMsg.mem_no?'mymsg':'yourmsg';
		$('#allChatMessage-box').append(messageHtml(className,receiveMsg));
	
	// 채팅메세지 삭제
	} else if(messageType == 'remove'){ 
		deleteMessage(receiveMsg);
		
	// 채팅방 입장
	} else if(messageType == 'enter'){
		enterMember(receiveMsg);
	
	// 채팅방 퇴장
	} else if(messageType == 'leave'){
		leaveMember(receiveMsg);
	
	// 단체방 첫 입장 메세지 : messageType의 값은 stomp에서 담아서 온다.
	} else if(messageType == 'new'){
		$('#allChatMessage-box').append('<div class="welcomeMessage">'+ receiveMsg.chatmessage_content+'</div>');
	}
}

// create message HTML
function messageHtml(className,receiveMsg){
   var html = '';
   html = ' <div class="'+className+'  message-box" data-chatmessage_no="'+receiveMsg.chatmessage_no+'" data-chatroom_no="'+receiveMsg.chatroom_no+'">';
   html += '<div class="'+className+'-name">'+receiveMsg.messageWriter+'</div>';
   html += '<div class="'+className+'-box chatmessage" data-messageWriter="'+receiveMsg.messageWriter+'">'+receiveMsg.chatmessage_content+'</div>';
   html += '<div class="'+className+'-date">';
   html +=  receiveMsg.chatmessage_writedate;
   html += '</div>';
   html += '<div class="deleteBtn" data-chatmessage_no="'+receiveMsg.chatmessage_no+'"><i class="fas fa-times"></i></div>';
   html += '</div>';
   return html;
}

// 1-2. 메세지 삭제처리 ('삭제된 메세지 입니다.') - chatroom.jsp
function deleteMessage(receiveMsg){
	$('[data-chatmessage_no="'+receiveMsg.chatmessage_no+'"]').children('.chatmessage').html(receiveMsg.chatmessage_content);
}

// 1-3. 입장 처리 (입장 멤버 css 효과) - chatroom.jsp
function enterMember(receiveMsg){
	$.each(receiveMsg.nowChatList,function(index,mem_no){
		$('#chatMember'+String(mem_no)).children('.enter-icon').html('<i class="fas fa-smile fa-2x" style="color: #b4d7f5;"></i>');
	});
}

// 1-4. 퇴장 처리 (퇴장 멤버 css 효과제거) - chatroom.jsp
 function leaveMember(receiveMsg){
	var mem_no = String(receiveMsg.mem_no);
	// chatroom.jsp 설정 
	$('#chatMember' + String(mem_no)).children('.enter-icon').html('<i class="fas fa-meh fa-2x" style="color: darkgrey;"></i>');
}


