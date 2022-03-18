<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>    
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/js/javascript.js"></script>
    <script src="/resources/js/member.js"></script>
    <link rel="stylesheet" href="/resources/reset.css">
    <link rel="stylesheet" href="/resources/style.css">
</head>
<body>

	    <div id="header">
	   		<%@ include file="../includes/header.jsp"  %>
	    </div>
    
    </div>
    <div id="warp">         
            <div class="login_inner">
                <h3 class="login_h3">로그인</h3>                
                <div class="login_formBox">
                    <form action="#" name="login_form" method="get">                        
                        <input class="login_formBox_input" type="text" id="id" name="id" placeholder="아이디를 입력해 주세요."><br>
                        <input class="login_formBox_input" type="password" id="password" name="password" placeholder="비밀번호를 입력해 주세요.">

                        <div class="login_find_div">
                     	   <a href="#"><span class="login_id_find">아이디 찾기</span></a>
                     	   <div class="login_find_line"></div>
                     	   <a href="#"><span class="login_pw_find">비밀번호 찾기</span></a>
                        </div>
                        <button type="submit" class="login_loginBtn" onclick="login_check()">로그인</button>
                    </form>
                    <a href="/member/login/signup" class="login_signupBtn">회원가입</a>
                </div>
            </div>
    </div>
    
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
</body>
</html>