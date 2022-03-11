<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>index</title>
	<script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="/resources/js/index.js"></script>
</head>
<body>

	<div id="header">
		<%@ include file="includes/header.jsp"%>
	</div>

	<div id="warp">
		<div class="main_inner">
			<div class="page">
				<div class="main_img_box">
					<button class="prevBtn">&lt;</button>
					<button class="nextBtn">&gt;</button>
					<ul class="slider">
						<li><a href="#" class="main_img_tag"><img src="/resources/images/main/main1.jpg" alt="main_jpg"></a></li>
						<li><a href="#" class="main_img_tag"><img src="/resources/images/main/main2.jpg" alt="main_jpg"></a></li>
						<li><a href="#" class="main_img_tag"><img src="/resources/images/main/main3.jpg" alt="main_jpg"></a></li>
					</ul>
				</div>
			</div>
			<div class="main_tit_box">
				<h1 class="main_tit">이건 어떠세요?</h1>
			</div>

			<div class="main_content_box">
				<ul class="main_content_list">
					<c:forEach items="${goodsList}" var="goods">
					
						<li>
							<a href="#">
								<div class="img_box">
									<img src="/resources/images/shop/goods/${goods.goodsImage}" alt="${goods.goodsImage}">
									<div class="itemList_cartBtn_div">
										<a href='${goods.goodsNo}' class="itemList_cartBtn"></a>
									</div>
								</div>
							</a>
								<div class="product">
									<span class="itemList_info index_item_name">${goods.goodsName}</span>
									<span class="itemList_info item_price"> <fmt:formatNumber value="${goods.goodsPrice}" pattern="###,###,###" />
									</span><span class="itemList_info item_desc">${goods.goodsContent}</span>
								</div>
						</li>
						
					</c:forEach>
				</ul>
			</div>
			
			<div class="event_inner">
				<ul class="event_list">
					<li>
						<a href="#">
							<div class="imgBox"><img src="/resources/images/event/event01.jpg" alt="event01">
							</div>
						</a>
					</li>
				</ul>
			</div>

			<div class="main_tit_box">
				<h1 class="main_tit">이건 안사면 후회!</h1>
			</div>
			<div class="main_content_box">
				<ul class="main_content_list">
					<c:forEach items="${goodsList}" var="goods">

						<li>
							<a href="#">
								<div class="img_box">
									<img src="/resources/images/shop/goods/${goods.goodsImage}"
										alt="${goods.goodsImage}">
									<div class="itemList_cartBtn_div">
										<a href='${goods.goodsNo}' class="itemList_cartBtn"></a>
									</div>
								</div>
							</a>
								<div class="product">
									<span class="itemList_info index_item_name">${goods.goodsName}</span>
									<span class="itemList_info item_price"> <fmt:formatNumber value="${goods.goodsPrice}" pattern="###,###,###" />
									</span> <span class="itemList_info item_desc">${goods.goodsContent}</span>
								</div>
						</li>

					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
	
	<div id="footer">
		<%@ include file="includes/footer.jsp"%>
	</div>
</body>
</html>








