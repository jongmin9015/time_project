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
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>payPage</title>
</head>
<body>






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
	
	console.log(memberId)
	console.log(orderGoodsName)
	console.log(orderName)
	console.log(orderPhone)
	console.log(orderEmail)
	console.log(deliveryPhone)
	console.log(deliveryLocation)
	console.log(deliveryMessage)
	console.log(entrancePw)
	console.log(etcLocation)
	console.log(totalPrice)
	console.log(address)
	console.log(addressSub)
	console.log(zipcode)
</script>
</html>