<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatroom</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatroom.css">
</head>

<body>
   <div class="custom-container">
      <div class="header">
         <div class="room-title">${chatInfo.chatInfo_roomname}</div>
         <button type="button" class="button-menu btn btn-secondary"
            data-toggle="modal" data-target="#modal_aside_left">
            <i class="bi bi-justify"></i>
         </button>
      </div>
      <div class="content" id="allChatMessage-box">
         <c:forEach var="message" items="${chatMessageList}">
         <c:set var="messageType" value="${message.mem_no eq member.mem_no ? 'mymsg' : 'yourmsg'}" />
            <div class="${messageType} message-box" data-chatmessage_no="${message.chatmessage_no}" data-chatroom_no="${message.chatroom_no}">
               <div class="${messageType}-name">${message.messageWriter}</div>
               <div class="${messageType}-box chatmessage" data-messageWriter="${message.messageWriter}">${message.chatmessage_content}</div>
               <div class="${messageType}-date">
                  <fmt:parseDate value="${message.chatmessage_writedate}" pattern="yyyy-MM-dd HH:mm:ss" var="chatmessage_writedate"/>
                  <fmt:formatDate pattern="a hh:mm" type="time" value="${chatmessage_writedate}" />
               </div>
               <div class="deleteBtn" data-chatmessage_no="${message.chatmessage_no}"><i class="fas fa-times"></i></div>
            </div>
         </c:forEach>
      </div>
      <div class="footer">
         <div class="input-wrapper">
            <textarea class="content-input" name="chatMessage_content" id="chatMessage_content"></textarea>
         </div>
         <div class="button-wrapper">
            <button class="btn btn-light button-input" type="button" id="sendBtn">보내기</button>
         </div>
      </div>
   </div>

   <!-- sidebar modal -->
   <div id="modal_aside_left" class="modal fixed-left fade" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-dialog-aside" role="document">
         <div class="modal-content">
            <div class="modal-body">
               <ul id="enterMemberList">
                  <c:forEach var="chatMember" items="${chatMemberList}">
                     <li id="chatMember${chatMember.mem_no}"><span class="enter-icon"><i class="fas fa-meh fa-2x" style="color: darkgrey;"></i></span> ${chatMember.mem_name}</li>
                  </c:forEach>
               </ul>
            </div>
            <div class="modal-footer">
               <button class="allDeleteBtn btn" value="n"><i class="fas fa-trash-alt"></i></button>
               <button type="button" class="allDeleteBtn btn" value="y"><i class="fas fa-sign-out-alt"></i></button>
            </div>
         </div>
      </div>
   </div>
   
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://kit.fontawesome.com/58a77f3783.js"></script>
	
	<script type="text/javascript">
		var mem_no = ${memNo};
		var chatMessage_writer = '${name}';
		var chatroom_no = '<c:out value="${chatInfo.chatroom_no}"/>';

		var chatroom_type = $('#enterMemberList > li').length > 2?'pub':'pri'; 
		var chatroomName = '<c:out value="${chatInfo_roomname.chatInfo_roomname}"/>';

		var socket = new SockJS("<c:url value="/socket"/>");
		stompClient = Stomp.over(socket); // Stomp 초기화 ? : SockJS의 정보를 기반으로 설정
		stompClient.connect({}, function() {

			stompClient.subscribe('/sub/response/chat/'+chatroom_no, function(message) {
				var data = JSON.parse(message.body);
				receiveMessage(data);
			});
			sendmessage('enter','','');
		});
		

		function sendmessage(messageType,chatmessage_no,chatmessage_content){

			var chatMessage = {
				'chatmessage_no' : chatmessage_no,
				'chatmessage_content' : chatmessage_content,
				'messageWriter' : chatMessage_writer,
				'mem_no' : mem_no,
				'chatroom_no' : chatroom_no,
				'chatroom_type' : chatroom_type,
				'messageType' : messageType,
				'chatroomName': chatroomName
				}
			stompClient.send('/pub/request/chat/'+chatroom_no, {}, JSON.stringify(chatMessage));
		}
		

		$(document).on('click', '.deleteBtn', function() {
			var chatmessage_no = $(this).data('chatmessage_no');
			$.post('deleteChatMessage.do', {'chatMessage_no' : chatmessage_no}, function(data) {
				if(data!=0){
					sendmessage('remove',chatmessage_no,'삭제된 메세지 입니다.'); // 소켓으로 보내는 메세지 
				}
			}).fail(function(jqXHR) {
			    alert("error" );
			});
		});


	    $(document).on('click', '.allDeleteBtn', function() {
	         var btnType = $(this).val();
	         var data = {
	            chatroom_no : Number(chatroom_no),
	            mem_no : mem_no,
	            chatInfo_deleted : btnType
	         }
	         $.ajax({
	            url : 'allDeleteChatMessage.do',
	            type : 'POST',
	            context : this,
	            data : JSON.stringify(data),
	            contentType : 'application/json; charset=utf-8;',
	            success : function(result) {
	               if (result > 0) {
	                  if (btnType == 'y') {
	                     // 퇴장
	                     opener.parent.setChat_default(chatroom_no);
	                     self.close();
	                  } else if (btnType == 'n') {
	                     // 메세지 전체 삭제
	                     $('#allChatMessage-box').empty();
	                     $('#modal_aside_left').modal('hide');
	                     opener.parent.deleteChatData(chatroom_no);
	                  }
	               }
	            },
	            error : function() {
	            }
	         });
	      });

		$('#sendBtn').click(function(){
			sendmessage('talk',0, $('#chatMessage_content').val());
		});

	    $(window).on("beforeunload", function() {
	    	opener.parent.deleteChatroomPopup(chatroom_no); // 입장해 있는 채팅방 배열에서 해당 채팅방 삭제
			sendmessage('leave','',''); // 소켓으로 보내는 메세지 
	    });
		
		
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/websocket.js"></script>
</body>
</html>