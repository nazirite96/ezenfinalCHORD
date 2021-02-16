<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 유저 정보 레이어팝업 : s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="userInfoPop" class="pop-layer profile-pop">
		<form name="userChatFom" action="/flowolf/chat/insert" class="ptn-from">
		
			<!-- pop header -->
    		<header class="pop-top border-box">
    			프로필정보
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   		
	   			<!-- profile picture : s -->
	   			<div class="profile-pic">
	   			</div>
	   			<!-- profile picture : f -->
	   		
	   			<!-- profile info : s -->
		   		<div class="pop-profile-info">
		   		
		   			<strong class="pop-user-nick size-24 color-black"></strong>
		   			
		   			<span class="pop-user-id size-13 color-gray"></span>
		   			<!--<span class="pop-user-phone dis-block martop-5 size-15 color-gray"></span>-->
		   			<span class="pop-my-id dis-none"></span>
		   			
				</div>
	   			<!-- profile info : f -->
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<!-- 본인 일때 -->
				<input type="button" class="pop-btn submit-btn back-color-pupple-l btn-close my-chat-btn" style="display:none" value="채팅하기"/>
				<!-- 본인이 아닐 때 -->
				<input type="button" class="pop-btn submit-btn back-color-pupple-l btn-close chat-btn" style="display:none" value="채팅하기"/>
				
				<input type="button" class="pop-btn submit-btn marleft-5 back-color-pupple-l btn-close apply-btn" value="친구신청"/>
				<a href="/mem/memEdit" class="pop-btn marleft-5 default-btn prof-edit-btn" style="display:none">프로필 수정</a>
			</footer>
			
			<input type="hidden" name="mem_id" id="user_mem_id">
			<input type="hidden" name="chat_title" id="user_chat_title">
			<input type="hidden" name="ptn_id" id="user_ptn_id">
		</form>
	</div>
	
	<script type="text/javascript">
	$(function(){
	
		// 채팅창 띄우기(본인일 때)
		$("#userInfoPop").find(".my-chat-btn").on("click", function(){
			var popup = $("#userInfoPop");
			var id = popup.find(".pop-user-id").text();
			var nick = popup.find(".pop-user-nick").text();
			var my_id = popup.find(".pop-my-id").text();
			
			// open nav
			popup.find("#user_mem_id").val(my_id);
			popup.find("#user_chat_title").val(nick);
			//popup.find("#user_ptn_id").val(id);
			
			$("#mem_id_ptn").val(my_id);
			$("#chat_title_ptn").val(nick);
			$("#ptn_id_ptn").val("");
			
			var check = document.userChatFom;
			window.open('', "new", "width=467,height=640,top=100,left=100");
			check.action='/chat/insert';
			check.target='new';
			check.submit();
		});
		
	
		// 채팅창 띄우기(본인이 아닐 때)
		$("#userInfoPop").find(".chat-btn").on("click", function(){
			var popup = $("#userInfoPop");
			var id = popup.find(".pop-user-id").text();
			var nick = popup.find(".pop-user-nick").text();
			var my_id = popup.find(".pop-my-id").text();
			
			// open nav
			popup.find("#user_mem_id").val(my_id);
			popup.find("#user_chat_title").val(nick);
			popup.find("#user_ptn_id").val(id);
			
			$("#mem_id_ptn").val(my_id);
			$("#chat_title_ptn").val(nick);
			$("#ptn_id_ptn").val(id);
			
			var check = document.userChatFom;
			window.open('', "new", "width=467,height=640,top=100,left=100");
			check.action='/chat/insert';
			check.target='new';
			check.submit();
		});
		
		// 친구신청하기
		$("#userInfoPop").find("#apply-btn-ptn").on("click", function(){
			var popup = $("#userInfoPop");
			var ptn_accept = popup.find(".pop-user-id").text();
			var ptn_apply = popup.find(".pop-my-id").text();
			
			$.ajax({
				url : "/ptn/apply",
				data : {ptn_apply:ptn_apply, ptn_accept:ptn_accept},
				dataType : 'json',
				type : 'POST',
				success : function(data) {
					window.opener.location.reload();
					self.close();
				},
				error : function(data) {
					alert("실패");
				}
			});
		});
		
	});
	</script>
