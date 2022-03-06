<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/reset.css?after">
    <link rel="stylesheet" href="/resources/css/style.css?after">
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>TIME_PROJECT</title> 

</head>
<body>

   
    <div id="header">
    <%@ include file="includes/header.jsp"  %>
    </div>
    
    <div id="warp">
        <div class="index_main_inner">
            <div class="index_main_img_box">
                <a href="#" class="main_img_tag">
                    <img src="/resources/images/main.jpg" alt="main_jpg">
                </a>
            </div>
            <div class="index_main_tit_box">
                <h1 class="main_tit">이건 어떠세요?</h1>
            </div>
            <div class="index_main_content_box">
                <ul class="index_main_content_list">
                    <li>
                        <a href="itemListPage_health.html">
                            <div class="index_img_box">
                                <img src="/resources/images/keyboard/keyboard01.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="itemListPage_health.html">
                            <div class="index_img_box">
                                <img src="/resources/images/keyboard/keyboard02.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="itemListPage_salad.html">
                            <div class="index_img_box">
                                <img src="/resources/images/keyboard/keyboard03.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="itemListPage_noodel.html">
                            <div class="index_img_box">
                                <img src="/resources/images/keyboard/keyboard04.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="index_main_tit_box">
                <h1 class="index_main_tit">이건 안사면 후회!</h1>
            </div>
            <div class="index_main_content_box">
                <ul class="index_main_content_list">
                    <li>
                        <a href="/shop/goods/goods_noodle">
                            <div class="index_img_box">
                                <img src="/resources/images/headset/headset01.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/goods/goods_health">
                            <div class="index_img_box">
                                <img src="/resources/images/headset/headset02.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/goods/goods_salad">
                            <div class="index_img_box">
                                <img src="/resources/images/headset/headset03.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/goods/goods_noodle">
                            <div class="index_img_box">
                                <img src="/resources/images/headset/headset04.jpg" alt="main_con_img">
                                <a href="cart.html"><i class="fa-solid fa-cart-plus"></i></a>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="footer">
    <%@ include file="includes/footer.jsp"%>
    </div>
</body>
</html>
