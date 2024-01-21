<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="mt-[88px]">
	<div class="bg-right h-[560px] w-full relative md:bg-cover"
		style="background-image: url(./images/bg.webp); background-repeat: no-repeat;">

		<div
			class="pt-[42px] md:pt-[100px] md:pl-[133px] pl-[33px] text-[#FCFCFD] font-bold absolute ">
			<p class="text-4xl md:text-6xl  mb-3">
				Amazing Flight
			</p>
			<p class = "text-4xl md:text-6xl">To Switzerland</p>
			<p class="text-lg pt-3 md:pt-6 md:text-3xl">Find and book a great
				experience</p>
		</div>
		<jsp:include page="search-bar.jsp" />
		<div class="flex absolute top-[500px] left-1/2 -translate-x-1/2 text-white gap-3 items-center">
			<i>Justed by</i>
			<div class="flex items-center gap-4">
				<img src="./images/VNAirline.webp" alt="" class="w-[60px] h-auto object-cover block">
				<img src="./images/VJAirline.png" alt="" class="w-[80px] h-auto object-cover block">
				<img src="./images/PacificAirline.webp" alt="" class="w-[60px] h-auto object-cover block">
				<img src="./images/PhiAirline.webp" alt="" class="w-[80px] h-auto object-cover block">
			</div>
		</div>
	</div>
</div>

</body>