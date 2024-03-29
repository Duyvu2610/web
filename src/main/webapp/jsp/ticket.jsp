<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Receipt</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .logo {
            width: 80px;
            height: 80px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .contact-info {
            text-align: right;
        }

        .contact-info p {
            margin: 5px 0;
        }

        .section-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .section .info {
            max-width: 500px;
        }

        .section .info p {
            margin: 5px 0;
        }

        .receipt-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .receipt-table th,
        .receipt-table td {
            border: 1px solid #e2e8f0;
            padding: 8px;
            text-align: left;
        }

        .total-row {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img alt="logo" src="./images/logo.svg" class="logo">
            <div class="contact-info">
                <p class="font-bold text-xl text-black">VTTrip</p>
                <p>+84329901371</p>
                <p>vttripcompany@vt.com</p>
                <p>Ho Chi Minh City, Viet Nam</p>
            </div>
        </div>
        <p class="section-title">${receipt}</p>
        <div class="section">
            <div class="info">
                <p class="font-bold text-xl text-black">${customer_info}</p>
                <p>${email}: <span>${username.email()}</span></p>
                <p>${booking_date}: <span>${bookAt}</span></p>
                <p>${payment}: <span>${paymentMethod}</span></p>
            </div>
        </div>
        <table class="receipt-table text-center">
            <tbody>
                <!-- Ticket Price -->
                <tr>
                    <td><strong>${price}: </strong></td>
                    <td><fmt:formatNumber value="${(flight.price() * exchangeRate)}" /> ${currency }</td>
                </tr>
                <!-- Tax -->
                <tr>
                    <td><strong>${tax}: </strong></td>
                    <td><fmt:formatNumber value="${(flight.price() * exchangeRate) * 0.1}" /> ${currency }</td>
                </tr>
                <!-- Service Fee -->
                <tr>
                    <td><strong>${serviceFee}: </strong></td>
                    <td><fmt:formatNumber value="${(flight.price() * exchangeRate) * 0.05}" /> ${currency }</td>
                </tr>
                <!-- Discount -->
                <tr>
                    <td><strong>${discount}: </strong></td>
                    <td><fmt:formatNumber value="${(flight.price() * exchangeRate) * 0.01}" /> ${currency }</td>
                </tr>
                <!-- Grand Total -->
                <tr class="total-row">
                    <td><strong>${total}: </strong></td>
                    <td><fmt:formatNumber value="${(flight.price() * exchangeRate) * 1.14}" /> ${currency }</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
