<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    
    
<title>Chord</title>
</head>

    <style>
    
    input[type='checkbox']  {
		display: inline-block;
		width: 53px;
    height: 25px;;
		border: 2px solid #bcbcbc;
		cursor: pointer;
	}
	
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/img/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/table_util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/table_main.css">
<!--===============================================================================================-->
    
    <!-- Custom styles for this template -->
 <link href="/chord/resources/css/dashboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	
	$(document).on("click", "#creat01", function(){
		var createfolder=$('.foldername').val();
		$.ajax({
	    	url:"folderAdd.do?createfolder="+createfolder,
	    	type:'GET',
	    	dataType: "text",
	    		success : function(data) {
	    			alert('폴더를 생성하였습니다.');
	    			history.replaceState({}, null, location.pathname);
	    			location.reload();
	    	    },
	    	    error : function(xhr, status, error) {     
	    	    	alert(xhr,status,error);
	    	    }
	    });
	});
	
	// 체크박스 항목을 이동할 통신
	function chkMove(foldername,state){
		if( $(":checkbox[name='chkList']:checked").length==0 ){
		    alert("항목을 하나이상 체크해주세요.");
		    location.reload();
		}else{
			var chkList=get_chked_values();
			var result=confirm('해당 파일을 이동시키겠습니까?');
			if(state==2){
				foldername=foldername.substring(0,foldername.length-1);
			}
			if(result){
				$.ajax({
			    	url:"moveList.do?foldername="+foldername+"&chkList="+chkList+"&state="+state,
			    	type:'GET',
			    	dataType: "text",
			    		success : function(data) {
			    			alert('해당화면으로 이동을 완료하였습니다.');
			    			location.reload();
			    	    },
			    	    error : function(xhr, status, error) {     
			    	    	alert(xhr,status,error);
			    	    }
			    });
			}
			location.reload();
		}
	}
	function del(stuff,state){;
		var result=confirm('해당 파일을 삭제시키겠습니까?');
		if(result){
			$.ajax({
		    	url:"delFileAndFolder.do?filename="+stuff+"&state="+state,
		    	type:'GET',
		    	dataType: "text",
		    		success : function(data) {
		    			alert('삭제를 완료하였습니다.');
		    			
		    			location.reload();
		    	    },
		    	    error : function(xhr, status, error) {     
		    	    	alert(xhr,status,error);
		    	    }
		    }); 
	}location.reload();
}

	// 체크 리스트들 , 로 담기
	function get_chked_values(){
		  var chked_val = "";
		  $(":checkbox[name='chkList']:checked").each(function(pi,po){
		    chked_val += ","+po.value;
		  });
		  if(chked_val!="")chked_val = chked_val.substring(1);
		  return chked_val;
		}

	//종류별로 보여줄 리스트
	$(function(){
		$('.custom-select').on("change",function(){
			var value=$('.custom-select').val();
			if(value==1){
				value='etclist.do?state='+value;
			}else if(value==2){
				value='etclist.do?state='+value;
			}else if(value==3){
				value='etclist.do?state='+value;
			}else if(value==4){
				value='etclist.do?state='+value;
			}else if(value==5){
				value='etclist.do?state='+value;
			}
			$.ajax({
		    	url: value,
		    	type:'GET',
		    	dataType: "json",
		    		success : function(data) {
		    			var data=data.etclist;
		    			$('.allList').empty();
		    			for(var i=0;data.length;i++){
		    				var html='<tr class="row100 body">'+
									'<td class="cell100 column1"><img src="resources/img/fileicon.png" width="45"></td>'+
									'<td class="cell100 column2"><a href="filedownload?filename='+data[i].file_name+'">'+data[i].file_name+'<img src="resources/img/uploadicon.png" width="40"></a></td>'+
									'<td class="cell100 column3">'+data[i].file_size+'</td>'+
									'<td class="cell100 column4">'+data[i].mem_no+'</td>'+
									'<td class="cell100 column5">'+data[i].file_date+'</td>'+
									'</tr>';
									
									$('.allList').append(html);
		    			}
		    	    },
		    	    error : function(xhr, status, error) {     
		    	          alert("HTTP REQUEST ERROR");
		    	    }
		    });
		});
	});
	//초기로 돌아가기
	function pageRe(){
		$.ajax({
	    	url:"pageReload.do",
	    	type:'GET',
	    	dataType: "text",
	    		success : function(data) {
	    			history.replaceState({}, null, location.pathname);
	    			location.reload();
	    	    },
	    	    error : function(xhr, status, error) {     
	    	    	alert(xhr,status,error);
	    	    }
	    });
	}
	
	function close01(){
		$.ajax({
	    	url:"close.do",
	    	type:'GET',
	    	dataType: "text",
	    		success : function(data) {
	    			history.replaceState({}, null, location.pathname);
	    	    },
	    	    error : function(xhr, status, error) {     
	    	    	alert(xhr,status,error);
	    	    }
	    });
	}
	
	function goback(){
		location.href='?del=good';
		history.replaceState({}, null, location.pathname);
	}
	
	$(document).on("click", "#close01", function(){
		$.ajax({
	    	url:"close.do",
	    	type:'GET',
	    	dataType: "text",
	    		success : function() {
	    			history.replaceState({}, null, location.pathname);
	    			location.href='index.do';
	    	    },
	    	    error : function(xhr, status, error) {     
	    	    	alert(xhr,status,error);
	    	    }
	    });
	});
	