</div> 
<!-- 유저 정보 레이어팝업 : f -->

<!-- 보관함 추가 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="addFolder" class="pop-layer">
		<form action="insertBox.do" method="get" class="boxInsert-form">
    		<!-- pop header -->
    		<input type="hidden" name="mem_no" value="${memNo }">
    		<header class="pop-top border-box">
    			보관함 만들기
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
    		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<input type="text" id="folderName" name="box_name" class="pop-input" placeholder="보관함명 입력(최대 50자)" required="required">
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="만들기">
			</footer>
		</form>
	</div>
</div>
<!-- 보관함 추가 레이어 팝업:f -->
	
<!-- 보관함 수정 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="editFolder" class="pop-layer">
		<form action="/flowolf/box/update" method="get">
			<input type="hidden" id="box_no" name="box_no" value="">
    		<!-- pop header -->
    		<header class="pop-top border-box">
    			보관함 수정하기
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
    		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<input type="text" name="box_name" id="box_name" class="pop-input" placeholder="보관함명">
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="변경하기">
			</footer>
		</form>
	</div>
</div>
<!-- 보관함 수정 레이어 팝업:f -->

<!-- 보관함 삭제 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="deleteFolder" class="pop-layer">
		<form action="/flowolf/box/delete" method="get">
		<input type="hidden" id="box_no" name="box_no" value="">
    		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<p class="marbtm-0 padtop-20 size-20 color-gray text-center">
	   				보관함을 삭제하시겠습니까?<br>
	   				보관함에 포함된 프로젝트는 삭제되지 않습니다.
	   			</p>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="삭제하기">
			</footer>
		</form>
	</div>
</div>
<!-- 보관함 삭제 레이어 팝업:f -->

<!-- 프로젝트 추가 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
	<div id="addProject" class="pop-layer">
		<form action="insertPro.do" method="post">
			<!-- pop con -->
	   		<section class="border-box">
	   		
	   			<!-- 프로젝트 명 -->
   				<div class="dis-block">
		   			<h3>프로젝트명</h3>
		   			<input type="text" name="pro_name" placeholder="프로젝트명 입력(최대 50자)" required="required">
	   			</div>
	   			
	   			<!-- 프로젝트 분류 -->
   				<div class="dis-block martop-20">
		   			<h3>프로젝트 분류</h3>
		   			<div class="pro-kind-box">
						<!-- 분류 종료 List -->
		   					<label class="maright-15">
			   					<input type="radio" name="kind_no" value="1">
			   					1
			   				</label>
			   				<label class="maright-15">
			   					<input type="radio" name="kind_no" value="2">
			   					2
			   				</label>
			   				<label class="maright-15">
			   					<input type="radio" name="kind_no" value="3">
			   					3
			   				</label>
		   			</div>
		   			<input type="hidden" name="pro_no" value="2">
	   			</div>
	   			<!-- 프로젝트 개요 -->
   				<div class="dis-block martop-20">
		   			<h3>프로젝트 개요</h3>
		   			<textarea name="pro_cont" rows="" cols="" placeholder="프로젝트 목표 및 개요 입력"></textarea>
	   			</div>
			</section>
			<!-- input hidden 회사번호 -->
			<input type="hidden" name="com_no" value="${sessionScope.comNo }">
			<input type="hidden" name="mem_no" value="${sessionScope.memNo }">
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="만들기">
			</footer>
		</form>
	</div>
	
</div>
<!-- 프로젝트 추가 레이어 팝업:f -->

