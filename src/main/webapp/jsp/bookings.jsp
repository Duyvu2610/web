<%--
  Created by IntelliJ IDEA.
  User: Dyland
  Date: 1/11/2024
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class=" bg-[#FAFAFB]">
<c:import url="Header.jsp" />
<div class="relative top-[200px] w-[80%] mx-auto mb-[550px]">
    <!-- Scrum -->
    <nav class="flex mb-16 hidden md:block md:absolute md:top-[-80px] md:left-0 md:text-white"  aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center text-black">
                <a href="${pageContext.servletContext.contextPath}" class="inline-flex items-center text-sm font-medium hover:text-blue-600">
                    <svg class="w-3 h-3 mr-2.5" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                         viewBox="0 0 20 20">
                        <path
                                d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
                    </svg> Home
                </a></li>
            <li aria-current="page">
                <div class="flex items-center">
                    <svg class="w-3 h-3 text-gray-400 mx-1" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                        <path stroke="currentColor" stroke-linecap="round"
                              stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4" />
                    </svg>
                    <span
                            class="ml-1 text-sm font-medium md:ml-2 text-[#B1B5C3]">Bookings</span>
                </div>
            </li>
        </ol>
    </nav>
    <div class="flex gap-8 flex-col">
        <h2 class="font-bold text-2xl">Bookings</h2>
        <table class="min-w-full leading-normal">
            <thead>
            <tr>
                <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                    Flight Id
                </th>
                <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                    purchase time
                </th>
                <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                    seat number
                </th>
                <th
                        class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                    Status
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var = "booking" items = "${bookings}">
                <tr class="bg-white hover:bg-gray-200 transition-all duration-300" >
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                        <div class="flex items-center">
                            <div class="ml-3">
                                <p class="text-gray-900 whitespace-no-wrap">
                                        ${booking.flightId()}
                                </p>
                            </div>
                        </div>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
                            <fmt:formatDate var="formattedDate" value="${booking.bookingTime()}" pattern="dd/MM/yyyy-HH:mm" />${formattedDate}

                        </p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
                        <p class="text-gray-900 whitespace-no-wrap">
                            ${booking.seatNumber()}
                        </p>
                    </td>
                    <td class="px-5 py-5 border-b border-gray-200 text-sm">
						<span class="relative inline-block px-3 py-1 font-semibold ${booking.bankingStatus() ? "text-green-900":"text-red-900"}  leading-tight">
                            <span aria-hidden class="absolute inset-0  ${booking.bankingStatus() ? "bg-green-200":"bg-red-200"} opacity-50 rounded-full"></span>
                            <span class="relative">${booking.bankingStatus() ? "paid":"unpaid"}</span>
						</span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:import url="footer.jsp" />
</body>
</html>
