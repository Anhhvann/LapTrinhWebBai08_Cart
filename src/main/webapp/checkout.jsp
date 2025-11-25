<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Checkout - Thanh Toán</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    <style>
        .checkout-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .order-summary {
            background-color: #f5f5f5;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
            padding: 5px 0;
        }
        .summary-row.total {
            border-top: 2px solid #333;
            padding-top: 10px;
            margin-top: 10px;
            font-weight: bold;
            font-size: 16px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-row {
            display: flex;
            gap: 10px;
        }
        .form-row .form-group {
            flex: 1;
        }
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .button-group input {
            flex: 1;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-submit {
            background-color: #28a745;
            color: white;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <h1>Thanh Toán (Checkout)</h1>
    
    <div class="checkout-container">
        <!-- Order Summary -->
        <div class="order-summary">
            <h2>Tóm Tắt Đơn Hàng</h2>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            
            <c:choose>
                <c:when test="${not empty cart.items}">
                    <c:forEach var="item" items="${cart.items}">
                        <div class="summary-row">
                            <span>${item.product.description} x ${item.quantity}</span>
                            <span>${item.totalCurrencyFormat}</span>
                        </div>
                    </c:forEach>
                    <div class="summary-row total">
                        <span>Tổng Cộng:</span>
                        <span>${cart.totalCurrencyFormat}</span>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>Giỏ hàng của bạn trống. Vui lòng quay lại để mua sắm.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Checkout Form -->
        <c:if test="${not empty cart.items}">
            <form action="" method="post">
                <h2>Thông Tin Giao Hàng</h2>
                
                <div class="form-group">
                    <label for="fullname">Họ và Tên:</label>
                    <input type="text" id="fullname" name="fullname" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="phone">Số Điện Thoại:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>

                <div class="form-group">
                    <label for="address">Địa Chỉ Giao Hàng:</label>
                    <input type="text" id="address" name="address" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="city">Thành Phố:</label>
                        <input type="text" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="zipcode">Mã Bưu Chính:</label>
                        <input type="text" id="zipcode" name="zipcode" required>
                    </div>
                </div>

                <h2>Thông Tin Thanh Toán</h2>

                <div class="form-group">
                    <label for="cardname">Tên Chủ Thẻ:</label>
                    <input type="text" id="cardname" name="cardname" required>
                </div>

                <div class="form-group">
                    <label for="cardnumber">Số Thẻ Tín Dụng:</label>
                    <input type="text" id="cardnumber" name="cardnumber" placeholder="1234 5678 9012 3456" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="expiry">Hạn Sử Dụng:</label>
                        <input type="text" id="expiry" name="expiry" placeholder="MM/YY" required>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" name="cvv" placeholder="123" required>
                    </div>
                </div>

                <div class="button-group">
                    <input type="hidden" name="action" value="complete">
                    <input type="submit" class="btn-submit" value="Hoàn Tất Thanh Toán">
                    <input type="button" class="btn-back" value="Quay Lại" onclick="window.history.back()">
                </div>
            </form>
        </c:if>
    </div>

</body>
</html>