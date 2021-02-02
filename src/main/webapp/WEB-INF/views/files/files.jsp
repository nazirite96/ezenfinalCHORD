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

    
    <!-- Custom styles for this template -->
    <link href="/chord/resources/css/dashboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
var count = 1;
/* 	$( document ).ready(function() {
		$.ajax({
	    	url:"getAllFles.do",
	    	type:'GET',
	    	data: foldername,
	    	dataType: "json",
	    		success : function(data) {
	    			var arr = data.list;
	    			var folderarr = data.folder;
	    			  for(var i=0; i<arr.length; i++){
	    				  filelist="<tr>"+
		    			  "<td>체크</td>"+
		    			  "<td colspan='3'><a href='filedownload?filename="+arr[i]+"'>"+arr[i]+"</a></td>"+
		    			  "</tr>";
		    			  $('.allList').append(filelist);
	    			  }
	    			  for(var i=0; i<folderarr.length; i++){
	    				  folderlist='<tr>'+
		    			  '<td>체크</td>'+
		    			  '<td colspan="3"><a href="getAllFiles.do?foldername='+folderarr[i]+'">'+folderarr[i]+'</a></td>'+
		    			  '</tr>';
		    			  $('.allList').append(folderlist);
		    			  count++;
	    			  }
	    	    },
	    	    error : function(xhr, status, error) {     
	    	          alert("HTTP REQUEST ERROR");
	    	    }
	    });
	}); */
	
	$(document).on("click", "#creat01", function(){
		var createfolder=$('.foldername').val();
		$.ajax({
	    	url:"folderAdd.do?createfolder="+createfolder,
	    	type:'GET',
	    	dataType: "text",
	    		success : function(data) {
	    			alert('폴더를 생성하였습니다.');
	    			location.reload();
	    	    },
	    	    error : function(xhr, status, error) {     
	    	          alert("HTTP REQUEST ERROR");
	    	    }
	    });
	});
	
	$(function(){
		$('.custom-select').on("change",function(){
			var value=$('.custom-select').val();
			if(value==0||value==1){
				value="pageReload.do"
			}
			
			$.ajax({
		    	url: value,
		    	type:'GET',
		    	dataType: "text",
		    		success : function(data) {
		    			location.href='files.do';
		    	    },
		    	    error : function(xhr, status, error) {     
		    	          alert("HTTP REQUEST ERROR");
		    	    }
		    });
		});
	});
</script>
  </head>
  <body>
    
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="index.do">Company name</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="#">Sign out</a>
    </li>
  </ul>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column" style="padding-bottom: 62%;">
          <li class="nav-item">
            <a class="nav-link active" href="#">
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
				  <option value="2">One</option>
				  <option value="3">Two</option>
				  <option value="4">Three</option>
				</select>
          </a></li>
         
        </ul>
        <hr>
        <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>프로젝트</span><a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
        <ul class="nav flex-column mb-2">
        <c:forEach var="folder" items="${folder }">
	        <li class="nav-item">
	            <a class="nav-link" href="?foldername=${folder }">
	              <span data-feather="file-text"></span>
	              	${folder }
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
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
			   폴더 생성
			</button>
			
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>
      <c:set var="f" value="${foldername }"></c:set>
      <c:set var="path" value="${crpath }"></c:set>
      <c:if test="${!empty path}">
      		<div>
       			현재 경로 : ${crpath } <a href="?del=chord">뒤로가기</a>
     		</div>
       </c:if>
		<!-- 전체 리스트 뿌려줄거의 메인 -->
		<form action="" method="POST">
			<table>
				<thead>
					<tr>
						<th>체크박스</th>
						<th>파일명</th>
						<th>크기</th>
						<th>등록자</th>
						<th>최근 업로드</th>
					</tr>
				</thead>
				<tbody class="allList">
				<c:if test="${!empty files}"> 등록되어있는 파일이 없습니다.</c:if>
					<c:forEach var="files" items="${test }">
							<tr>
								<td>체크박스</td>
								<td colspan="3"><a href="filedownload?filename=${files.file_name }">${files.file_name }</a></td>
							</tr>
					</c:forEach>
					<c:if test=""></c:if>
					<c:forEach var="folder" items="${folder }">
						<c:if test="${!empty folder}"> 
							<tr>
								<td>폴더 입니다.</td>
								<td colspan="3"><a href="?foldername=${folder }">${folder }</a></td>
							</tr>
							</c:if>
					</c:forEach>
					
				</tbody>
			</table>
		</form>
		<!-- 전체 리스트 뿌려줄거의 메인  -->
    </main>
  </div>
</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">폴더 만들기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form name="fm">
			      <div class="modal-body" style="text-align: center">
			        폴더 이름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="foldername">
			      </div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="creat01">만들기</button>
		     	 </div>
		       </form>
		    </div>
		  </div>
		</div>

     <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/chord/resources/js/dashboard.js"></script>
  </body>
</html>