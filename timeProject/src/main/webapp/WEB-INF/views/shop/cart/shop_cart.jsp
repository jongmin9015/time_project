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
    <script src="/resources/js/javascript.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>cart Page</title>
</head>
<body>    
    <script>
        $(document).ready(function(){
            $("#tmpBtn").trigger("click");
        });
    </script>
   	<div id="header">
   		<%@ include file="../../includes/header.jsp"  %>
    </div>
    <div id="warp">
        <div class="cartPage_inner clear">
            <div class="cartPage_tit_div">
                <h2 class="cartPage_tit">장바구니</h2>
            </div>
            <form action="#" name="cart_item_list">
               <!--  <button type="button" id="	" onclick="getAllListCnt()"></button> -->
                <div class="cartPage_main_div">

                    <div class="cartPage_div_left">                        
                        <div class="cartPage_select_menu_div cartPage_select_menu_div_top">
                            <label class="cartPage_checkbox_label" onclick="getCheckedCnt()">
                                <input type="checkbox" name="cartPage_checkbox_item_list" onclick="selectAll(this)" value="selectall">
                                <span class="cartPage_checkbox_span"></span>
                                <span class="cartPage_checkAll_span cartPage_checkAll_span_top">
                                    전체선택(<span id="cartPage_item_select_num1">0</span>/<span id="cartPage_item_all_num1">${cartTotal}</span>)
                                </span>
                            </label>
                            <a href="#" class="cartPage_select_menu_delBtn cartPage_select_menu_delBtn_top">
                                선택삭제
                            </a>
                        </div>


    
    			
                        <div class="cartPage_itemList_div">
                            <ul class="cartPage_itemList_list">
                            
                               		<c:if test="${totalPrice == 0}">
   							 			<li>
   							 	 		  	<div class="cartPage_item_empty">장바구니에 담긴 상품이 없습니다.</div>
                           				</li>
    								</c:if>
    								
    								
                            <c:forEach items="${cartList}" var="goods">

                                <li>
                                    <div class="cartPage_item">
                                        <label class="cartPage_item_chkItem_label">
                                            <input type="checkbox" class="cartPage_item_count_check" name="cartPage_checkbox_item_list" onclick="getCheckedCnt()">
                                            <span class="cartPage_item_chkItem_span"></span>
                                        </label>
                                        <div class="cartPage_item_img_div">
                                            <a href="/shop/goods/goods_detail?goodsNo=${goods.goodsNo}" class="cartPage_item_img_tag">
                                                <img src="/resources/images/shop/goods/${goods.goodsImage}" class="cartPage_item_img" alt="cartimg">
                                            </a>
                                        </div>
                                        <div class="cartPage_item_name_div">
                                            <a href="/shop/goods/goods_detail?goodsNo=${goods.goodsNo}" class="cartPage_item_name">
                                                ${goods.goodsName}
                                            </a>
                                        </div>
                                        <div class="cartPage_item_count_div">
                                            <button type="button" class="cartPage_item_count cartPage_item_btn cartPage_count_down"><i class="fa-solid fa-minus"></i></button>
                                            <input type="number" class="cartPage_item_count cartPage_item_count_input" readonly="readonly" value="${goods.cartCount}">
                                            <button type="button" class="cartPage_item_count cartPage_item_btn cartPage_count_up"><i class="fa-solid fa-plus"></i></button>
                                            <input type="hidden" class="goodsPrice_hidden" name="goodsPrice" value="${goods.goodsPrice}">
                                        </div>
                                        <div class="cartPage_item_price_div cart_input_div">

                                            <span class="cartPage_item_price goodsPriceCount">
                                           		<fmt:formatNumber pattern="###,###,###" value="${goods.goodsPrice * goods.cartCount}"></fmt:formatNumber>
                                            </span>
                                            <span class="cartPage_item_price_won">원</span>
                                        </div>
                                        <button type="button" class="cartPage_item_delBtn"><i class="fa-solid fa-x"></i></button>
                                    </div>
                                </li>

    						</c:forEach>                              
                            </ul>
                        </div>

                        <div class="cartPage_select_menu_div cartPage_select_menu_div_bottom">
                            <label class="cartPage_checkbox_label"  onclick="getCheckedCnt()">
                                <input type="checkbox" name="cartPage_checkbox_item_list" onclick="selectAll(this)" value="selectall" checked="checked">
                                <span class="cartPage_checkbox_span"></span>
                                <span class="cartPage_checkAll_span cartPage_checkAll_span_bottom">
                                    전체선택(<span id="cartPage_item_select_num2">0</span>/<span id="cartPage_item_all_num2">${cartTotal}</span>)
                                </span>
                            </label>
                            <a href="#" class="cartPage_select_menu_delBtn cartPage_select_menu_delBtn_bottom">
                                선택삭제
                            </a>
                        </div>


                    </div>

                    <div class="cartPage_div_right">
                        <div class="cartPage_delivery_div">
                            <h3 class="cartPage_delivery_tit">배송지</h3>
                            <div class="cartPage_address_div">
                                <p class="cartPage_address">	
                                    서울특별시 영등포구 선유로 130
                                </p>
                            </div>
                        </div>
                        <div class="cartPage_amount_div">
                            <dl class="cartPage_amount_list clear">
                                <dt class="cartPage_amount_tit">
                                    상품금액
                                </dt>
                                <dd class="cartPage_amount_price">
                                    <span class="cartPage_amount_price_num totalPrice">
                                   		<fmt:formatNumber pattern="###,###,###" value="${totalPrice}"></fmt:formatNumber>
                                    </span>
                                    <span class="cartPage_amount_price_won">원</span>
                                </dd>
                            </dl>
                            <dl class="cartPage_amount_list clear">
                                <dt class="cartPage_amount_tit">
                                    배송비
                                </dt>
                                <dd class="cartPage_amount_price">
                                    <span class="cartPage_amount_delivery_num">
                                   		 <fmt:formatNumber pattern="###,###,###" value="${deliveryFee}"></fmt:formatNumber>                               		 
                                   </span>
                                    <span class="cartPage_amount_delivery_won">원</span><br>
                                    <span class="cartPage_deliveryMessage">${deliveryMessage}</span>
                                </dd>
                            </dl>
                            <dl class="cartPage_amount_list cartPage_amount_list_total">
                                <dt class="cartPage_amount_tit">
                                    결제예정금액
                                </dt>
                                <dd class="cartPage_amount_price">
                                    <span class="cartPage_amount_price_num amountPrice">
                                   		 <fmt:formatNumber pattern="###,###,###" value="${totalPrice + deliveryFee}"></fmt:formatNumber>
                                    </span>
                                    <span class="cartPage_amount_price_won">원</span>
                                </dd>
                            </dl>
                        </div>

                        <c:choose>
                            <c:when test="${totalPrice == 0}">
	                            <div class="cartPage_submit_btn_div">
	                           		 <button type="submit" class="cartPage_empty_btn">상품을 담아주세요</button>
	                       	    </div>
                      		</c:when>
                      		
                      		<c:otherwise>
                      			<div class="cartPage_submit_btn_div">
                           			 <button type="submit" class="cartPage_submit_btn">주문하기</button>
                        		</div>
                      		</c:otherwise>    
                        </c:choose>
                        
                        
                    </div>
                </div>
            </form>
        </div>
    
    </div>
