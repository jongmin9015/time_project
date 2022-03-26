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
    <title>상세페이지</title>
</head>
<body>
	<div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">
        <div class="noticeView_inner">
        <c:choose>
        	<c:when test="${bgno == 1 }">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    공지사항
	                    <p class="noticeView_sub">
	                        컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
	                    </p>
	                </h2>
	            </div>
	        </c:when>
        	<c:when test="${bgno == 2 }">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    자주하는 질문
	                    <p class="noticeView_sub">
	                        고객님들께서 가장 자주하시는 질문을 모두 모았습니다.
	                    </p>
	                </h2>
	            </div>
	        </c:when>
        	<c:when test="${bgno == 3 }">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    1:1 문의
	                </h2>
	            </div>
	        </c:when>
        </c:choose>
            <div class="noticeView_table_inner">
                <table class="noticeView_table">
                    <tr>
                        <th scope="row" style="border: none;">제목</th>
                        <td>
                        <c:choose>
                        	<c:when test="${bgno != 1 }">
                        		<span class="boardView_category_span">${boardView.category }</span>
                        	</c:when>
                        </c:choose>
                        ${boardView.title }
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">작성자</th>
                        <td>${boardView.writer }</td>
                    </tr>
                    <tr class="noticeView_etcArea">
                        <td colspan="2">
                            <ul class="clear">
                                <li class="noticeView_date">
                                    <strong class="noticeView_th">작성일</strong>
                                    <span class="noticeView_td">
                                    	<fmt:formatDate pattern="yyyy-MM-dd" value="${boardView.regdate }"/>
                                    </span>
                                </li>
                                <li class="noticeView_hit">
                                    <strong class="noticeView_th">조회수</strong>
                                    <span class="noticeView_td">${boardView.viewcnt }</span>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="noticeView_contents">
                            <textarea name="content" cols="140" rows="20" class="noticeView_inp_content" readonly style="border: none;">${boardView.content }</textarea>
                        </td>
                    </tr>
                </table>
                <div class="noticeView_listBtn_div clear">
                    <a href="#" class="boardList_aTag_Btn">목록</a>
                    <sec:authorize access="hasAuthority('role_admin')">
                    <a href="#" class="boardmodify_aTag_Btn">수정</a>
                    </sec:authorize>
                </div>
                <div class="noticeView_move_div">
                    <ul>
                        <li class="noticeView_prev clear">
                            <strong>이전글</strong>
                            <a href="${boardView.preno }" class="noticeView_next_prev_move_btn">${boardView.pretit }</a>
                        </li>
                        <li class="noticeView_next clear">
                            <strong>다음글</strong>
                            <a href="${boardView.nextno }" class="noticeView_next_prev_move_btn">${boardView.nexttit }</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<form id="infoForm" action="/board/boardmodify" method="get">
   		<input type="hidden" id="bno" name="bno" value='<c:out value="${boardView.bno }"/>'>
   		<input type="hidden" id="bgno" name="bgno" value='<c:out value="${bgno }"/>'>
   	</form>
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
    <script>
    	let formView = $("#infoForm");
    	/* 이전글 다음글 클릭 */
    	$(".noticeView_next_prev_move_btn").on("click", function(e){
    		e.preventDefault();
    		if($(this).text() == '이전글이 없습니다'){
    			alert($(this).text());
    			return false;
    		}else if($(this).text() == '다음글이 없습니다'){
    			alert($(this).text());
    			return false;
    		}
    		formView.attr("action", "/board/boardView");
    		formView.find("#bno").val($(this).attr("href"));
    		formView.submit();
    	});
    			
    	/* 게시글 목록 버튼 */
    	$(".boardList_aTag_Btn").on("click", function(e){
    		formView.find("#bno").remove();
    		formView.attr("action", "/board/board_list");
    		formView.submit();
    	});
    	
    	$(".boardmodify_aTag_Btn").on("click", function(e){
    		formView.attr("action", "/board/boardmodify");
    		formView.submit();
    	});
    	
    	/* textarea 자동 높이조절 */
    	let textarea = $("textarea[name='content']");
    	if(textarea){
    		textarea.each(function(){
    			$(this).height(this.scrollHeight);
    		});
    	}
    </script>
</body>
</html>