</script>
  </head>
  
  <body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" style="z-index: -1" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column" style="padding-bottom: 62%;">
          <li class="nav-item">
            <a class="nav-link active" href="javascript:pageRe();">
              <span data-feather="home"></span>
              	목록보기<span class="sr-only">(current)</span>
            </a>
            <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Type</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
          </li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="file"></span>
	          <select class="custom-select" aria-label="Default select example">
				  <option value="1">전체파일</option>
				  <option value="2">txt</option>
				  <option value="3">Excel</option>
				  <option value="4">Word</option>
				  <option value="5">pptx</option>
				</select>
          </a></li>
         
        </ul>
        <hr>
        <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>프로젝트</span><a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
        <ul class="nav flex-column mb-2">
        <c:forEach var="pro" items="${proName }">
	        <li class="nav-item">
	            <a class="nav-link" href="?projectName=${pro }">
	              <span data-feather="file-text"></span>
	              	${pro }
	            </a>
	          </li>
        </c:forEach>
        </ul>
      </div>
    </nav>
    
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">전체</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
    <!-- Button trigger modal -->
           
				<c:choose>
		        	<c:when test="${!empty clickproject }"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">폴더 생성</button></c:when>
		        	<c:when test="${empty clickproject }"><button disabled="disabled" type="button" class="btn btn-primary" data-toggle="modal">폴더 생성</button></c:when>
		        </c:choose>
           		 
           		 <c:choose>
		        	<c:when test="${!empty clickproject }"><button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModal3">삭제</button></c:when>
		        	<c:when test="${empty clickproject }"><button disabled="disabled" type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModal3">삭제</button></c:when>
		        </c:choose>
		        
           		 <c:choose>
		        	<c:when test="${!empty clickproject }"><button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModal2">이동</button></c:when>
		        	<c:when test="${empty clickproject }"><button disabled="disabled" type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#exampleModal2">이동</button></c:when>
		        </c:choose>
		        
          </div>
          <button type="button" id="close01" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
        	    닫&nbsp;&nbsp;기
          </button>
        </div>
      </div>