<!-- 프로젝트 수정 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
	<div id="editProject" class="pop-layer pop-add-project">
		<form class="editPro-form" action="updatePro.do" method="get">
			<input type="hidden" id="pro_no" name="pro_no" value="${proUserDTO.pro_no }">
			
    		<!-- pop header -->
    		<header class="pop-top border-box">
    			프로젝트 수정하기
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
		
			<!-- pop con -->
	   		<section class="pop-con border-box">
	   		
	   			<!-- 프로젝트 명 -->
   				<div class="dis-block">
		   			<h3>프로젝트명</h3>
		   			<input type="text" id="pro_name" name="pro_name" class="pop-input input-line" value="${proUserDTO.pro_name }" placeholder="프로젝트명 입력(최대 50자)" required="required">
	   				<input type="hidden" name="mem_no" value="${memNo }">
	   			</div>
	   			
	   			<!-- 프로젝트 분류 
   				<div class="dis-block martop-20">
		   			<h3>프로젝트 분류</h3>
		   			<div class="pro-kind-box">
						<!-- 분류 종료 List 
		   				<c:forEach items="${kindList }" var="kindVo">
		   					<c:choose>
		   						<c:when test="${kindVo.kind_no==proVo.kind_no }">
				   					<label class="maright-15">
					   					<input type="radio" name="kind_no" value="${kindVo.kind_no }" checked>
					   					${kindVo.kind_name }
					   				</label>
		   						</c:when>
		   						<c:otherwise>
				   					<label class="maright-15">
					   					<input type="radio" name="kind_no" value="${kindVo.kind_no }">
					   					${kindVo.kind_name }
					   				</label>
		   						</c:otherwise>
		   					</c:choose>
		   				</c:forEach>
		   			</div>
	   			</div>
	   			-->
	   			<!-- 프로젝트 개요 -->
   				<div class="dis-block martop-20">
		   			<h3>프로젝트 개요</h3>
		   			<textarea id="pro_cont" name="pro_cont" rows="" cols="" placeholder="프로젝트 목표 및 개요 입력">${proUserDTO.pro_cont }</textarea>
	   			</div>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="수정">
			</footer>
		</form>
	</div>
	
</div>
<!-- 프로젝트 수정 레이어 팝업:f -->

<!-- 프로젝트 참여자 나가기 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="deleteProUser" class="pop-layer">
		<form action="deleteProUser.do" method="get">
		
		<input type="hidden" name="pro_no" value="${proUserDTO.pro_no }">
    	<input type="hidden" name="mem_no" value="${memNo }">
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<p class="marbtm-0 padtop-20 size-20 color-gray text-center">
	   				해당 프로젝트를 나가시겠습니까?
	   			</p>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="나가기">
			</footer>
		</form>
	</div>
</div>
<!-- 프로젝트 참여자 나가기 레이어 팝업:f -->

<!-- 프로젝트 삭제 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="deletePro" class="pop-layer">
		<form action="deleteProject.do" method="get" class="timeline-del-form">
		
			<input type="hidden" name="pro_no" value="${proUserDTO.pro_no }">
    		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<p class="marbtm-0 padtop-20 size-20 color-gray text-center">
	   				해당 프로젝트를 삭제하시겠습니까?
	   			</p>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="삭제하기">
						
			</footer>
		</form>
	</div>
</div>
<!-- 프로젝트 삭제 레이어 팝업:f -->

<!-- 프로젝트 보관함 설정 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
	<div id="proFolderEdit" class="pop-layer">
		<form class="proFolderEdit-form">
			<input type="hidden" id="pro_no" name="pro_no" value="${proUserDTO.pro_no }">
			
    		<!-- pop header -->
    		<header class="pop-top border-box">
    			보관함 설정
    			<a href="#" class="posi-ab over-hidden btn-close"><span data-feather="x"></span></a>
    		</header>
		
			<!-- pop con -->
	   		<section class="pop-con border-box">
	   		
	   			<p class="color-gray marbtm-10">이동할 보관함을 선택하세요.</p>
	   		
	   			<!-- 보관함명 -->
   				<ul class="dis-block martop-20">
   					<c:forEach items="${setBoxList }" var="box" varStatus="status">
   						<c:choose>
   							<c:when test="${box.pro_no == proUserDTO.pro_no }">
			   					<li>
			   						<input type="checkbox" id="proFolder${status.count }" name="box_no" value="${box.box_no }" data-prono="${proUserDTO.pro_no }" class="custom-check-input" checked="checked">
			   						<label for="proFolder${status.count }">${box.box_name }</label>
			   					</li>   								
   							</c:when>
   							<c:otherwise>
			   					<li>
			   						<input type="checkbox" id="proFolder${status.count }" name="box_no" value="${box.box_no }" data-prono="${proUserDTO.pro_no }" class="custom-check-input">
			   						<label for="proFolder${status.count }">${box.box_name }</label>
			   					</li>   								
   							</c:otherwise>
   						</c:choose>
   					</c:forEach>
	   			</ul>
			</section>
			
		</form>
	</div>
	
