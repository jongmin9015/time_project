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
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>payPage</title>
</head>
<body>
    <div id="header">
   		<%@ include file="../../includes/header.jsp"  %>
    </div>
	
	<div id="paypage_body">
	
		<div class="paypage_title">
			<h1>결제하기</h1>
			<span>결제를 진행중입니다 잠시만 기다려주세요</span>
		</div>

	</div>
	
	
    <div id="footer">
   		<%@ include file="../../includes/footer.jsp"  %>
    </div>
</body>

<script>
	const memberId = "${payInfo.memberId}";
	const orderGoodsName = "${payInfo.orderGoodsName}";
	const orderName = "${payInfo.orderName}";
	const orderPhone = "${payInfo.orderPhone}";
	const orderEmail = "${payInfo.orderEmail}";
	const deliveryName = "${payInfo.deliveryName}";
	const deliveryPhone = "${payInfo.deliveryPhone}";
	const deliveryLocation = "${payInfo.deliveryLocation}";
	const deliveryMessage = "${payInfo.deliveryMessage}";
	const entrancePw = "${payInfo.entrancePw}";
	const etcLocation = "${payInfo.etcLocation}";
	const totalPrice = "${payInfo.totalPrice}";
	const address = "${payInfo.address}";
	const addressSub = "${payInfo.addressSub}";
	const zipcode = "${payInfo.zipcode}";
	const payMethod = "${payInfo.payMethod}" || 'kakaopay' ;
	const payId = "${payInfo.payId}";
	
	
		
	(function () {
		var IMP = window.IMP;
		IMP.init('imp63731846');

		IMP.request_pay({
		pg: 'inicis', 

		pay_method: payMethod,

		merchant_uid: payId,

		name: orderGoodsName,

		amount: totalPrice,

		buyer_email: orderEmail,
		buyer_name: orderName,
		buyer_tel: orderPhone,
		buyer_addr: address + " " + addressSub,
		buyer_postcode: zipcode,
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'

		}, function (rsp) {
			console.log(rsp);
			payResult = rsp.success;
			console.log(rsp.success);
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			location.href = "/";
			} else {
			var msg = '결제에 실패하였습니다. ';
			msg += '에러내용 : ' + rsp.error_msg;
			}
			
		
			alert(msg);						
			history.back();
			history.back();
			history.back();

				
			});
		}());
</script>
</html>