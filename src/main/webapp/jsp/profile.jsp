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

        <form class="flex gap-8" action="profile" method = "post" id = "formUser" enctype="multipart/form-data">
        <div class="w-[25%]">
          <div class="">
            <div class="bg-white shadow-xl rounded-lg py-3">
                <div class="photo-wrapper p-2">
                    <img class="w-32 h-32 rounded-full mx-auto" src="${userDetail.imagePath()}" alt="John Doe">
                    <label class="block mx-auto">
                        <span class="sr-only">Choose profile photo</span>
                        <input type="file" class="block w-full text-sm text-slate-500
                            file:mr-8 file:py-2 file:px-4
                            file:rounded-full file:border-0
                            file:text-sm file:font-semibold
                            file:bg-violet-50 file:text-violet-700
                            hover:file:bg-violet-100"
                            name="avatar"
                               id="avatar"
                        />
                    </label>
                </div>
                <div class="p-2">
                    <h3 class="text-center text-xl text-gray-900 font-medium leading-8">${userDetail == null ? "":userDetail.name()}</h3>
                    <table class="text-xs my-3">
                        <tbody><tr>
                            <td class="px-2 py-2 text-gray-500 font-semibold">${address}</td>
                            <td class="px-2 py-2">${userDetail == null ? "":userDetail.address()}</td>
                        </tr>
                        <tr>
                            <td class="px-2 py-2 text-gray-500 font-semibold">${phone}</td>
                            <td class="px-2 py-2">${userDetail == null ? "":userDetail.phone()}</td>
                        </tr>
                        <tr>
                            <td class="px-2 py-2 text-gray-500 font-semibold">${email}</td>
                            <td class="px-2 py-2">${userDetail == null ? "":userDetail.userEmail()}</td>
                        </tr>
                    </tbody></table>
        
                    <div class="text-center my-3">
                        <a class="text-xs text-indigo-500 italic hover:underline hover:text-indigo-600 font-medium" href="#">${profile}</a>
                    </div>
        
                </div>
            </div>
        </div>
        </div>
        <div class="w-[70%]" >
            <h2 class="font-bold text-3xl pb-8 border-b">${profile}</h2>

            <div class="flex justify-between items-center my-4">
                <p class="text-xl font-semibold">${hello} ${userDetail == null ? "":userDetail.name()}</p>
                <button class="rounded-full px-4 py-2 border hover:bg-gray-200" type="submit" id="submitButton">${save}</button>
            </div>
            <div class="flex gap-8">
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="name" class="text-sm font-medium text-[#6F717E]">${name}</label>
                            <input type="text" name="name" id="name" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                value="${userDetail == null ? '' : userDetail.name()}">
                            <img src="./icons/home.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="address" class="text-sm font-medium text-[#6F717E]">${address}</label>
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
                        <label for="phone" class="text-sm font-medium text-[#6F717E]">${phone}</label>
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
                            <label for="dob" class="text-sm font-medium text-[#6F717E]">${dob}</label>
                            <input type="date" name="dob" id="dob" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                value="${userDetail.dob()}" placeholder="dd-mm-yyyy"/>
                            <img src="./icons/birth.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
                <div class="w-[50%]">
                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2 relative">
                            <label for="gender" class="text-sm font-medium text-[#6F717E]">${gender}</label>
                            <input type="text" name="gender" id="gender" class="text-[#3B3E44] text-sm border border-gray-300 rounded-lg p-2 py-3 bg-transparent pl-10"
                                   value="${userDetail == null ? '' : userDetail.gender()}">
                            <img src="./icons/gender.svg" alt="home icon" class="w-5 h-5 absolute top-[42px] left-[13px]">
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </form>
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
    document.getElementById('avatar').addEventListener('change', function () {
        document.getElementById('imgForm').submit();
    });
    document.getElementById('submitButton').addEventListener('click', function () {
        document.getElementById('formUser').submit();
    });
</script>
</html>
