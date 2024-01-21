<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="px-4 py-6 mt-[88px] md:w-[800px] md:ml-36">

	<div class="md:w-[70%]">
		<p class="pb-4 border-b font-bold text-lg md:text-2xl md:pb-8">${confirmYourBook }</p>
		<div>
			<p class="py-4 font-bold text-lg">${yourTour }</p>
			<div
				class="bg-[#F4F4F6] rounded-xl flex justify-between px-4 py-2 mb-4">
				<div>
					<p class="font-semibold text-lg">${customerName }</p>
					<p class="text-[#84878B]">${userDetail.name()}</p>
				</div>
			</div>
			<div
				class="bg-[#F4F4F6] rounded-xl flex justify-between px-4 py-2 mb-4">
				<div>
					<p class="font-semibold text-lg">${customerNumPhone }</p>
					<p class="text-[#84878B]">${userDetail.phone()}</p>
				</div>
			</div>
		</div>
	</div>
	<div
		class="rounded-xl border px-4 py-6 md:absolute md:w-[335px] md:top-52 bg-white md:right-24">
		<div class="flex items-center">
			<p class="font-bold text-lg">${flight.departureId() }</p>
			<svg xmlns="http://www.w3.org/2000/svg" width="130" height="29"
				viewBox="0 0 130 29" fill="none" class="mx-4">
	<ellipse cx="2.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="91.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="20.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="109.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="11.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="100.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="29.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="118.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="38.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<ellipse cx="127.5" cy="14.9245" rx="2.5" ry="2.47451" fill="#BCBCBC" />
	<path
					d="M76.1073 16.7294C76.5391 16.3032 76.8333 15.7598 76.9528 15.1679C77.0722 14.576 77.0115 13.9624 76.7782 13.4047C76.545 12.847 76.1497 12.3704 75.6426 12.0353C75.1355 11.7002 74.5392 11.5216 73.9294 11.5222L69.9555 11.5222L66.8937 5.46806C66.8099 5.30912 66.6841 5.17567 66.5297 5.08199C66.3753 4.98831 66.198 4.93789 66.0169 4.93614L62.6652 4.92214C62.5048 4.92306 62.347 4.96215 62.2051 5.03613C62.0631 5.11011 61.9413 5.2168 61.8497 5.34719C61.7582 5.47758 61.6997 5.62786 61.6792 5.78533C61.6587 5.94279 61.6767 6.10284 61.7318 6.25195L63.733 11.5222L60.056 11.5222L59.455 9.72344C59.3951 9.52428 59.2734 9.34884 59.1071 9.22196C58.9409 9.09509 58.7385 9.02322 58.5287 9.01654L55.9972 9.04454C55.733 9.04532 55.4799 9.14954 55.2931 9.33444C55.1063 9.51935 55.001 9.7699 55.0002 10.0314L55.0002 19.1161C55.001 19.3776 55.1063 19.6281 55.2931 19.813C55.4799 19.9979 55.733 20.1021 55.9972 20.1029L58.5287 20.1309C58.7398 20.132 58.9459 20.0669 59.1174 19.9449C59.2888 19.823 59.4169 19.6504 59.4832 19.452L60.0843 17.6533L63.7612 17.6533L61.7601 22.9235C61.705 23.0726 61.687 23.2327 61.7075 23.3901C61.728 23.5476 61.7865 23.6979 61.878 23.8283C61.9695 23.9587 62.0914 24.0653 62.2333 24.1393C62.3753 24.2133 62.5331 24.2524 62.6935 24.2533L66.0311 24.2533C66.2122 24.2516 66.3894 24.2011 66.5438 24.1075C66.6983 24.0138 66.8241 23.8803 66.9079 23.7214L69.9696 17.6673L73.9294 17.6253C74.3344 17.6265 74.7355 17.548 75.1094 17.3941C75.4833 17.2403 75.8226 17.0144 76.1073 16.7294ZM73.9224 15.6446L69.3403 15.6446C69.1592 15.6463 68.982 15.6967 68.8275 15.7904C68.6731 15.8841 68.5473 16.0175 68.4635 16.1765L65.4088 22.2236L64.136 22.2236L66.13 16.9604C66.1867 16.8109 66.206 16.6501 66.1863 16.4917C66.1666 16.3333 66.1085 16.1819 66.0169 16.0505C65.9245 15.9181 65.8008 15.8101 65.6566 15.7357C65.5125 15.6613 65.3522 15.6228 65.1896 15.6236L59.3348 15.6516C59.1257 15.6515 58.9218 15.7162 58.7519 15.8367C58.5819 15.9573 58.4544 16.1275 58.3872 16.3235L57.7791 18.0732L56.9872 18.0732L56.9942 11.0252L57.7791 11.0742L58.3802 12.873C58.4473 13.069 58.5748 13.2392 58.7448 13.3597C58.9148 13.4802 59.1186 13.545 59.3277 13.5449L65.1967 13.5309C65.3585 13.5315 65.5181 13.4932 65.6618 13.4194C65.8054 13.3455 65.9287 13.2382 66.0212 13.1067C66.1137 12.9752 66.1726 12.8235 66.1928 12.6645C66.213 12.5056 66.1939 12.3441 66.1371 12.1941L64.1148 6.90285L65.3876 6.90285L68.4423 12.95C68.5261 13.1089 68.6519 13.2424 68.8063 13.336C68.9607 13.4297 69.138 13.4801 69.3191 13.4819L73.9012 13.4819C74.0437 13.4803 74.1851 13.5069 74.317 13.5602C74.449 13.6135 74.5689 13.6923 74.6697 13.792C74.7705 13.8918 74.8501 14.0105 74.9039 14.1411C74.9577 14.2717 74.9846 14.4117 74.983 14.5527C74.9884 14.6934 74.9635 14.8336 74.9098 14.9639C74.8562 15.0942 74.7751 15.2118 74.6719 15.3086C74.5759 15.4112 74.4601 15.4938 74.3314 15.5515C74.2027 15.6092 74.0636 15.6409 73.9224 15.6446Z"
					fill="#3B71FE" />
	</svg>
			<p class="font-bold text-lg">${flight.destinationId() }</p>
		</div>
		<div class="flex items-center my-2">
			<svg class="w-4 h-4 text-yellow-300 mr-1" aria-hidden="true"
				xmlns="http://www.w3.org/2000/svg" fill="currentColor"
				viewBox="0 0 22 20">
        <path
					d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z" />
    </svg>
			<p class="ml-2 text-sm font-bold text-gray-900 dark:text-white">
				${flight.travelHour()} ${hrs } ${flight.travelMinute()} ${mins }
			</p>
		</div>
		<img alt="img" src="./images/airplane-background.svg"
			class="rounded-xl my-4">
		<div class="flex justify-between py-6">
			<div>
				<p class="text-[#84878B]">${checkin }</p>
				<p class="font-semibold text-lg">
					<fmt:formatDate value="${flight.departureDate() }"
						pattern="MMM dd, yyyy" />
				</p>
			</div>
			<div>
				<p class="text-[#84878B]">${checkout }</p>
				<p class="font-semibold text-lg">
					<fmt:formatDate value="${flight.arrivalDate() }"
						pattern="MMM dd, yyyy" />
				</p>
			</div>
		</div>
		<div>
			<p class="text-[#84878B]">${ticketClass }</p>
			<p class="font-semibold text-lg">${ticketEconomy }/${ticketBussiness }</p>
		</div>
		<div class="flex flex-col gap-4 mt-4">
			<p class="text-lg font-bold">${payment }</p>
			<div class="flex justify-between">
				<p class="text-[#777E90]">${price }</p>
				<p class="text-[#23262F] font-semibold">
					<fmt:formatNumber value="${flight.price() * exchangeRate}" /> ${currency }
				</p>
			</div>
			<div class="flex justify-between">
				<p class="text-[#777E90]">${tax }</p>
				<p class="text-[#23262F] font-semibold">
					<fmt:formatNumber value="${(flight.price() * exchangeRate) * 0.1}" /> ${currency }
				</p>
			</div>
			<div class="flex justify-between">
				<p class="text-[#777E90]">${serviceFee }</p>
				<p class="text-[#23262F] font-semibold">
					<fmt:formatNumber value="${(flight.price() * exchangeRate) * 0.05}" /> ${currency }
				</p>
			</div>
		</div>
		<div
			class="flex justify-between bg-[#F4F5F6] rounded-lg -mx-2 p-2 my-2">
			<p class="text-[#23262F] font-semibold">${total }</p>
			<p class="text-[#23262F] font-semibold">
				<fmt:formatNumber value="${(flight.price() * exchangeRate) * 1.15}" /> ${currency }
			</p>
		</div>
	</div>
	<div>
		<p class="pb-4 font-bold text-lg py-4">${creditCard }</p>
		<div class="flex border-b pb-4 gap-4 mb-4 w-fit">
			<div class="border rounded-xl relative px-5 py-2">
				<img alt="master" src="./images/master-card.png">
			</div>
			<div class="border rounded-xl relative px-5 py-2 items-center flex">
				<img alt="master" src="./images/visa.png">
			</div>
		</div>
		<!-- credit -->
		<!-- component -->
		<div class="flex justify-center items-center">
			<div class="flex flex-col gap-8 md:flex-row">
				<div
					class="h-56 m-auto bg-red-100 rounded-xl relative text-white shadow-2xl transition-transform transform hover:scale-110">

					<img class="relative object-cover w-full h-full rounded-xl"
						src="https://i.imgur.com/kGkSg1v.png">

					<div class="w-full px-8 absolute top-8">
						<div class="flex justify-between">
							<div class="">
								<p class="font-light">Name
								</h1>
								<p class="font-medium tracking-widest">Karthik P</p>
							</div>
							<img class="w-14 h-14" src="https://i.imgur.com/bbPHJVe.png" />
						</div>
						<div class="pt-1">
							<p class="font-light">Card Number
							</h1>
							<p class="font-medium tracking-more-wider">4642 3489 9867
								7632</p>
						</div>
						<div class="pt-6 pr-6">
							<div class="flex justify-between">
								<div class="">
									<p class="font-light text-xs">Valid
									</h1>
									<p class="font-medium tracking-wider text-sm">11/15</p>
								</div>
								<div class="">
									<p class="font-light text-xs text-xs">Expiry
									</h1>
									<p class="font-medium tracking-wider text-sm">03/25</p>
								</div>

								<div class="">
									<p class="font-light text-xs">CVV
									</h1>
									<p class="font-bold tracking-more-wider text-sm">���</p>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div
					class="h-56 bg-red-100 rounded-xl relative text-white shadow-2xl transition-transform transform hover:scale-110">

					<img class="relative object-cover w-full h-full rounded-xl"
						src="https://i.imgur.com/Zi6v09P.png">

					<div class="w-full px-8 absolute top-8">
						<div class="flex justify-between">
							<div class="">
								<p class="font-light">Name
								</h1>
								<p class="font-medium tracking-widest">Karthik P</p>
							</div>
							<img class="w-14 h-14" src="https://i.imgur.com/bbPHJVe.png" />
						</div>
						<div class="pt-1">
							<p class="font-light">Card Number
							</h1>
							<p class="font-medium tracking-more-wider">4642 3489 9867
								7632</p>
						</div>
						<div class="pt-6 pr-6">
							<div class="flex justify-between">
								<div class="">
									<p class="font-light text-xs">Valid
									</h1>
									<p class="font-medium tracking-wider text-sm">11/15</p>
								</div>
								<div class="">
									<p class="font-light text-xs text-xs">Expiry
									</h1>
									<p class="font-medium tracking-wider text-sm">03/25</p>
								</div>

								<div class="">
									<p class="font-light text-xs">CVV
									</h1>
									<p class="font-bold tracking-more-wider text-sm">���</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- form -->
		<div class="w-full max-w-lg mt-8">
			<div class=" rounded-lg">
				<form action="confirm?status=true" method="post">
					<div class="">
						<div class="">
							<label for="card-number"
								class="block text-sm font-medium text-gray-700 mb-2">${cardNumber }</label>
							<input type="text" name="card-number" id="card-number"
								placeholder="0000 0000 0000 0000"
								class="w-full py-3 px-4 border border-gray-400 rounded-lg focus:outline-none focus:border-blue-500">
						</div>
						<div class="grid grid-cols-2 gap-4 mt-4">
							<div class="">
								<label for="expiration-date"
									class="block text-sm font-medium text-gray-700 mb-2">${expirationDate }</label>
								<input type="text" name="expiration-date" id="expiration-date"
									placeholder="MM / YY"
									class="w-full py-3 px-4 border border-gray-400 rounded-lg focus:outline-none focus:border-blue-500">
							</div>
							<div class="">
								<label for="cvv"
									class="block text-sm font-medium text-gray-700 mb-2">CVV</label>
								<input type="text" name="cvv" id="cvv" placeholder="000"
									class="w-full py-3 px-4 border border-gray-400 rounded-lg focus:outline-none focus:border-blue-500">
							</div>
						</div>
					</div>
					<div class="mt-8">
						<button type="submit"
							class="bg-[#3B71FE] px-4 hover:bg-blue-600 text-white font-medium py-3 rounded-lg focus:outline-none">${confirmAndReverse }</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>