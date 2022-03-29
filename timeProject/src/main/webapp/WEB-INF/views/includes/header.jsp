<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <script type="/resources/js/header.js" defer></script>
</head>
<body>

        <div id="warp">
        <!-- User Menu -->
        <sec:authentication property="principal" var="pinfo"/>
        
        
	        <div id="user_menu">
	            <ul class="list_menu">
	           		<sec:authorize access="isAnonymous()">          		
	                <li class="menu_join">
	                    <a href="/member/signup/move" class="link_menu menu_join">회원가입</a>
	                </li>
                	<li class="menu_login">
		                    <a href="/member/login/move" class="link_menu">로그인</a>
	                </li>
	                </sec:authorize>
	                
					<sec:authorize access="isAuthenticated()">
						<li id="welcome">
		                    <div class="welcome_div">웰컴</div>
	                	</li>
	                	<li class="menu_login" id="login_user">	
		                    <a href="#" class="link_menu" >${pinfo.member.memberName} 님</a>
		                     <ul class="login_user_menu">
               					  <li><a href="/member/memberPwCheck">개인정보수정</a></li>
                     			  <li> <a href="#">배송지관리</a></li>
                   				  <li><a href="/member/login/logout">로그아웃</a></li>
               			     </ul>

		                </li>
					</sec:authorize>

	                <li class="menu_center">
	                    <a href="#" class="link_menu header_noticeMove">고객센터</a>
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
                    <a href="/shop/goods/goods_list?category=health" class="link health_food ">
                        <span class="txt">건강식품</span>
                    </a>
                    <ul class="health_food submenu">
                        <a href="/shop/goods/goods_sublist?category=nutrients"><li>영양제</li></a>
                        <a href="/shop/goods/goods_sublist?category=lacto"><li>유산균</li></a>
                        <a href="/shop/goods/goods_sublist?category=ginseng"><li>홍삼</li></a>
                        <a href="/shop/goods/goods_sublist?category=healthdrink"><li>건강즙</li></a>
                        <a href="/shop/goods/goods_sublist?category=healthpowder"><li>건강환</li></a>
                        <a href="/shop/goods/goods_sublist?category=diet"><li>다이어트</li></a>
                        <a href="/shop/goods/goods_sublist?category=child"><li>유아동</li></a>
                    </ul>
                </li>
                
                <li class="gbnMenulist">
                    <a href="/shop/goods/goods_list?category=noodle" class="link noodle ">
                        <span class="txt">면·양념·오일</span>
                    </a>
                    <ul class="noodel submenu">
                        <a href="/shop/goods/goods_sublist?category=pastanoodle"><li>파스타·면류</li></a>
                        <a href="/shop/goods/goods_sublist?category=dressing"><li>식초·소스·드레싱</li></a>
                        <a href="/shop/goods/goods_sublist?category=seasoning"><li>양념·액정·장류</li></a>
                        <a href="/shop/goods/goods_sublist?category=oil"><li>식용유·참기름·오일</li></a>
                        <a href="/shop/goods/goods_sublist?category=spice"><li>소금·설탕</li></a>
                        <a href="/shop/goods/goods_sublist?category=flour"><li>밀가루·가루·믹스</li></a>
                    </ul>
                </li>
                <li class="gbnMenulist">
                    <a href="/shop/goods/goods_list?category=salad" class="link salad ">
                        <span class="txt">샐러드·간편식</span>
                    </a>
                    <ul class="salad submenu">
                        <a href="/shop/goods/goods_sublist?category=saladchicken"><li>샐러드·닭가슴살</li></a>
                        <a href="/shop/goods/goods_sublist?category=lunchbox"><li>도시락·밥류</li></a>
                        <a href="/shop/goods/goods_sublist?category=pasta"><li>파스타·면류</li></a>
                        <a href="/shop/goods/goods_sublist?category=snack"><li>떡볶이·튀김·순대</li></a>
                        <a href="/shop/goods/goods_sublist?category=pizza"><li>피자·핫도그·만두</li></a>
                        <a href="/shop/goods/goods_sublist?category=poached"><li>폭림·떡갈비·안주</li></a>
                    </ul>
                </li>
                <li class="gbnMenulist">
                    <a href="/event" class="link event ">
                        <span class="txt">이벤트</span>
                    </a>
                </li>
            </ul> 

            <div id="sidequir_search" class="gnb_search">
                <form id="search_frm" action="/shop/goods/search_list/">
                    <input name="keyword" type="text" id="sword" value="" reed="required" label="검색어" placeholder="검색어를 입력해주세요." class="inp_search">                    
	                    <span onclick="search_form()">
	                        <i class="fa-solid fa-magnifying-glass"></i>
	                    </span>          
                </form>
            </div> 
			<sec:authorize access="isAnonymous()">
	            <div class="cart">
	                <a href="/shop/cart/move" class="cart_icon">
	                        <i class="fa-solid fa-cart-shopping"></i>
	    			</a>
	            </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
	            <div class="cart">
	                <a href="/shop/cart/move?memberId=${pinfo.member.memberId}" class="cart_icon">
	                        <i class="fa-solid fa-cart-shopping"></i>
	    			</a>
	            </div>
            </sec:authorize>
        </div>
        <!-- hidden Form -->
        <form id="indexMoveForm" method="get" action="/board/board_list">
	        <input type="hidden" name="bgno" value="1">
    	</form>
    	<script>
    		let formIndex = $("#indexMoveForm");
    		/* 고객센터 이동 */
   			$(".header_noticeMove").on("click", function(e){
   				e.preventDefault();
   				formIndex.submit();
   				
   			});
    		
    	</script>
        <!-- HEADER -->
        
        
</body>

</html>