<script>

	let count = 0;
	
	$(".cartPage_count_up").on("click", function() {
		
 		count = $(this).prev(".cartPage_item_count_input").val();
 		if (count == 99) return;
 		
 		const goodsPrice = parseInt($(this).nextAll("input[name='goodsPrice']").val());
		goodsPriceCountTag = $(this).parent().next(".cart_input_div").children(".goodsPriceCount"); 	
		
		const totalPriceTag = $(".totalPrice");
		const amountPriceTag = $(".amountPrice");
		const deleveryFeeTag = $(".cartPage_amount_delivery_num");
		let deliveryFee = ${deliveryFee};
		const deleveryMessageTag = $(".cartPage_deliveryMessage");
		let lackPrice = 0;
 	
 		$(this).prev(".cartPage_item_count_input").val(++count);
		goodsPriceCountTag.html(priceToString(goodsPrice * count));
	
		const totalPrice = stringNumberToInt(totalPriceTag.html()) + goodsPrice;
		totalPriceTag.html(priceToString(totalPrice));
		
		if (totalPrice > 20000){
			deleveryFeeTag.html(0);
			deliveryFee = 0;
			deleveryMessageTag.html("");
		} else {
			deliveryFee = ${deliveryFee};
			deleveryFeeTag.html(priceToString(deliveryFee));
			lackPrice = 20000 - totalPrice;
			deleveryMessageTag.html(priceToString(lackPrice)+"원 추가 주문 시, 무료배송");
		}
		
		deliveryFee = ${deliveryFee};
		const amountPrice = stringNumberToInt(totalPriceTag.html()) + deliveryFee;
		amountPriceTag.html(priceToString(amountPrice)); 
		
	})

// 모달창 내부 수량 카운트 DOWN
	$(".cartPage_count_down").on("click", function() {
		
		count = $(this).next(".cartPage_item_count_input").val();
		if (count == 1 || count == 99) return;
		
 		const goodsPrice = parseInt($(this).nextAll("input[name='goodsPrice']").val());
		const goodsPriceCountTag = $(this).parent().next(".cart_input_div").children(".goodsPriceCount");
		const totalPriceTag = $(".totalPrice");
		const amountPriceTag = $(".amountPrice");
		const deleveryFeeTag = $(".cartPage_amount_delivery_num");
		let deliveryFee = ${deliveryFee};
		const deleveryMessageTag = $(".cartPage_deliveryMessage");
		let lackPrice = 0;
		
		$(this).next(".cartPage_item_count_input").val(--count);
		goodsPriceCountTag.html(priceToString(goodsPrice * count));
	
		const totalPrice = stringNumberToInt(totalPriceTag.html()) - goodsPrice;
		totalPriceTag.html(priceToString(totalPrice));
		console.log(totalPrice);
		if (totalPrice > 20000){
			deleveryFeeTag.html(0);
			deliveryFee = 0;
			deleveryMessageTag.html("");
		} else {
			deliveryFee = ${deliveryFee};
			deleveryFeeTag.html(priceToString(deliveryFee));
			lackPrice = 20000 - totalPrice;
			deleveryMessageTag.html(priceToString(lackPrice)+"원 추가 주문 시, 무료배송");
		}
		
		const amountPrice = stringNumberToInt(totalPriceTag.html()) + deliveryFee;
		amountPriceTag.html(priceToString(amountPrice));
	})


</script>    
    
    
    <div id="footer">
   		<%@ include file="../../includes/footer.jsp"  %>
    </div>
  
</body>
</html>