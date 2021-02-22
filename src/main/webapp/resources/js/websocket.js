
function receiveMessage(receiveMsg){
	var messageType = receiveMsg.messageType;
	if(messageType == 'talk'){
		var className = mem_no == receiveMsg.mem_no?'mymsg':'yourmsg';
		$('#allChatMessage-box').append(messageHtml(className,receiveMsg));
	} else if(messageType == 'remove'){ 
		deleteMessage(receiveMsg);
	} else if(messageType == 'enter'){
		enterMember(receiveMsg);
	} else if(messageType == 'leave'){
		leaveMember(receiveMsg);
	} else if(messageType == 'new'){
		$('#allChatMessage-box').append('<div class="welcomeMessage">'+ receiveMsg.chatmessage_content+'</div>');
		enterMember(receiveMsg);
	}
}

function messageHtml(className, receiveMsg) {
   var html = '';
   html = ' <div class="' + className + '" data-chatmessage_no="' + receiveMsg.chatmessage_no + '" data-chatroom_no="' + receiveMsg.chatroom_no + '">';
   html += '<div class="clear"> </div>';
   html += '<div class="' + className + '-name">' + receiveMsg.messageWriter + '</div>';
   html += '<div class="clear"> </div>';
   html += '<div class="' + className + '-box chatmessage" data-messageWriter="' + receiveMsg.messageWriter + '">' + receiveMsg.chatmessage_content + '</div>';
   html += '<div class="clear"> </div>';
   html += '<div class="' + className + '-date">';
   html += '<span class="deleteBtn" data-chatmessage_no="' + receiveMsg.chatmessage_no + '"><i class="fas fa-times"></i></span>'
   html += receiveMsg.chatmessage_writedate;
   html += '</div>';
   html += '</div>';
   html += '<div class="clear"></div>';
   html += '</div>';
   return html;
}

function deleteMessage(receiveMsg){
	$('[data-chatmessage_no="'+receiveMsg.chatmessage_no+'"]').children('.chatmessage').html(receiveMsg.chatmessage_content);
}

function enterMember(receiveMsg){
	$.each(receiveMsg.nowChatList,function(index,mem_no){
		$('#chatMember'+String(mem_no)).children('.enter-icon').html('<i class="fas fa-smile fa-2x" style="color: #b4d7f5;"></i>');
	});
}

 function leaveMember(receiveMsg){
	var mem_no = String(receiveMsg.mem_no);
	// chatroom.jsp 설정 
	$('#chatMember' + String(mem_no)).children('.enter-icon').html('<i class="fas fa-meh fa-2x" style="color: darkgrey;"></i>');
}


