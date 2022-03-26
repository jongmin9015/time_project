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
    <title>공지사항 수정</title>
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
	                    공지사항 수정
	                </h2>
	            </div>
	        </c:when>
        	<c:when test="${bgno == 2 }">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    자주 하는 질문 수정
	                </h2>
	            </div>
	        </c:when>
        	<c:when test="${bgno == 3 }">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    1:1문의 수정
	                </h2>
	            </div>
	        </c:when>
        </c:choose>
            <form method="post" id="noticewriter_frm">
                <div class="noticeView_table_inner">
                    <table class="noticeView_table">
                        <tr>
                            <th scope="row" style="border: none;">제목</th>
                            <td>
                            	<input type="text" name="title" value="${boardView.title }" class="noticeWrite_inp noticeWrite_inp_title">
                            	<c:choose>
                            		<c:when test="${bgno != 1 }">                            			
                            			<select name="category">
		                            		<option value="회원" <c:out value="${boardView.category eq '회원'?'selected':''}"/>>회원</option>
		                            		<option value="배송/포장" <c:out value="${boardView.category eq '배송/포장'?'selected':''}"/>>배송/포장</option>
		                            		<option value="상품" <c:out value="${boardView.category eq '상품'?'selected':''}"/>>상품</option>
		                            		<option value="서비스 이용" <c:out value="${boardView.category eq '서비스 이용'?'selected':''}"/>>서비스 이용</option>
		                            		<option value="취소/교환/환불" <c:out value="${boardView.category eq '취소/교환/환불'?'selected':''}"/>>취소/교환/환불</option>
		                            	</select>
                            		</c:when>
                            		<c:otherwise>                            		
                            			<input type="hidden" name="category" value="-">
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">작성자</th>
                            <td><input type="text" name="writer" value="${boardView.writer }" readonly="readonly" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>
                        <tr class="noticeView_etcArea">
                            <td colspan="2">
                                <ul class="clear">
                                    <li class="noticeView_date">
                                        <strong class="noticeView_th">작성일</strong>
                                        <span class="noticeView_td"><fmt:formatDate pattern="yyyy-MM-dd" value="${boardView.regdate }"/></span>
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
                                <textarea name="content" cols="140" rows="20" class="noticeWrite_inp_content">${boardView.content }</textarea>
                            </td>
                        </tr>
                    </table>
                    <div class="noticeView_listBtn_div clear">
                        <button type="submit" class="noticeWrite_submitBtn">수정</button>
                        <a href="#" class="noticeWrite_backBtn boardDelete_aTag_Btn">삭제</a>
                        <a href="#" class="noticeWrite_backBtn boardView_aTag_Btn">수정취소</a>
                        <a href="#" class="noticeWrite_backBtn boardList_aTag_Btn">목록</a>
                    </div>

                </div>
            </form>
            
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
    $(document).ready(function(){
    	/* 등록 수정 삭제 시 alert창 띄우기 */
    	let result = '<c:out value="${result}"/>';    	
    	
    	checkAlert(result);
    	console.log(result);
    	
    	function checkAlert(result){
    		if(result === ''){
    			return;
    		}
    		if(result === "enrol success"){
    			alert("등록이 완료되었습니다.");
    		}
    		if(result === "modify success"){
    			alert("수정이 완료되었습니다.");
    		}
    		if(result === "delete success"){
    			alert("삭제가 완료되었습니다.");
    			console.log("test");
    		}
    	}
    });
    
    	let formModify = $("#infoForm");
    	let mForm = $("#noticewriter_frm");
    	
    	/* 목록 페이지 이동 */
    	$(".boardList_aTag_Btn").on("click", function(e){
    		e.preventDefault();
    		formModify.find("#bno").remove();
    		formModify.attr("action", "/board/board_list");
    		formModify.submit();
    	});
    	
    	/* 수정 취소 버튼 */
    	$(".boardView_aTag_Btn").on("click", function(e){
    		e.preventDefault();
    		formModify.attr("action", "/board/boardView");
    		formModify.submit();
    	});
    	
    	/* 삭제 버튼 */    	
    	$(".boardDelete_aTag_Btn").on("click", function(e){
    		e.preventDefault();
    		formModify.attr("action", "/board/boardDelete");
    		formModify.attr("method", "post");
    		formModify.submit();
    	});
    	
    </script>
</body>
</html>