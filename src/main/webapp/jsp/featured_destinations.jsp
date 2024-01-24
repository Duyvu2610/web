<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<div class="container mx-auto px-4 text-[#3B3E44] pb-6 md:w-[75%]">
	<h2 class="text-3xl font-bold text-center md:text-left mb-4">
		${featuredDestinations}
	</h2>
	<p class="text-lg text-center md:text-left mb-6">${featuredDestinationsDescription}</p>

	<div class="grid grid-cols-2 md:grid-cols-4 gap-4">
		<div class="grid gap-4">
			<div>
				<img class="h-64 w-full object-cover rounded-lg"
					 src="./images/NhaTrang.jpg"
					 alt="Nha Trang">
			</div>
			<div>
				<img class="h-64 w-full object-cover rounded-lg"
					 src="./images/NinhBinh.jpg"
					 alt="Ninh Binh">
			</div>
			<div>
				<img class="h-64 w-full object-cover rounded-lg"
					 src="./images/PhuQuoc.jpg"
					 alt="Phu Quoc">
			</div>
		</div>
		<div class="grid gap-4">
			<div>
				<img class="h-full w-full object-cover rounded-lg"
					 src="./images/PhuYen.jpg"
					 alt="Phu Yen">
			</div>
			<div>
				<img class="h-full w-full object-cover rounded-lg"
					 src="./images/sg.jpg"
					 alt="Sapa">
			</div>

		</div>
		<div class="grid gap-4">
			<div>
				<img class="h-64 w-full object-cover rounded-lg"
					 src="./images/DaLat.jpg"
					 alt="Da Lat">
			</div>
			<div>
				<img class="h-64 w-full object-cover rounded-lg"
					 src="./images/thuysi.svg"
					 alt="Thuy Si">
			</div>
			<div>
				<img class="h-64 w-full object-cover rounded-lg"
					 src="./images/hn.jpg"
					 alt="Ha Noi">
			</div>
		</div>
		<div class="grid gap-4">
			<div>
				<img class="h-full w-full object-cover rounded-lg"
					 src="./images/HaGiang.jpg"
					 alt="Ha Giang">
			</div>
			<div>
				<img class="h-full w-full object-cover rounded-lg"
					 src="./images/PhuYen.jpg"
					 alt="./images/PhuYen.jpg">
			</div>

		</div>
	</div>
</div>
