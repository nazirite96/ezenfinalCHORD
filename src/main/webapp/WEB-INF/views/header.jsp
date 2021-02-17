<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>HEADER</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/dashboard/">


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<!--아이콘 -->
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="/chord/resources/js/jquery-3.1.1.min.js"></script>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<!--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
	<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

<script type="text/javascript">
	function exit(){
		var result = window.confirm('로그아웃하시겠습니까?');
		if(result){
			location.href='logout.do';
		}else{
			location.history.back;
		}

	}
</script>

<style type="text/css">
/* 네비바 */
.navbar-default{
	background-color: #7b9acc ;
	z-index : 3;
}
/*[chord]*/
.navbar-default .navbar-nav > li > a {
    color : #FCF6F5; 
}
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus {
   	color: #5E5E5E;
}
.navbar-default .navbar-brand{
	color : #FCF6F5;
}
/*메뉴*/
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
    color: #5E5E5E;
}
.navbar-default .navbar-toggler .navbar-toggler-icon {
    border-color:#FCF6F5;
}
.navbar-default .navbar-toggler .navbar-toggler-icon:hover,
.navbar-default .navbar-toggler .navbar-toggler-icon:focus
{
    border-color:#FCF6F5; 
}
/*dropdown*/
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
.navbar-default .navbar-nav > .dropdown > a {
    border-top-color: #777;
    border-bottom-color: #777;
}
.navbar-default .navbar-nav > .dropdown > a:hover,
.navbar-default .navbar-nav > .dropdown > a:focus {
    border-top-color: #333;
    border-bottom-color: #333;
}
.navbar-default .navbar-nav > .open > a , 
.navbar-default .navbar-nav > .open > a:hover , 
.navbar-default .navbar-nav > .open > a:focus  {
    border-top-color: #555;
    border-bottom-color: #555;
}

