<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TimeShop</title>
	<script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <script type="/resources/js/header.js" defer></script>
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
							<a href="/shop/goods/goods_detail?goodsNo=${goods.goodsNo}">
								<div class="img_box">
									<img src="/resources/images/shop/goods/${goods.goodsImage}" alt="${goods.goodsImage}">
									<div class="itemList_cartBtn_div">
										<a href='${goods.goodsNo}' class="itemList_cartBtn"></a>
									</div>
								</div>
							</a>
								<div class="product">
									<a href="/shop/goods/goods_detail?goodsNo=${goods.goodsNo}">
									<span class="itemList_info index_item_name">${goods.goodsName}</span>
									</a>								
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
							<a href="/shop/goods/goods_detail?goodsNo=${goods.goodsNo}">
								<div class="img_box">
									<img src="/resources/images/shop/goods/${goods.goodsImage}"
										alt="${goods.goodsImage}">
									<div class="itemList_cartBtn_div">
										<a href='${goods.goodsNo}' class="itemList_cartBtn"></a>
									</div>
								</div>
							</a>
								<div class="product">
									<a href="/shop/goods/goods_detail?goodsNo=${goods.goodsNo}">
										<span class="itemList_info index_item_name">${goods.goodsName}</span>
									</a>
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
	
	
	<!--Modal Overlay -->
	<div class="modal_overlay">
		<div class="goodsList_cart_div modal">
			<dl class="goodsList_amount_list clear">
				<dt class="goodsList_cart_tit">
					<!-- 상품 제목 -->
				</dt>
			</dl>
			<li class="clear"><span class="goodsList_cart_price"> <!-- 상품 가격 -->
			</span>
				<div class="goodsList_count_div">
					<span class="itemView_item_count">
						<button class="itemView_btn itemViewDown">
							<i class="fa-solid fa-minus"></i>
						</button> <input type="number" readonly="readonly" onfocus="this.blur()" class="itemView_count_input" value="1">
						<button class="itemView_btn itemViewUp">
							<i class="fa-solid fa-plus"></i>
						</button>
					</span>
				</div></li>
			<div class="goodsList_amount_div">
				<dl class="goodsList_amount_list goodsList_amount_list_total">
					<dt class="goodsList_amount_tit">합계</dt>
					<dd class="goodsList_amount_price">
						<span class="goodsList_amount_price_num"></span> 
						<span class="goodsList_amount_price_won">원</span>
					</dd>

				</dl>
			</div>
			<div class="goodsList_btn_div">
				<div class="goodsList_close_btn_div">
					<button type="button" class="goodsList_close_btn">취소</button>
				</div>
				<div class="goodsList_submit_btn_div">
					<button type="submit" class="goodsList_submit_btn">장바구니 담기</button>
				</div>
			</div>
		</div>
	</div>
<script>
	// 모달창
	const modal = $(".modal_overlay");

	let goodsNo = "";

	$(".itemList_cartBtn_div a").on("click", function(e) {

		// 모달창 ON 스크롤 막기
		e.preventDefault();
		$("body").addClass("hidden");
		modal.fadeIn();	
		goodsNo = $(this).attr("href");

		// 상품 조회 WITH GOODS NO
		get(goodsNo, function(goods) {

			const goodsPrice = goods.goodsPrice.toLocaleString();
			$(".goodsList_cart_tit").html(goods.goodsName);
			$(".goodsList_cart_price").html(goodsPrice);
			$(".goodsList_amount_price_num").html(goodsPrice);
			
		});
		
	});

	// 모달창 내부 수량 카운트 UP
	let count = $(".itemView_count_input").attr("value")

	$(".itemViewUp").on("click", function() {

		const price = stringNumberToInt($(".goodsList_cart_price").html());
		$(".itemView_count_input").val(++count);
		let total = price * count;
		$(".goodsList_amount_price_num").html(priceToString(total));
		
	});

	// 모달창 내부 수량 카운트 DOWN
	$(".itemViewDown").on("click", function() {

		const price = stringNumberToInt($(".goodsList_cart_price").html());
		if (count > 0) {
			
			$(".itemView_count_input").val(--count);
			let total = price * count;
			$(".goodsList_amount_price_num").html(priceToString(total));
		}
		
	});

	// 모달창 종료시 창 닫고 수량 카운트 초기화
	$(".goodsList_close_btn").on("click", function() {

		modal.fadeOut();
		$("body").removeClass("hidden");
		$(".itemView_count_input").val(1);
		count = 1;
		
	});

	// 로그인된 아이디 정보
	const memberId = "${memberId}" || "${sessionId}";

	// 장바구니 담기
	$(".goodsList_submit_btn").on("click", function() {

		let cart = {
			goodsNo : goodsNo,
			memberId : memberId,
			cartCount : count
		};

		put(cart, function(result) {
			alert(result);
		})

		// 모달창 OFF 스크롤 기능 복구 COUNT 초기화
		modal.fadeOut();
		$("body").removeClass("hidden");
		$(".itemView_count_input").val(1);
		count = 1;
		
	});
</script>	
</body>
</html>








