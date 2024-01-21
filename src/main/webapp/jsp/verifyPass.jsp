<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
/*remove custom style*/
.circles {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.circles li {
	position: absolute;
	display: block;
	list-style: none;
	width: 20px;
	height: 20px;
	background: rgba(255, 255, 255, 0.2);
	animation: animate 25s linear infinite;
	bottom: -150px;
}

.circles li:nth-child(1) {
	left: 25%;
	width: 80px;
	height: 80px;
	animation-delay: 0s;
}

.circles li:nth-child(2) {
	left: 10%;
	width: 20px;
	height: 20px;
	animation-delay: 2s;
	animation-duration: 12s;
}

.circles li:nth-child(3) {
	left: 70%;
	width: 20px;
	height: 20px;
	animation-delay: 4s;
}

.circles li:nth-child(4) {
	left: 40%;
	width: 60px;
	height: 60px;
	animation-delay: 0s;
	animation-duration: 18s;
}

.circles li:nth-child(5) {
	left: 65%;
	width: 20px;
	height: 20px;
	animation-delay: 0s;
}

.circles li:nth-child(6) {
	left: 75%;
	width: 110px;
	height: 110px;
	animation-delay: 3s;
}

.circles li:nth-child(7) {
	left: 35%;
	width: 150px;
	height: 150px;
	animation-delay: 7s;
}

.circles li:nth-child(8) {
	left: 50%;
	width: 25px;
	height: 25px;
	animation-delay: 15s;
	animation-duration: 45s;
}

.circles li:nth-child(9) {
	left: 20%;
	width: 15px;
	height: 15px;
	animation-delay: 2s;
	animation-duration: 35s;
}

.circles li:nth-child(10) {
	left: 85%;
	width: 150px;
	height: 150px;
	animation-delay: 0s;
	animation-duration: 11s;
}

@
keyframes animate { 0%{
	transform: translateY(0) rotate(0deg);
	opacity: 1;
	border-radius: 0;
}

100


%
{
transform


:


translateY
(


-1000px


)


rotate
(


720deg


)
;


opacity


:


0
;


border-radius


:


50
%;


}
}
.triangle {
	border-top: 60rem solid #fff;
	border-left: 25rem solid transparent;
}
.body {
	font-family: 'Plus Jakarta Sans', sans-serif;
}

input:not(:placeholder-shown) {
	border: 1 solid;
	border-color: #60a5fa;
}
</style>
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<c:import url="forgotPass.jsp" />
<div
	class="top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 justify-center items-center fixed z-50 w-full h-screen " id ="verify">
	<div class="bg-[#03121a] opacity-50 w-full h-full"></div>
	<div
		class="bg-white rounded-xl border shadow p-4 sm:p-8 mx-4 max-w-sm fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">
		<div class = "flex justify-between items-center">
			<svg class="w-6 h-6 mb-4" xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 24 24">
      <path
				d="M1.94631 9.31555C1.42377 9.14137 1.41965 8.86034 1.95706 8.6812L21.0433 2.31913C21.5717 2.14297 21.8748 2.43878 21.7268 2.95706L16.2736 22.0433C16.1226 22.5718 15.8179 22.5901 15.5946 22.0877L12.0002 14.0002L18.0002 6.00017L10.0002 12.0002L1.94631 9.31555Z">
      </path>
    </svg>
		<button onclick="hideLoginModel(event)">
			<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
				xmlns="http://www.w3.org/2000/svg" data-id="IcSystemCrossClose">
					<path d="M6 6L18 18M6 18L18 6" stroke="#687176" stroke-width="2"
					stroke-linecap="round" stroke-linejoin="round"></path></svg>
		</button>
		</div>
		<h1 class="font-bold text-2xl text-gray-800 mb-1">Check your
			email</h1>
		<p class="text-sm font-medium text-gray-600">We've sent a code to
			${emailUser }</p>
		<div class="mt-6">

		</div>
		<small class="text-center block text-xs text-gray-600 font-medium">Didn't
			get a code? <a href=""
			class="underline font-semibold text-gray-900 hover:text-blue-600">Click
				to resend</a>
		</small>
	</div>
</div>
<script>
	function hideLoginModel(event) {
		event.stopPropagation();
		var loginModel = document.getElementById("verify");
		loginModel.style.display = "none";
	}
</script>
	<!-- component -->

	<div class="relative min-h-screen flex ">
		<div
			class="flex flex-col sm:flex-row items-center md:items-start sm:justify-center md:justify-start flex-auto min-w-0 bg-white">
			<div
				class="sm:w-1/2 xl:w-2/5 h-full hidden md:flex flex-auto items-center justify-start p-10 overflow-hidden bg-purple-900 text-white bg-no-repeat bg-cover relative bg-right-bottom"
				style="background-image: url(./images/airplane-background.svg);">
				<div
					class="absolute bg-gradient-to-b from-blue-900 to-gray-900 opacity-75 inset-0 z-0"></div>
				<div class="absolute triangle  min-h-screen right-0 w-16" style=""></div>
				<a href="/BookTickets" title="codepen aji"
					class="z-50 flex absolute top-5 text-center text-gray-100 focus:outline-none"><img
					src="./images/logo.svg" alt="aji"
					class="object-cover mx-auto w-8 h-8 w-10 h-10">
					<p class="text-xl ml-3">
						aji<strong>mon</strong>
					</p> </a> <img src="./images/airplane.webp"
					class="h-96 absolute -right-8 mr-5">
				<div class="w-full  max-w-md z-10">
					<div class="sm:text-4xl xl:text-5xl font-bold leading-tight mb-6">VTTrip</div>
					<div class="sm:text-sm xl:text-md text-gray-200 font-normal">
						${descriptionSignUp}</div>
				</div>
				<!---remove custom style-->
				<ul class="circles ">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div
				class="md:flex md:items-center md:justify-center w-full sm:w-auto md:h-full w-2/5 xl:w-2/5 p-8  md:p-10 lg:p-14 sm:rounded-lg md:rounded-none bg-white "
				id="signinSection">
				<div class="max-w-md w-full space-y-8">
					<div class="text-center">
						<h2 class="mt-6 text-3xl font-bold text-gray-900">${signin }</h2>

					</div>
					<div class="flex flex-row justify-center items-center space-x-3">
						<a
							href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/BookTickets/oauth2callback&response_type=code&client_id=251807274105-g8c3hjtmil4smff6lvga0s1bejqjabdn.apps.googleusercontent.com&approval_prompt=force&access_type=online"
							class="w-11 h-11 items-center justify-center inline-flex rounded-2xl
							 font-semibold hover:shadow-lg cursor-pointer transition 
							 ease-in duration-300 flex-1  border">
							<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 48 48" class="w-4 h-4 mr-2">
						<g>
						<path fill="#EA4335"
									d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
						<path fill="#4285F4"
									d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
						<path fill="#FBBC05"
									d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
						<path fill="#34A853"
									d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
						<path fill="none" d="M0 0h48v48H0z"></path></g></svg>
							<p>${signFb }</p>
						</a>
					</div>
					<div class="flex items-center justify-center space-x-2">
						<span class="h-px w-16 bg-gray-200"></span> <span
							class="text-gray-300 font-normal">${orContinute }</span> <span
							class="h-px w-16 bg-gray-200"></span>
					</div>
					<!-- form -->
					<form class="space-y-4 md:space-y-6" action="login" method="post">
						<div>
							<label for="email"
								class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">${email }</label>
							<input type="email" placeholder="abc@gmail.com"
								class="mt-1 block w-full px-3 py-2  border border-slate-300 rounded-md text-sm shadow-sm placeholder-slate-400
	      focus:outline-none focus:border-[#316BFF] focus:ring-1 focus:ring-[#316BFF] bg-gray-50
	    "
								name="email" />
						</div>
						<div>
							<label for="password"
								class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">${password }</label>
							<input type="password" placeholder="************"
								class="mt-1 block w-full px-3 py-2  border border-slate-300 rounded-md text-sm shadow-sm placeholder-slate-400
	      focus:outline-none focus:border-[#316BFF] focus:ring-1 focus:ring-[#316BFF] bg-gray-50
	    "
								name="pw" />
						</div>
						<div class="flex items-center justify-between">
							<div class="flex items-start">
								<div class="flex items-center h-5">
									<input id="remember" aria-describedby="remember"
										type="checkbox"
										class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800"
										required>
								</div>
								<div class="ml-3 text-sm">
									<label for="remember" class="text-gray-500 dark:text-gray-300">${rememberMe }</label>
								</div>
							</div>
							<button onclick="showLoginModel(event)"
								class="text-sm font-medium text-[#316BFF] hover:underline dark:text-primary-500">${forgotPassword }?</button>
						</div>
						<button type="submit"
							class="w-full text-white bg-[#316BFF] hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-[#316BFF] dark:hover:bg-primary-700 dark:focus:ring-primary-800">${signin }</button>
						<p class="text-sm font-light text-gray-500 dark:text-gray-400">
							${dontHaveAccount }? <a
								class="font-medium text-[#316BFF] hover:underline dark:text-primary-500"
								href="register">${signup }</a>
						</p>
					</form>
				</div>
			</div>

		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
		const status = document.getElementById("status").value;
		console.log(status);
		setTimeout(() => {
			if (status == "failed") {
				
					Swal.fire({
					    title: 'Sign in failed',
					    icon: 'error',
					    text: 'Please sign in again',
					    confirmButtonText: 'OK',
					})
				
			}
		}, 0);
		function showLoginModel(event) {
			event.preventDefault(); 
			var loginModel = document.getElementById("loginModel");
			loginModel.style.display = "flex";
		}
	</script>
</body>
</html>
