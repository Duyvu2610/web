<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.tailwindcss.com"></script>
<title>Insert title here</title>
</head>
<body class=" md:bg-[#FAFAFB] md:pt-20">
	<jsp:include page="Header.jsp"></jsp:include>
	<nav class="flex mb-16 hidden md:block absolute top-[125px] left-[165px]" aria-label="Breadcrumb">
		<ol class="inline-flex items-center space-x-1 md:space-x-3">
			<li class="inline-flex items-center"><a
				href="${pageContext.servletContext.contextPath}"
				class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400">
					<svg class="w-3 h-3 mr-2.5" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" fill="currentColor"
						viewBox="0 0 20 20">
          <path
							d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
        </svg> Home
			</a></li>
			<li>
				<div class="flex items-center">
					<svg class="w-3 h-3 text-gray-400 mx-1" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4" />
        </svg>
					<button onclick="window.history.back()"
						class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Flights</button>
				</div>
			</li>
			<li aria-current="page">
				<div class="flex items-center">
					<svg class="w-3 h-3 text-gray-400 mx-1" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4" />
        </svg>
					<span
						class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">Confirm</span>
				</div>
			</li>
		</ol>
	</nav>
	<c:choose>
		<c:when test="${empty param.status}">
			<jsp:include page="payment.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="payment-success.jsp" />
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>