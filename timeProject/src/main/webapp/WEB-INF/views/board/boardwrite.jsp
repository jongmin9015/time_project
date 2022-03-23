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
    <title>등록</title>
</head>
<body>
	<div id="header">
   		<%-- <%@ include file="../includes/header.jsp"  %> --%>
    </div>
    <div id="warp">
        <div class="noticeView_inner">
        <c:choose>
        	<c:when test="${bgno == 1}">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                    공지사항 등록                    
	                </h2>
	            </div>
            </c:when>
        	<c:when test="${bgno == 2}">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                   	자주하는질문 등록                    
	                </h2>
	                
	            </div>
            </c:when>
        	<c:when test="${bgno == 3}">
	            <div class="noticeView_tit_div">
	                <h2 class="noticeView_tit">
	                   	1:1문의 관리                    
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
                            	<input type="text" name="title" class="noticeWrite_inp noticeWrite_inp_title">
                            	<select name="category">
                            		<option value="10">회원</option>
                            		<option value="20">배송/포장</option>
                            		<option value="30">상품</option>
                            		<option value="40">서비스 이용</option>
                            		<option value="50">취소/교환/환불</option>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">작성자</th>
                            <td><input type="text" name="writer" class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>                        
                        <tr>
                            <td colspan="2" class="noticeView_contents">
                                <textarea name="content" cols="140" rows="20" class="noticeWrite_inp_content"></textarea>
                            </td>
                        </tr>
                    </table>
                    <div class="noticeView_listBtn_div clear">
                    	<input type="hidden" name="bgno" value="${bgno }">
                        <button type="submit" class="noticeWrite_submitBtn">등록</button>
                        <a href="javascript:history.back()" class="noticeWrite_backBtn">이전</a>
                    </div>                    
                </div>
            </form>
        </div>
    </div>
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
</body>
</html>