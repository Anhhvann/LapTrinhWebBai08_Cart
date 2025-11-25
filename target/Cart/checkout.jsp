<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Thanh Toán</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            background-color: #f8f9fa;
        }
        
        main {
            max-width: 700px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 28px;
        }
        
        h2 {
            font-size: 20px;
            color: #34495e;
            margin-bottom: 15px;
            margin-top: 20px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        .order-summary {
            background-color: #ecf0f1;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        article {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #bdc3c7;
        }
        
        article:last-of-type {
            border-bottom: none;
        }
        
        aside {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            margin-top: 10px;
            border-top: 2px solid #34495e;
            font-weight: bold;
            font-size: 18px;
            color: #e74c3c;
        }
        
        form {
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        fieldset {
            border: none;
            padding: 0;
            margin: 0;
        }
        
        legend {
            font-size: 18px;
            font-weight: bold;
            color: #34495e;
            margin-bottom: 15px;
            margin-top: 20px;
            padding: 0;
            border-bottom: 2px solid #3498db;
            width: 100%;
            padding-bottom: 10px;
        }
        
        fieldset:first-of-type legend {
            margin-top: 0;
        }
        
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 15px;
            color: #2c3e50;
        }
        
        label input {
            display: block;
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #bdc3c7;
            border-radius: 4px;
            font-family: inherit;
            font-size: 14px;
            transition: border-color 0.3s;
            margin-top: 6px;
        }
        
        label input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }
        
        output {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        
        output label {
            margin-bottom: 15px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #2c3e50;
        }
        
        .form-group input {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #bdc3c7;
            border-radius: 4px;
            font-family: inherit;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        
        nav {
            display: flex;
            gap: 12px;
            margin-top: 30px;
            justify-content: center;
        }
        
        nav input {
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
            flex: 1;
            max-width: 250px;
        }
        
        .btn-submit {
            background-color: #27ae60;
            color: white;
        }
        
        .btn-submit:hover {
            background-color: #229954;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .btn-back {
            background-color: #7f8c8d;
            color: white;
        }
        
        .btn-back:hover {
            background-color: #5d6d7b;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <main>
        <h1>Thanh Toán Đơn Hàng</h1>
        
        <section class="order-summary">
            <h2>Tóm Tắt Đơn Hàng</h2>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            
            <c:choose>
                <c:when test="${not empty cart.items}">
                    <c:forEach var="item" items="${cart.items}">
                        <article>
                            <span>${item.product.description} x ${item.quantity}</span>
                            <span>${item.totalCurrencyFormat}</span>
                        </article>
                    </c:forEach>
                    <aside>
                        <span>Tổng Cộng:</span>
                        <span>${cart.totalCurrencyFormat}</span>
                    </aside>
                </c:when>
                <c:otherwise>
                    <p class="empty-message">Giỏ hàng của bạn trống. Vui lòng quay lại để mua sắm.</p>
                </c:otherwise>
            </c:choose>
        </section>

        <!-- Checkout Form -->
        <c:if test="${not empty cart.items}">
            <form action="" method="post">
                <fieldset>
                    <legend>Thông Tin Giao Hàng</legend>
                    
                    <label>
                        Họ và Tên:
                        <input type="text" name="fullname" required>
                    </label>

                    <label>
                        Email:
                        <input type="email" name="email" required>
                    </label>

                    <label>
                        Số Điện Thoại:
                        <input type="tel" name="phone" required>
                    </label>

                    <label>
                        Địa Chỉ Giao Hàng:
                        <input type="text" name="address" required>
                    </label>

                    <output>
                        <label>
                            Thành Phố:
                            <input type="text" name="city" required>
                        </label>
                        <label>
                            Mã Bưu Chính:
                            <input type="text" name="zipcode" required>
                        </label>
                    </output>
                </fieldset>

                <fieldset>
                    <legend>Thông Tin Thanh Toán</legend>

                    <label>
                        Tên Chủ Thẻ:
                        <input type="text" name="cardname" required>
                    </label>

                    <label>
                        Số Thẻ Tín Dụng:
                        <input type="text" name="cardnumber" placeholder="1234 5678 9012 3456" required>
                    </label>

                    <output>
                        <label>
                            Hạn Sử Dụng:
                            <input type="text" name="expiry" placeholder="MM/YY" required>
                        </label>
                        <label>
                            CVV:
                            <input type="text" name="cvv" placeholder="123" required>
                        </label>
                    </output>
                </fieldset>



                <nav>
                    <input type="hidden" name="action" value="complete">
                    <input type="submit" class="btn-submit" value="Hoàn Tất Thanh Toán">
                    <input type="button" class="btn-back" value="Quay Lại" onclick="window.history.back()">
                </nav>
            </form>
        </c:if>
    </main>

</body>
</html>