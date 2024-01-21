<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/datepicker.min.js"></script>
<form
	class="absolute rounded-lg w-[85%] md:w-[75%] bg-white top-[230px] md:top-[350px] left-1/2 transform -translate-x-1/2
	  		py-5 px-4 shadow md:flex md:gap-5 md:items-end z-50 bg-transparent"
	method="post" action="flights">
	<div class="md:flex-1">
		<!--  -->
		<div class="mt-4 md:flex md:gap-2">
			<div class="flex flex-col md:flex-row gap-2 md:flex-1">
				<div
					class="bg-[#F4F5F7] rounded-lg md:relative px-5 py-2 md:w-[55%] flex flex-col gap-2">
					<!-- Dropdown menu -->
					<p class="font-medium">${leavingFrom }</p>
					<select data-te-select-init data-te-select-filter="true"
						id="leaving"
						name="leaving">
						<c:forEach var="city" items="${applicationScope.cities}">
							<option value="${city.id()}" selected="selected">${city.name()}</option>
						</c:forEach>
					</select> <img alt="logo" src="./icons/arrow.svg"
						class="hidden md:block absolute top-1/2 -right-5 -translate-y-1/2 z-10">

				</div>
				<div
					class="bg-[#F4F5F7] rounded-lg md:relative px-5 py-2 md:w-[45%] flex flex-col gap-2">
					<!-- Dropdown menu -->
					<p class="font-medium">${goingTo }</p>
					<select data-te-select-init data-te-select-filter="true"
						 name="gointo">
						
						<c:forEach var="city" items="${applicationScope.cities}">
							<option value="${city.id()}">${city.name()}</option>
						</c:forEach>
					</select><img alt="logo" src="./icons/arrow.svg"
						class="hidden md:block absolute top-1/2 -right-5 -translate-y-1/2 z-10">

				</div>

			</div>
			<div class="grid grid-cols-2 mb-3 gap-2 md:mb-0">
				<div class="relative rounded-lg border px-5 py-2 bg-[#F4F5F7]">
					<p class="font-medium mb-2">${checkin }</p>

					<input datepicker datepicker-autohide
						datepicker-format="dd/mm/yyyy" type="text"
						class="text-sm rounded block w-full bg-[#F4F5F7] px-2 py-[6px] focus:border-black border border-[#d4d4d4] focus:border-[#F4F5F7]"
						placeholder=${holder } name="checkin" ><img alt="logo" src="./icons/arrow.svg"
						class="hidden md:block absolute top-1/2 -right-5 -translate-y-1/2 z-10">

				</div>
				<div class="relative rounded-lg border px-5 py-2 bg-[#F4F5F7]">
					<p class="font-medium mb-2">${checkout }</p>

					<input datepicker datepicker-autohide
						datepicker-format="dd/mm/yyyy" type="text"
						class="text-sm rounded block w-full bg-[#F4F5F7] px-2 py-[6px] focus:border-black border border-[#d4d4d4] focus:border-[#F4F5F7]"
						placeholder=${holder } name="checkout">

				</div>

			</div>
			<div class="px-4 py-2 bg-[#F4F5F7] rounded-lg mb-3 border md:hidden">
				<p>Passenger</p>

			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${not empty sessionScope.username}">
			<button
				class=" py-3 text-center rounded-lg bg-[#ff5e1f]
				 text-[#FFFFFF] text-font-bold text-xl md:px-4 md:mb-0 block"
				type="submit">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg" data-id="IcSystemSearch">
					<path
						d="M15 15L20.5 20.5M10 17C13.866 17 17 13.866 17 10C17 6.13401 13.866 3 10 3C6.13401 3 3 6.13401 3 10C3 13.866 6.13401 17 10 17Z"
						stroke="#FFFFFF" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round"></path>
				</svg>
			</button>
		</c:when>
		<c:otherwise>
			<button data-tooltip-target="tooltip-no-arrow" type="button"
				class=" py-3 text-center rounded-lg opacity-70
				 text-[#FFFFFF] text-font-bold text-xl  md:mb-0 block cursor-not-allowed bg-[#ff5e1f] md:px-4"
				disabled>
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg" data-id="IcSystemSearch">
					<path
						d="M15 15L20.5 20.5M10 17C13.866 17 17 13.866 17 10C17 6.13401 13.866 3 10 3C6.13401 3 3 6.13401 3 10C3 13.866 6.13401 17 10 17Z"
						stroke="#FFFFFF" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round"></path>
				</svg>
			</button>
			<div id="tooltip-no-arrow" role="tooltip"
				class="absolute z-10 invisible inline-block px-3 py-2 text-sm font-medium text-white bg-gray-900 rounded-lg shadow-sm opacity-0 tooltip dark:bg-gray-700">
				Please signin to search!</div>
		</c:otherwise>
	</c:choose>

</form>

<script
	src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/tw-elements.umd.min.js"></script>
	
<script src="./js/search-bar.js"></script>