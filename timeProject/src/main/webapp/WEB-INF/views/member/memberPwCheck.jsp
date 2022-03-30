<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberPwCheck</title>    
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/js/javascript.js"></script>
    <script src="/resources/js/login.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <style>
    	.memberPw_check_span{
    		color: #333;
    		font-size: 12px;
    		text-align: center;
    	}
    </style>
</head>
<body>

	    <div id="header">
	   		<%@ include file="../includes/header.jsp"  %>
	    </div>
    
   
    <div id="warp">         
            <div class="login_inner">
                <h3 class="login_h3">개인정보수정<br><span class="memberPw_check_span">비밀번호 재확인</span> </h3>
                          
                <div class="login_formBox">
                    <form method="post" >                        
                        <input class="login_formBox_input" type="text" id="id" name="memberId" value="<sec:authentication property='principal.member.memberId'/>"><br>
                        <input class="login_formBox_input" type="password" id="password" name="memberPw" placeholder="비밀번호를 입력해 주세요."><br>
                       	<c:if test="${not empty param.fail}">
                       	 	<span class="login_error_span"><i class="fa-solid fa-xmark"></i> 비밀번호 오류입니다</span>
						</c:if>
                        <!-- <div class="login_find_div">
                        	<label class="remember_me_label">
                        		<input type="checkbox" name="remember-me" onchange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
                        		<span>자동로그인</span>
                        	</label>
                     	   <a href="#"><span class="login_id_find">아이디 찾기</span></a>
                     	   <div class="login_find_line"></div>
                     	   <a href="#"><span class="login_pw_find">비밀번호 찾기</span></a>
                        </div> -->
                        <button type="submit" class="memberPw_check_btn" onclick="login_ok()">확인</button>
                    </form>
                </div>
            </div>
    </div>
    
    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
</body>
</html>