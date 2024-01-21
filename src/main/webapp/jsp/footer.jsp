<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="text-white mb-8 bg-[#316BFF] p-4 relative
	 rounded-xl md:w-[75%] md:mx-auto flex flex-col md:flex-row  md:p-10 md:gap-6 md:items-end md:mt-4 mx-2">
	 <div class = "absolute left-1/3 -bottom-5 hidden md:block">
	 	<svg xmlns="http://www.w3.org/2000/svg" width="161" height="108" viewBox="0 0 161 108" fill="none">
			<path d="M121.158 176.337C142.192 159.849 155.998 135.915 159.538 109.8C163.079 83.6852 156.065 57.5286 140.039 37.0845C124.013 16.6404 100.288 3.58345 74.0831 0.786001C47.8781 -2.01145 21.3399 5.67978 0.306528 22.1677L23.4344 51.6715C36.4173 41.4943 52.7981 36.7469 68.9732 38.4736C85.1483 40.2003 99.7926 48.2598 109.685 60.879C119.577 73.4982 123.906 89.6434 121.721 105.763C119.535 121.882 111.014 136.656 98.0307 146.833L121.158 176.337Z" fill="white" fill-opacity="0.42"/>
		</svg>
	 </div>
	 <div class = "absolute left-0 -top-5 rotate-180 hidden md:block">
	 	<svg xmlns="http://www.w3.org/2000/svg" width="161" height="108" viewBox="0 0 161 108" fill="none">
			<path d="M121.158 176.337C142.192 159.849 155.998 135.915 159.538 109.8C163.079 83.6852 156.065 57.5286 140.039 37.0845C124.013 16.6404 100.288 3.58345 74.0831 0.786001C47.8781 -2.01145 21.3399 5.67978 0.306528 22.1677L23.4344 51.6715C36.4173 41.4943 52.7981 36.7469 68.9732 38.4736C85.1483 40.2003 99.7926 48.2598 109.685 60.879C119.577 73.4982 123.906 89.6434 121.721 105.763C119.535 121.882 111.014 136.656 98.0307 146.833L121.158 176.337Z" fill="white" fill-opacity="0.42"/>
		</svg>
	 </div>
	<div class="md:w-1/2">
		<p class="font-bold text-xl md:text-4xl">${getOurProOffers }</p>
		<p class="my-3 text-[#FCFCFD] md:text-xl">${createAVisual }</p>
	</div>
	<div class="p-3 flex bg-white rounded-lg md:flex-1 md:h-[80px]">
		<input placeholder=${typeYourEmail }
			class="focus:outline-none text-black flex-1 ">
		<button class="bg-[#353945] px-5 py-4 rounded-lg ">${subscribe }</button>
	</div>
</div>
<div
	class="px-4 py-6 flex flex-col gap-6 md:flex-row md:items-start md:mt-4 border-t md:mt-6">
	<div class="flex items-center md:flex-1">
		<a href="#"><img alt="logo" src="./images/logo.svg"
			class="pr-2 md:w-10 md:h-9"></a> <span
			class="font-bold text-[#222529] md:text-xl">VTTrip</span>
	</div>
	<div class="border-b flex flex-col gap-2  pb-4 md:flex-1 md:border-0">
		<p class="font-bold text-lg">${services }</p>
		<p>${travelBooking }</p>
		<p>${flightBooking }</p>
		<p>${hotel }</p>
	</div>
	<div class="border-b flex flex-col gap-2  pb-4 md:flex-1 md:border-0">
		<p class="font-bold text-lg">${support }</p>
		<p>${account }</p>
		<p>${pickAirport }</p>
		<p>${contact }</p>
		<p>${term }</p>
		<p>${privacy }</p>
	</div>
	<div class="flex flex-col gap-2  pb-4 md:flex-1">
		<p class="font-bold text-lg">${business }</p>
		<p>${success }</p>
		<p>${about }</p>
		<p>${blog }</p>
		<p>${information }</p>
	</div>
</div>