 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>delivery</title>
</head>
<body>
	<div class="delivery_input_div">	
			<div class="delivery_tit">
				<span class="delivery_tit_info">배송정보</span>			
				<label class="delivery_tit_same">
					<input type="checkbox" name="same" value="x" onclick="sameOrder(this.value)" class="delivery_sameBtn">
					<span class="delivery_same_checkBtn"></span>
					<span class="delivery_same_checkBtn_text">&nbsp;주문자 정보와 동일</span>		
				</label>		
			</div>
			<div class="delivery_info_user">
					<span class="delivery_input_tit">받으실 분</span>
					<span class="delivery_input_sub">*</span><br>
					<input type="text" name="deliveryName" class="delivery_input_text orderName" placeholder="이름을 입력해주세요" >
			</div>
			<div class="delivery_info_phone">
					<span class="delivery_input_tit">휴대폰</span>
					<span class="delivery_input_sub">*</span><br>
					<input type="text" name="deliveryPhone" class="delivery_input_text orderPhone" placeholder="숫자만 입력해주세요">
			</div>
            <div class="delivery_info_locaion">
	             	<span class="delivery_input_tit">받으실 장소</span>
	             	<span class="delivery_input_sub">*</span><br>
                 <ul class="delivery_info_locaion_select_list">
                     <li class="door">
                         <label class="delivery_info_locaion_radio" onclick="locationAddClass(this)">
                             <input type="radio" name="deliveryLocation" data-name="문 앞" value="door" onclick="noticeDisplay(this.value)" checked="checked">
                             &nbsp;&nbsp;문 앞
                         </label>
                     </li>
                     <li class="security">
                         <label class="delivery_info_locaion_radio" onclick="locationAddClass(this)">
                             <input type="radio" name="deliveryLocation" data-name="경비실" value="security" onclick="noticeDisplay(this.value)">
                             &nbsp;&nbsp;경비실
                         </label>
                     </li>
                     <li class="post">
                         <label class="delivery_info_locaion_radio" onclick="locationAddClass(this)">
                             <input type="radio" name="deliveryLocation" data-name="택배함" value="post" onclick="noticeDisplay(this.value)">
                             &nbsp;&nbsp;택배함
                         </label>
                     </li>
                     <li class="etc">
                         <label class="delivery_info_locaion_radio" onclick="locationAddClass(this)">
                             <input type="radio" name="deliveryLocation" value="etc" data-name="기타 장소" onclick="noticeDisplay(this.value)">
                             &nbsp;&nbsp;기타 장소
                         </label>
                     </li>
                 </ul>
            </div>
            <div class="delivery_entrance">
					<span class="delivery_input_tit">공동현관 비밀번호</span>
					<span class="delivery_input_sub">*</span><br>
					<input type="text" name="entrancePw" class="delivery_input_text" placeholder="공동현관 비밀번호">
			</div>
			
            <div class="delivery_location_etc">
					<span class="delivery_input_tit">기타 장소</span>
					<span class="delivery_input_sub">*</span><br>
					<input type="text" name="etcLocation" class="delivery_input_text" placeholder="장소를 입력해주세요">
			</div>
			
            <div class="delivery_info_message">
            	<div class="delivery_message_div">
	             	<span class="delivery_input_tit">배송 완료 메시지 전송</span>
	             	<span class="delivery_input_sub">*</span>
             	</div>
                 <ul class="delivery_info_message_select_list">
                     <li class="now">
                         <label class="message_simple_radio" onclick="messageAddClass(this)">
                             <input type="radio" name="deliveryMessage" value="now" data-name="배송 직후">
                             &nbsp;&nbsp;배송 직후
                         </label>
                     </li>
                     <li class="seven">
                         <label class="message_simple_radio" onclick="messageAddClass(this)" >
                             <input type="radio" name="deliveryMessage" value="seven" data-name="오전 7시">
                             &nbsp;&nbsp;오전 7시
                         </label>
                     </li>
                 </ul>
            </div>
            
            <div class="delivery_notice_back">
			<p class="delivery_notice_door">
				<span class="notice_check"><i class="fa-solid fa-check"></i> 확인해주세요!</span><br>
				<span class="notice_attention">&#183; 비밀번호가 정확하지 않을 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</span>
			</p>		
			<p class="delivery_notice_security">
				<span class="notice_check"><i class="fa-solid fa-check"></i> 확인해주세요!</span><br>
				<span class="notice_attention">&#183; 경비 부재로 출입이 불가능한 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</span>
			</p>		
			<p class="delivery_notice_post">
				<span class="notice_check"><i class="fa-solid fa-check"></i> 확인해주세요!</span><br>
				<span class="notice_attention">&#183; 자유출입이 불가능한 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</span>
			</p>		
			<p class="delivery_notice_etc">
				<span class="notice_check"><i class="fa-solid fa-check"></i> 확인해주세요!</span><br>
				<span class="notice_attention">&#183; 요청하신 방법으로 출입이 어려운 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수 있습니다.</span>
				<span class="notice_attention">배송 받으실 시간은 별도로 지정하실 수 없으며, 밤 11시까지 주문 시 오전 7시까지 배송이 완료됩니다.</span>
			</p>		
			</div>
			
			<div class="delivery_btn_div">
				<div class="delivery_close_btn_div">
					<button type="button" class="delivery_close_btn" onclick="closePopUp()">취소</button>
				</div>
				<div class="delivery_submit_btn_div">
					<button type="button" class="delivery_submit_btn" onclick="deliveryInsertInfo()">저장</button>
				</div>
			</div>
	</div>
	
<script>

	const orderName = '${order.orderName}';
	const orderPhone= '${order.orderPhone}';


</script>
</body>
</html>