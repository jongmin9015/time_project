<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <script src="/resources/js/signup.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>memberInfo</title>
</head>
<body>
    <div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">            
    	<div class="signup_inner">
        	<h2 class="signup_h2">나의 정보</h2>                 
            <div class="signup_forminner">
            	<div class="signup_formBox">                        
                	<form name="signup_form" method="post" class="signup_form" autocomplete="off" onsubmit="return memberUpdate()">
                    	<table class="signup_formtable">
	                         <tr>
	                             <th>아이디<!-- <span class="signup_check">*</span> --></th>
	                             <td>
	                                 <input class="signup_input" type="text" name="memberId" id="memberId" value="${member.memberId }" readonly="readonly">	                                 
	                             </td>
	                         </tr>
    
                                
                             <!-- <tr>
                                 <th>비밀번호<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="password" name="memberPw" id="memberPw1" placeholder="비밀번호를 입력해주세요">
                                  <p class="check_id_span_div">
                                  	<span class="check_id_span checK_pw_success"><i class="fa-solid fa-check"></i> 8~16자 내외로 영문과 숫자를 조합</span> 	
                                     <span class="check_id_span checK_pw_error"><i class="fa-solid fa-xmark"></i> 8~16자 내외로 영문과 숫자를 조합</span>	
                                 </p>                                   
                                 </td>
                             </tr> -->
                             <!-- <tr>
                                 <th>비밀번호확인<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="password" name="memberPw2" id="memberPw2" placeholder="비밀번호를 한번 더 입력해주세요" >
                                 <p class="check_id_span_div">
                                  	<span class="check_id_span checK_pwsame_success"><i class="fa-solid fa-check"></i> 동일한 비밀번호를 입력해주세요</span> 	
                                     <span class="check_id_span checK_pwsame_error"><i class="fa-solid fa-xmark"></i> 동일한 비밀번호를 입력해주세요</span>	
                                 </p>                                      
                                 </td>
                             </tr> -->
                             <tr>
                                 <th>이름<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="text" name="memberName" id="username" value="${member.memberName }" readonly="readonly">                                    
                                 </td>
                             </tr>
                             <tr>
                                 <th>이메일<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="text" name="email" id="email" placeholder="예) timeproject@naver.com" value="${member.email }" readonly="readonly">                                                         
                                 </td>
                             </tr>
                             <tr>
                                 <th>휴대폰<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="tel" name="phone" id="phone" placeholder="숫자만 입력해주세요" maxlength="11" value="${member.phone }" readonly="readonly">
                                 </td>
                             </tr>
                             <tr class="juso_tr">
                                 <th>주소<span class="signup_check">*</span></th>
                                 <td>
                                 	${member.zipcode } &nbsp; ${member.address } &nbsp; ${member.address }
                                 </td>
                             </tr>
                             <tr>
                                 <th>성별</th>
                               	  <td class="signup_sex_input_td">
                               	  	${member.gender eq 'male'?'남자':''}
                               	  	${member.gender eq 'female'?'여자':''}
                               	  	${member.gender eq 'none'?'선택안함':''}                                 	                                         
                                	</td>
                             </tr>
                             <tr>
                                 <th>생년월일</th>
                                 <td>
                                 <div class="signup_birth_div">
                                     <input class="signup_birth_year_input signup_birth_input" id="year" type="text" name="birth_year" pattern="[0-9]+" size="4" maxlength="4" value="<fmt:formatDate value="${member.birth }" pattern="yyyy"/>" readonly="readonly">                    
                                     <span class="signup_birth_span"></span>
                                     <input class="signup_birth_month_input signup_birth_input" id="month" type="text" name="birth_month" pattern="[0-9]+" size="2" maxlength="2" value="<fmt:formatDate value="${member.birth }" pattern="MM"/>" readonly="readonly">                    
                                      <span class="signup_birth_span"></span>
                                     <input class="signup_birth_day_input signup_birth_input" id="day" type="text" name="birth_day" pattern="[0-9]+" size="2" maxlength="2" value="<fmt:formatDate value="${member.birth }" pattern="dd"/>" readonly="readonly"><br><br>
                                     <input type="hidden" name="birth">                   
                                 </div>
                                 </td>
                             </tr>                            
                         </table>
                            
			             <div class="signup_btn_div">                                
		                    <button type="button" class="signup_submitBtn">확인</button>
			             </div>
		              </form>
                 </div>
                       
            </div>
        </div>
    </div>     
    

    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>
	<form action="/" id="indexMoveFrm">
		
	</form>
	<script>
		$(".signup_submitBtn").on("click", function(){
			$("#indexMoveFrm").submit();
		})
	</script>
</body>
</html>