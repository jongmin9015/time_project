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
        <div class="noticeView_inner">
            <div class="noticeView_tit_div">
                <h2 class="noticeView_tit">
                    공지사항 수정
                    <!-- <p class="noticeView_sub">
                        컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.
                    </p> -->
                </h2>
            </div>
            <form method="post" id="noticewriter_frm">
                <div class="noticeView_table_inner">
                    <table class="noticeView_table">
                        <tr>
                            <th scope="row" style="border: none;">제목</th>
                            <td><input type="text" name="title" value="${boardView.title }" class="noticeWrite_inp noticeWrite_inp_title"></td>
                        </tr>
                        <tr>
                            <th scope="row">작성자</th>
                            <td><input type="text" name="writer" value="${boardView.writer } class="noticeWrite_inp noticeWrite_inp_writer"></td>
                        </tr>
                        <!-- <tr class="noticeView_etcArea">
                            <td colspan="2">
                                <ul class="clear">
                                    <li class="noticeView_date">
                                        <strong class="noticeView_th">작성일</strong>
                                        <span class="noticeView_td">2022-01-03</span>
                                    </li>
                                    <li class="noticeView_hit">
                                        <strong class="noticeView_th">조회수</strong>
                                        <span class="noticeView_td">34528</span>
                                    </li>
                                </ul>
                            </td>
                        </tr> -->
                        <tr>
                            <td colspan="2" class="noticeView_contents">
                                <textarea name="content" cols="140" rows="20" value="${boardView.content }" class="noticeWrite_inp_content"></textarea>
                            </td>
                        </tr>
                    </table>
                    <div class="noticeView_listBtn_div clear">
                        <button type="submit" class="noticeWrite_submitBtn">수정</button>
                        <a href="javascript:history.back()" class="noticeWrite_backBtn">이전</a>
                    </div>
                    <!-- <div class="noticeView_move_div">
                        <ul>
                            <li class="noticeView_prev clear">
                                <strong>이전글</strong>
                                <a href="">[가격인상공지] [지위픽] DOG 에어드라이 사슴고기 1kg 외 52건 (2022 3. 18 ~)</a>
                            </li>
                            <li class="noticeView_next clear">
                                <strong>다음글</strong>
                                <a href="">[가격인상공지] [온맘] 엄마의식탁 김자반 (2022 3. 18 ~)</a>
                            </li>
                        </ul>
                    </div> -->
                </div>
            </form>
        </div>
    </div>
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
</body>
</html>