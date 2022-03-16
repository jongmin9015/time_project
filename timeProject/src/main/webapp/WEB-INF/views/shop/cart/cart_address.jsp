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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>

	<div class="address_input_div">
		<input type="hidden" name="zipcode" class="zipcode" value="">
		<input type="hidden" name="memberId" class="memberId" value="${memberId}">
		<p class="address_tit">
			<span class="address_star">샛별배송</span><br><br>
			<span class="star_content">매일 아침, 문 앞까지 신선함을 전해드려요.</span>	
		</p>
		<div class="address_search_main">
			<input type="text" name="address" class="address" readonly value="">
			<button type="button" class="address_searchBtn" onclick="kakaoPost()">
			<i class="fa-solid fa-magnifying-glass"></i> 주소 찾기</button>
		</div>
		<div class="address_search_sub">
			<input type="text" name="addressSub" class="addressSub" placeholder="나머지 주소를 입력해주세요" data-max-length="79" value="">
		</div>
		<p class="address_notice">
			<span class="notice_login">로그인 할 경우, 회원님의 배송지 목록에 추가됩니다.</span>
		</p>		
		<c:choose>
		
			<c:when test="${form == 'update'}">
				<button type="button" class="address_saveBtn" onclick="closePop()">변경</button>
			</c:when>
			
			<c:otherwise>
				<button type="button" class="address_saveBtn" onclick="closePop()">저장</button>
			</c:otherwise>
			</c:choose>
	</div>
</body>





<script>

	const form = '${form}';
	//카카오 주소 검색 API
	function kakaoPost() {
	
    	new daum.Postcode({
    	    oncomplete: function(data) {
            document.querySelector(".address").value = data.address;
            document.querySelector(".zipcode").value = data.zonecode;       
        }
    	
	}).open();
    	
	}
	
	// 주소 유효성 검사 AND 주소 정보 전송후 팝업 창 닫기
   	function closePop() {
   		
		let addressInput = document.querySelector(".address");  		
   		
		if(addressInput.value == ""){
			alert("주소를 입력하세요.");
			addressInput.focus();
			return true;
		}	
		
		const address = addressInput.value;
		const addressSub = document.querySelector(".addressSub").value;
		const zipcode = document.querySelector(".zipcode").value;
		const memberId = document.querySelector(".memberId").value;
		
		const addressJson = {
				address : address,
				addressSub : addressSub,
				zipcode : zipcode,
				memberId : memberId
			};		
		
		// 배송지 변경
		if (form == 'update') {
			
			$.ajax({
				url : '/address/cart',
				type : 'put',
				data : JSON.stringify(addressJson),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					opener.location.href = '/shop/cart/move/';
					window.close(); 
				},
				error : function (error) {
					alert("에러발생");
				}
			});
		// 배송지 입력
		} else {
			
			$.ajax({
				url : '/address/cart',
				type : 'post',
				data : JSON.stringify(addressJson),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					opener.location.href = '/shop/cart/move/'
					window.close(); 
				},
				error : function (error) {
					alert("에러발생");
				}
			});
		};
		
	
	}
</script>
</html>
