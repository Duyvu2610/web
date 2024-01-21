<%--
  Created by IntelliJ IDEA.
  User: Dyland
  Date: 1/11/2024
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class=" bg-[#FAFAFB]">
    <input type="hidden" id="updateUser" value="${updateUser}">
    <c:import url="Header.jsp" />
    <div class="relative top-[200px] w-[80%] mx-auto h-screen mb-[150px]">
      <!-- Scrum -->
      <nav class="flex mb-16 hidden md:block md:absolute md:top-[-80px] md:left-0 md:text-white"  aria-label="Breadcrumb">
          <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center text-black">
                <a href="${pageContext.servletContext.contextPath}" class="inline-flex items-center text-sm font-medium hover:text-blue-600">
                <svg class="w-3 h-3 mr-2.5" aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                  viewBox="0 0 20 20">
              <path
                    d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z" />
            </svg> Home
            </a></li>
            <li aria-current="page">
              <div class="flex items-center">
                <svg class="w-3 h-3 text-gray-400 mx-1" aria-hidden="true"
                  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round"
                    stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4" />
            </svg>
                <span
                  class="ml-1 text-sm font-medium md:ml-2 text-[#B1B5C3]">Profile</span>
              </div>
            </li>
          </ol>
      </nav>
      <div class="flex gap-8">
        <div class="w-[25%]">
          <div class="">
            <div class="bg-white shadow-xl rounded-lg py-3">
                <div class="photo-wrapper p-2">
                    <img class="w-32 h-32 rounded-full mx-auto" src="https://www.gravatar.com/avatar/2acfb745ecf9d4dccb3364752d17f65f?s=260&d=mp" alt="John Doe">
                </div>
                <div class="p-2">
                    <h3 class="text-center text-xl text-gray-900 font-medium leading-8">${userDetail == null ? "":userDetail.name()}</h3>
                    <div class="text-center text-gray-400 text-xs font-semibold">
                        <p>Web Developer</p>
                    </div>
                    <table class="text-xs my-3">
                        <tbody><tr>
                            <td class="px-2 py-2 text-gray-500 font-semibold">Address</td>
                            <td class="px-2 py-2">${userDetail == null ? "":userDetail.address()}</td>
                        </tr>
                        <tr>
                            <td class="px-2 py-2 text-gray-500 font-semibold">Phone</td>
                            <td class="px-2 py-2">${userDetail == null ? "":userDetail.phone()}</td>
                        </tr>
                        <tr>
                            <td class="px-2 py-2 text-gray-500 font-semibold">Email</td>
                            <td class="px-2 py-2">${userDetail == null ? "":userDetail.userEmail()}</td>
                        </tr>
                    </tbody></table>
        
                    <div class="text-center my-3">
                        <a class="text-xs text-indigo-500 italic hover:underline hover:text-indigo-600 font-medium" href="#">View Profile</a>
                    </div>
        
                </div>
            </div>
        </div>
        </div>
        <form class="w-[70%]" action="profile" method = "post">
            <h2 class="font-bold text-3xl pb-8 border-b">My Profile</h2>
            <div class="bg-white rounded-lg shadow px-4 py-6 my-8">
              <p>Get the best out of  TripGuide by adding the remaining details!</p>
              <div class="flex gap-4 mt-4">
                <div class="rounded-full bg-[#E7ECF3] flex justify-center items-center px-3 py-1 gap-2">
                  <img src="./images/Vector.png" alt="">
                  <p>Verified Email ID
                  </p>
                </div>
                  <div class="rounded-full bg-[#E7ECF3] flex justify-center items-center px-3 py-1 gap-2">
                      <img src="./images/Vector.png" alt="">
                      <p>Verified mobile Number
                      </p>
                  </div>
                  <div class="rounded-full bg-[#E7ECF3] flex justify-center items-center px-3 py-1 gap-2">
                      <img src="./images/Vector.png" alt="">
                      <p>Complete Basic Info
                      </p>
                  </div>
              </div>
            </div>
            <div class="flex justify-between items-center my-4">
                <p class="text-xl font-semibold">Hi, I'm ${userDetail == null ? "":userDetail.name()}</p>
                <button class="rounded-full px-4 py-2 border hover:bg-gray-200">Save My Data</button>
            </div>
            <div class="flex gap-8">
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="name" class="text-sm font-medium text-[#6F717E]">Name</label>
                            <input type="text" name="name" id="name" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                value="${userDetail == null ? '' : userDetail.name()}">
                            <img src="./icons/home.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="address" class="text-sm font-medium text-[#6F717E]">Street Address</label>
                            <input type="text" name="address" id="address" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                   value="${userDetail == null ? '' : userDetail.address()}">
                            <img src="./icons/home.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
            </div>
            <div class="my-8">
                <div class="flex flex-col gap-4">
                    <div class="flex flex-col gap-2 relative">
                        <label for="phone" class="text-sm font-medium text-[#6F717E]">Phone</label>
                        <input type="text" name="phone" id="phone" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                               value="${userDetail == null ? '' : userDetail.phone()}">
                        <img src="./icons/email.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                    </div>
                </div>
            </div>
            <div class="flex gap-8 my-8">
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="dob" class="text-sm font-medium text-[#6F717E]">Date Of Birth</label>
                            <input type="date" name="dob" id="dob" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                value="${profileDob}" placeholder="dd-mm-yyyy"/>
                            <img src="./icons/birth.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="gender" class="text-sm font-medium text-[#6F717E]">Gender</label>
                            <input type="text" name="gender" id="gender" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                   value="${userDetail == null ? '' : userDetail.gender()}">
                            <img src="./icons/gender.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
            </div>
        </form>
      </div>
    </div>
    <c:import url="footer.jsp" />
</body>
<script type="text/javascript">
    const status = document.getElementById("updateUser").value;
    setTimeout(() => {
        if (status === "true") {
            Swal.fire({
                title: 'Success',
                icon: 'success',
                text: 'Update user success',
                confirmButtonText: 'OK',
            });
        }
        else if (status === "false"){
            Swal.fire({
                title: 'Failed',
                icon: 'error',
                text: 'Update user failed',
                confirmButtonText: 'OK',
            })
        }
    }, 500);
</script>
</html>