</div>
<!-- 프로젝트 보관함 설정 레이어 팝업:f -->

<!-- 내 정보 레이어 팝업 : s -->
<div class="dim-layer">
	<div class="dimBg"></div>
    <div id="profileMyPopup" class="pop-layer pop-layer-style">
		<form action="/flowolf/chat/insert" method="post" name="myChatFom">
			<!-- pop header -->
    		<header class="pop-top border-box">
    			프로필정보
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<div class="prof_thumb">
		   			<div class="pop-pic">
		   				<img src="/chord/resources/img/sample.png" class="pop-pic-img">
<%-- 		   				<img src="/mem/pic?mem_id=${memVo.mem_id}"/> --%>
		   			</div>
	   			</div>
	   		
		   		<div class="prof_info">
					<div class="prof_top">
						<h2>
							<span class="flnm"></span>
						</h2>
					</div>
					<ul class="prof_cn">
						<li class="cmnm"></li>
						<li class="phone"></li>
					</ul>
				</div>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" id="chat-btn-my" value="채팅하기">
				<a href="/mem/memEdit" class="dis-inblock pop-btn submit-btn marleft-5 back-color-pupple-l">프로필 수정</a>
			</footer>
			
			<input type="hidden" name="mem_id" id="mem_id_my">
			<input type="hidden" name="chat_title" id="chat_title_my">
			<input type="hidden" name="ptn_id" id="ptn_id_my">
		</form>
	</div>
	
	<script type="text/javascript">
	$(function(){
		// 채팅창 띄우기
		$("#chat-btn-my").on("click", function(){
			var id = $("#profileMyPopup").find(".cmnm").text();
			var nick = $("#profileMyPopup .flnm").text();
			
			// open nav
			$("#mem_id_my").val(id);
			$("#chat_title_my").val(nick);
			$("#ptn_id_my").val("");
			
			var check = document.myChatFom;
			window.open('', "new", "width=467,height=640,top=100,left=100");
			check.action='/chat/insert';
			check.target='new';
			check.submit();
		});
		
	});
	</script>
	
</div>
<!-- 내 정보 레이어 팝업 : f -->
	
<!-- top > chat > 동료(친구) 정보 레이어 팝업 : s -->
<div class="dim-layer">
	<div class="dimBg"></div>
    <div id="ptnPopup" class="pop-layer pop-layer-style">
		<form name="ptnChatFom" action="/flowolf/chat/insert" class="ptn-from">
			<!-- pop header -->
    		<header class="pop-top border-box">
    			프로필정보
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<div class="prof_thumb">
		   			<div class="pop-pic">
		   				<img src="" class="pop-pic-img">
		   			</div>
	   			</div>
	   		
		   		<div class="prof_info">
					<div class="prof_top">
						<h2>
							<span class="flnm"></span>
						</h2>
					</div>
					<ul class="prof_cn">
						<li class="cmnm"></li>
						<li class="phone"></li>
						<li class="my_id" style="display:none"></li>
					</ul>
				</div>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l btn-close" id="chat-btn-ptn" value="채팅하기"/>
				<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l btn-close" id="apply-btn-ptn" value="친구신청"/>
			</footer>
			
			<input type="hidden" name="mem_id" id="mem_id_ptn">
			<input type="hidden" name="chat_title" id="chat_title_ptn">
			<input type="hidden" name="ptn_id" id="ptn_id_ptn">
		</form>
	</div>
	
	<script type="text/javascript">
	$(function(){
		
		// 채팅창 띄우기
		$("#chat-btn-ptn").on("click", function(){
			var id = $("#ptnPopup .cmnm").text();
			var nick = $("#ptnPopup .flnm").text();
			var my_id = $("#ptnPopup .my_id").text();
			
			// open nav
			$("#mem_id_ptn").val(my_id);
			$("#chat_title_ptn").val(nick);
			$("#ptn_id_ptn").val(id);
			
			var check = document.ptnChatFom;
			window.open('', "new", "width=467,height=640,top=100,left=100");
			check.action='/chat/insert';
			check.target='new';
			check.submit();
		});
		
		// 친구신청하기
		$("#apply-btn-ptn").on("click", function(){
			var ptn_accept = $("#ptnPopup").find(".cmnm").text();
			var ptn_apply = $("#ptnPopup .my_id").text();
			
			$.ajax({
				url : "/ptn/apply",
				data : {ptn_apply:ptn_apply, ptn_accept:ptn_accept},
				dataType : 'json',
				type : 'POST',
				success : function(data) {
					window.opener.location.reload();
					self.close();
				},
				error : function(data) {
					alert("실패");
				}
			});
		});
		
	});
	</script>
