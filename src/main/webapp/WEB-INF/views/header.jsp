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
<!--<script src="/chord/resources/js/jquery-3.1.1.min.js"></script>  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toast.css">
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

.navbar-nav #modal-chatList{
	margin:8px auto;
}

</style>
</head>
<body>
<header>
	<c:set var="sessionMemNo" value="${sessionScope.memNo}"></c:set>
	<c:set var="sessionName" value="${sessionScope.name}"></c:set>
	<c:set var="sessionGrade" value="${sessionScope.grade }"></c:set>
	<c:set var="sessionComNo" value="${sessionScope.comNo }"></c:set>
	<c:choose>
		<c:when test="${sessionName!=null}">

			<c:set var="whatGrade" value="${sessionGrade}"></c:set>
			<c:choose>
				<c:when test="${whatGrade=='web_ses'}">
					<!-- ***********************사이트 운영자*********************** -->
					<nav class="navbar navbar-default navbar-expand-lg">
						<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3"
							href="index.do"><b>[ CHORD ]</b></a>
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
				<!-- *************************** 회사 관리자 **************************** -->
					<nav class="navbar navbar-default navbar-expand-lg">
						<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="proList.do?mem_no=${sessionScope.memNo }">[ CHORD ]</a>
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
				<!-- **************************** 일반회원 ********************************* -->
				<nav class="navbar navbar-default navbar-expand-lg">
					<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="proList.do?mem_no=${sessionScope.memNo }">[ CHORD ]</a>
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
		<!--
				<div class="collapse navbar-collapse justify-content-between" id="navbarNavAltMarkup">
					<ul class="navbar-nav">
						<li class="nav-item nav-link text-nowrap " style="margin-left:1050px;">
							<a class="nav-link float-right" href="memJoinForm.do">회원가입</a></li>
					 	<li class="nav-item nav-link text-nowrap ">
					 		<a class="nav-link float-right" href="loginForm.do">로그인</a></li>	
					</ul>
				</div>
		-->
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
							<a class="nav-link" data-toggle="tab" href="#myPublicChat"><i class="fas fa-user-friends"></i></a>
						</li>
						<!-- 단체방 추가  -->
						<li class="nav-item">
							<span class="nav-link" id="invitationPopup"><i class="fas fa-plus-circle"></i></span>
						</li>
					</ul>

				   <div class="tab-content">
				   		<div class="tab-pane active container" id="myProjectMemberList">
                     			<script id="handlebars-template-myProjectMemberList" type="text/x-handlebars-template">
                              	<div class="privateChatList">
                              	{{#each .}}
                                 	{{{changeTagName chatmessage_content chatroom_no}}}
										<div class="private-box" data-mem_no={{mem_no}}>
											<div class="private-img">
                                    			<img src="${pageContext.request.contextPath}/resources/img/test.png">
                               				</div>
                                            <div class="private-name">{{mem_name}}</div>
                                            <span class="private-content">{{chatmessage_content}}</span>
                                            <span class="private-writedate">{{{setWritedate chatmessage_writedate}}}</span>
                                            <span class="private-unread unread-box">{{{setChatmessage_count chatmessage_count chatroom_no}}}</span>
                                            <span class="create-chat float-right" data-mem_no={{mem_no}} data-mem_name={{mem_name}}><i class="fas fa-comment-medical"></i></span>
                                       </div>
                                 	</div>
                               {{/each}}
                               </div>   
                           </script>
                       </div>

		               <div class="tab-pane container" id="myPublicChat">
		               		<div id="publicChatList">
								<script id="handlebars-template-myPublicChatroomList" type="text/x-handlebars-template">
									{{#each .}}
										<div class="chatroom_ing public" data-chatroom_no={{chatroom_no}}>
											<div class="public-box">			
												<div class="public-img">
                                    				<img src="${pageContext.request.contextPath}/resources/img/groupChat.png">
                               					</div>
												<div class="public-name">{{chatroomName}}</div>
                                				<span class="public-content">{{chatmessage_content}}</span>
                                				<span class="public-writedate">{{{setWritedate chatmessage_writedate}}}</span>
 												<span class="public-unread unread-box">{{{setChatmessage_count chatmessage_count chatroom_no}}}</span>
											</div>
										</div>							 
									{{/each}}
						 	   </script>
						  </div>
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
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
   	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   	<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
   	<script type="text/javascript" src="https://unpkg.com/moment@2.27.0/moment.js"></script>
   	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/locale/ko.js"></script>
	<!-- Toastr-->
   	<script src="${pageContext.request.contextPath}/resources/js/toast.js"></script>

<script type="text/javascript">
	var mem_no = ${memNo};
	var com_no = ${comNo};

	    var chatroomPopupList = []; 

		if (mem_no != '') {
			var socket = new SockJS("<c:url value="/socket"/>");
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function() {
				stompClient.subscribe('/sub/response/login/' + String(mem_no),function(message) {
							var data = JSON.parse(message.body);
							chatListUpdate(data);
							chatAlarm(data);  
						});
				stompClient.send('/pub/request/login/' + String(mem_no),{},mem_no);
			});
		}

		
		$('#modal-chatList').on('click',function() {
				$.post('getChatList.do', function(data) {
				
					var privateSource = $('#handlebars-template-myProjectMemberList').html();
					var template = Handlebars.compile(privateSource);
					var privateHTML = template(data.privateChatList);
				
					$('#myProjectMemberList').children('.privateChatList').remove();
					$('#myProjectMemberList').append(privateHTML);

					var publicSource = $('#handlebars-template-myPublicChatroomList').html();
					var template = Handlebars.compile(publicSource);
					var publicHTML = template(data.publicChatList);
					$('#publicChatList').empty();
					$('#publicChatList').append(publicHTML);
				}, 'json');	
				$('#modal_aside_left').modal();
		});
	    Handlebars.registerHelper('changeTagName',function(chatmessage_content, chatroom_no) {
	         if (chatmessage_content != null) {
	            	return '<div class="chatroom_ing private" data-chatroom_no="' + chatroom_no + '">';
	            }
	         return '<div class="chatroom_default">';
	    });
      	Handlebars.registerHelper('setWritedate', function(chatmessage_writedate) {
         	if (chatmessage_writedate == null) {
            	return '';
         	}
         	moment.locale('kr');
         	var today = moment().format('YYYY-MM-DD');
         	if (today == moment(chatmessage_writedate).format('YYYY-MM-DD')) {
            	return moment(chatmessage_writedate).format('a hh:mm');
         	} else {
            	return moment(chatmessage_writedate).format('YY-MM-DD');
         	}
      	});
		Handlebars.registerHelper('setChatmessage_count',function(chatmessage_count,chatroom_no) {
			if(chatroom_no != 0){
				if(checkOpenChatroom(chatroom_no)){
					return '';
				};
			}
			var result = chatmessage_count == 0 ? '' : chatmessage_count;
			return result;
		});
		$(document).on('click','.create-chat',function() {
			var mem_no = $(this).data("mem_no");
			var mem_name = $(this).data("mem_name");
			$.post('createChatroom.do', {'mem_no' : mem_no,'mem_name' : mem_name}, function(data) {
				formSubmit(data);
			});
		});
		
		$(document).on('click','.chatroom_ing',function() {
			var tagName = $(this).hasClass('private')?'private':'public';
			$(this).find($('.'+tagName+'-unread')).empty(); 
			formSubmit($(this).data("chatroom_no"));
		});
		
		function formSubmit(chatroom_no) {
			$('#chatroom_no').val(chatroom_no); 
			var targetName = 'chatroom' + String(chatroom_no);
			var popup = window.open('', targetName, 'width=520, height=750');
			var form = document.getElementById('chatroomForm');
			form.target = targetName;
			form.action = 'chatroom.do';
			if (!popup) {
				alert('팝업 차단을 해제해 주세요.');
			} else {
				var check = checkOpenChatroom(chatroom_no);
				if(!(check)){
					chatroomPopupList.push(targetName); 
				    form.submit();		
				}else{
					popup.focus();
				}
			}
		}
		function chatListUpdate(receiveMsg) {
			
			if(receiveMsg.chatroom_type == 'pub'){
				publicChatListUpdate(receiveMsg);
				
			}else if(receiveMsg.chatroom_type == 'pri'){
				var $chatBox = setChat_ing(receiveMsg.reciver,receiveMsg.chatroom_no);
				$chatBox.find('.private-content').html(receiveMsg.chatmessage_content);
				if(receiveMsg.messageType != 'remove'){
					$chatBox.find('.private-writedate').html(receiveMsg.chatmessage_writedate);
				    var count = unreadCount($chatBox,'pri',receiveMsg);
					$chatBox.find('.private-unread').html(count);
				}
			}
		}
        function publicChatListUpdate(data){ 
         	var $chatBox = $('#publicChatList').find('div[data-chatroom_no="' + data.chatroom_no + '"]');
			if($chatBox.length > 0){
				var count = unreadCount($chatBox,'pub',data);
				$chatBox.remove();
				$('#publicChatList').prepend(createPublicChatListHtml(data,count));
			}else{
				$('#publicChatList').append(createPublicChatListHtml(data,0));
			}
        }
        
		function setChat_ing(reciver, chatroom_no) {
			var $chatBox = $('div[data-mem_no="' + reciver + '"]').parent('div');
			if ($chatBox.hasClass('chatroom_default')) {
				$chatBox.attr('class', 'chatroom_ing private');
				$chatBox.attr('data-chatroom_no', chatroom_no);
				$chatBox.find('.private-content, .private-writedate, .private-unread').css('display', 'block');
				$chatBox.find('.create-chat').css('display', 'none');
			}
			return $chatBox;
		}
  
		function setChat_default(chatroom_no) {
 			var $chatBox = $('div[data-chatroom_no="' + chatroom_no + '"]');
 			var reciver = $chatBox.children('private-box').data('mem_no'); 
 			if ($chatBox.hasClass('chatroom_ing')) {
				$chatBox.attr('class', 'chatroom_default private');
				$chatBox.removeAttr('data-chatroom_no');
				$chatBox.find('.private-content, .private-writedate, .private-unread').css('display', 'none');
				$chatBox.find('.create-chat').css('display', 'block');
				$chatBox.find('.create-chat').attr('data-mem_no', reciver);
			}
        }
		
        function unreadCount(target,chatroomType,receiveMsg){
        	var chatroomType = chatroomType=='pub'?'public':'private';
        	var unread_count = $(target).find('.'+chatroomType+'-unread').text();
        	if (receiveMsg.chatmessage_count != 0) {
        		if (unread_count == ''|| unread_count == null) {
        			unread_count = receiveMsg.chatmessage_count;
        		} else {
        			unread_count = Number(unread_count) + receiveMsg.chatmessage_count;
        		}
        	} 
        	return unread_count;
        }
       
	    function deleteChatData(chatroom_no,chatroom_type) {
	    	var chatroomType = chatroomType=='pub'?'public':'private';
	        var $chatBox = $('div[data-chatroom_no="' + chatroom_no + '"]');
	        $chatBox.find('.'+chatroomType+'-content').html('대화 내용이 없습니다.');
	    }

        function checkOpenChatroom(chatroom_no) {
            var check = false; 
            for (var i=0; i<chatroomPopupList.length; i++) {
              try {
                if(chatroomPopupList[i] == 'chatroom' + String(chatroom_no)){
                	check = true;//이미 같은 이름으로 팝업이 띄워저 있는 경우         	
                }
       		  }catch (e) {
                chatroomPopupList[i] = null;
              }        
			}
        	return check;
        }

        function deleteChatroomPopup(chatroom_no){
	    	chatroomPopupList = chatroomPopupList.filter(function(item) {
	    	    return item !== 'chatroom' + String(chatroom_no);
			});
        }
        
        function createPublicChatListHtml(chatmessage,count){
			var chatmessage_count = count == 0?'':count;
			var html = '';
	  		html = '<div class="chatroom_ing" data-chatroom_no="'+chatmessage.chatroom_no+'">';
	  		html += '<div class="public-box">'
	  		html += '<div class="public-img"><img src="${pageContext.request.contextPath}/resources/img/groupChat.png"></div>';
	  		html += '<div class="public-name">'+chatmessage.chatroomName+'</div>';
	  		html += '<span class="public-content">'+chatmessage.chatmessage_content+'</span>';
	  		html += '<span class="public-writedate">'+chatmessage.chatmessage_writedate+'</span>';
	  		html += '<span class="public-unread unread-box">'+chatmessage_count+'</span>';
	  		html += '</div>';
	  		html += '</div>';
			return html;
		}	

        $(document).on('click','#invitationPopup',function() {
        	   window.open('invitationPopup.do', 'invitationPopup', "width=400,height=600");
        })

	     $.toastDefaults.position = 'bottom-right';
	     $.toastDefaults.dismissible = true;

	     function chatAlarm(chatmessage){
	    	 if(chatmessage.mem_no != mem_no && chatmessage.messageType != 'remove'){
	    		 $.toast({
		        	  title: chatmessage.chatroomName,
		        	  content: chatmessage.chatmessage_content,
		        	  type: 'info',
		        	  delay: 5000,
		        });
	    	 }
		}
	    
	</script>
</header>
</body>
</html>