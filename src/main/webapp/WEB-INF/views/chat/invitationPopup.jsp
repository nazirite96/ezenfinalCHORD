<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/invitationPopup.css">
</head>
<body>
<hr>
<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                    <form id="invitationMemberForm" method="POST">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                	<th><span>User</span></th>
                                	<th colspan="2">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:choose>
	                            	<c:when test="${empty invitationMemberList}">
										<tr>
											<td>회원이 존재하지 않습니다.</td>
									    </tr>
									</c:when>
									<c:otherwise>
										<input type="hidden" value="${memNo}" name="memberList" class="invite-member" checked>
										<c:forEach var="memberList" items="${invitationMemberList}">
			                                <tr>
			                                    <td>
			                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="">
			                                    </td>
			                                    <td><a href="#" class="user-link text-center">${memberList.mem_name}</a></td>
			                                    <td class="text-center">
			                                        <span class="label label-default checkbox">
													 	<input type="checkbox" class="invite-member" name="memberList" value="${memberList.mem_no}">
												    </span>
			                                    </td>
			                                </tr>
	                               		</c:forEach>
	                               		<tr>
	                               			<td colspan="3">
	                               				<input type="text" id="chatInfo_roomname" name="chatInfo_roomname" class="form-control" placeholder="채팅방 이름을 입력해주세요." required>
	                               			</td>
	                               		</tr>
									</c:otherwise>
                            	</c:choose>
							</tbody>
                        </table>
                     </form>
					</div>
                    <button type="button" id="createBtn" class="btn btn-info">채팅방 만들기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	  $('#createBtn').on('click', function() {
		  var checkSize = $('.invite-member:checked').length;
			if (checkSize < 2) {
		      alert('채팅방 회원은 3명 이상이어야 합니다.');
		      return;
		    } 
	    	if($('#chatInfo_roomname').val() == '' || $('#chatInfo_roomname').val() == null){
	    		 alert('채팅방 이름을 입력해주세요.');	
	    		 return;
	    	}
	      	$.ajax({
	        	url : 'createChatroom.do',
	        	type : 'post',
	        	data : $('#invitationMemberForm').serialize(),
	        	success : function(data) {
	        		opener.parent.formSubmit(data); 
	        		self.close();
	        	},
	        	error : function() {}
	      });
	});
	

</script>
</body>
</html>