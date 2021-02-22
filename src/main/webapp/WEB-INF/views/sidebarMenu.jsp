<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.sidebar-heading{
    font-size: 31px;
    padding-bottom: 16px;
}
</style>
<nav id="sidebarMenu" style="z-index : 2"
    class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3" style="font-size: 15px">
        <ul class="nav flex-column">
          <li class="nav-item">
            <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>project</span>
        </h1>
          </li>
          <li class="nav-item"><a class="nav-link" href="proList.do?mem_no=${memNo }"><span data-feather="file"></span>전체</a></li>
          <c:forEach items="${boxList }" var="dto">
          <c:if test="${ dto.box_name eq '중요' }">
          	<c:set var="imp_no" value="${dto.box_no }" />
          	<li class="nav-item"><a class="nav-link" href="seperateList.do?box_no=${dto.box_no }&mem_no=${memNo}"><span data-feather="star"></span>중요</a></li>
          </c:if>
          
          </c:forEach>
          
          <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>collection</span></h1>
          
          <li class="nav-item"><a class="nav-link" href="taskBasic.do"><span data-feather="users"></span>전체업무</a></li>
          <li class="nav-item"><a class="nav-link" href="fullCalender.do"><span data-feather="bar-chart-2"></span>전체일정</a></li>
          <li class="nav-item"><a class="nav-link" href="files.do"><span data-feather="layers"></span>전체파일</a></li>
          <li class="nav-item"><a class="nav-link" href="collection.do"><span data-feather="layers"></span>담아둔글</a></li>
          <li class="nav-item"><a class="nav-link" href="myTimeline.do"><span data-feather="layers"></span>내 게시글</a></li>
        </ul>

        <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>BOX</span>
        <a class="d-flex align-items-center text-muted add-folder-pop-btn" href="#addFolder" aria-label="Add a new report">
           <span data-feather="plus-circle"></span> 
         </a>
        </h1>
        <ul class="nav flex-column mb-2">
        <c:forEach items="${boxList }" var="dto" >
        <c:if test="${dto.box_name != '중요' }">
          <li class="nav-item" style="height: 35px;">
            <a class="nav-link col-lg-10 col-md-10" href="seperateList.do?box_no=${dto.box_no }&mem_no=${memNo}" style="display: inline-block;">
              <span data-feather="box"></span>
              ${dto.box_name }
            </a>
           <a href="#deleteFolder" class="folder-delete cursor-point" data-boxno="${dto.box_no}"><span data-feather="minus-circle"></span></a>
          </li>
        </c:if>
        </c:forEach>  
       
        </ul>
      </div>
    </nav>