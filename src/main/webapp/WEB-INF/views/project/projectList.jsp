<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    
    
<title>Insert title here</title>


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
  </head>
  <body>
    
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Company name</a>
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
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="#">
              <span data-feather="home"></span>
              	목록보기<span class="sr-only">(current)</span>
            </a>
            <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>project</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
          </li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="file"></span>전체</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="shopping-cart"></span>중요</a></li>
          
          
          <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>collection</span><a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report"><span data-feather="plus-circle"></span></a></h1>
          
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="users"></span>전체업무</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="bar-chart-2"></span>전체일정</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>전체파일</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>담아둔글</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>내 게시글</a></li>
        </ul>

        <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>Saved reports</span><a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>
		
      <div id="addProject">
		<form action="insertPro.do" method="post">
    			<h1>프로젝트 만들기</h1>
		
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
			
			<!-- pop footer -->
			<footer class="pop-footer border-box">
				<input type="button" class="pop-btn default-btn btn-close" value="취소">
				<input type="submit" class="pop-btn submit-btn marleft-5 back-color-pupple-l" value="만들기">
			</footer>
		</form>
	</div>
	<c:forEach var="dto" items="${proList }">
		<div><a href="timeLine.do?pro_no=${dto.pro_no }">${dto.pro_no } ${dto.pro_name } </a></div>
	</c:forEach>
      

      <h2>Section title</h2>
      <div class="table-responsive">
        
      </div>
    </main>
  </div>
</div>


     <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/chord/resources/js/dashboard.js"></script>
  </body>
</html>