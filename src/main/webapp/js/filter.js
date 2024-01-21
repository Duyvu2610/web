/**
 * 
 */

// Lấy tham chiếu đến các phần tử HTML
const popup = document.getElementById('filter');
const closePopupBtn = document.getElementById('close');
const filter = document.querySelectorAll('.filter');
console.log(filter)

// Hàm để hiển thị popup
function showPopup() {
	popup.classList.remove('hidden');
	// Thêm animation class để tạo hiệu ứng biến mất dần
	popup.classList.add('animate-fadeIn');
}

// Hàm để ẩn popup
function hidePopup() {
	// Loại bỏ animation class
	popup.classList.remove('animate-fadeIn');
	// Thêm class hidden để ẩn popup
	popup.classList.add('hidden');
}

// Gắn sự kiện click cho nút đóng popup
closePopupBtn.addEventListener('click', hidePopup);

// Gọi hàm showPopup để hiển thị popup
showPopup();