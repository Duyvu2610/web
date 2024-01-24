<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quyền truy cập bị từ chối</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">

<div class="max-w-md mx-auto p-6 bg-white rounded-md shadow-md text-center">
    <svg class="w-16 h-16 mx-auto mb-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
         xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M6 18L18 6M6 6l12 12"></path>
    </svg>
    <h1 class="text-3xl font-bold text-red-500 mb-4">Quyền truy cập bị từ chối</h1>
    <p class="text-gray-600">Rất tiếc, bạn không có quyền truy cập vào tài nguyên này.</p>
    <button class="mt-4 bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600"
            onclick="goBack()">Quay lại
    </button>
</div>

<script>
    function goBack() {
        // Sử dụng đối tượng history để quay lại trang trước đó
        window.history.back();
    }
</script>

</body>
</html>
