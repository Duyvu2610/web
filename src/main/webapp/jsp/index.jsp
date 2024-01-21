<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css"
	rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-element-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/global.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<style>
	body {
		font-family: 'Roboto', sans-serif;
	}
</style>
<body>
	<jsp:include page="Header.jsp"/>
	<jsp:include page="banner.jsp"/>
	<jsp:include page="slider.jsp" />
	<jsp:include page="featured_destinations.jsp" />
	<jsp:include page="trending_cities.jsp" />
	<jsp:include page="explore_world.jsp" />
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
		
</body>
</html>