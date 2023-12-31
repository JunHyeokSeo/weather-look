<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title>WeatherLook</title>
	<meta content="" name="description">
	<meta content="" name="keywords">

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- 에셋 ========================================= -->

	<!-- Favicons -->
	<link href="ico/weatherico.png" rel="icon">

	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
			rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	      rel="stylesheet">
	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	      rel="stylesheet">
	<link href="assets/vendor/boxicons/css/boxicons.min.css"
	      rel="stylesheet">
	<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="assets/css/style.css" rel="stylesheet">


	<!-- ========================================= 에셋 -->


	<link href="css/mainpage.css" rel="stylesheet">
	<script src="js/weather.js"></script>

</head>
<body>

<%@ include file="../include/header.jsp" %>
<main id="main">

	<!-- 날씨박스 ==============> -->

	<!-- 기본 지역 설정 : 서울 -->
	<c:set var="lat" value="37.5683"/>
	<c:set var="lon" value="127"/>
	<c:set var="templow"/>
	<c:set var="temphigh"/>

	<div class="weather">
		<div class="weather_2x2box">

			<c:forEach var="d" items="${dates }" varStatus="status">
				<a href="#" onclick="updateLink('${d.df2}');">
					<div id="${d.df2 }" class="day">
						<div class="dayvalue">${d.df1}(${d.df3 })</div>
						<div class="dayvalue" id="${d.df2 }_high"></div>
						<div class="dayvalue" id="${d.df2 }_low"></div>
					</div>
				</a>
			</c:forEach>


		</div>
	</div>
	<!-- <============== 날씨박스 -->

	<section>

		<div class="container mt-4" style="max-width: 900px;">
			<div class="row">
				<c:forEach var="r" items="${mainlist}" varStatus="i">
					<div class="col-md-4 mb-4">
						<div style="max-width: 100%; display: flex; flex-direction: column; align-items: center;">
							<a href="detail?type_name=${r.type_name}&post_id=${r.post_id}">
								<img src="upload/${r.image_path}"
								     style="max-width: 100%; height: auto; border-radius: 8px;">
								<div style="text-align: left; margin-top: 10px;">
									<span style="font-family: 'Open Sans', sans-serif; color: #e03e2d; display: block; margin-bottom: 2px; font-weight: bold;">#${r.type_name}</span>
									<span style="font-family: 'Open Sans', sans-serif; color: #000000; display: block; margin-top: 2px; font-weight: bold;">${r.title}</span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>


		<!-- 페이징 ==============> -->

		<div style="display: flex; justify-content: center;">
			<ul class="pagination">
				<c:if test="${startpage > 10}">
					<li class="page-item"><a class="page-link"
					                                  href="main?page=${startpage - 10}" tabindex="-1">&laquo;</a></li>
				</c:if>

				<c:forEach var="i" begin="${startpage}" end="${endpage}">
					<c:if test="${i == page }">
						<li class="page-item active" aria-current="page"><a
								class="page-link" href="">${i}</a></li>
					</c:if>
					<c:if test="${i != page }">
						<li class="page-item"><a class="page-link"
						                         href="main?page=${i}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${endpage < maxpage}">
					<li class="page-item"><a class="page-link"
					                         href="main?page=${startpage + 10}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>

		<!--  <============== 페이징 -->

	</section>
</main>


<!-- 에셋 ========================================= -->

<!-- Vendor JS Files -->
<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/chart.js/chart.umd.js"></script>
<script src="assets/vendor/echarts/echarts.min.js"></script>
<script src="assets/vendor/quill/quill.min.js"></script>
<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="assets/vendor/tinymce/tinymce.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- ========================================= 에셋 -->

</body>

</html>