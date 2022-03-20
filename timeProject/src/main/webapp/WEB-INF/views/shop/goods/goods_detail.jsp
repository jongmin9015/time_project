<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="/resources/css/reset.css?detail">
    <link rel="stylesheet" href="/resources/css/style.css?detail">
    <title>itemViewPage</title>
</head>
<body>

   	<div id="header">
   		<%@ include file="../../includes/header.jsp"  %>
    </div>
    
    <div id="wrap">
        <!-- itemView 상단 상품이미지 및 구매수량, 구매 -->
        <div class="itemView_inner">
            <div class="itemView_pay_div clear">
                <div class="itemView_main_img_div">
                	<img class="itemView_main_img" src='/resources/images/shop/goods/<c:out value="${goods.goodsImage}"/>' alt="${goods.goodsImage}" >
                </div>
                <div class="itemView_iteminfo_div">
                
                    <div class="itemView_maintit_div">
                        <strong class="itemView_maintit"><c:out value="${goods.goodsName}"/></strong>
                        <span class="itemView_maintit_desc"><c:out value="${goods.goodsContent}"/></span>
                    </div>

                    <div class="itemView_price_div">
                        <span class="itemView_price"><fmt:formatNumber value="${goods.goodsPrice}" pattern="###,###,###"/></span>
                        <span class="itemView_price_won">원</span>
                    </div>

                    <div class="itemView_info_div">
                        <dl class="itemView_info_list">
                            <dt class="itemView_list_tit">판매단위</dt>
                            <dd class="itemView_list_desc"><c:out value="${goods.goodsUnit}"/></dd>
                        </dl>
                        <dl class="itemView_info_list">
                            <dt class="itemView_list_tit">중량/용량</dt>
                            <dd class="itemView_list_desc"><c:out value="${goods.goodsWeight}"/></dd>
                        </dl>
                        <dl class="itemView_info_list">
                            <dt class="itemView_list_tit">배송구분</dt>
                            <dd class="itemView_list_desc"><c:out value="${goods.goodsDelivery}"/></dd>
                        </dl>
                        <dl class="itemView_info_list">
                            <dt class="itemView_list_tit">포장타입</dt>
                            <dd class="itemView_list_desc"><c:out value="${goods.goodsPackage}"/></dd>
                        </dl>
                        <div class="itemView_option">
                            <ul class="itemView_option_list">
                                <li class="clear">
                                    <span class="itemView_tit_item">구매수량</span>
                                    <div class="itemView_item_count_div">
                                        <span class="itemView_item_count">
                                            <button type="button" class="itemView_btn itemViewDown" onclick="countBtn(this)"><i class="fa-solid fa-minus"></i></button>
                                            <input type="number" readonly="readonly" onfocus="this.blur()" class="itemView_count_input" value="1">
                                            <button type="button" class="itemView_btn itemViewUp" onclick="countBtn(this)"><i class="fa-solid fa-plus"></i></button>              
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="itemView_total clear">
                            <div class="itemView_total_price_div">
                                <span class="itemView_total_price_tit">총 상품금액: </span>
                                <span class="itemView_total_price">
                                <fmt:formatNumber pattern="###,###,###" value="${goods.goodsPrice}"></fmt:formatNumber>
                                </span>
                                <span class="itemView_total_won">원</span>
                            </div>
                        </div>
                        <div class="itemView_buyBtn_div">
                            <button class="itemView_buyBtn" onclick="itemViewCart(this)">장바구니 담기</button>                       
                        </div>
                        
                    </div>
                </div>                
            </div>

            <!-- itemView 상품상세 시작 -->
            <div class="itemView_info_inner">

                <!-- itemView 탭메뉴 -->
                <div class="itemView_tab_menu_div">
                    <ul class="itemView_tab_menu clear">
                        <li>
                            <a href="#itemView_info_img_div" class="itemView_tab_menu_tit tab_menu_tit_on" >상품설명</a>
                        </li>
                        <li>
                            <a href="#itemView_info_pic_div" class="itemView_tab_menu_tit" >상세정보</a>
                        </li>
                        <li>
                            <a href="#itemView_happy_div" class="itemView_tab_menu_tit" >교환 및 환불</a>
                        </li>
                    </ul>
                </div>

                <!-- itemView 제품설명 -->
                <div id="itemView_info_img_div">
                    <img src="/resources/images/gv30000266054_1.jpg" alt="">
                </div>
                <div class="itemView_info_tit_div">
                    <div class="itemView_tit_div">
                        <span class="itemView_subtit">
                            <c:out value="${goods.goodsContent}"/>
                        </span>
                        <h3 class="itemView_tit">
                            <c:out value="${goods.goodsName}"/>
                        </h3>
                    </div>
                    <p class="itemView_info_words">
                        국산 흑마늘의 영양을 고스란히 담아낸 마늘의 왕을 만나 보세요. 전통발효식품(흑마늘) 분야에서 토속문화 명인으로 선정된 백남국 명인이 정성껏 만들었답니다. 더욱 편안하게 섭취할 수 있도록 사과 농축액과 벌꿀을 더해 완성했고요. 한 포씩 깔끔하게 포장되어 있으니 매일 꾸준히 챙겨 드셔 보세요. 선물을 받는 분이 건강하시길 바라는 마음으로 선물해도 좋을 거예요.
                    </p>
                </div>

                <!-- itemView 상품 팁 -->
                <div class="itemView_tip_box">
                    <h3 class="itemView_tip_tit_div">
                        <span class="itemView_tip_tit">
                            Time's Tip
                        </span>
                    </h3>
                    <div class="itemView_tip_content">
                        <p class="itemView_words">
                            <strong>구입 전 확인사항</strong>
                            <b class="itemView_words_b">・</b> 선물세트를 넣을수 있는 전용 쇼핑백을 함께 보내드립니다.
                        </p>
                        <p class="itemView_words">
                            <strong>섭취법</strong>
                            <b class="itemView_words_b">・</b> 1일 1~2회, 1회 1포씩 드세요. 드시기 전에 충분히 흔들어 주세요.
                        </p>
                        <p class="itemView_words">
                            <strong>보관법</strong>
                            <b class="itemView_words_b">・</b> 직사광선을 피해 건조하고 서늘한 곳에 보관하세요.
                        </p>
                    </div>
                </div>

                <!-- itemView 제품설명사진 -->
                <div id="itemView_info_pic_div">
                    <img class="itemView_info_pic" src="/resources/images/gv40000266059_1.webp" alt="">
                </div>

                <!-- itemView 상품표기설명 -->
                <div class="itemView_table_div">
                    <table class="itemView_table" cellpadding="0" cellspacing="1">
                        <tr>
                            <th scope="row" class="itemView_table_head">제품명</th>
                            <td>상품설명 및 상품이미지 참조</td>
                            <th scope="row" class="itemView_table_head">식품의 유형</th>
                            <td>상품설명 및 상품이미지 참조</td>
                        </tr>
                        <tr>
                            <th scope="row" class="itemView_table_head">생산자및소재지(수입품의경우생산자,수입자및제조국)</th>
                            <td>상품설명 및 상품이미지 참조</td>
                            <th scope="row" class="itemView_table_head">제조연월일,유통기한또는품질유지기한</th>
                            <td>제품 별도 라벨 표기 참조</td>
                        </tr>
                        <tr>
                            <th scope="row" class="itemView_table_head">포장단위별 내용물의 용량(중량), 수량</th>
                            <td>상품설명 및 상품이미지 참조</td>
                            <th scope="row" class="itemView_table_head">원재료명및함량(농수산물의원산지표시에관한법률에따른원산지표시포함)</th>
                            <td>상품설명 및 상품이미지 참조</td>
                        </tr>
                        <tr>
                            <th scope="row" class="itemView_table_head">영양성분(식품등의표시·광고에관한법률에 따른 영양성분 표시대상 식품에 한함)</th>
                            <td>상품설명 및 상품이미지 참조</td>
                            <th scope="row" class="itemView_table_head">유전자변형식품에해당하는경우의표시</th>
                            <td>상품설명 및 상품이미지 참조</td>
                        </tr>
                        <tr>
                            <th scope="row" class="itemView_table_head">소비자안전을 위한 주의사항</th>
                            <td>상품설명 및 상품이미지 참조</td>
                            <th scope="row" class="itemView_table_head">수입식품에 해당하는 경우 “수입식품안전관리특별법에 따른 수입신고를 필함”의 문구</th>
                            <td>상품설명 및 상품이미지 참조</td>
                        </tr>
                        <tr>
                            <th scope="row" class="itemView_table_head">소비자상담관련전화번호</th>
                            <td>타임쇼핑 고객행복센터 (0000-0000)</td>
                            <th scope="row" class="itemView_table_head last_table_head"></th>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <!-- itemView 교환 및 환불 -->
                <div id="itemView_happy_div">
                    <div class="itemView_happy_tit_div clear">
                        <h4 class="itemView_happy_tit">교환 및 환불 안내</h4>
                        <p class="itemView_happy_subtit">교환 및 환불이 필요하신 경우 행복센터로 문의해주세요.</p>                        
                    </div>

                    <div class="itemView_happy_content_div">
                        <ul class="itemView_happy_content_list">
                            <li class="itemView_happy_content_list_li clear">
                                <span class="itemView_happy_content_tit">01. 상품에 문제가 있는 경우</span>
                                <p class="itemView_happy_content_desc">
                                    받으신 상품이 표시·광고 내용 또는 계약 내용과 다른 경우에는 상품을 받은 날부터 3개월 이내, 그 사실을 알게 된 날부터 30일 이내에 교환 및 환불을 요청하실 수 있습니다. 상품의 정확한 상태를 확인할 수 있도록 사진을 함께 보내주시면 더 빠른 상담이 가능합니다.
                                    <br><br>
                                    ※ 상품에 문제가 있는 것으로 확인되면 배송비는 time이 부담합니다.
                                </p>
                            </li>
                            <li class="itemView_happy_content_list_li clear">
                                <span class="itemView_happy_content_tit">02. 단순 변심, 주문 착오의 경우</span>
                                <p class="itemView_happy_content_desc">
                                    <strong class="itemView_happy_content_sub"> 신선 / 냉장 / 냉동 식품</strong><br>
                                    재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다.

                                    상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.
                                    <br><br>
                                    <strong class="itemView_happy_content_sub">유통기한 30일 이상 식품 (신선 / 냉장 / 냉동 제외) & 기타 상품</strong><br>
                                    상품을 받은 날부터 7일 이내에 고객행복센터로 문의해주세요.
                                    <br><br>
                                    ※ 단순 변심으로 인한 교환 또는 환불의 경우 고객님께서 배송비 6,000원을 부담하셔야 합니다.
                                    (주문 건 배송비를 결제하셨을 경우 3,000원)
                                </p>
                            </li>
                            <li class="itemView_happy_content_list_li clear">
                                <span class="itemView_happy_content_tit">03. 교환·반품이 불가한 경우</span>
                                <p class="itemView_happy_content_desc clear">
                                    다음에 해당하는 교환·환불 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.
                                    <ul class="itemView_happy_content_sublist">
                                        <li>
                                            고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우<br>(단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)
                                        </li>
                                        <li>고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우</li>
                                        <li>시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우</li>
                                        <li>복제가 가능한 상품의 포장이 훼손된 경우</li>
                                        <li>고객님의 주문에 따라 개별적으로 생산되는 상품의 제작이 이미 진행된 경우</li>
                                    </ul>
                                </p>
                            </li>
                            <li class="itemView_happy_content_list_li clear">
                                <span class="itemView_happy_content_tit">주문 취소 관련</span>
                                <p class="itemView_happy_content_desc">
                                    - [배송준비중] 부터는 취소가 불가하니, 반품으로 진행해주세요. (상품에 따라 반품이 불가할 수 있습니다.) <br>
                                    - 주문마감 시간에 임박할수록 취소 가능 시간이 짧아질 수 있습니다.<br>
                                    - 비회원은 App 또는 모바일 웹사이트에서 [마이컬리 > 비회원 주문조회 페이지] 에서 취소가 가능합니다.<br>
                                    - 일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.<br>
                                    - 주문상품의 부분취소는 불가능합니다. 전체 주문 취소 후 다시 구매 해주세요.<br>
                                </p>
                            </li>
                        </ul>
                    </div>

                    <!-- itemView 문의 - 미구현 -->
                    <!-- <div class="itemView_inquiry_div">
                        <div class="itemView_inquiry_tit_div">
                            <strong class="itemView_inquiry_tit">PRODUCT Q&A</strong>
                            <ul class="itemView_inquiry_sublist">
                                <li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</li>
                            </ul>
                        </div>
                        <div class="itemView_inquiry_board_header">
                            <div class="itemView_inquiry_board itemView_inquiry_con" style="width: 710px;">제목</div>
                            <div class="itemView_inquiry_board">작성자</div>
                            <div class="itemView_inquiry_board">작성일</div>
                            <div class="itemView_inquiry_board">답변상태</div>
                        </div>
                        <ul class="itemView_board_list">
                            <li class="inquiry_item board_item">등록된 문의가 없습니다.</li>
                        </ul>
                        <div class="itemView_board_list_btn_div">
                            <div class="itemView_board_list_pagin_div">
                                <button type="button" class="itemView_board_list_paginBtn_prev"><i class="fa-solid fa-angle-left"></i></button>
                                <button type="button" class="itemView_board_list_paginBtn_next"><i class="fa-solid fa-angle-right"></i></button>
                            </div>
                            <button class="itemView_board_list_add_btn">문의하기</button>
                        </div>
                    </div> -->

                </div>
            </div>
        </div>
    </div>
   	<div id="footer">
   		<%@ include file="../../includes/footer.jsp"  %>
    </div>
</body>

<script>

	// 로그인된 아이디 정보
	'<sec:authorize access="isAuthenticated()">'
	let memberId = '<sec:authentication property="principal.member.memberId"/>'
	'</sec:authorize>'
	
	'<sec:authorize access="isAnonymous()">'
	let memberId = "${sessionId}";
	'</sec:authorize>

	const goodsNo = '${goods.goodsNo}';
	
	
</script>
</html>