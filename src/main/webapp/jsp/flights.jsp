<%@page import="models.Flight"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class=" mt-[88px] md:flex md:w-[75%] md:mx-auto ">
	<aside id="default-sidebar"
		class="fixed md:relative md:top-0 top-[88px] border-t-2 left-0 z-40 w-64 md:w-96 h-screen transition-transform -translate-x-full sm:translate-x-0 bg-white md:bg-inherit md:border-0"
		aria-label="Sidebar">
		<div class="h-full px-3 md:px-1 py-4 overflow-y-hidden">

			<button id="dropdownRadioButton"
				data-dropdown-toggle="dropdownDefaultRadio"
				class=" relative text-white bg-white w-full text-black font-medium rounded-lg px-5 py-2.5 inline-flex items-center"
				type="button">
				<svg width="20" height="20" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg" data-id="IcSystemToolSort">
					<path d="M3 6H15.5M3 12H12.5M3 18H9" stroke="#687176"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
					<path d="M19 6V19.5M19 19.5L16.5 17M19 19.5L21.5 17"
						stroke="#0194F3" stroke-width="2" stroke-linecap="round"
						stroke-linejoin="round"></path></svg>
				<div class="flex flex-col items-start ml-3 text-base">
					<p class="font-bold">Sắp Xếp</p>
					<p>Giá thấp nhất</p>
				</div>
				<div class="absolute right-4 rotate-180">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg" data-id="IcSystemChevronUp">
						<path d="M6 15L12 9L18 15" stroke="#0194f3" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round"></path></svg>
				</div>
			</button>

			<!-- Dropdown menu -->
			<div id="dropdownDefaultRadio"
				class="z-10 hidden w-full bg-white divide-y divide-gray-100 rounded-lg shadow ">
				<form action="/flight-list">
					<ul class="p-3 space-y-3 text-sm text-gray-700 dark:text-gray-200"
						aria-labelledby="dropdownRadioButton">
						<li>
							<div class="flex items-center">
								<input id="default-radio-1" type="radio" value="lowestPrice"
									onclick="window.location.href = window.location.href;"
									name="default-radio"
									class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 filter">
								<label for="default-radio-1"
									class="ml-2 text-sm font-medium text-gray-900">Default
									radio</label>
							</div>
						</li>
						<li>
							<div class="flex items-center">
								<input id="default-radio-2" type="radio" value=""
									name="default-radio"
									class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
								<label for="default-radio-2"
									class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Checked
									state</label>
							</div>
						</li>
						<li>
							<div class="flex items-center">
								<input id="default-radio-3" type="radio" value=""
									name="default-radio"
									class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 dark:focus:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
								<label for="default-radio-3"
									class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Default
									radio</label>
							</div>
						</li>
					</ul>
				</form>
			</div>

			<p class="py-4 font-bold text-lg">Bộ lọc</p>

			<details
				class="group transition-all duration-150 h-[64px] open:h-44 overflow-hidden">
				<summary
					class="transition-all duration-500 flex cursor-pointer items-center rounded-lg px-4 py-2 md:px-6 md:py-4  hover:bg-gray-100 hover:text-gray-700">


					<span class="ml-3 text-sm md:text-xl"> Teams </span> <span
						class="ml-auto shrink-0 transition duration-300 group-open:-rotate-180">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
							viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd"
								d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
								clip-rule="evenodd" />
            </svg>
					</span>
				</summary>

				<nav class="mt-1.5 ml-8 flex flex-col transition-all duration-500">
					<a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
            </svg> <span class="ml-3 text-sm font-medium"> Banned Users
					</span>
					</a> <a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg> <span class="ml-3 text-sm font-medium"> Calendar </span>
					</a>
				</nav>
			</details>
			<div class="w-full h-px bg-slate-500 mx-auto bg-[#E7ECF3]"></div>
			<details
				class="group transition-all duration-150 h-[64px] open:h-44 overflow-hidden">
				<summary
					class="transition-all duration-500 flex cursor-pointer items-center rounded-lg px-4 py-2 md:px-6 md:py-4  hover:bg-gray-100 hover:text-gray-700">


					<span class="ml-3 text-sm md:text-xl"> Teams </span> <span
						class="ml-auto shrink-0 transition duration-300 group-open:-rotate-180">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
							viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd"
								d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
								clip-rule="evenodd" />
            </svg>
					</span>
				</summary>

				<nav class="mt-1.5 ml-8 flex flex-col transition-all duration-500">
					<a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
            </svg> <span class="ml-3 text-sm font-medium"> Banned Users
					</span>
					</a> <a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg> <span class="ml-3 text-sm font-medium"> Calendar </span>
					</a>
				</nav>
			</details>

			<div class="w-full h-px bg-slate-500 mx-auto bg-[#E7ECF3]"></div>
			<details
				class="group transition-all duration-150 h-[64px] open:h-44 overflow-hidden">
				<summary
					class="transition-all duration-500 flex cursor-pointer items-center rounded-lg px-4 py-2 md:px-6 md:py-4  hover:bg-gray-100 hover:text-gray-700">


					<span class="ml-3 text-sm md:text-xl"> Teams </span> <span
						class="ml-auto shrink-0 transition duration-300 group-open:-rotate-180">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
							viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd"
								d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
								clip-rule="evenodd" />
            </svg>
					</span>
				</summary>

				<nav class="mt-1.5 ml-8 flex flex-col transition-all duration-500">
					<a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
            </svg> <span class="ml-3 text-sm font-medium"> Banned Users
					</span>
					</a> <a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg> <span class="ml-3 text-sm font-medium"> Calendar </span>
					</a>
				</nav>
			</details>
			<div class="w-full h-px bg-slate-500 mx-auto bg-[#E7ECF3]"></div>
			<details
				class="group transition-all duration-150 h-[64px] open:h-44 overflow-hidden">
				<summary
					class="transition-all duration-500 flex cursor-pointer items-center rounded-lg px-4 py-2 md:px-6 md:py-4  hover:bg-gray-100 hover:text-gray-700">


					<span class="ml-3 text-sm md:text-xl"> Teams </span> <span
						class="ml-auto shrink-0 transition duration-300 group-open:-rotate-180">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
							viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd"
								d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
								clip-rule="evenodd" />
            </svg>
					</span>
				</summary>

				<nav class="mt-1.5 ml-8 flex flex-col transition-all duration-500">
					<a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
            </svg> <span class="ml-3 text-sm font-medium"> Banned Users
					</span>
					</a> <a href=""
						class="flex items-center rounded-lg px-4 py-2 text-gray-500 hover:bg-gray-100 hover:text-gray-700">
						<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 opacity-75"
							fill="none" viewBox="0 0 24 24" stroke="currentColor"
							stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
								d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg> <span class="ml-3 text-sm font-medium"> Calendar </span>
					</a>
				</nav>
			</details>

		</div>
	</aside>

	<div class="px-4  md:ml-0 md:flex-1 md:pr-0 pt-4">
		<div class="rounded-lg md:hidden my-4">
			<div
				class="bg-white rounded-full flex items-center justify-center p-2">
				<div class="rounded-full shadow px-3 py-2">
					<img alt="arrow" src="./icons/arrow-left.svg" width="12px"
						height="12px" class="">
				</div>
				<p class="truncate ml-3 py-2 font-medium text-[#84878B]">jahsdggggdaksdlakjdhsalkjdhsalkshj</p>
				<div class="w-px h-[25px] bg-slate-500 mx-3"></div>
				<button data-drawer-target="default-sidebar"
					data-drawer-toggle="default-sidebar"
					aria-controls="default-sidebar" type="button"
					class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200">
					<span class="sr-only">Open sidebar</span> <img alt="filter"
						src="./icons/filter.svg" width="24px" height="24px">
				</button>

			</div>
		</div>
		<!-- content -->

		<c:choose>
			<c:when test="${empty flights}">
				<p class="text-center text-gray-500 mt-8">No flights available.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="flight" items="${flights }">
					<details
							class="group select-none transition-all duration-150 h-[230px] md:h-[170px] open:h-[${500 *  fn:length(flight.stopOvers()) + 500}px] overflow-hidden border rounded-lg mb-4 hover:border-blue-400 bg-white">
						<summary
								class="transition-all duration-500 flex cursor-pointer items-center  px-4 py-2 md:px-6 md:py-4 hover:border-blue-400 ">
							<div class="relative flex-1 transition-all duration-150">
								<p class="flex items-center font-medium">
										${flight.departureId()} <span class="mx-2"><img
										alt="arrow" src="./icons/arrow-right.svg"></span>${flight.destinationId()}, <fmt:formatDate value="${flight.departureDate() }" pattern="dd-MM-yyyy" />
								</p>
								<div
										class="py-4 relative flex items-center justify-between md:justify-center md:py-8">
									<p class="flex flex-col font-bold text-center">
											${flight.departureId()}<span class="font-medium text-[#84878B]"><fmt:formatDate value="${flight.departureDate() }" pattern="hh:mm a" /></span>
									</p>
									<div class="relative md:mx-20">
										<svg xmlns="http://www.w3.org/2000/svg" width="157" height="1"
											 class="absolute top-[34px] -right-[48px]" viewBox="0 0 157 1"
											 fill="none">
											<rect x="0.25" y="0.25" width="40.5" height="0.5" stroke="#B1B5C4"
												  stroke-width="0.5" stroke-dasharray="3 3" />
											<rect x="116.25" y="0.25" width="40.5" height="0.5" stroke="#B1B5C4"
												  stroke-width="0.5" stroke-dasharray="3 3" />
										</svg>
										<svg xmlns="http://www.w3.org/2000/svg" width="62" height="36"
											 viewBox="0 0 62 36" fill="none">
											<path
													d="M1.32984 34.4703C0.711309 34.5426 0.149093 34.0999 0.0992895 33.4791C-0.221933 29.4755 0.237724 25.4437 1.45665 21.609C2.78954 17.4158 4.99979 13.5544 7.94045 10.2815C10.8811 7.00856 14.4848 4.39911 18.5119 2.62663C22.5391 0.854155 26.8974 -0.0407465 31.2971 0.00142384C35.6969 0.0435942 40.0372 1.02187 44.0296 2.87121C48.0221 4.72056 51.5751 7.3986 54.4524 10.7273C57.3298 14.056 59.4656 17.9591 60.7179 22.177C61.8631 26.0343 62.2454 30.0742 61.8475 34.071C61.7858 34.6907 61.2152 35.1225 60.5982 35.0383C59.9812 34.9542 59.5515 34.3858 59.6114 33.766C59.9672 30.0865 59.6101 26.3693 58.556 22.8189C57.3948 18.9077 55.4144 15.2886 52.7463 12.2021C50.0783 9.11554 46.7837 6.63232 43.0818 4.91751C39.3798 3.2027 35.3552 2.29559 31.2755 2.25649C27.1958 2.21739 23.1546 3.04719 19.4204 4.69072C15.6862 6.33426 12.3447 8.75387 9.61797 11.7887C6.89124 14.8235 4.84178 18.404 3.60585 22.2922C2.4839 25.8218 2.05568 29.5315 2.3408 33.217C2.38883 33.8379 1.94837 34.3979 1.32984 34.4703Z"
													fill="#FFAF4E" />
										</svg>
										<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
											 class="absolute top-[22px] right-5" viewBox="0 0 23 23"
											 fill="none">
											<path
													d="M20.8566 12.9073C21.2016 12.5669 21.4366 12.1327 21.532 11.6599C21.6274 11.1871 21.5789 10.6968 21.3926 10.2513C21.2062 9.80584 20.8905 9.42511 20.4854 9.15739C20.0802 8.88967 19.6039 8.747 19.1168 8.74747L15.9422 8.74747L13.4962 3.91107C13.4293 3.78409 13.3288 3.67749 13.2054 3.60265C13.082 3.52781 12.9405 3.48754 12.7958 3.48614L10.1182 3.47495C9.9901 3.47568 9.86401 3.50692 9.75063 3.56602C9.63724 3.62511 9.53989 3.71034 9.46677 3.81451C9.39366 3.91867 9.34693 4.03872 9.33054 4.16452C9.31415 4.29031 9.32858 4.41817 9.3726 4.53729L10.9712 8.74747L8.03383 8.74747L7.55368 7.31053C7.50583 7.15143 7.40861 7.01127 7.2758 6.90992C7.14298 6.80856 6.98131 6.75115 6.81368 6.74582L4.79141 6.76818C4.58036 6.7688 4.37814 6.85206 4.22891 6.99977C4.07967 7.14749 3.99556 7.34765 3.99493 7.55654L3.99493 14.8139C3.99556 15.0228 4.07967 15.223 4.22891 15.3707C4.37814 15.5184 4.58036 15.6017 4.79141 15.6023L6.81368 15.6247C6.98237 15.6255 7.147 15.5735 7.28399 15.4761C7.42098 15.3787 7.52329 15.2408 7.57627 15.0823L8.05642 13.6454L10.9938 13.6454L9.39519 17.8556C9.35117 17.9747 9.33675 18.1025 9.35314 18.2283C9.36953 18.3541 9.41625 18.4742 9.48937 18.5783C9.56248 18.6825 9.65984 18.7677 9.77322 18.8268C9.88661 18.8859 10.0127 18.9172 10.1408 18.9179L12.8071 18.9179C12.9518 18.9165 13.0933 18.8762 13.2167 18.8014C13.3401 18.7265 13.4406 18.6199 13.5075 18.493L15.9535 13.6566L19.1168 13.623C19.4403 13.624 19.7607 13.5612 20.0594 13.4384C20.3581 13.3155 20.6291 13.135 20.8566 12.9073ZM19.1111 12.0407L15.4507 12.0407C15.306 12.0421 15.1644 12.0824 15.0411 12.1572C14.9177 12.2321 14.8172 12.3387 14.7503 12.4656L12.31 17.2964L11.2932 17.2964L12.8862 13.0918C12.9314 12.9725 12.9468 12.844 12.9311 12.7174C12.9154 12.5909 12.8689 12.47 12.7958 12.365C12.7219 12.2592 12.6231 12.1729 12.508 12.1135C12.3928 12.0541 12.2647 12.0233 12.1349 12.0239L7.45765 12.0463C7.29063 12.0462 7.12778 12.0979 6.992 12.1942C6.85623 12.2905 6.75435 12.4265 6.70071 12.583L6.21491 13.9809L5.58224 13.9809L5.58789 8.3505L6.21491 8.38963L6.69506 9.82658C6.7487 9.98314 6.85058 10.1191 6.98635 10.2154C7.12213 10.3117 7.28498 10.3634 7.452 10.3633L12.1405 10.3522C12.2698 10.3527 12.3973 10.3221 12.5121 10.2631C12.6268 10.204 12.7253 10.1183 12.7992 10.0133C12.8731 9.90826 12.9201 9.78704 12.9363 9.66005C12.9524 9.53306 12.9371 9.40409 12.8918 9.28423L11.2762 5.05727L12.293 5.05727L14.7333 9.88808C14.8002 10.0151 14.9008 10.1217 15.0241 10.1965C15.1475 10.2713 15.2891 10.3116 15.4338 10.313L19.0942 10.313C19.208 10.3118 19.321 10.333 19.4264 10.3756C19.5319 10.4181 19.6276 10.4811 19.7082 10.5608C19.7887 10.6405 19.8523 10.7353 19.8953 10.8396C19.9382 10.944 19.9597 11.0558 19.9585 11.1685C19.9628 11.2808 19.9429 11.3928 19.9 11.4969C19.8571 11.6011 19.7923 11.6949 19.7099 11.7723C19.6332 11.8543 19.5407 11.9203 19.4379 11.9664C19.3351 12.0124 19.224 12.0377 19.1111 12.0407Z"
													fill="#3B71FE" />
										</svg>

										<p class="text-xs absolute top-2 right-3">${flight.travelHour()}h${flight.travelMinute()}m</p>
										<p class="text-xs absolute top-10 right-2 text-[#B1B5C3]">${fn:length(flight.stopOvers())} stop</p>
									</div>
									<p class="flex flex-col font-bold  text-center">
											${flight.destinationId()}<span
											class="font-medium text-[#84878B]"><fmt:formatDate value="${flight.arrivalDate() }" pattern="hh:mm a" /></span></span>
									</p>

								</div>
								<div class="flex justify-between items-center md:absolute md:w-full md:top-6">
									<img alt="logo" src="${flight.airline().imagePath() }"
										 class="w-20 h-auto">
									<div class="flex flex-col pt-2 pb-6 justify-center items-center gap-2">
										<span class="font-bold text-xl text-[#ff5e1f] select-none">
												<fmt:formatNumber value="${flight.price() * exchangeRate}" /> ${currency }</span>
										<a class="px-6 py-2 bg-[#0194f3] text-white rounded-full" href="flights?id=${flight.id()}">Book Now</a>
									</div>
								</div>
							</div>
						</summary>

						<nav class="flex flex-col transition-all duration-500 rounded-t-lg bg-[#f7f9fa] h-full px-6 py-4 relative">

							<c:forEach var = "stopover" items = "${flight.stopOvers()}">
								<div class="flex flex-col  gap-4 relative">
									<div class="flex gap-12">
										<div>
											<p class="font-semibold">17:20</p>
											<p class="text-sm text-[#687176] font-semibold">09 Nov</p>
										</div>
										<div>
											<p class="font-semibold">TP HCM (SGN)</p>
											<p class="text-sm text-[#687176] font-semibold">Sân bay Tân
												Sơn Nhất</p>
										</div>
									</div>
									<div class="flex gap-12 items-center">
										<p class="text-sm text-[#687176] font-semibold">5h 40m</p>
										<div class="flex flex-col gap-2">
											<p class="font-semibold">17:20</p>
											<p class="text-sm text-[#687176] font-semibold">09 Nov</p>
											<p class="font-semibold">17:20</p>
											<p class="text-sm text-[#687176] font-semibold">09 Nov</p>
											<p class="font-semibold">17:20</p>
											<p class="text-sm text-[#687176] font-semibold">09 Nov</p>
										</div>
									</div>
									<div class="flex gap-12">
										<div>
											<p class="font-semibold">17:20</p>
											<p class="text-sm text-[#687176] font-semibold">09 Nov</p>
										</div>
										<div>
											<p class="font-semibold">TP HCM (SGN)</p>
											<p class="text-sm text-[#687176] font-semibold">Sân bay Tân
												Sơn Nhất</p>
										</div>
									</div>
									<div
											class="absolute left-[58px] top-[10px] h-full items-center flex flex-col">
										<div class="rounded-full bg-white border w-4 h-4 border-blue-400"></div>
										<div class="h-[80%] w-px bg-[#687176]"></div>
										<div class="rounded-full w-4 h-4 bg-blue-400"></div>
									</div>
								</div>
							</c:forEach>
						</nav>
					</details>

				</c:forEach>
			</c:otherwise>
		</c:choose>



	</div>
</div>

