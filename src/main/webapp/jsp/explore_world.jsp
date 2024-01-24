<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="px-4 text-[#3B3E44] pb-8 pt-12 bg-[#FBFBFB]" style="background-image: url('./images/bg1.webp'); object-fit: contain">
	<div class = " md:w-[75%] mx-auto">
		<h2 class="font-bold text-xl py-6">${title}</h2>
		<div class="flex gap-4 justify-between">
			<div class="flex-1 border rounded shadow flex bg-white justify-start items-center text-sm font-medium p-4 gap-2 hover:scale-105 transition-all duration-500">
				<img src="./images/balo.webp" alt="" class="w-[64px] h-[64px] object-cover block">
				<div class="">
					<p class="font-bold py-2">${why1}</p>
					<p>${reason1}</p>
				</div>
			</div>
			<div class="flex-1 border rounded shadow flex bg-white justify-start items-center text-sm font-medium p-4 gap-2 hover:scale-105 transition-all duration-500">
				<img src="./images/todo.webp" alt="" class="w-[64px] h-[64px] object-cover block">
				<div class="">
					<p class="font-bold py-2">${why2}</p>
					<p>${reason2}</p>
				</div>
			</div>
			<div class="flex-1 border rounded shadow flex bg-white justify-start items-center text-sm font-medium p-4 gap-2 hover:scale-105 transition-all duration-500">
				<img src="./images/khieng.webp" alt="" class="w-[64px] h-[64px] object-cover block">
				<div class="">
					<p class="font-bold py-2">${why3}</p>
					<p>${reason3}</p>
				</div>
			</div>
		</div>
	</div>
</div>