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
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>payPage</title>
</head>
<body>
   	<div id="header">
   		<%@ include file="../../includes/header.jsp"  %>
    </div>

    <!-- payPage 타이틀 -->
    <div class="payPage_tit_div">
        <h2 class="payPage_tit">
            주문서
        </h2>            
    </div>
    <div class="payPage_inner clear">
        <!-- payPage 주문상품 리스트 -->
        <div class="payPage_item_list_inner clear">
            <div class="payPage_item_list_tit_div">
                <h2 class="payPage_item_list_tit">
                    주문상품
                </h2>
            </div>
            <div class="payPage_item_list_div">                
                <ul class="payPage_item_list">
                
                	<c:forEach items="${orderGoodsList}" var="goods">
                	
	                    <li class="clear">
	                        <div class="payPage_item_list_thumb">
	                            <img src="/resources/images/shop/goods/${goods.goodsImage}" alt="${goods.goodsImage}">
	                        </div>
	                        <div class="payPage_item_list_name">
	                            ${goods.goodsName}
	                        </div>
	                        <div class="payPage_tiem_list_ea">
	                            <span class="payPage_item_list_ea_num">${goods.goodsCount}</span>
	                            개
	                        </div>
	                        <div class="payPage_item_list_info_price">
	                            <span class="payPage_item_list_info_span_div">                                
	                                <span class="payPage_item_list_price" data-value="${goods.goodsPrice * goods.goodsCount}">
	                                <fmt:formatNumber pattern="###,###,###" value="${goods.goodsPrice * goods.goodsCount}"></fmt:formatNumber>
	                                </span>
	                            </span>
	                        </div>
	                    </li>
	                    
                    </c:forEach>
                </ul>
            </div>
            <!-- payPage 주문자 정보 -->
            <div class="payPage_order_form_inner">                
                <form action="" name="formOrder">
                    <input type="hidden" name="">
                    <input type="hidden" name="">
                    <input type="hidden" name="">
                    <input type="hidden" name="">
                    <div class="payPage_order_tit_div">
                        <h2 class="payPage_order_tit">
                            주문자 정보
                        </h2>
                    </div>
                    <div class="payPage_order_table_div">
                     
                        <c:choose>
                        	<c:when test="${member == null}">
			                       <table class="payPage_order_table">
			                            <tr class="payPage_order_fst">
			                                <th>보내는 분</th>
			                                <td>
												<input type="text" name="orderName" id="orderName" placeholder="이름을 입력해주세요" 
												class="payPage_user_input" value="" >
											</td>
			                                
			                            </tr>
			                            <tr>
			                                <th>휴대폰</th>
			                                <td>
			                                    <input type="text" name="orderPhone" id="orderPhone" placeholder="숫자만 입력해주세요" 
			                                    class="payPage_user_input" value="">
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>이메일</th>
			                                <td>
			                                    <input type="text" name="orderEmail" id="orderEmail" placeholder="예)spring@java.com" class="payPage_user_input" >
			                                </td>
			                            </tr>
			                        </table>	
                        	</c:when>
                        	
                        	<c:otherwise>
			                       <table class="payPage_order_table">
			                            <tr class="payPage_order_fst">
			                                <th>보내는 분</th>
			                                <td>${member.memberName}</td>
			                                <input type="hidden" name="orderName" value="${member.memberName}">
			                            </tr>
			                            <tr>
			                                <th>휴대폰</th>
			                                <td>
			                                    ${member.phone}
			                                    <input type="hidden" name="orderPhone" value="${member.phone}">
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>이메일</th>
			                                <td>
			                                    ${member.email}
			                                    <input type="hidden" name="orderEmail" value="${member.email}">
			                                    <p class="payPage_order_txt_desc">
			                                        정보 변경은 마이컬리 > 개인정보 수정 메뉴에서 가능합니다.
			                                    </p>
			                                </td>
			                            </tr>
			                        </table>
                        	</c:otherwise>
                        
                        </c:choose>
                       
                    </div>


                    <div class="payPage_address_inner">
                        <!-- payPage 배송정보 -->
                        <div class="payPage_address_tit_div">
                            <h2 class="payPage_address_tit">
                                배송 정보
                            </h2>
                        </div>
                        <div class="payPage_address_info_inner">
                            <div class="payPage_address_div clear">
                                <h3 class="payPage_address payPage_address_tit">
                                    배송지
                                </h3>
                                <div class="payPage_addrinfo_div">
                                    <span class="payPage_addrinfo_default" id="addrDefault" data-text="기본배송지">기본배송지</span> <br>                              
                                    <span class="payPage_addrinfo">
                                    </span>
                                </div>
                            </div>
                            <div class="payPage_address_info_div clear">
                                <h3 class="payPage_address payPage_address_info_tit clear">
                                    상세 정보
                                </h3>
                                <div class="payPage_receiving_div">                                    
                                    <div class="payPage_receiving_info">
                                        <span class="payPage_receiving_name"></span>
                                    	<span class="payPage_receiving_phone"></span>
                                    </div>
                                   
                                    <div class="payPage_receiving_place_div">                                    
                                        <span class="payPage_receiving_place">배송지역</span>
                                        <span class="payPage_receiving_txt"></span>
                                    </div>
                                    <div class="payPage_receiving_message_div">                                    
                                        <span class="payPage_receiving_message_tit">배송완료 메시지</span>
                                        <span class="payPage_receiving_message_time"></span>
                                    </div>
                                     <button type="button" class="payPage_subaddress_update_Btn" id="btnUpdateSubAddress" onclick="showPopUpDelivery()">입력</button>
                                </div>
                              
                            </div>                            
                        </div>
                        <div class="payPage_banner_img_div">
                            <img src="/resources/images/shop/order/banner-order-paper_1050_107.webp" alt="배너이미지" class="payPage_banner_img">
                        </div>
                        <!-- payPage 포인트 -->
                        <div class="payPage_pay_inner clear">
                            <div class="payPage_pay_section_inner">
                                <div class="payPage_pay_tit_div">
                                    <h2 class="payPage_pay_tit"> 적립금</h2>
                                </div>
                            
                                <div class="payPage_point_table_div">
                                    <table class="payPage_point_table">
                                        <tr class="payPage_point_use">
                                            <th class="payPage_noPoint">
                                                적립금 적용
                                                <input type="hidden" name="checkPoint" value="0">
                                            </th>
                                            <td>
                                                사용 가능한 적립금이 없습니다.
                                                <input type="hidden" name="using_point" value="0">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- payPage 결제 수단 -->
                                <div class="payPage_pay_select_div">
                                    <div class="payPage_pay_select_tit_div">
                                        <h2 class="payPage_pay_select_tit">
                                            결제 수단
                                        </h2>
                                    </div>
                                    <div class="payPage_pay_select_table_div">
                                        <table class="payPage_pay_select_table">
                                            <tr>
                                                <th>결제수단 선택</th>
                                                <td>
                                                    <div class="payPage_pay_select_first">
                                                        <label class="payPage_kakaopay" id="kakaopayment" onclick="cardaddClass(this)">
                                                            <input type="radio" value="kakaopay" checked="checked" name="pay-select" onclick="cardCheck(this.value)">
                                                            <img src="/resources/images/shop/order/ico_kakao-pay.webp" alt="kakao-pay" class="kakaopay-logo" id="kakaoPay">
                                                        </label>
                                                    </div>
                                                    <ul class="payPage_pay_select_menu_list clear">
                                                        <li class="payPage_pay_menu payPage_pay_menu_card" onclick="cardaddClass(this)">
                                                            <label class="payPage_card" id="cardment">
                                                                <input type="radio" name="pay-select" value="card" id="payPage_card_radio" onclick="cardCheck(this.value)">
                                                                신용카드                                                            
                                                            </label>
                                                        </li>
                                                        <li class="payPage_pay_menu_simple" onclick="cardaddClass(this)">
                                                            <label class="payPage_simple" id="payPage_simple_click" onclick="menuClick()">
                                                                간편결제
                                                            </label>
                                                        </li>
                                                        <li class="payPage_pay_menu_phone" onclick="cardaddClass(this)">
                                                            <label class="payPage_phone">
                                                                <input type="radio" name="pay-select" value="phone" onclick="cardCheck(this.value)">
                                                                휴대폰
                                                            </label>
                                                        </li>
                                                    </ul>
                                                
                                                    <div class="payPage_pay_card_detail_div">
                                                        <div class="payPage_card_select_div" id="payPage_card_view">
                                                            <div class="payPage_card_select_box" onclick="cardSelect()">
                                                                <strong class="payPage_card_select_tit" id="payPage_card_select_card" onclick="cardSelect()">카드를 선택해주세요.</strong>
                                                                <input type="hidden" name="card_code" value="0">
                                                                <ul class="card_select_list card_select_list_card" id="card_select_list_card">
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="1">현대(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="2">신한(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="3">비씨(페이북)(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="4">KB국민(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="5">삼성(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="6">롯데(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="7">하나(외환)(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="8">NH채움(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="9">우리(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="10">수협</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="11">씨티</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="12">광주(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="13">전북(무이자)</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="14">제주</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="15">신협체크</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="16">MG새마을체크</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="17">저축은행체크</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="18">우체국카드</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="19">KDB산업은행</a></li>
                                                                    <li><a onclick="cardSelectClick(this)" class="card_select" data-value="20">카카오뱅크</a></li>
                                                                </ul>                                                            
                                                            </div>
                                                            <div class="payPage_card_select_box2">
                                                                <strong class="payPage_card_select_tit" id="payPage_card_select_month" onclick="cardSelect()">일시불</strong>
                                                                <input type="hidden" name="card_code_month" value="0">
                                                                <ul class="card_select_list card_select_list_month" id="card_select_list_month">
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="21">일시불</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="22">2개월(무이자)</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="23">3개월(무이자)</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="24">4개월(무이자)</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="25">5개월(무이자)</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="26">6개월(무이자)</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="27">7개월(무이자)</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="28">8개월</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="29">9개월</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="30">10개월</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="31">11개월</a></li>
                                                                    <li><a onclick="monthSelectClick(this)" class="card_select_month" data-value="32">12개월</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>                                                  
                                                    </div>

                                                    <div class="payPage_simple_select_box">
                                                        <ul class="payPage_simple_select_list" id="payPage_simple_view">
                                                            <li class="chai">
                                                                <label class="payPage_simple_radio" onclick="simpleRadioEvent(this)">
                                                                    <input type="radio" name="pay-select">
                                                                    차이
                                                                </label>
                                                            </li>
                                                            <li class="toss">
                                                                <label class="payPage_simple_radio" onclick="simpleRadioEvent(this)">
                                                                    <input type="radio" name="pay-select">
                                                                    토스
                                                                </label>
                                                            </li>
                                                            <li class="naver-pay">
                                                                <label class="payPage_simple_radio" onclick="simpleRadioEvent(this)">
                                                                    <input type="radio" name="pay-select">
                                                                    네이버페이
                                                                </label>
                                                            </li>
                                                            <li class="payco">
                                                                <label class="payPage_simple_radio" onclick="simpleRadioEvent(this)">
                                                                    <input type="radio" name="pay-select">
                                                                    페이코
                                                                </label>
                                                            </li>
                                                            <li class="smile-pay">
                                                                <label class="payPage_simple_radio" onclick="simpleRadioEvent(this)">
                                                                    <input type="radio" name="pay-select">
                                                                    스마일페이
                                                                </label>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="payPage_txt_notice" colspan="2">
                                                    <ul class="payPage_txt_notice_list">
                                                        <li>※ 카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</li>
                                                        <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>                                                                                                        
                                                    </ul>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <!-- payPage 최종 결제 금액 -->
                            <div class="payPage_pay_total_inner">
                                <div class="payPage_pay_total_tit_div">
                                    <h2 class="payPage_pay_total_tit">
                                        결제금액
                                    </h2>
                                </div>
                                <div class="payPage_orderitem_div">
                                    <dl class="payPage_orderitem_amount payPage_orderitem_amount_fst clear">
                                        <dt class="payPage_orderitem_amount_tit">주문금액</dt>
                                        <dd class="payPage_orderitem_price">
                                            <span class="payPage_orderitem_total_price">95,000</span>
                                            원
                                        </dd>
                                    </dl>
                                    <dl class="payPage_orderitem_amount payPage_orderitem_amount_sub clear">
                                        <dt class="payPage_orderitem_amount_tit">상품금액</dt>
                                        <dd class="payPage_orderitem_price">
                                            <span class="payPage_orderitem_itemprice">95,000</span>
                                            원
                                        </dd>
                                    </dl>
                                    <dl class="payPage_orderitem_amount clear">
                                        <dt class="payPage_orderitem_amount_tit">배송비</dt>
                                        <dd class="payPage_orderitem_price payPage_orderitem_delivery_area">
                                            <span class="payPage_orderitem_delivery_price">
                                            	<fmt:formatNumber pattern="###,###,###" value="${order.deliveryFee}"></fmt:formatNumber>
                                            </span>
                                            원
                                        </dd>
                                    </dl>
                                    <dl class="payPage_orderitem_amount clear">
                                        <dt class="payPage_orderitem_amount_tit">적립금사용</dt>
                                        <dd class="payPage_orderitem_price payPage_orderitem_point_area">
                                            <span class="payPage_orderitem_point_num">0 원</span>
                                            <input type="hidden" name="payPage_point" size="12" value="0" readonly>
                                        </dd>
                                    </dl>
                                    <dl class="payPage_orderitem_amount payPage_orderitem_amount_1st clear">
                                        <dt class="payPage_orderitem_amount_tit">최종결제금액</dt>
                                        <dd class="payPage_orderitem_price">
                                            <span class="payPage_orderitem_add_total"></span>
                                            <span class="payPage_won">원</span>
                                        </dd>
                                    </dl>
                                </div>
                            </div>

                            <!-- payPage 개인정보 수집/제공 -->
                            <div class="payPage_focusAgree_div">
                                <div class="payPage_focusAgree_tit_div">
                                    <h2 class="payPage_focusAgree_tit">
                                        개인정보 수집/제공
                                    </h2>
                                </div>
                                <div class="payPage_focusAgree_table_div">
                                    <table class="payPage_focusAgree_table">
                                        <tr>
                                            <td class="payPage_focusAgree">
                                                <label class="payPage_focusAgree_check">                                                    
                                                    <input type="checkbox" name="ordAgree" value="y" class="agreeCheck">                                              
                                                    <span class="payPage_check_span_ico"></span>
                                                    <span class="payPage_check_span">결제 진행 필수 동의</span>
                                                    <input type="hidden" name="ordAgree" value="n" class="agreeCheck_hidden" >
                                                </label>
                                                <ul class="payPage_list_agree">
                                                    <li>
                                                        <span class="payPage_subject">
                                                            개인정보 수집 · 이용 및 처리 동의
                                                            <span class="payPage_emph">(필수)</span>
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <span class="payPage_subject">
                                                            결제대행 서비스 약관 동의 
                                                            <span class="payPage_emph">(필수)</span>
                                                        </span>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </table>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="button"  value="" class="payPage_paymant_btn" >
                </form>
                <ul class="payPage_notice_order_list">
                    <li>[배송준비중] 이전까지 주문 취소 가능합니다.</li>
                    <li>미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
                    <li>상품 미배송 시, 결제수단으로 환불됩니다.</li>
                    <li>카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불됩니다.</li>
                </ul>
            </div>
        </div>
    </div>

	<form action="/shop/pay/info" method="post" id="payForm">
		<input type="hidden" name="memberId" value="${order.memberId}">
		<input type="hidden" name="orderGoodsName" value="">	
		<input type="hidden" name="orderName" value="">
		<input type="hidden" name="orderPhone" value="">
		<input type="hidden" name="orderEmail" value="">
		<input type="hidden" name="deliveryName" value="">
		<input type="hidden" name="deliveryPhone" value="">
		<input type="hidden" name="deliveryLocation" value="">
		<input type="hidden" name="deliveryMessage" value="">
		<input type="hidden" name="entrancePw" value="">
		<input type="hidden" name="etcLocation" value="">
		<input type="hidden" name="address" value="${address.address}">
		<input type="hidden" name="addressSub" value="${address.addressSub}">
		<input type="hidden" name="zipcode" value="${address.zipcode}">
		<input type="hidden" name="payMethod" value="">
		<input type="hidden" name="totalPrice" value="" class="paypage_totalprice_input">
	</form>
    <div id="footer">
   		<%@ include file="../../includes/footer.jsp"  %>
    </div>
    
    

</body>
<script>

	
	// 상품수에 따라 결제 상품명 설정
	let goodsName = document.querySelectorAll(".payPage_item_list_name");
	
	if (goodsName.length > 1){
		orderGoodsName = goodsName[0].innerText + " 외 " +  (goodsName.length - 1) +"건"
	} else {
		orderGoodsName = goodsName[0].innerText;
	}
	
	// 결제 페이지 input 실시간 반영
	let orderName = document.querySelector("input[name='orderName']").value;
	let orderPhone = document.querySelector("input[name='orderPhone']").value;
	let orderEmail = document.querySelector("input[name='orderEmail']").value;
	let payMethod = document.querySelector("input[name='pay-select']").value;
	
	
	$("#orderName").on("propertychange change keyup paste input", function() {
		orderName = $(this).val();
		console.log(orderName);
	});
	$("#orderPhone").on("propertychange change keyup paste input", function() {
		orderPhone = $(this).val();
	});
	$("#orderEmail").on("propertychange change keyup paste input", function() {
		orderEmail = $(this).val();
	});
	$("input[name='pay-select']").on("propertychange change keyup paste input", function() {
		payMethod = $(this).val();
	});
	

	// 결제 form 전송
	$(".payPage_paymant_btn").on("click", function() {
		
		if (payInfoCheck()) {
			
			$("input[name='orderGoodsName']").val(orderGoodsName);
			$("input[name='orderName']").val(orderName);
			$("input[name='orderPhone']").val(orderPhone);
			$("input[name='orderEmail']").val(orderEmail);
			$("input[name='payMetho']").val(payMethod);
			
			$("#payForm").submit();
			
			$("input[name='orderName']").val('');
			$("input[name='orderPhone']").val('');
			$("input[name='orderEmail']").val('');
			$(".agreeCheck").prop('checked', false);
		}
	
	})
	

</script>
</html>