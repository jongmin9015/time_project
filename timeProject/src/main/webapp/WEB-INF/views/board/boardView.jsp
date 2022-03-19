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
    <title>공지사항 상세페이지</title>
</head>
<body>
	<div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">
        <div class="noticeView_inner">
            <div class="noticeView_tit_div">
                <h2 class="noticeView_tit">
                    공지사항
                    <p class="noticeView_sub">
                        컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
                    </p>
                </h2>
            </div>
            <div class="noticeView_table_inner">
                <table class="noticeView_table">
                    <tr>
                        <th scope="row" style="border: none;">제목</th>
                        <td>${boardView.title }</td>
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
                            <textarea name="content" cols="140" rows="20" class="noticeView_inp_content" readonly>${boardView.content }</textarea>
                        </td>
                    </tr>
                </table>
                <div class="noticeView_listBtn_div clear">
                    <a href="#" class="boardList_aTag_Btn">목록</a>
                    <a href="#" class="boardmodify_aTag_Btn">수정</a>
                </div>
                <div class="noticeView_move_div">
                    <ul>
                        <li class="noticeView_prev clear">
                            <strong>이전글</strong>
                            <a href="/board/boardView?bno=${boardView.bno-1}">[가격인상공지] [지위픽] DOG 에어드라이 사슴고기 1kg 외 52건 (2022 3. 18 ~)</a>
                        </li>
                        <li class="noticeView_next clear">
                            <strong>다음글</strong>
                            <a href="/board/boardView?bno=${boardView.bno+1}">[가격인상공지] [온맘] 엄마의식탁 김자반 (2022 3. 18 ~)</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<form id="infoForm" action="/board/boardmodify" method="get">
   		<input type="hidden" id="bno" name="bno" value='<c:out value="${boardView.bno }"/>'>
   	</form>
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
    <script>
    	let form = $("#infoForm");
    	
    	/* 게시글 목록 버튼 */
    	$(".boardList_aTag_Btn").on("click", function(e){
    		form.find("#bno").remove();
    		form.attr("action", "/board/board_list");
    		form.submit();
    	});
    	
    	$(".boardmodify_aTag_Btn").on("click", function(e){
    		form.attr("action", "/board/boardmodify");
    		form.submit();
    	});
    </script>
</body>
</html>