</style>
</head>
<body>
	<c:set var="sessionMemNo" value="${sessionScope.memNo}"></c:set>
	<c:set var="sessionName" value="${sessionScope.name}"></c:set>
	<c:set var="sessionGrade" value="${sessionScope.grade }"></c:set>
	<c:set var="sessionComNo" value="${sessionScope.comNo }"></c:set>
	<c:choose>
		<c:when test="${sessionName!=null}">

			<c:set var="whatGrade" value="${sessionGrade}"></c:set>
			<c:choose>
				<c:when test="${whatGrade=='web_ses'}">
					<!-- 사이트 운영자 -->
					<nav class="navbar navbar-default navbar-expand-lg">
						<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3"
							href="index.do">[ CHORD ]</a>
						<button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button> 
						<input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
						<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
							<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active">${sessionName}님 </a></li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active"
									href="adminWebForm.do">사이트 운영자 관리</a></li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active" href="javascript:exit()">로그아웃</a></li>
							</ul>
						</div>
					</nav>
				</c:when>
				<c:when test="${whatGrade=='com_ses'}">
				<!-- 회사 관리자 -->
					<nav class="navbar navbar-default navbar-expand-lg">
						<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">[ CHORD ]</a>
						  <button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						  </button>
						<input 
						class="form-control mr-sm-2" 
						type="text" 
						placeholder="Search" 
						aria-label="Search">
						<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
							<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
								<li class="nav-item nav-link text-nowrap dropdown">
								<a class="nav-link" data-toggle="dropdown" href="#">
								<img alt="user" src="resources/img/header/user.png" width="27" height="27"></a>
									<div class="dropdown-menu">
										<c:url var="gomypageURL" value="goMyPage.do">
											<c:param name="mem_no">${sessionMemNo}</c:param>
										</c:url>										
										<a class="dropdown-item" href="${gomypageURL}">${sessionName}님</a>
									</div>
								</li>
								<li class="nav-item nav-link text-nowrap" id="modal-chatList">
									<img alt="chat" src="resources/img/header/chat.png" width="25" height="25">
								</li>
								<c:url var="comContentsUrl" value="adminCompanyForm.do">
									<c:param name="com_no">${sessionComNo}</c:param>
								</c:url>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link" href="${comContentsUrl}">
								<img alt="admin" src="resources/img/header/admin.png" width="25" height="25"></a></li>
								<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active" href="javascript:exit()">
								<img alt="logout" src="resources/img/header/exit.png" width="25" height="25"></a></li>
							</ul>
						</div>
					</nav>
				</c:when>
				<c:otherwise>
				<nav class="navbar navbar-default navbar-expand-lg">
					<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">[ CHORD ]</a>
						  <button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						  </button>
						<input 
						class="form-control mr-sm-2" 
						type="text" 
						placeholder="Search" 
						aria-label="Search">
					<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
							<li class="nav-item nav-link text-nowrap dropdown">
								<a class="nav-link" data-toggle="dropdown" href="#">
								<img alt="user" src="resources/img/header/user.png" width="27" height="27"></a>
									<div class="dropdown-menu dorpdown-menu-left">
										<c:url var="gomypageURL" value="goMyPage.do">
											<c:param name="mem_no">${sessionMemNo}</c:param>
										</c:url>									
										<a class="dropdown-item" href="${gomypageURL}">${sessionName}님</a>
									</div>
								</li>
							<li class="nav-item nav-link text-nowrap" id="modal-chatList">
								<img alt="chat" src="resources/img/header/chat.png" width="25" height="25">
							</li>
							<li class="nav-item nav-link text-nowrap">
								<a class="nav-link active" href="javascript:exit()">
								<img alt="logout" src="resources/img/header/exit.png" width="25" height="25"></a></li>
						</ul>
					</div>						
				</nav>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-default navbar-expand-lg">
				<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">[ CHORD ]</a>
					<button class="navbar-toggler" 
						  type="button" 
						  data-toggle="collapse" 
						  data-target="#navbarNavAltMarkup" 
						  aria-expanded="false" 
						  aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse justify-content-between" id="navbarNavAltMarkup">
					<ul class="navbar-nav">
						<li class="nav-item nav-link text-nowrap ">
							<a class="nav-link float-right" href="memJoinForm.do">회원가입</a></li>
					 	<li class="nav-item nav-link text-nowrap ">
					 		<a class="nav-link float-right" href="loginForm.do">로그인</a></li>	
					</ul>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>
	
	<!-- ChatroomList modal -->
	<div id="modal_aside_left" class="modal fixed-left fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-aside" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#myProjectMemberList"><i class="fas fa-user-tie"></i></a>
					    </li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#myCompanyChat"><i class="fas fa-user-friends"></i></a>
						</li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active container" id="myProjectMemberList">
							<script id="handlebars-template-myProjectMemberList" type="text/x-handlebars-template">
                     			<div class="privateChatList">
                        		{{#each .}}
                        			{{{changeTagName chatroom_no}}}
                           				<div class="private-box" data-mem_no={{mem_no}}>
                              				<div class="private-img">
												<img src="${pageContext.request.contextPath}/resources/img/test.png">
											</div>
                                        	<div class="private-name">{{mem_name}}</div>
                              				<span class="private-content">{{chatmessage_content}}</span>
                                        	<span class="private-writedate">{{{setWritedate chatmessage_writedate}}}</span>
                                        	<span class="private-unread">{{{setChatmessage_count chatmessage_count chatroom_no}}}</span>
                              				<span class="create-chat float-right" data-mem_no={{mem_no}} data-mem_name={{mem_name}}><i class="fas fa-comment-medical"></i></span>
                           				</div>
                        			</div>
                        	 {{/each}}
                     		 </div>   
                     		</script>
						</div>

               <div class="tab-pane container" id="myCompanyChat">
                     <script id="handlebars-template-myCompanyChat" type="text/x-handlebars-template">
                        <div class="publicChatroom-box {{CHATROOM_NO}}-box">
                           <span class="chat-img"><i class="fas fa-user"></i></span>
                           <span class="chat-name">{{CHATINFO_ROOMNAME}}</span>
                           {{#if CHATMESSAGE_CONTENT}}
                              <span class="chat-content">{{CHATMESSAGE_CONTENT}}</span>
                              <span class="chat-writedate">{{CHATMESSAGE_WRITEDATE}}</span>
                           {{/if}}
                           <span class="company-chat float-right" data-chatroom_no={{CHATROOM_NO}} data-chatinfo_roomname={{CHATINFO_ROOMNAME}}><i class="fas fa-comments"></i></span>
                        </div>
                     </script>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <i class="fas fa-angle-right" data-dismiss="modal" aria-label="Close"></i>
            </div>
         </div>
      </div>
   </div>

	<form id="chatroomForm" method="post">
      	<input type="hidden" name="chatroom_no" id="chatroom_no">
    </form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://kit.fontawesome.com/58a77f3783.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/websocket.js"></script>

	<script type="text/javascript">
		var mem_no = ${memNo};
		var com_no = ${comNo};

	    var chatroomPopupList = []; // 팝업 객체의 이름을 담는 배열
	    
		
		if (mem_no != '') {
			var socket = new SockJS("<c:url value="/socket"/>");
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function() {
			
				stompClient.subscribe('/sub/response/login/' + String(mem_no),function(message) {
							var data = JSON.parse(message.body);
							chatListUpdate(data);
						});
				stompClient.send('/pub/request/login/' + String(mem_no), {},mem_no);
			});
		}


		$('#modal-chatList').on('click',function() {
					$.post('getChatList.do', function(data) {
						// 핸들바 템플릿 로드
						var source = $('#handlebars-template-myProjectMemberList').html();
						// 미리 준비한 HTML틀 로드
						var template = Handlebars.compile(source);
						// Ajax를 통해서 읽어온 JSON을 템플릿에 병합
						var html = template(data.privateChatList);
						// 읽어온 내용 추가
						$('#myProjectMemberList').children('.privateChatList').remove();
						$('#myProjectMemberList').append(html);
					}, 'json');
					$('#modal_aside_left').modal();
				});

	
		Handlebars.registerHelper('changeTagName',function(chatroom_no) {
							if (chatroom_no != 0) {
								return '<div class="chatroom_ing" data-chatroom_no="' + chatroom_no + '">';
							}
							return '<div class="chatroom_default">';
		});


		Handlebars.registerHelper('setWritedate', function(chatmessage_writedate) {
			// 메세지를 나누지 않은 상태일 경우 처리 (ex. 채팅방 생성, 메세지 삭제)
			if (chatmessage_writedate == null) {
				return '';
			}
			var today = moment().format('YYYY-MM-DD');
			if (today == moment(chatmessage_writedate).format('YYYY-MM-DD')) {
				return moment(chatmessage_writedate).format('a h:mm');
			} else {
				return moment(chatmessage_writedate).format('YY-MM-DD');
			}
		});

		
		Handlebars.registerHelper('setChatmessage_count', function(chatmessage_count,chatroom_no) {
			// 회원이 해당 채팅방에 들어와있지 않을때 출력한다.
			if(chatroom_no != 0){
				if(checkOpenChatroom(chatroom_no)){
					return '';
				};
			}
			var result = chatmessage_count == 0 ? '' : chatmessage_count;
			return result;
		});

		// 채팅방 만들기
		$(document).on('click', '.create-chat', function() {
			var mem_no = $(this).data("mem_no");
			var mem_name = $(this).data("mem_name");
			$.post('createChatroom.do', {'mem_no' : mem_no,'mem_name' : mem_name}, function(data) {
				$('#chatroom_no').val(data);
				setChat_ing(mem_no, data); // 채팅목록 class변경
				formSubmit(data);
			});
		});

		// 기존 채팅방 입장 
		$(document).on('click', '.chatroom_ing', function() {
			$(this).find('.private-unread').empty(); // 안읽은 메세지 갯수 초기화
			$('#chatroom_no').val($(this).data("chatroom_no")); // chatroom.do 컨트롤러로 보내는 값 setting
			formSubmit($(this).data("chatroom_no"));
		});

		// 채팅방 controller 로 전송 
		function formSubmit(chatroom_no) {
			
			var targetName = 'chatroom' + String(chatroom_no);
			var popup = window.open('', targetName, 'width=520, height=750');
			var form = document.getElementById('chatroomForm');
			form.target = targetName;
			form.action = 'chatroom.do';
			if (!popup) {
				alert('팝업 차단을 해제해 주세요.');
			} else {
				var check = checkOpenChatroom(chatroom_no);
				if(!(check)){ // 채팅방이 현재 열려있지 않다면    ex. check == false
					chatroomPopupList.push(targetName); 
				    form.submit();		
				}else{
					popup.focus();
				}
			}
		}
		
		function chatListUpdate(receiveMsg) {

			var $chatBox = setChat_ing(receiveMsg.reciver,receiveMsg.chatroom_no);
			$chatBox.find('.private-content').html(receiveMsg.chatmessage_content);
			
			// messageType이 'talk' 일 경우에만 처리하는 메소드
			if(receiveMsg.messageType != 'remove'){
				$chatBox.find('.private-writedate').html(receiveMsg.chatmessage_writedate);

				var unread_count = $chatBox.find('.private-unread').text();
				// 채팅방에 입장하지 않은 회원은 chatmessage_count 값이 1이다.
				if (receiveMsg.chatmessage_count != 0) {
					var count = 0;
					// 기존의 안읽은 메세지가 있다면, 그 갯수에  +1을 해준다.
					if (unread_count == ''|| unread_count == null) {
						count = receiveMsg.chatmessage_count;
					} else {
						count = Number(unread_count) + receiveMsg.chatmessage_count;
					}
					$chatBox.find('.private-unread').html(count);
				}
			}
		}
		
  
		function setChat_ing(reciver, chatroom_no) {
			var $chatBox = $('div[data-mem_no="' + reciver + '"]').parent('div');
			if ($chatBox.hasClass('chatroom_default')) {
				// 첫 메세지일 경우 class 이름을 chat_default에서 chat_ing로 변경한다.
				$chatBox.attr('class', 'chatroom_ing');
				$chatBox.attr('data-chatroom_no', chatroom_no);
				// chatroom_ing 일때의  css 속성들로 변경 (display: none -> display:block)
				$chatBox.find('.private-content, .private-writedate, .private-unread').css('display', 'block');
				$chatBox.find('.create-chat').css('display', 'none');
			}
			return $chatBox;
		}
     
		function setChat_default(chatroom_no) {
 			var $chatBox = $('div[data-chatroom_no="' + chatroom_no + '"]');
 			var reciver = $chatBox.children('private-box').data('mem_no'); 
 			if ($chatBox.hasClass('chatroom_ing')) {
				$chatBox.attr('class', 'chatroom_default');
				$chatBox.removeAttr('data-chatroom_no');
				// chatroom_default 일때의   css 속성들로 변경 (display: block -> display:none)
				$chatBox.find('.private-content, .private-writedate, .private-unread').css('display', 'none');
				$chatBox.find('.create-chat').css('display', 'block');
				$chatBox.find('.create-chat').attr('data-mem_no', reciver);
			}
	       	//** 수정 : chatroom_no가 잇다면,createChatroom.do로 가서 db 조회 하지 말고, 바로  chatroom.do로 가도록 수정한다.**//
        }
        

        function deleteChatData(chatroom_no) {
        	var $chatBox = $('div[data-chatroom_no="' + chatroom_no + '"]');
        	$chatBox.find(".private-content").empty();
        }
        

        function checkOpenChatroom(chatroom_no) {
            var check = false; 
            for (var i=0; i<chatroomPopupList.length; i++) {
              try {
                if(chatroomPopupList[i] == 'chatroom' + String(chatroom_no)){
                	check = true;//이미 같은 이름으로 팝업이 띄워저 있는 경우         	
                }
       		  }catch (e) {
       			//팝업 객체를 담는 배열의 초기값은 null 이기 때문에 try~catch 문을 사용하여 null exception 방지 
                chatroomPopupList[i] = null;
              }        
			}
        	return check;
        }
        
        // 실시간 채팅방 목록 갱신 : 안읽은 메세지 카운트  
        // 방법 : 채팅방 팝업창이 닫히면, 배열에서 해당 채팅방 이름 삭제
        function deleteChatroomPopup(chatroom_no){
	    	chatroomPopupList = chatroomPopupList.filter(function(item) {
	    	    return item !== 'chatroom' + String(chatroom_no);
			});
        }

	</script>
</body>
</html>