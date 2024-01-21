<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<div class="px-4 text-[#3B3E44] py-8 bg-[#F5F5F5]">
	<div class="w-[75%] mx-auto">
		<h2 class="text-2xl font-bold my-6">${trendingCities }</h2>
		<div class="grid grid-cols-3 grid-rows-2 h-[400px] gap-4">
			<a href="#" class="block rounded w-full h-full rounded-lg relative">
				<img src="./images/vn.webp" alt="" class="w-full h-full object-cover rounded-lg">
				<div class="absolute top-4 left-4">
					<p class="font-semibold text-white text-xl">Việt Nam</p>
				</div>
			</a>
			<a href="#" class="block rounded w-full h-full rounded-lg relative">
				<img src="./images/thailan.webp" alt="" class="w-full h-full object-cover rounded-lg">
				<div class="absolute top-4 left-4">
					<p class="font-semibold text-white text-xl">Thailand</p>
				</div>
			</a>
			<a href="#" class="block rounded w-full h-full rounded-lg relative">
				<img src="./images/singapo.webp" alt="" class="w-full h-full object-cover rounded-lg">
				<div class="absolute top-4 left-4">
					<p class="font-semibold text-white text-xl">Singapore</p>
				</div>
			</a>
			<a href="#" class="block rounded w-full h-full rounded-lg relative">
				<img src="./images/malai.webp" alt="" class="w-full h-full object-cover rounded-lg">
				<div class="absolute top-4 left-4">
					<p class="font-semibold text-white text-xl">Malaysia</p>
				</div>
			</a>
			<a href="#" class="block rounded w-full h-full rounded-lg relative">
				<img src="./images/indo.webp" alt="" class="w-full h-full object-cover rounded-lg">
				<div class="absolute top-4 left-4">
					<p class="font-semibold text-white text-xl">Indonesia</p>
				</div>
			</a>
			<a href="#" class="block rounded w-full h-full rounded-lg relative">
				<img src="./images/hanquoc.webp" alt="" class="w-full h-full object-cover rounded-lg">
				<div class="absolute top-4 left-4">
					<p class="font-semibold text-white text-xl">Korea</p>
				</div>
			</a>
		</div>
	</div>
	
</div>