</div>
<!-- top > chat > 동료(친구) 정보 레이어 팝업 : f -->

<!-- top > chat > 프로젝트 팀원 정보 레이어 팝업 : s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="proPopup" class="pop-layer pop-layer-style">
		<form name="proChatFom" action="/flowolf/chat/insert" class="ptn-from">
			<!-- pop header -->
    		<header class="pop-top border-box">
    			프로필정보
    			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
    		</header>
		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<div class="prof_thumb">
		   			<div class="pop-pic">
		   				<img src="" class="pop-pic-img">
		   			</div>
	   			</div>
	   		
		   		<div class="prof_info">
					<div class="prof_top">
						<h2>
							<span class="flnm"></span>
						</h2>
					</div>
					<ul class="prof_cn">
						<li class="cmnm"></li>
						<li class="phone"></li>
						<li class="my_id" style="display:none"></li>
					</ul>
				</div>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l btn-close" id="chat-btn-pro" value="채팅하기"/>
			</footer>
			
			<input type="hidden" name="mem_id" id="mem_id_pro">
			<input type="hidden" name="chat_title" id="chat_title_pro">
			<input type="hidden" name="ptn_id" id="ptn_id_pro">
		</form>
	</div>
	
	<script type="text/javascript">
	$("#chat-btn-pro").on("click", function(){
		var id = $("#proPopup").find(".cmnm").text();
		var nick = $("#proPopup .flnm").text();
		var my_id = $("#proPopup .my_id").text();
		
		// open nav
		$("#mem_id_pro").val(my_id);
		$("#chat_title_pro").val(nick);
		$("#ptn_id_pro").val(id);
		
		var check = document.proChatFom;
		window.open('', "new", "width=467,height=640,top=100,left=100");
		check.action='/chat/insert';
		check.target='new';
		check.submit();
	});
	
	</script>
</div>
<!-- top > chat > 프로젝트 팀원 정보 레이어 팝업 : f -->

<!-- 상단 고정글 확인 레이어 팝업 : s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="fixCheck" class="pop-layer">
   		<!-- pop header -->
   		<header class="pop-top border-box">
   			상단고정 설정
   			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
   		</header>
   		
   		<!-- pop con -->
   		<section class="pop-con border-box">
			<p class="fix-n">이 글을 상단고정 하시겠습니까?</p>
			<p class="fix-y">이 글을 상단고정 해제 하시겠습니까?</p>
		</section>
		
		<!-- pop footer -->
		<footer class="pop-footer border-box">
			<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
			<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l fix-submit-btn" value="확인">
		</footer>
	</div>				
</div>

<form action="" method="get" class="fix-form">
	<input type="hidden" class="timeline_col" value="">
	<input type="hidden" class="timeline_no" value="" name="timeline_no">
	<input type="hidden" class="fix_chk" value="" name="fix_chk">
</form>

<!-- 상단 고정글 확인 레이어 팝업 : f -->

<!-- 타임라인 삭제 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="deleteTimeLine" class="pop-layer">
		<form action="deleteTim.do" method="get" class="timeline-del-form">
			<input type="hidden" class="timeline_no" name="tim_no" value="">
			<input type="hidden" class="content_kind" name="cont_kind" value="">
			<input type="hidden" class="content_no" name="cont_no" value="">
			<input type="hidden" class="project_no" name="pro_no" value="">
    		
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<p class="marbtm-0 padtop-20 size-20 color-gray text-center">
	   				글을 삭제하시겠습니까?
	   			</p>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l timeline-del-btn" value="삭제하기">
			</footer>
		</form>
	</div>