<c:set var="f" value="${foldername }"></c:set>
      <c:set var="path" value="${crpath }"></c:set>
      <c:if test="${!empty path}">
      		<div>
       			경로 : ${crpath } <a href="javascript:goback()">뒤로가기</a>
     		</div>
       </c:if>

	<!-- 전체 리스트 뿌려줄거의 메인 -->
	<div class="limiter">
		<div class="container-table100" id="tak_table01">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">No.</th>
									<th class="cell100 column2">파일명</th>
									<th class="cell100 column3">크기</th>
									<th class="cell100 column4">등록자</th>
									<th class="cell100 column5">최근 업로드</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
							<table>
							<tbody class="allList">
							<c:if test="${empty clickproject}">
								<c:forEach var="allFiles" items="${allFileList }">
										<tr class="row100 body">
											<td class="cell100 column1"><img src="resources/img/fileicon.png" width="45"></td>
											<td class="cell100 column2"><a href="filedownload?filename=${allFiles.file_name }">${allFiles.file_name }<img src="resources/img/uploadicon.png" width="40"></a></td>
											<td class="cell100 column3">${allFiles.file_size }</td>
											<td class="cell100 column4">${allFiles.mem_no }</td>
											<td class="cell100 column5">${allFiles.file_date }</td>
										</tr>
								</c:forEach>
							</c:if>
							<c:if test="${!empty clickproject}">
								<c:forEach var="files" items="${partFileList }">
										<tr class="row100 body">
											<td class="cell100 column1">
											<input type="checkbox" name="chkList" value="${files.file_name }">
 											 
											</td>
											<td class="cell100 column2"><a href="filedownload?filename=${files.file_name }">${files.file_name }<img src="resources/img/uploadicon.png" width="40"></a></td>
											<td class="cell100 column3">${files.file_size }</td>
											<td class="cell100 column4">${files.mem_no }</td>
											<td class="cell100 column5">${files.file_date }</td>
										</tr>
								</c:forEach>
									<c:forEach var="folder" items="${folder }">
											<tr class="row100 body">
												<td class="cell100 column1"><img src="resources/img/foldericon.png" width="50"></td>
												<td class="cell100 column2" colspan="4"><a href="?foldername=${folder }">${folder }</a></td>
											</tr>
									</c:forEach>
							</c:if>
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>										
		<!-- 전체 리스트 뿌려줄거의 메인  -->
    </main>
</div>

<!-- Modal -->
    	<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">어떤 것을 살제하실? :></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		      <div class="modal-body2" style="text-align: center;margin: 20px 0px;"">
		      <c:forEach var="files" items="${partFileList }">
						<a href="javascript:del('${files.file_name }',1)">${files.file_name }</a><br>
				</c:forEach>
		        <c:forEach var="df" items="${folder }">
		        		<a href="javascript:del('${df }',-1);">${df }</a> <br>
		        </c:forEach>
		        <c:if test="${empty folder}"> 
		        <c:if test="${empty partFileList }">삭제할 리스트가 없삼.... </c:if>
		        </c:if>
		      </div>
		     
	      	<div class="modal-footer">
	      	<div style="margin-bottom: 30px;margin-right: 134px;font-size: 10px; color: red;">
	      		*참고로 폴더 삭제할 경우 안쪽 파일 전부 삭제가 됩니다~ :)
	      	</div>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	     	 </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal -->
    	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">어느폴더에 이동시키실? :></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
		      <div class="modal-body2" style="text-align: center;margin: 20px 0px;">
		        <c:forEach var="mf" items="${folder }">
		        		<a href="javascript:chkMove('${mf }',1)">${mf }</a> <br>
		        </c:forEach>
		        <c:if test="${empty folder}"> <a href="javascript:chkMove('${crpath }k',2)">최상의 경로로...</a></c:if>
		      </div>
	      	<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	     	 </div>
	    </div>
	  </div>
	</div>
	<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">폴더 메이커 :></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
			      <div class="modal-body01" style="text-align: center;margin: 39px 0px;">
			       폴더 이름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="foldername">
			      </div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			     	<button type="button" class="btn btn-primary" id="creat01">만들기</button>
		     	 </div>
		    </div>
		  </div>
		</div>
		</div>

     <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/chord/resources/js/dashboard.js"></script>
    

  </body>
</html>