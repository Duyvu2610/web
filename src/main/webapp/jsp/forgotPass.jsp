<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<div
	class="fixed z-[100000] top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full h-screen justify-center items-center hidden"
	id="loginModel">
	<div class="bg-[#03121a] opacity-50 w-full h-full"></div>
	<div class="bg-white opacity-100 fixed p-4 rounded w-[400px] top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
		<form novalidate class="group" action="RegisterServlet" method="post">
			<div class="flex justify-between items-center border-b pb-2">
				<h1 class="font-bold text-xl">Tìm tài khoản của bạn</h1>
			
			</div>
			<div class="my-2 border-b pb-2">
				<p>Vui lòng nhập email hoặc số di động để tìm kiếm tài khoản của bạn.</p>
				<label for="email"
					class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
					<span>${email }</span>
					<input type="email" name="email" placeholder="abc@gmail.com"
					class="mt-1 block w-full px-3 py-2  border border-slate-300 rounded-md text-sm shadow-sm placeholder-slate-400
	      focus:outline-none focus:border-[#316BFF] focus:ring-1 focus:ring-[#316BFF] bg-gray-50
	      invalid:[&:not(:placeholder-shown):not(:focus)]:border-red-500 peer
	    "
					required pattern=".*[a-zA-Z]+.*" name="email" /> <span
					class="mt-2 hidden text-sm text-red-500 peer-[&:not(:placeholder-shown):not(:focus):invalid]:block">
						Please enter a valid email address </span>
				</label>
			</div>
			<div class = "flex justify-end gap-4">
				<button onclick="hideLoginModel(event)"
				class="bg-[#f2f3f3] hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Huy
				</button>
				<button type="submit"
				class="text-white bg-[#FF5E1F] hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center group-invalid:pointer-events-none group-invalid:text-[#cdd0d1] group-invalid:bg-[#f2f3f3]">Dang
				nhap</button>
			</div>
		</form>
	</div>
</div>
<script>
	function hideLoginModel(event) {
		event.preventDefault(); 
		var loginModel = document.getElementById("loginModel");
		loginModel.style.display = "none";
	}
</script>
