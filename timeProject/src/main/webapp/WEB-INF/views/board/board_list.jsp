<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="/resources/js/javascript.js" defer></script>
    <title>고객센터</title>
    <style>
    	/* 페이징 번호 클릭시 표시 클래스 */
        .boardList_page_aTag{
            background-color: #ddd;
            font-weight: 700;
            cursor: default;
        }
        /* 페이징 번호 컬러 수정 */
        .notice_page_div .notice_page_btn{
        	color: #333;
        }
        /* 게시글 제목 좌측정렬 및 글자 한줄로만 보이기 */
        .notice_table_contentTitle_td{
        	display: inline-block;
        	text-align: left !important;
        	width: 470px !important;
        	overflow : hidden;
        	text-overflow: ellipsis;
        	white-space : nowrap;
        }
        /* 글쓰기 버튼 */
        .bgno3_insert_Btn{
        	display: block;
        	float: right;
		    width: 150px;
		    line-height: 37px;
		    font-size: 13px;
		    text-align: center;
		    border: 1px solid #795b8f;
		    color: #fff;
		    background-color: #795b8f;
		    cursor: pointer;
        }
        .bgno3_insert_Btn:hover{
        	color: #795b8f;
        	background-color: #fff;
        }
    </style>
</head>
<body>
	<div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">
        <div class="notice_inner">
            <div class="notice_head_tit_div">
            <c:choose>
            	<c:when test="${pageMaker.cri.bgno == 1}">
                <h2 class="notice_head_tit">
                    공지사항
                    <span class="notice_head_sub">
                        컬리의 새로운 소식들과 유용한 정보들을 곳에서 확인하세요.
                    </span>
                    
            		<sec:authorize access="hasAuthority('role_admin')">
                    <a href="#" class="notice_admin_write_btn">공지글 작성</a>
                    </sec:authorize>
                    
                </h2>
                </c:when>
            	<c:when test="${pageMaker.cri.bgno == 2}">
                <h2 class="notice_head_tit">
                    자주하는 질문
                    <span class="notice_head_sub">
                        고객님들께서 가장 자주하시는 질문을 모두 모았습니다.
                    </span>
                    <sec:authorize access="hasAuthority('role_admin')">
                    <a href="#" class="notice_admin_write_btn">자주하는질문 작성</a>
                    </sec:authorize>
                </h2>
                </c:when>
            	<c:when test="${pageMaker.cri.bgno == 0}">
                <h2 class="notice_head_tit">
                    상품 리스트 관리                    
                    <sec:authorize access="hasAuthority('role_admin')">
                    <a href="#" class="boardGoods_admin_insert_btn">상품 입력</a>
                    <form id="boardGoodsInsertMove_frm" action="/board/boardGoodsInsert">
                    	<input type="hidden" name="bgno" value="${pageMaker.cri.bgno}">
                    </form>
                    </sec:authorize>
                </h2>
                </c:when>
            	<c:otherwise>
                <h2 class="notice_head_tit">
                    1:1 문의
                    <span class="notice_head_sub">
                    </span>
                </h2>
                </c:otherwise>
			</c:choose>
                <!-- <a href="/board/boardwrite">게시글 등록</a> -->

            </div>
            <form id="notice_frm" action="" onsubmit="return false;">
                <input type="hidden" name="id" value="notice">
                <div class="notice_table_inner">
                <c:choose>
                	<c:when test="${pageMaker.cri.bgno == 1}">
	                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
	                        <tr>
	                            <td>
	                                <div class="notice_table_div">
	                                    <table class="notice_table" width="100%" cellpadding="0" cellspacing="0">
	                                        <thead>
	                                            <tr class="notice_table_fir_tr">
	                                                <th>번호</th>
	                                                <th>제목</th>
	                                                <th>작성자</th>
	                                                <th>작성일</th>
	                                                <th>조회</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        <c:forEach items="${boardList }" var="boardList">
	                                            <tr class="notice_table_second_tr">
	                                                <td width="50" nowrap align="center">${boardList.bno }</td>
	                                                <td class="notice_table_contentTitle_td">
	                                                    <a href="#">
	                                                        <b class="notice_table_con_tit">
	                                                        <a href="/board/boardView?bno=${boardList.bno }&bgno=${pageMaker.cri.bgno}" class="notice_table_con_tit_atag">${boardList.title }</a>
	                                                        </b>
	                                                    </a>
	                                                </td>
	                                                <td width="100" nowrap align="center">
	                                                    ${boardList.writer }
	                                                </td>
	                                                <td width="100" nowrap align="center" class="notice_eng2">
	                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${boardList.regdate }"/>
	                                                    
	                                                </td>
	                                                <td width="100" nowrap align="center" class="notice_eng2">
	                                                    ${boardList.viewcnt }
	                                                </td>
	                                            </tr>                                            
	                                        </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </td>
	                        </tr>
	                    </table>
                   	</c:when>
                	<c:when test="${pageMaker.cri.bgno == 2}">
	                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
	                        <tr>
	                            <td>
	                                <div class="notice_table_div">
	                                    <table class="notice_table" width="100%" cellpadding="0" cellspacing="0">
	                                        <thead>
	                                            <tr class="notice_table_fir_tr">
	                                                <th>번호</th>
	                                                <th>카테고리</th>
	                                                <th>제목</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        <c:forEach items="${boardList }" var="boardList">
	                                            <tr class="notice_table_second_tr">
	                                                <td width="50" nowrap align="center" style="color: #333; font-size: 12px;">${boardList.bno }</td>
	                                                
	                                                <td width="100" nowrap align="center" style="color: #333; font-size: 12px;">
	                                                    ${boardList.category }
	                                                </td>
	                                                <td class="notice_table_contentTitle_td" style="width: 670px !important;">
	                                                    <a href="#">
	                                                        <b class="notice_table_con_tit">
	                                                        <a href="/board/boardView?bno=${boardList.bno }&bgno=${pageMaker.cri.bgno}" class="notice_table_con_tit_atag">${boardList.title }</a>
	                                                        </b>
	                                                    </a>
	                                                </td>
	                                            </tr>                                            
	                                        </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </td>
	                        </tr>
	                    </table>
                   	</c:when>
                   	<c:when test="${pageMaker.cri.bgno == 3}">
                   	<sec:authorize access="isAnonymous()">
                   	로그인 후 사용해 주세요 
                   	</sec:authorize>
            		<sec:authorize access="isAuthenticated()">
                   	
	                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
	                        <tr>
	                            <td>
	                                <div class="notice_table_div">
	                                    <table class="notice_table" width="100%" cellpadding="0" cellspacing="0">
	                                        <thead>
	                                            <tr class="notice_table_fir_tr">
	                                                <th style="width= 20px;">번호</th>
	                                                <th>카테고리</th>
	                                                <th>제목</th>
	                                                <th>작성자</th>
	                                                <th>작성일</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        <c:forEach items="${boardList }" var="boardList">
	                                            <tr class="notice_table_second_tr">
	                                                <td width="50" nowrap align="center">${boardList.bno }</td>
	                                                <td width="100" nowrap align="center" class="notice_eng2">
	                                                    ${boardList.category }
	                                                </td>
	                                                <td class="notice_table_contentTitle_td">
	                                                    <a href="#">
	                                                        <b class="notice_table_con_tit">
	                                                        <a href="/board/boardView?bno=${boardList.bno }&bgno=${pageMaker.cri.bgno}" class="notice_table_con_tit_atag">${boardList.title }</a>
	                                                        </b>
	                                                    </a>
	                                                </td>
	                                                <td width="100" nowrap align="center">
	                                                    ${boardList.writer }
	                                                </td>
	                                                <td width="100" nowrap align="center" class="notice_eng2">
	                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${boardList.regdate }"/>
	                                                    
	                                                </td>
	                                                
	                                            </tr>                                            
	                                        </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </td>
	                        </tr>
	                    </table>
	                </sec:authorize>
                   	</c:when>
                   	<c:when test="${pageMaker.cri.bgno == 0}">                   	
	            		<sec:authorize access="hasAuthority('role_admin')">
		                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
		                        <tr>
		                            <td>
		                                <div class="notice_table_div">
		                                    <table class="notice_table" width="100%" cellpadding="0" cellspacing="0">
		                                        <thead>
		                                            <tr class="notice_table_fir_tr">
		                                                <th style="width= 20px;">이미지</th>
		                                                <th>카테고리</th>
		                                                <th>상품명</th>
		                                                <th>상품가격</th>
		                                                <th></th>
		                                            </tr>
		                                        </thead>
		                                        <tbody>
		                                        <c:forEach items="${goodsList }" var="goods">
		                                            <tr class="notice_table_second_tr">
		                                                <td nowrap align="center" style="height: 115px;">
		                                                	<img src="/resources/images/shop/goods/${goods.goodsImage}" class="notice_goods_img" alt="#">
		                                                </td>
		                                                <td style="height: 115px;" nowrap align="center" class="notice_eng2">
		                                                    ${goods.goodsCategory }
		                                                </td>
		                                                <td style="height: 115px;" width="100%" class="notice_table_contentTitle_td">
		                                                    <a href="#">
		                                                        <b class="notice_table_con_tit">
		                                                        <a style="line-height: 80px;" href="${goods.goodsNo}" class="notice_goodsList_atag">${goods.goodsName }</a>
		                                                        </b>
		                                                    </a>
		                                                </td>
		                                                <td width="100" style="height: 115px;" nowrap align="center">
		                                                    ${goods.goodsPrice}원
		                                                </td>
		                                                <td width="100" style="height: 115px;" nowrap align="center" class="notice_eng2">
		                                                    <a href="${goods.goodsNo}" class="board_goodsList_delBtn_aTag"><i class="fa-solid fa-x board_goodsList_delBtn"></i></a>
		                                                </td>
		                                                
		                                            </tr>                                            
		                                        </c:forEach>
		                                        </tbody>
		                                    </table>
		                                </div>
		                            </td>
		                        </tr>
		                    </table>
		                </sec:authorize>
                   	</c:when>
                </c:choose>
                    <div class="notice_page_inner">                    	
                        <div class="notice_page_div">
                        	<!-- 이전페이지 -->
                        	<c:if test="${pageMaker.prev }">
	                            <a href="1" class="notice_page_btn notice_page_fir"><i class="fa-solid fa-angles-left"></i></a>
	                            <a href="${pageMaker.startPage - 1 }" class="notice_page_btn notice_page_fir"><i class="fa-solid fa-angle-left"></i></a>
	                        </c:if>
	                        
                        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">         	  
	                            <a href="${num }" class="notice_page_btn notice_page_num ${pageMaker.cri.pageNum == num ? "boardList_page_aTag":""}">${num }</a>
	                        </c:forEach>
	                        
	                        <!-- 다음페이지 -->
	                        <c:if test="${pageMaker.next }">
	                            <a href="${pageMaker.endPage + 1}" class="notice_page_btn notice_page_last"><i class="fa-solid fa-angle-right"></i></a>
	                            <a href="${pageMaker.realEnd}" class="notice_page_btn notice_page_last"><i class="fa-solid fa-angles-right"></i></a>
	                        </c:if>
                        </div>
                    </div>
                    <table class="notice_search_table">
                        <tr>
                        <c:choose>
                        	<c:when test="${pageMaker.cri.bgno == 1}">
                            <td class="notice_input_txt">
                                검색어
                            </td>
                            <td class="notice_stxt">
                                <input type="checkbox" name="searchType" class="boardSearchType" value="W" <c:out value="${pageMaker.cri.type eq 'W'?'checked':''}"/>>이름
                                <input type="checkbox" name="searchType" class="boardSearchType" value="T" <c:out value="${pageMaker.cri.type eq 'T'?'checked':''}"/>>제목
                                <input type="checkbox" name="searchType" class="boardSearchType" value="C" <c:out value="${pageMaker.cri.type eq 'C'?'checked':''}"/>>내용 &nbsp;
                            </td>
                            <td class="notice_input_txt">
                                &nbsp;
                            </td>
                            <td class="notice_search_bt">
                                <a href=""><!--  onclick="return notice_search_frm()" -->
                                    <img src="/resources/images/notice/search.webp" alt="">
                                </a>
                                <input id="notice_input_box" type="text" name="notice_search[word]" value="${pageMaker.cri.keyword }" required>
                                
                            </td>
                            </c:when>
                        	<c:when test="${pageMaker.cri.bgno == 2}">
                            <td class="notice_stxt">
                                <input type="hidden" name="searchType" class="boardSearchType" value="W" <c:out value="${pageMaker.cri.bgno eq '2'?'checked':''}"/>>
                                <input type="hidden" name="searchType" class="boardSearchType" value="T" <c:out value="${pageMaker.cri.bgno eq '2'?'checked':''}"/>>
                                <input type="hidden" name="searchType" class="boardSearchType" value="C" <c:out value="${pageMaker.cri.bgno eq '2'?'checked':''}"/>>
                            </td>
                            <td class="notice_search_bt">
                                <a href=""><!--  onclick="return notice_search_frm()" -->
                                    <img src="/resources/images/notice/search.webp" alt="">
                                </a>
                                <input id="notice_input_box" type="text" name="notice_search[word]" value="${pageMaker.cri.keyword }" required>
                                
                            </td>
                            </c:when>
                        	<c:when test="${pageMaker.cri.bgno == 3}">
                            
                            <td class="notice_bt">
                            <sec:authorize access="isAuthenticated()">
                                <a href="#" class="notice_admin_write_btn">글쓰기</a>
                            </sec:authorize>
                            </td>
                            </c:when>
                        </c:choose>
                        </tr>
                    </table>
                </div>
                
            </form>
            <sec:authorize access="isAnonymous()">
            <aside class="board_side_menu_bar">            
	                <div class="board_side_menu_inner">
	                    <h2>고객센터</h2>
	                    <div class="board_side_menu_list_inner">
	                        <ul class="board_side_menu_list">
	                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_notic ${pageMaker.cri.bgno eq '1'?'board_side_menu_click_aTag':'' }">공지 사항</a><span class="side_menu_arr"></span></li>
	                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_many ${pageMaker.cri.bgno eq '2'?'board_side_menu_click_aTag':'' }">자주 하는 질문</a><span class="side_menu_arr"></span></li>                         
	                            	                            
	                        </ul> 
	                    </div>
	                </div>	            
            </aside>
            </sec:authorize>
            <sec:authorize access="hasAuthority('role_member')">
            <aside class="board_side_menu_bar">            
	                <div class="board_side_menu_inner">
	                    <h2>고객센터</h2>
	                    <div class="board_side_menu_list_inner">
	                        <ul class="board_side_menu_list">
	                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_notic ${pageMaker.cri.bgno eq '1'?'board_side_menu_click_aTag':'' }">공지 사항</a><span class="side_menu_arr"></span></li>
	                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_many ${pageMaker.cri.bgno eq '2'?'board_side_menu_click_aTag':'' }">자주 하는 질문</a><span class="side_menu_arr"></span></li>
	                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_inquiry ${pageMaker.cri.bgno eq '3'?'board_side_menu_click_aTag':'' }">1:1문의</a><span class="side_menu_arr"></span></li>                            
	                            	                            
	                        </ul> 
	                    </div>
	                </div>	            
            </aside>
            </sec:authorize>
            <sec:authorize access="hasAuthority('role_admin')">
            <aside class="board_side_menu_bar">            
	                <div class="board_side_menu_inner">
	                    <h2>관리자 페이지</h2>
	                    <div class="board_side_menu_list_inner">
	                        <ul class="board_side_menu_list">
		                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_notic ${pageMaker.cri.bgno eq '1'?'board_side_menu_click_aTag':'' }">공지 사항 관리</a><span class="side_menu_arr"></span></li>
		                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_many ${pageMaker.cri.bgno eq '2'?'board_side_menu_click_aTag':'' }">자주 하는 질문 관리</a><span class="side_menu_arr"></span></li>
		                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_inquiry ${pageMaker.cri.bgno eq '3'?'board_side_menu_click_aTag':'' }">1:1문의 관리</a><span class="side_menu_arr"></span></li>	                            
		                            <li><a href="#" class="board_side_menu_list_Btn board_side_menu_list_Btn_goodsList ${pageMaker.cri.bgno eq '0'?'board_side_menu_click_aTag':'' }">상품리스트 관리</a><span class="side_menu_arr"></span></li>	                            
		                            	                            
	                        </ul> 
	                    </div>
	                </div>	            
            </aside>
            </sec:authorize>
		        
            
        </div>
        <!-- 페이징처리 -->
        <form id="boardListmoveForm" method="get" action="/board/board_list">
	        <input type="hidden" name="bgno" value="${pageMaker.cri.bgno }">
	        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
    	</form>
    	<form id="boardGoodsMoveForm" method="get" action="/shop/goods/goods_detail">
    	</form>
    </div>
    <script>
    	$(document).ready(function() {
    		//상품등록페이지 이동
    		$(".boardGoods_admin_insert_btn").on("click", function(e){
    			e.preventDefault();
    			let moveFrm = $("#boardGoodsInsertMove_frm");
    			moveFrm.find("input[name='goodsNo']").val().remove();
    			moveFrm.submit();
    		});
    		
    		$(".board_goodsList_delBtn_aTag").on("click",function(e){
    			e.preventDefault();
    			let moveFrm = $("#boardGoodsInsertMove_frm");
    			moveFrm.append("<input type='hidden' name='goodsNo' value='" + $(this).attr("href") + "'>");
    			moveFrm.attr("action", "/board/boardGoodsDelete");
    			moveFrm.submit();
    			
    		});
    		
    		// 상품 상세 이동
    		$(".notice_goodsList_atag").on("click", function(e) {
    			let item_listForm = $("#boardGoodsMoveForm");
    			e.preventDefault();
    			item_listForm.append("<input type='hidden' name='goodsNo' value='" + $(this).attr("href") + "'>");
    			item_listForm.attr("action","/shop/goods/goods_detail");
    			item_listForm.submit();
    			
    		});
    		
    		/* 페이징 번호 이동 작업 */
    		$(".notice_page_div a").on("click", function(e) {
    			
    			e.preventDefault();
    			$("input[name='pageNum']").val($(this).attr("href"));
    			console.log($("input[name='pageNum']").val())
    			boardListmoveForm.submit();
    			
    		});
    		
    		let fromList = $("#boardListmoveForm");
    		
    		/* 글작성 페이지 이동 */
    		let moveBtn = $(".notice_admin_write_btn");    		
    		moveBtn.on("click", function(e){
    			e.preventDefault();
    			fromList.attr("action", "/board/boardwrite");
    			fromList.submit();
    		});
    		
    		
    		let notice = $(".board_side_menu_list_Btn_notic");
    		let many = $(".board_side_menu_list_Btn_many");
    		let inquiry = $(".board_side_menu_list_Btn_inquiry");
    		let admin = $(".board_side_menu_list_Btn_admin");
    		let back = $(".board_side_menu_list_Btn_back_admin");
    		let goodsList = $(".board_side_menu_list_Btn_goodsList");
    		
    		
    		/* 서브메뉴 클릭 페이지 이동 */
    		notice.on("click",function(e){
    			e.preventDefault();
    			fromList.find("inpiut[name='keyword']").val("");
    			fromList.find("inpiut[name='type']").val("");
    			fromList.find("input[name='bgno']").val("1");
    			fromList.find("input[name='pageNum']").val("1");
    			fromList.submit();
    		});
    		
    		many.on("click",function(e){
    			e.preventDefault();
    			fromList.find("inpiut[name='keyword']").val('');
    			fromList.find("inpiut[name='type']").val('');
    			fromList.find("input[name='bgno']").val("2");
    			fromList.find("input[name='pageNum']").val("1");
    			fromList.submit();
    		});
    		
    		inquiry.on("click",function(e){   
    			e.preventDefault();
    			fromList.find("inpiut[name='keyword']").val('');
    			fromList.find("inpiut[name='type']").val('');
    			fromList.find("input[name='bgno']").val("3");
    			fromList.find("input[name='pageNum']").val("1");
    			fromList.submit();
    		});
    		
    		admin.on("click",function(e){   
    			e.preventDefault();
    			fromList.find("inpiut[name='keyword']").val('');
    			fromList.find("inpiut[name='type']").val('');
    			fromList.find("input[name='bgno']").val("0");
    			fromList.submit();
    		});
    		
    		 goodsList.on("click",function(e){   
    			e.preventDefault();
    			fromList.find("inpiut[name='keyword']").val('');
    			fromList.find("inpiut[name='type']").val('');
    			fromList.find("input[name='bgno']").val("0");
    			fromList.submit();
    		});
    		
    		back.on("click",function(e){   
    			e.preventDefault();
    			fromList.find("input[name='bgno']").val("1");
    			fromList.submit();
    		});
    		
    		
    		//검색
    		$(".notice_search_bt a").on("click", function(e){
    			e.preventDefault();
    			let checkTypeBgno = ${pageMaker.cri.bgno };
    			
    			
    			let typeArr = [];
    			let type = null;
    			
    			/* 인풋박스 value를 배열로 받음 */
    			$("input:checkbox[name='searchType']:checked").each(function(){
    				typeArr.push($(this).val());
    			});
    			/* 배열을 문자열로 변경 */
    			type = typeArr.join('');
    			    			
    			/* 키워드 */
    			let keyword = $("input[name='notice_search[word]']").val();
    			
    			if(checkTypeBgno == '2' || checkTypeBgno == '3'){
    				type = 'WTC';
    			}
    			
    			/* 키워드, 검색종류 미선택시 */
    			if(!type && !keyword){
    				keyword.value = '';
    			}else if(!type && keyword){
    				alert("검색 종류를 선택하세요.");
    				return false;
    			}else if(!keyword && type){
    				alert("키워드를 입력하세요.");
    	            return false;
    			}
    			
    			
    			$("input[name='type']").val(type);
    			$("input[name='keyword']").val(keyword);
    			$("input[name='pageNum']").val(1);
    			boardListmoveForm.submit();
    		});
    	});
    </script>
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
    
</body>
</html>