</div>
<!-- 댓글 삭제 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="deleteReply" class="pop-layer">
		<form action="deleteRep.do" method="get" class="reply-del-form">
			<input type="hidden" class="rep_no" name="rep_no" value="">
    		<input type="hidden" class="pro_no" name="pro_no" value="">
    		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			<p class="marbtm-0 padtop-20 size-20 color-gray text-center">
	   				댓글을 삭제하시겠습니까?
	   			</p>
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l timeline-del-btn" value="삭제하기">
			</footer>
		</form>
	</div>
</div>
<!-- 댓글 삭제 레이어 팝업:f -->

<!-- 업무상태 수정 confirm 레이어 팝업:s -->
<div class="dim-layer">
	<div class="dimBg"></div>
	
    <div id="editTaskState" class="pop-layer">
    
		<form action="/flowolf/task/state" method="get">
			<input type="hidden" name="task_no" value="">
			<input type="hidden" name="task_state" value="">
	   		<!-- pop con -->
	   		<section class="pop-con border-box">
	   			상태를 변경하시겠습니까?
			</section>
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" name="" id="editNo" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" name="" id="editYes" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="변경">
			</footer>
		</form>
		
	</div>
	
</div>
<!-- 업무상태 수정 confirm 레이어 팝업:f -->
	
<!-- top > alim > 동료(친구) 수락  레이어 팝업 : s -->
<div class="dim-layer">
	<div class="dimBg"></div>
    <div id="ptnAcceptPopup" class="pop-layer pop-layer-style">
    
		<!-- pop header : s -->
   		<header class="pop-top border-box">
   			프로필 정보
   			<a href="#" class="posi-ab dis-block over-hidden icon-close btn-close">close</a>
   		</header>
		<!-- pop header : f -->
		
   		<!-- pop content : s -->
   		<section class="pop-con border-box">
   			<div class="prof_thumb">
	   			<div class="pop-pic">
	   				<img src="" class="pop-pic-img">
	   			</div>
   			</div>
   		
	   		<div class="prof_info">
				<div class="prof_top">
					<h2>
						<span class="flnm"></span>
					</h2>
				</div>
				<ul class="prof_cn">
					<li class="cmnm"></li>
					<li class="phone"></li>
				</ul>
			</div>
		</section>
   		<!-- pop content : f -->
			
		<!-- pop footer -->
		<footer class="pop-footer border-box">
			<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l btn-close" id="accept-btn-ptn" value="친구수락"/>
			<input type="button" name="" class="pop-btn submit-btn marleft-5 back-color-pupple-l btn-close" id="cancel-btn-ptn" value="거절하기"/>
		</footer>
		
		<input type="hidden" class="ptn_no" id="ptn_no" name="ptn_no">
		<input type="hidden" class="alim_no" id="alim_no" name="alim_no">
	</div>
	
	<script type="text/javascript">
		$(function(){
			// 친구수락하기
			$("#accept-btn-ptn").on("click", function(){
				var ptn_no = $("#ptnAcceptPopup .ptn_no").text();
				var alim_no = $("#ptnAcceptPopup .alim_no").text();
				
				$.ajax({
					url : "/ptn/accept",
					data : {ptn_no:ptn_no, alim_no:alim_no, ptn_chk:'y'},
					dataType : 'json',
					type : 'POST',
					success : function(data) {
						window.location.reload();
						self.close();
					},
					error : function(data) {
						alert("실패");
					}
				});
			});
			
			// 거절하기
			$("#cancel-btn-ptn").on("click", function(){
				var ptn_no = $("#ptnAcceptPopup .ptn_no").text();
				var alim_no = $("#ptnAcceptPopup .alim_no").text();
				
				$.ajax({
					url : "/ptn/acceptCancel",
					data : {ptn_no:ptn_no, alim_no:alim_no, ptn_chk:'n'},
					dataType : 'json',
					type : 'POST',
					success : function(data) {
						window.location.reload();
						self.close();
					},
					error : function(data) {
						alert("실패");
					}
				});
			});
			
		});
	</script>
</div>
<!-- top > alim > 동료(친구) 수락  레이어 팝업 : f -->


		
<script>
	
function fn_failDeletePro(){
	alertCustom("글이 있는 프로젝트는 삭제가 불가능 합니다.", "alert-danger");
}

