/**
 * 
 */
const user = document.querySelectorAll(".user")
const userDropDown = document.getElementById("user_drop_down")
const dropdown = document.getElementById("dropdown");

user.forEach(e => e.addEventListener("click", () => {
	
	if (userDropDown.classList.contains("my_hidden")) {
		// Nếu có lớp "hidden", loại bỏ lớp "hidden" để hiển thị phần tử
		userDropDown.classList.remove("my_hidden");
		dropdown.classList.add("rotate-180");
		// Triggers reflow/repaint so that CSS transition is applied.
		void userDropDown.offsetWidth;
		// Tăng opacity để hiển thị phần tử một cách mượt mà
		userDropDown.style.opacity = "1";
	}
	else {
		userDropDown.classList.add
		 // Nếu không có lớp "hidden", thêm lớp "hidden" để ẩn phần tử
        userDropDown.style.opacity = "0"; // Tạo hiệu ứng mất mờ
        dropdown.classList.remove("rotate-180");
        userDropDown.addEventListener("transitionend", function() {
            // Sự kiện transitionend sẽ được gọi sau khi hoàn thành hiệu ứng mất mờ
            userDropDown.classList.add("my_hidden");
            
        }, { once: true });
	}

}))