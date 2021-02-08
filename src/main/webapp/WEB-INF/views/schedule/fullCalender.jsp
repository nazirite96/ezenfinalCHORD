<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>금일부터 일정을 시작하겟노나이다</h2>
<div id="map" style="width:100%; height: 100vh;"></div>
			  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8bzzn6nlXYfctPLkT0aCHApiK0aig4KA&callback&callback=initMap&region=kr"></script>
			  <script>
			    function initMap() {
			      var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
			      var map = new google.maps.Map(
			        document.getElementById('map'), {
			          zoom: 12,
			          center: seoul
			        });
			      
			    }
			  </script>
<a href="addCal.do">일단 일정 등록 먼저</a>
</body>
</html>