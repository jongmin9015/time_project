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
   		<%@ include file="../../includes/header.jsp"  %>
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
                                            <tr class="notice_table_second_tr">
                                                <td width="50" nowrap align="center">공지</td>
                                                <td>
                                                    <a href="#">
                                                        <b class="notice_table_con_tit">마켓컬리 배송안내</b>
                                                    </a>
                                                </td>
                                                <td width="100" nowrap align="center">
                                                    Time
                                                </td>
                                                <td width="100" nowrap align="center" class="notice_eng2">
                                                    2016-01-08
                                                </td>
                                                <td width="100" nowrap align="center" class="notice_eng2">
                                                    3041075
                                                </td>
                                            </tr>
                                            <tr class="notice_table_second_tr">
                                                <td width="50" nowrap align="center">공지</td>
                                                <td>
                                                    <a href="#">
                                                        <b class="notice_table_con_tit">마켓컬리 배송안내</b>
                                                    </a>
                                                </td>
                                                <td width="100" nowrap align="center">
                                                    Time
                                                </td>
                                                <td width="100" nowrap align="center" class="notice_eng2">
                                                    2016-01-08
                                                </td>
                                                <td width="100" nowrap align="center" class="notice_eng2">
                                                    3041075
                                                </td>
                                            </tr>
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
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">1</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">2</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">3</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">4</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">5</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">6</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">7</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">8</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">9</a>
                            <a onclick="notice_page_addClass(this)" href="#" class="notice_page_btn notice_page_num">10</a>
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
                                <input type="checkbox" name="notice_search[name]">이름
                                <input type="checkbox" name="notice_search[subject]">제목
                                <input type="checkbox" name="notice_search[content]">내용 &nbsp;
                            </td>
                            <td class="notice_input_txt">
                                &nbsp;
                            </td>
                            <td class="notice_search_bt">
                                <a href="" onclick="return notice_search_frm()">
                                    <img src="/resources/images/notice/search.webp" alt="">
                                </a>
                                <input id="notice_input_box" type="text" name="notice_search[word]" value required>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            
        </div>
    </div>
    <div id="footer">
   		<%@ include file="../../includes/footer.jsp"  %>
    </div>
</body>
</html>