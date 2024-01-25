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
<%--                <img src="./icons/close.svg" alt="close" class="block">--%>
                X
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
<%--                <img src="./icons/close.svg" alt="close" class="block">--%>
                X
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
<%--            <img src="./icons/plus.svg" alt="icon">--%>
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
                    <img src="./icons/airline.svg" alt="eye">
                </div>
                <p class="font-bold text-2xl">${totalPassenger}</p>
                <div class="flex justify-between">
                    <p>Tổng hành khách</p>
                </div>
            </div>
        </div>
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
