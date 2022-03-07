<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>itemList page</title>
</head>
<body>

   	<div id="header">
   		<%@ include file="../../includes/header.jsp"  %>
    </div>
    <div id="wrap">
        <!-- itemList 시작 -->
        <div class="itemList_inner">

            <!-- itemList 상단 서브메뉴 -->
            <div class="itemList_lnb_inner">                
                <div class="itemlList_main_img_div">
                    <img src="/resources/images/health_main.png" alt="health">
                </div>                



                <div class="itemList_tit_div">
                	<c:forEach items="${categorys}" var="category" end="0">
                    <h3 class="itemList_tit"><c:out value="${category.categoryMain}"/></h3>
                    </c:forEach>
                </div>
                <div class="itemList_lnb_div clear">
                    <ul class="itemList_subList">
                        <li><a href='/shop/goods/goods_list?category=${categoryMainTitle}' class="itemList_allList_tit${categorySubTitle == null ? "_on" : ""}">전체보기</a></li>                   
                        <c:forEach items="${categorys}" var="category">
                        <li>
                        <a href="${category.categorySubTitle}"
                         class="itemList_subList_tit${category.categorySubTitle == categorySubTitle ? "_on" : "" }">
                         <c:out value="${category.categorySub}"/></a></li>
                        </c:forEach>
                        
                    </ul>
                </div>
            </div>

            <!-- itemList 솔트메뉴 -->
            <div class="itemList_sort_menu">
                <span class="itemList_count">총 45개</span>
                <ul class="itemList_sort_menu_list">
                    <li><a href="#" class="itemList_sort_menu_list_atag_on">추천순</a></li>
                    <li><a href="#" class="itemList_sort_menu_list_atag">낮은 가격순</a></li>
                    <li><a href="#" class="itemList_sort_menu_list_atag">높은 가격순</a></li>
                </ul>
            </div>

            <!-- itemList 리스트 -->
            <div class="itemList_list_div">
                <ul class="itemList_list">
                
                <c:forEach items="${goodsList}" var="goods">
                    <li>
                   	 	<a class="move" href='<c:out value="${goods.goodsNo}"/>'>
                        <div class="itemList_item" >
                            <div class="itemList_img_div">
                                <div class="itemList_img">
                                    <img src="/resources/images/shop/goods/${goods.goodsImage}" alt="#">
                                </div>
                                <div class="itemList_cartBtn_div">
                                    <a href="#" class="itemList_cartBtn"></a>
                                </div>
                            </div>
  							<!--<a href="#" class="itmeList_info"> -->
                                <span class="itemList_info item_name">${goods.goodsName}</span>
                                <span class="itemList_info item_price">${goods.goodsPrice}</span>
                                <span class="itemList_info item_desc">${goods.goodsContent}</span>
                            <!--</a> -->
                        </div>
                    	</a>
                    </li>
                </c:forEach>                             
                </ul>
            </div>

            <!-- itemList 페이지리스트 -->
            <div class="itemList_page_div">
                <div class="itemList_page_div_box">
                    <a href="#" class="itemList_move_f itemList_first"><i class="fa-solid fa-angles-left"></i></a>
                    <a href="#" class="itemList_move_f itemList_pre"><i class="fa-solid fa-angle-left"></i></a>
                    <a href="#" class="itemList_move itemList_num_on">1</a>
                    <a href="#" class="itemList_move itemList_num">2</a>
                    <a href="#" class="itemList_move itemList_num">3</a>
                    <a href="#" class="itemList_move itemList_num">4</a>
                    <a href="#" class="itemList_move itemList_num">5</a>
                    <a href="#" class="itemList_move itemList_num">6</a>
                    <a href="#" class="itemList_move itemList_num">7</a>
                    <a href="#" class="itemList_move itemList_num">8</a>
                    <a href="#" class="itemList_move itemList_num">9</a>
                    <a href="#" class="itemList_move itemList_num">10</a>
                    <a href="#" class="itemList_move_f itemList_naxt"><i class="fa-solid fa-angle-right"></i></a>
                    <a href="#" class="itemList_move_f itemList_last"><i class="fa-solid fa-angles-right"></i></a>
                </div>
            </div>
        </div>
        <!-- itemList 끝 -->
        <form action="/shop/goods/goods_sublist" id="actionForm">
        </form>
    </div>
    
    
<script>
	$(document).ready(function() {
		
		const actionForm = $("#actionForm");
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='goodsNo' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/shop/goods/goods_detail");
			actionForm.submit();
		})
		
		$(".itemList_subList_tit").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='category' value='"+$(this).attr("href")+"'>");
			$("#itemlist_All").remove("")
			actionForm.submit();
		})
		
		$("#itemlist_All")

		
	})
</script>
    <div id="footer">
   		<%@ include file="../../includes/footer.jsp"  %>
    </div>
</body>
</html>