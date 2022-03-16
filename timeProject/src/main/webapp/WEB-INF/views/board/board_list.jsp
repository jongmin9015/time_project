<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>공지사항</title>
</head>
<body>
	<div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">
        <div class="notice_inner">
            <div class="notice_head_tit_div">
                <h2 class="notice_head_tit">
                    공지사항
                    <span class="notice_head_sub">
                        컬리의 새로운 소식들과 유용한 정보들을 곳에서 확인하세요.
                    </span>
                </h2>
                <a href="/board/boardwrite">게시글 등록</a>
            </div>
            <form id="notice_frm" action="">
                <input type="hidden" name="id" value="notice">
                <div class="notice_table_inner">
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
                                                <td>
                                                    <a href="#">
                                                        <b class="notice_table_con_tit">
                                                        <a href="/board/boardView?bno=${boardList.bno }" class="notice_table_con_tit_atag">${boardList.title }</a>
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
                    <div class="notice_page_inner">                    	
                        <div class="notice_page_div">
	                            <a href="#" class="notice_page_btn notice_page_fir"><i class="fa-solid fa-angles-left"></i></a>
	                            <a href="#" class="notice_page_btn notice_page_fir"><i class="fa-solid fa-angle-left"></i></a>
	                        
                        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">         	  
	                            <a href="${num }" class="notice_page_btn notice_page_num">${num }</a>
	                        </c:forEach>
	                            <a href="#" class="notice_page_btn notice_page_last"><i class="fa-solid fa-angle-right"></i></a>
	                            <a href="#" class="notice_page_btn notice_page_last"><i class="fa-solid fa-angles-right"></i></a>
                        </div>
                    </div>
                    <table class="notice_search_table">
                        <tr>
                            <td class="notice_input_txt">
                                검색어
                            </td>
                            <td class="notice_stxt">
                                <input type="checkbox" name="notice_search[name]" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>이름
                                <input type="checkbox" name="notice_search[title]" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목
                                <input type="checkbox" name="notice_search[content]" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용 &nbsp;
                            </td>
                            <td class="notice_input_txt">
                                &nbsp;
                            </td>
                            <td class="notice_search_bt">
                                <a href="" onclick="return notice_search_frm()">
                                    <img src="/resources/images/notice/search.webp" alt="">
                                </a>
                                <input id="notice_input_box" type="text" name="notice_search[word]" value="${pageMaker.cri.keyword }" required>
                                
                            </td>
                        </tr>
                    </table>
                </div>
                
            </form>
            
        </div>
        <!-- 페이징처리 -->
        <form id="boardListmoveForm" method="get" action="/board/board_list">
	        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
    	</form>
    </div>
    <script>
    	/* 페이징 번호 이동 작업 */
    	$(document).ready(function() {
    		$(".notice_page_div a").on("click", function(e) {
    			
    			e.preventDefault();
    			$("input[name='pageNum']").val($(this).attr("href"));
    			console.log($("input[name='pageNum']").val())
    			boardListmoveForm.submit();
    			
    		});
    		
    		//검색
    		$(".notice_search_bt a").on("click", function(e){
    			e.preventDefault();
    			let w = $(".notice_stxt checkbox").val();
    			let keyword = $("input[name='notice_search[word]']").val();
    			
    			if(!type){
    				alert("검색 종류를 선택하세요.");
    				return false;
    			}
    			if(!keyword){
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