$(function(){
	
	// 보관함 설정
	$(".custom-check-input").change(function(){
		var box_no = $(this).val();
		var pro_no = $(this).data("prono");
		
		if($(this).is(":checked")){
			$.ajax({
				url : "insertBoxPro.do",
				method : "get",
				dataType : "json",
				data : {pro_no:pro_no , box_no:box_no},
				success : function(data){
					alertCustom("보관함 설정되었습니다.","alert-warning");
				}
			});
		}else{
			$.ajax({
				url : "deleteBoxPro.do",
				method : "get",
				dataType : "json",
				data : {pro_no:pro_no , box_no:box_no},
				success : function(data){
					alertCustom("보관함 설정되었습니다.","alert-warning");
				}
			});
		}	
	});
	
	// 상단 고정 확인 버튼
	$(".fix-submit-btn").on('click', function(){
		
		// 상단 고정 alert
		var item = $(this);
		var fixTextN = item.parent().siblings(".pop-con").children("p.fix-n");
		var fixTextY = item.parent().siblings(".pop-con").children("p.fix-y");
		
		// parameter		
		var col = $(".fix-form .timeline_col");
		var no = $(".fix-form .timeline_no");
		var fixChk = $(".fix-form .fix_chk");
		
		if(fixTextN.css("display") == 'block'){	// 고정 
			
			fixChk.val("y");
			
			if(col.val() == 'basic_no'){		// 일반글
				$(".fix-form").attr("action", "/flowolf/basic/fix");
			
			}else if(col.val() == 'schd_no'){	// 일정
				$(".fix-form").attr("action", "/flowolf/schd/fix");
			
			}else if(col.val() == 'task_no'){	// 업무
				$(".fix-form").attr("action", "/flowolf/task/fix");
			
			}else if(col.val() == 'todo_no'){	// 할일
				$(".fix-form").attr("action", "/flowolf/todo/fix");	
			
			}else if(col.val() == 'vote_no'){	// 투표
				$(".fix-form").attr("action", "/flowolf/vote/fix");				
			}
			
		}else{	// 해제
			
			fixChk.val("n");
		
			if(col.val() == 'basic_no'){		// 일반글
				$(".fix-form").attr("action", "/flowolf/basic/fix");
			
			}else if(col.val() == 'schd_no'){	// 일정
				$(".fix-form").attr("action", "/flowolf/schd/fix");
			
			}else if(col.val() == 'task_no'){	// 업무
				$(".fix-form").attr("action", "/flowolf/task/fix");
			
			}else if(col.val() == 'todo_no'){	// 할일
				$(".fix-form").attr("action", "/flowolf/todo/fix");	
			
			}else if(col.val() == 'vote_no'){	// 투표
				$(".fix-form").attr("action", "/flowolf/vote/fix");				
			}
			
		}
		
		$(".fix-form").submit();	// submit
	});
	
	// 삭제 확인 버튼 이벤트
	$(".timeline-del-btn").on('click', function(){
		
		var col = $(".timeline-del-form .timeline_col");
		
		if(col.val() == 'basic_no'){		// 일반글
			$(".timeline-del-form").attr("action", "/flowolf/basic/delete");
		
		}else if(col.val() == 'schd_no'){	// 일정
			$(".timeline-del-form").attr("action", "/flowolf/schd/delete");
		
		}else if(col.val() == 'task_no'){	// 업무
			$(".timeline-del-form").attr("action", "/flowolf/task/delete");
		
		}else if(col.val() == 'todo_no'){	// 할일
			$(".timeline-del-form").attr("action", "/flowolf/todo/delete");	
		
		}else if(col.val() == 'vote_no'){	// 투표
			$(".timeline-del-form").attr("action", "/flowolf/vote/delete");	
		
		}else if(col.val() == 'post_no'){	// 게시글
			$(".timeline-del-form").attr("action", "/flowolf/post/delete");
		
		}else if(col.val() == 'adm_post_no'){	// 관리자 게시글
			$(".timeline-del-form").attr("action", "/flowolf/adm/delete");
		
		}else if(col.val() == 'rep_no'){	// 댓글
			$(".timeline-del-form").attr("action", "/flowolf/rep/delete");
		}
		
		$(".timeline-del-form").submit();
	});
});
</script>





