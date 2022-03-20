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
	<script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/resources/js/javascript.js" defer></script>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<title>itemList page</title>
</head>
<body>

	<div id="header">
		<%@ include file="../../includes/header.jsp"%>
	</div>
	

	<div id="wrap">
	
		<!-- 검색 처리 -->
		
		
		
	<div class="itemList_inner">	
		<c:choose>
			<c:when test="${keyword != null}">
			
				<div class="search_inner">
					<div class="search_tit_div">
						<h2 class="search_tit">상품검색</h3>
					</div>
					<div class="saerch_option_div">
					<form id="searchList_frm" action="/shop/goods/search_list/" method="get">
						<span class="search_option_tit">검색조건</span>		
							<input class="search_option_input" type="text" value="${keyword}" name="keyword" >	
							<input type="hidden" name="priceSort" value="" class="searchList_sort">					
						<button type="submit" class="search_option_btn" onclick="searchList_form()">검색하기</button>
					</div>
					</form>
				</div>
				
			</c:when>

			<c:otherwise>	
			<!-- itemList 상단 서브메뉴 -->
			<div class="itemList_lnb_inner">
				<div class="itemlList_main_img_div">
					<img src="/resources/images/${categoryMainTitle}_main.png" alt="health">
				</div>

				<div class="itemList_tit_div">
				
					<c:forEach items="${categorys}" var="category" end="0">
						<h3 class="itemList_tit">
							<c:out value="${category.categoryMain}" />
						</h3>
					</c:forEach>
					
				</div>			
				<div class="itemList_lnb_div clear">
					<ul class="itemList_subList">
						<li>
							<a href='/shop/goods/goods_list?category=${categoryMainTitle}' class="itemList_allList_tit${categorySubTitle == null ? "_on" : ""}">전체보기</a>
						</li>
						
						<c:forEach items="${categorys}" var="category">				
							<li>
								<a href="${category.categorySubTitle}" class="itemList_subList_tit${category.categorySubTitle == categorySubTitle ? "_on" : "" }">
									<c:out value="${category.categorySub}" />
								</a>							
							</li>
						</c:forEach>	
						
					</ul>
				</div>
			</div>
			
			</c:otherwise>
		
		</c:choose>
	
		<!-- itemList 시작 -->
		
			<!-- itemList 솔트메뉴 -->
			<div class="itemList_sort_menu">
				<span class="itemList_count">총 ${total}개</span>
					<ul class="itemList_sort_menu_list">
						<li class="liteList_solt_li">
							<a href="new" class="itemList_sort_menu_list_atag${priceSort == 'new' ? "_on" : ""}">신상품순</a>
						</li>
						<li class="liteList_solt_li">
							<a href="asc" class="itemList_sort_menu_list_atag${priceSort == 'asc' ? "_on" : ""}">낮은 가격순</a>
						</li>
						<li class="liteList_solt_li">
							<a href="desc" class="itemList_sort_menu_list_atag${priceSort == 'desc' ? "_on" : ""}"">높은 가격순</a>
						</li>
					</ul>
			</div>

			<!-- itemList 리스트 -->
			<div class="itemList_list_div">
				<ul class="itemList_list">

					<c:forEach items="${goodsList}" var="goods">
						
						<li>
							<a class="goods_detail" href="${goods.goodsNo}">
								<div class="itemList_item">
									<div class="itemList_img_div">
										<div class="itemList_img">
											<img src="/resources/images/shop/goods/${goods.goodsImage}" alt="#">
										</div>
										<div class="itemList_cartBtn_div">
											<a href='${goods.goodsNo}' class="itemList_cartBtn"></a>
										</div>
									</div>
									<!--<a href="#" class="itmeList_info"> -->
									<span class="itemList_info item_name">${goods.goodsName}</span>
									<span class="itemList_info item_price"> 
										<fmt:formatNumber value="${goods.goodsPrice}" pattern="###,###,###" /></span> 
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
					<c:if test="${pageMaker.prev}">
						<a href="1" class="itemList_move_f itemList_first"><i class="fa-solid fa-angles-left"></i></a>
						<a href="${pageMaker.startPage - 1}" class="itemList_move_f itemList_pre"> <i class="fa-solid fa-angle-left"></i></a>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a href="${num}" class="itemList_move itemList_num${num == pageMaker.cri.pageNum ? "_on" : ""}" >${num}</a>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<a href="${pageMaker.endPage + 1}" class="itemList_move_f itemList_naxt"> <i class="fa-solid fa-angle-right"></i></a>
						<a href="${pageMaker.realEnd}" class="itemList_move_f itemList_last"> <i class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
		<!-- itemList 끝 -->

		<!-- 페이징 처리 -->
		<c:choose>
			<c:when test="${category.categorySubTitle == categorySubTitle}">
				<form action="/shop/goods/goods_list" id="item_listPage_Form" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden"name="amount" value="${pageMaker.cri.amount}"> 
					<input type="hidden" name="category" value="${categoryMainTitle}">
					<input type="hidden" name="priceSort" value="${priceSort}">
				</form>
			</c:when>
			
			<c:otherwise>
				<form action="/shop/goods/goods_sublist" id="item_listPage_Form" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
					<input type="hidden" name="category" value="${categorySubTitle}">
					<input type="hidden" name="priceSort" value="${priceSort}">
				</form>
			</c:otherwise>
		</c:choose>

		<!-- Sub 메뉴 이동 -->
		<form action="/shop/goods/goods_sublist" id="item_list_Form" me>
		</form>
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
	
	
	<sec:authorize access="isAuthenticated()"></sec:authorize>
	
<script>

$(document).ready(function() {
	
	let sessionId = "${sessionId}";

	const item_listForm = $("#item_list_Form");
	const item_listPageForm = $("#item_listPage_Form");

	// 상품 상세 이동
	$(".goods_detail").on("click", function(e) {
		
		e.preventDefault();
		item_listForm.append("<input type='hidden' name='goodsNo' value='" + $(this).attr("href") + "'>");
		item_listForm.attr("action","/shop/goods/goods_detail");
		item_listForm.submit();
		
	});

	// SUB 메뉴 이동 
	$(".itemList_subList_tit").on("click", function(e) {
		
		e.preventDefault();
		item_listForm.append("<input type='hidden' name='category' value='" + $(this).attr("href") + "'>");
		item_listForm.submit();		
		
	});

	// 페이징 처리
	$(".itemList_page_div_box a").on("click", function(e) {
		
		e.preventDefault();
		item_listPageForm.find("input[name='pageNum']").val($(this).attr("href"));
		item_listPageForm.submit();
		
	});

	// 가격순 정렬
	$(".itemList_sort_menu_list a").on("click", function(e) {
		
		e.preventDefault();
		var priceSort = $(this).attr("href");
		const keyword = '${keyword}';
		
		if (keyword != "") {
			$('.searchList_sort').val(priceSort);
			$('#searchList_frm').submit();
		} else {
			item_listPageForm.find("input[name='pageNum']").val("1");
			item_listPageForm.find("input[name='priceSort']").val(priceSort);
			item_listPageForm.submit(); 
		}
	});

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
	'<sec:authorize access="isAuthenticated()">'
	let memberId = '<sec:authentication property="principal.member.memberId"/>'
	'</sec:authorize>'
	
	'<sec:authorize access="isAnonymous()">'
	let memberId = "${sessionId}";
	'</sec:authorize>'
	
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
	
	
})//ready
</script>
	<div id="footer">
		<%@ include file="../../includes/footer.jsp"%>
	</div>
</body>
</html>