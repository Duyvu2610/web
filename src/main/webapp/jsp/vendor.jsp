<%--
  Created by IntelliJ IDEA.
  User: Dyland
  Date: 1/1/2024
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/flowbite.min.css" rel="stylesheet" />
</head>
<body>
<input type="hidden" id="add" value="${add}">
<input type="hidden" id="update" value="${update}">
    <!--Edit Model -->
    <div class="justify-center items-center fixed z-[20000000000] w-full h-screen hidden" id ="editPopup">
        <div class="bg-[#03121a] opacity-50 w-full h-full"></div>
        <div class="bg-white rounded-xl border shadow p-4 sm:p-8 mx-4 w-[700px] fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
            <button onclick="hideEditModel()" class="flex items-center w-8 h-8 rounded-full bg-gray-400 justify-center  my-2 ml-auto hover:opacity-100 opacity-50">
                <img src="./icons/close.svg" alt="close" class="block">
            </button>
            <form method="post" action="flight?update=true">
                <div class="grid gap-6 mb-6 md:grid-cols-2">
                    <div>
                        <label for="departureEdit" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Departure</label>
                        <select
                                id="departureEdit"
                                name="departureEdit"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                        >
                            <c:forEach var="airport" items="${airports}">
                                <option value="${airport.id()}">${airport.name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="destinationEdit" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Destination</label>
                        <select
                                id="destinationEdit"
                                name="destinationEdit"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                        >
                            <c:forEach var="airport" items="${airports}">
                                <option value="${airport.id()}">${airport.name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="departure_dateEdit" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Departure Date</label>
                        <input type="datetime-local" name="departure_dateEdit" id="departure_dateEdit" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Flowbite" required>
                    </div>
                    <div>
                        <label for="arrival_dateEdit" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Arrival Date</label>
                        <input type="datetime-local" name="arrival_dateEdit" id="arrival_dateEdit" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required>
                    </div>
                    <div>
                        <label for="priceEdit" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                        <input type="number" name="priceEdit" id="priceEdit" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="flowbite.com" required>
                    </div>
                    <div>
                        <label for="num_seatEdit" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Number seat</label>
                        <input type="number" name="num_seatEdit" id="num_seatEdit" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="" required>
                    </div>
                    <input type="hidden" id="flightId" name="flightId">
                    <!-- Add more fields as needed -->
                </div>
                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
            </form>
        </div>
    </div>
    <%--Register Model--%>
    <div class="justify-center items-center fixed z-[20000000000] w-full h-screen hidden" id ="popup">
        <div class="bg-[#03121a] opacity-50 w-full h-full"></div>
        <div class="bg-white rounded-xl border shadow p-4 sm:p-8 mx-4 w-[700px] fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
            <button onclick="hideLoginModel()" class="flex items-center w-8 h-8 rounded-full bg-gray-400 justify-center  my-2 ml-auto hover:opacity-100 opacity-50">
                <img src="./icons/close.svg" alt="close" class="block">
            </button>
            <form method="post" action="flight">
                <div class="grid gap-6 mb-6 md:grid-cols-2">
                    <div>
                        <label for="departure" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Departure</label>
                        <select
                                id="departure"
                                name="departure"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                        >
                            <c:forEach var="airport" items="${airports}">
                                <option value="${airport.id()}">${airport.name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="destination" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Destination</label>
                        <select
                                id="destination"
                                name="destination"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                        >
                            <c:forEach var="airport" items="${airports}">
                                <option value="${airport.id()}">${airport.name()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label for="departure_date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Departure Date</label>
                        <input type="datetime-local" name="departure_date" id="departure_date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Flowbite" required>
                    </div>
                    <div>
                        <label for="arrival_date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Arrival Date</label>
                        <input type="datetime-local" name="arrival_date" id="arrival_date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required>
                    </div>
                    <div>
                        <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                        <input type="number" name="price" id="price" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="flowbite.com" required>
                    </div>
                    <div>
                        <label for="num_seat" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Number seat</label>
                        <input type="number" name="num_seat" id="num_seat" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="" required>
                    </div>
                </div>
                <div class="mb-6">
                    <label for="disabled-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Filght code</label>
                    <input readonly aria-label="disabled input" type="text" name="flight_code" value="${randomCode}" id="disabled-input" class="cursor-not-allowed bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 w-[20%]" placeholder="john.doe@company.com" required>
                </div>
                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
            </form>

        </div>
    </div>
    <%--Header--%>
    <c:import url="Header.jsp" />
    <%--Content--%>
    <div class="pt-[120px] px-12">
        <div class = "font-bold text-xl flex w-full items-center justify-center gap-4">
            <img src="${airline.imagePath()}" class="w-60 h-auto">
        </div>
        <button class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none flex ml-auto items-center gap-2 my-4
         focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center me-2" onclick="showLoginModel()">
            <img src="./icons/plus.svg" alt="icon">
            Add Flight
        </button>
        <div class="flex gap-8 justify-between">
            <div class="border w-full p-6 shadow-xl hover:scale-110 transition-all duration-500 rounded-lg">
                <div class="w-12 h-12 rounded-full bg-[#eff2f7] flex justify-center items-center mb-3">
                    <img src="./icons/airline.svg" alt="eye">
                </div>
                <p class="font-bold text-2xl">${flights}</p>
                <div class="flex justify-between">
                    <p>Tổng chuyến bay</p>
                </div>
            </div>
            <div class="border w-full p-6 shadow-xl hover:scale-110 transition-all duration-500 rounded-lg">
                <div class="w-12 h-12 rounded-full bg-[#eff2f7] flex justify-center items-center mb-3">
                    <img src="./icons/clock.svg" alt="eye">
                </div>
                <p class="font-bold text-2xl">${totalHour}</p>
                <div class="flex justify-between">
                    <p>Tổng giờ bay</p>
                </div>
            </div>
            <div class="border w-full p-6 shadow-xl hover:scale-110 transition-all duration-500 rounded-lg">
                <div class="w-12 h-12 rounded-full bg-[#eff2f7] flex justify-center items-center mb-3">
                    <img src="./icons/money.svg" alt="eye">
                </div>
                <p class="font-bold text-2xl">${totalAmount}</p>
                <div class="flex justify-between">
                    <p>Tổng doanh thu</p>
                </div>
            </div>
            <div class="border w-full p-6 shadow-xl hover:scale-110 transition-all duration-500 rounded-lg">
                <div class="w-12 h-12 rounded-full bg-[#eff2f7] flex justify-center items-center mb-3">
                    <img src="./icons/eye.svg" alt="eye">
                </div>
                <p class="font-bold text-2xl">${totalPassenger}</p>
                <div class="flex justify-between">
                    <p>Tổng hành khách</p>
                </div>
            </div>
        </div>
        <%--        Start Chart--%>
        <div class="flex my-10 gap-4">
            <div class="w-[70%]">
                <div class="max-w w-full bg-white rounded-lg shadow dark:bg-gray-800 p-4 md:p-6">
                    <div class="flex justify-between">
                        <div>
                            <h5 class="leading-none text-3xl font-bold text-gray-900 dark:text-white pb-2">32.4k</h5>
                            <p class="text-base font-normal text-gray-500 dark:text-gray-400">Users this week</p>
                        </div>
                        <div
                                class="flex items-center px-2.5 py-0.5 text-base font-semibold text-green-500 dark:text-green-500 text-center">
                            12%
                            <svg class="w-3 h-3 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13V1m0 0L1 5m4-4 4 4"/>
                            </svg>
                        </div>
                    </div>
                    <div id="area-chart"></div>
                </div>
                <script>
                    // ApexCharts options and config
                    window.addEventListener("load", function() {
                        let options = {
                            chart: {
                                height: "100%",
                                maxWidth: "100%",
                                type: "area",
                                fontFamily: "Inter, sans-serif",
                                dropShadow: {
                                    enabled: false,
                                },
                                toolbar: {
                                    show: false,
                                },
                            },
                            tooltip: {
                                enabled: true,
                                x: {
                                    show: false,
                                },
                            },
                            fill: {
                                type: "gradient",
                                gradient: {
                                    opacityFrom: 0.55,
                                    opacityTo: 0,
                                    shade: "#1C64F2",
                                    gradientToColors: ["#1C64F2"],
                                },
                            },
                            dataLabels: {
                                enabled: false,
                            },
                            stroke: {
                                width: 6,
                            },
                            grid: {
                                show: false,
                                strokeDashArray: 4,
                                padding: {
                                    left: 2,
                                    right: 2,
                                    top: 0
                                },
                            },
                            series: [
                                {
                                    name: "New users",
                                    data: [6500, 6418, 6456, 6526, 6356, 6456],
                                    color: "#1A56DB",
                                },
                            ],
                            xaxis: {
                                categories: ['01 February', '02 February', '03 February', '04 February', '05 February', '06 February'],
                                labels: {
                                    show: true,
                                },
                                axisBorder: {
                                    show: false,
                                },
                                axisTicks: {
                                    show: false,
                                },
                            },
                            yaxis: {
                                show: false,
                            },
                        }

                        if (document.getElementById("area-chart") && typeof ApexCharts !== 'undefined') {
                            const chart = new ApexCharts(document.getElementById("area-chart"), options);
                            chart.render();
                        }
                    });
                </script>
            </div>
            <div class="w-[30%]">
                <div class="max-w w-full bg-white rounded-lg shadow dark:bg-gray-800 p-4 md:p-6 h-full">
                    <div class="flex justify-between pb-4 mb-4 border-b border-gray-200 dark:border-gray-700">
                        <div class="flex items-center">
                            <div class="w-12 h-12 rounded-lg bg-gray-100 dark:bg-gray-700 flex items-center justify-center me-3">
                                <svg class="w-6 h-6 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 19">
                                    <path d="M14.5 0A3.987 3.987 0 0 0 11 2.1a4.977 4.977 0 0 1 3.9 5.858A3.989 3.989 0 0 0 14.5 0ZM9 13h2a4 4 0 0 1 4 4v2H5v-2a4 4 0 0 1 4-4Z"/>
                                    <path d="M5 19h10v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2ZM5 7a5.008 5.008 0 0 1 4-4.9 3.988 3.988 0 1 0-3.9 5.859A4.974 4.974 0 0 1 5 7Zm5 3a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm5-1h-.424a5.016 5.016 0 0 1-1.942 2.232A6.007 6.007 0 0 1 17 17h2a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5ZM5.424 9H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h2a6.007 6.007 0 0 1 4.366-5.768A5.016 5.016 0 0 1 5.424 9Z"/>
                                </svg>
                            </div>
                            <div>
                                <h5 class="leading-none text-2xl font-bold text-gray-900 dark:text-white pb-1">3.4k</h5>
                                <p class="text-sm font-normal text-gray-500 dark:text-gray-400">Leads generated per week</p>
                            </div>
                        </div>
                        <div>
      <span class="bg-green-100 text-green-800 text-xs font-medium inline-flex items-center px-2.5 py-1 rounded-md dark:bg-green-900 dark:text-green-300">
        <svg class="w-2.5 h-2.5 me-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13V1m0 0L1 5m4-4 4 4"/>
        </svg>
        42.5%
      </span>
                        </div>
                    </div>

                    <div class="grid grid-cols-2">
                        <dl class="flex items-center">
                            <dt class="text-gray-500 dark:text-gray-400 text-sm font-normal me-1">Money spent:</dt>
                            <dd class="text-gray-900 text-sm dark:text-white font-semibold">$3,232</dd>
                        </dl>
                        <dl class="flex items-center justify-end">
                            <dt class="text-gray-500 dark:text-gray-400 text-sm font-normal me-1">Conversion rate:</dt>
                            <dd class="text-gray-900 text-sm dark:text-white font-semibold">1.2%</dd>
                        </dl>
                    </div>
                    <div id="column-chart"></div>
                </div>

                <script>
                    // ApexCharts options and config
                    window.addEventListener("load", function() {
                        const options = {
                            colors: ["#1A56DB", "#FDBA8C"],
                            series: [
                                {
                                    name: "Organic",
                                    color: "#1A56DB",
                                    data: [
                                        { x: "Mon", y: 231 },
                                        { x: "Tue", y: 122 },
                                        { x: "Wed", y: 63 },
                                        { x: "Thu", y: 421 },
                                        { x: "Fri", y: 122 },
                                        { x: "Sat", y: 323 },
                                        { x: "Sun", y: 111 },
                                    ],
                                },
                                {
                                    name: "Social media",
                                    color: "#FDBA8C",
                                    data: [
                                        { x: "Mon", y: 232 },
                                        { x: "Tue", y: 113 },
                                        { x: "Wed", y: 341 },
                                        { x: "Thu", y: 224 },
                                        { x: "Fri", y: 522 },
                                        { x: "Sat", y: 411 },
                                        { x: "Sun", y: 243 },
                                    ],
                                },
                            ],
                            chart: {
                                type: "bar",
                                height: "320px",
                                fontFamily: "Inter, sans-serif",
                                toolbar: {
                                    show: false,
                                },
                            },
                            plotOptions: {
                                bar: {
                                    horizontal: false,
                                    columnWidth: "70%",
                                    borderRadiusApplication: "end",
                                    borderRadius: 8,
                                },
                            },
                            tooltip: {
                                shared: true,
                                intersect: false,
                                style: {
                                    fontFamily: "Inter, sans-serif",
                                },
                            },
                            states: {
                                hover: {
                                    filter: {
                                        type: "darken",
                                        value: 1,
                                    },
                                },
                            },
                            stroke: {
                                show: true,
                                width: 0,
                                colors: ["transparent"],
                            },
                            grid: {
                                show: false,
                                strokeDashArray: 4,
                                padding: {
                                    left: 2,
                                    right: 2,
                                    top: -14
                                },
                            },
                            dataLabels: {
                                enabled: false,
                            },
                            legend: {
                                show: false,
                            },
                            xaxis: {
                                floating: false,
                                labels: {
                                    show: true,
                                    style: {
                                        fontFamily: "Inter, sans-serif",
                                        cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400'
                                    }
                                },
                                axisBorder: {
                                    show: false,
                                },
                                axisTicks: {
                                    show: false,
                                },
                            },
                            yaxis: {
                                show: false,
                            },
                            fill: {
                                opacity: 1,
                            },
                        }

                        if(document.getElementById("column-chart") && typeof ApexCharts !== 'undefined') {
                            const chart = new ApexCharts(document.getElementById("column-chart"), options);
                            chart.render();
                        }
                    });
                </script>

            </div>
        </div>
        <%--        End Chart--%>
        <%--   Start table     --%>
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg my-10">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        Mã chuyến bay
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Xuất phát từ
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Đi đến
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Thời gian đi
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Tổng giờ bay
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Số ghế còn lại
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Giá
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Action
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="fl" items="${flightVendor}">
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            ${fl.flightCode()}
                        </th>
                        <td class="px-6 py-4">
                            ${fl.departureId()}
                        </td>
                        <td class="px-6 py-4">
                            ${fl.destinationId()}
                        </td>
                        <td class="px-6 py-4">
                            <fmt:formatDate var="formattedDate" value="${fl.departureDate()}" pattern="dd/MM/yyyy-HH:mm" />${formattedDate}
                        </td>
                        <td class="px-6 py-4">
                            ${fl.travelHour()}h:${fl.travelMinute()}m
                        </td>
                        <td class="px-6 py-4">
                            ${fl.price()}
                        </td>
                        <td class="px-6 py-4">
                            ${fl.price()}
                        </td>
                        <td class="px-6 py-4">
                            <button class="font-medium text-blue-600 dark:text-blue-500 hover:underline" onclick="showEditDialog('${fl.id()}')">Edit</button>
                            <button class="font-medium text-red-600 dark:text-blue-500 hover:underline pl-1" onclick="showDeleteConfirmation('${fl.id()}')">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav class="flex items-center flex-column flex-wrap md:flex-row justify-between p-4" aria-label="Table navigation">
                <span class="text-sm font-normal text-gray-500 dark:text-gray-400 mb-4 md:mb-0 block w-full md:inline md:w-auto">Showing <span class="font-semibold text-gray-900 dark:text-white">${currentPage * 10 - 9}-${currentPage * 10}</span> of <span class="font-semibold text-gray-900 dark:text-white">${flights}</span></span>
                <ul class="inline-flex -space-x-px rtl:space-x-reverse text-sm h-8">
                    <li>
                        <button onclick="changePage()" class="flex items-center justify-center px-3 h-8 ms-0 leading-tight text-gray-500 border border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white ${currentPage <= 1 ? 'pointer-events-none bg-gray-300' : ''}">Previous</button>
                    </li>
                    <c:forEach var="i" begin="1" end="${totalPage}">
                        <li>
                            <a href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white ${i == currentPage ? 'bg-blue-300' : ''}">${i}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <button onclick="changePage(true)" href="#" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 border border-gray-300 rounded-e-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white ${currentPage >= totalPage ? 'pointer-events-none bg-gray-300' : ''}">Next</button>
                    </li>
                </ul>
            </nav>
        </div>
        <%--   End table     --%>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/flowbite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("nav ul li a").click(function(e) {
                e.preventDefault();
                var page = $(this).text(); // Get the page number from the link text
                window.location.href = "/BookTickets_war_exploded/vendor?page=" + page; // Change the URL
            });
        });

        function changePage(increase){
            var urlParams = new URLSearchParams(window.location.search);
            var page = urlParams.get('page') ? parseInt(urlParams.get('page')) : 1;
            if (increase === true) {
                page = page + 1;
            }
            else {
                page = page - 1;
            }
            window.location.href = "/BookTickets_war_exploded/vendor?page=" + page;
        }

        function showEditDialog(flightId) {
            const editModel = document.getElementById("editPopup");
            document.getElementById('flightId').value = flightId;
            editModel.style.display = "flex";
        }
        function hideEditModel(event){
            const editModel = document.getElementById("editPopup");
            editModel.style.display = "none";
        }
        function showLoginModel(event) {
            const loginModel = document.getElementById("popup");
            loginModel.style.display = "flex";
        }

        function hideLoginModel(event) {
            const loginModel = document.getElementById("popup");
            loginModel.style.display = "none";
        }

        function showDeleteConfirmation(flightCode) {
            Swal.fire({
                title: 'Confirm Deletion',
                text: 'Are you sure you want to delete this flight?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng đồng ý xóa, thực hiện hành động xóa (có thể gọi hàm xóa ở đây)
                    deleteFlight(flightCode);
                }
            });
        }

        function deleteFlight(flightCode) {
            $.ajax({
                url: '/BookTickets_war_exploded/flight?id=' + flightCode,
                type: 'DELETE',
                success: function(result) {
                    Swal.fire({
                        title: 'Deleted!',
                        text: 'The flight has been deleted.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        location.reload();
                    });

                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        title: 'Failed!',
                        text: status,
                        icon: 'error',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        
                    });
                }
            });
        }

        const status = document.getElementById("add").value;
        console.log(status);
        setTimeout(() => {
            if (status === "true") {
                Swal.fire({
                    title: 'Success',
                    icon: 'success',
                    text: 'Add flight success',
                    confirmButtonText: 'OK',
                });
            }
            else if (status === "false"){
                Swal.fire({
                    title: 'Failed',
                    icon: 'error',
                    text: 'Add flight failed',
                    confirmButtonText: 'OK',
                })
            }
        }, 500);

        const update = document.getElementById("update").value;
        setTimeout(() => {
            if (update === "true") {
                Swal.fire({
                    title: 'Success',
                    icon: 'success',
                    text: 'Update flight success',
                    confirmButtonText: 'OK',
                });
            }
            else if (update === "false"){
                Swal.fire({
                    title: 'Failed',
                    icon: 'error',
                    text: 'Update flight failed',
                    confirmButtonText: 'OK',
                })
            }
        }, 500);
    </script>
</body>
</html>
