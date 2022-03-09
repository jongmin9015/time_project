<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>    
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>

    <script>
        $(document).ready(function() {
            var wind = $(window),
            header = $('#gnbMenu'),
            headerOffsetTop = header.offset().top;

            console.log(headerOffsetTop);
            console.log(wind.scrollTop());
            wind.scroll(function() {
               if(wind.scrollTop()>= headerOffsetTop) {
                header.addClass('sticky');
               } else {
                header.removeClass('sticky');
              }
            });
        });
    </script>
    <div id="warp">
        <!-- User Menu -->
        <div id="user_menu">
            <ul class="list_menu">
                <li class="menu_join">
                    <a href="signup.html" class="link_menu">회원가입</a>
                </li>
                <li class="menu_login">
                    <a href="login.html" class="link_menu">로그인</a>
                </li>
                <li class="menu_center">
                    <a href="#" class="link_menu">고객센터</a>
                    <ul class="sub">
                        <li>
                            <a href="#">공지사항</a>
                        </li>
                        <li>
                            <a href="#">자주하는 질문</a>
                        </li>
                        <li><a href="#">1:1 문의</a></li>
                        
                    </ul>
                </li>
            </ul>    
        </div>

        <!-- Main Logo -->
        <div id="headerLogo" class="layout-wrapper">
            <h1 class="logo">
            <a href="/" class="link_main">
                <img src="/resources/images/header/MarketKurly.webp">
            </a>
        </div>

        <!-- HEADER -->
        <div id="gnbMenu" class="">
            <ul class="gnb">
                <li class="gbnMenulist">
                    <a href="/shop/goods/goods_list?category=health">
                        <span class="txt">건강식품</span>
                    </a>
                </li>
                <li class="gbnMenulist">
                    <a href="/shop/goods/goods_list?category=noodle" class="link new ">
                        <span class="txt">누들</span>
                    </a>
                </li>
                <li class="gbnMenulist">
                    <a href="/shop/goods/goods_list?category=salad" class="link best ">
                        <span class="txt">샐러드</span>
                    </a>
                </li>
                <li class="gbnMenulist">
                    <a href="/event" class="link bargain ">
                        <span class="txt">이벤트</span>
                    </a>
                </li>
                <!-- <li class="gbnMenulist">
                    <a href="#" class="link event ">
                        <span class="txt">메뉴 5</span>
                    </a>
                </li> -->
            </ul> 

            <div id="sidequir_search" class="gnb_search">
                <form action="">
                    <input name="sword" type="text" id="sword" value="" reed="required" label="검색어" placeholder="검색어를 입력해주세요." class="inp_search">
                    <a href="#" >
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </a>
                </form>
            </div> 


            <div class="cart">
                <a href="/shop/cart/move">
                        <i class="fa-solid fa-basket-shopping"></i>
                장바구니</a>
            </div>
        </div>
        <!-- HEADER -->
</body>
</html>