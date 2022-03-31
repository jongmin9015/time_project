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
    <title>memberUpdate</title>
    <style>
		/* 탈퇴하기 버튼 */
    	.member_info_del{
    		background-color: #fff;
		    border: 1px solid #5f0080;
		    color: #333;
		    width: 120px;
		    height: 46px;
		    font-size: 13px;
		    font-weight: 700;
		    border-radius: 5px;
		    margin: 30px 0 100px 0;
		    cursor: pointer;
    	}
    	.member_info_del:hover{
    		color: #fff;
    		background-color: #5f0080;
    	}
    </style>
</head>
<body>
    <div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">            
    	<div class="signup_inner">
        	<h2 class="signup_h2">개인정보수정</h2>                 
            <div class="signup_forminner">
            	<div class="signup_formBox">                        
                	<form name="signup_form" method="post" class="signup_form" autocomplete="off" onsubmit="return memberUpdate()">
                    	<table class="signup_formtable">
	                         <tr>
	                             <th>아이디<!-- <span class="signup_check">*</span> --></th>
	                             <td>
	                                 <input class="signup_input" type="text" name="memberId" id="memberId" value="${member.memberId }" readonly="readonly">
	                                 <!-- <button type="button" class="signup_overlap signup_overlap_id" onclick="checkId()">중복확인</button> -->
	                                 <!-- <input type="hidden" name="overLapId" value="n" disabled="disabled"> -->
	                                 <!-- <button type="button" class="signup_overlap signup_overlap_id_ok" onclick="id_check()">중복확인</button><br> -->
	                              <!-- <p class="check_id_span_div">
	                              	<span class="check_id_span checK_id_six_success"><i class="fa-solid fa-check"></i> 6자 이상의 영문 혹은 영문과 숫자를 조합</span> 	
	                                 <span class="check_id_span checK_id_six_error"><i class="fa-solid fa-xmark"></i> 6자 이상의 영문 혹은 영문과 숫자를 조합</span>
	                                 <span class="check_id_span checK_id_overlap_success"><i class="fa-solid fa-check"></i> 아이디 중복확인</span>
	                                 <span class="check_id_span checK_id_overlap_error"><i class="fa-solid fa-xmark"></i> 아이디 중복확인</span> 	
	                             </p> -->
	                             </td>
	                         </tr>
    
                                
                             <tr>
                                 <th>비밀번호<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="password" name="memberPw" id="memberPw1" placeholder="비밀번호를 입력해주세요">
                                  <p class="check_id_span_div">
                                  	<span class="check_id_span checK_pw_success"><i class="fa-solid fa-check"></i> 8~16자 내외로 영문과 숫자를 조합</span> 	
                                     <span class="check_id_span checK_pw_error"><i class="fa-solid fa-xmark"></i> 8~16자 내외로 영문과 숫자를 조합</span>	
                                 </p>                                   
                                 </td>
                             </tr>
                             <tr>
                                 <th>비밀번호확인<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="password" name="memberPw2" id="memberPw2" placeholder="비밀번호를 한번 더 입력해주세요" >
                                 <p class="check_id_span_div">
                                  	<span class="check_id_span checK_pwsame_success"><i class="fa-solid fa-check"></i> 동일한 비밀번호를 입력해주세요</span> 	
                                     <span class="check_id_span checK_pwsame_error"><i class="fa-solid fa-xmark"></i> 동일한 비밀번호를 입력해주세요</span>	
                                 </p>                                      
                                 </td>
                             </tr>
                             <tr>
                                 <th>이름<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="text" name="memberName" id="username" value="${member.memberName }">                                    
                                 </td>
                             </tr>
                             <tr>
                                 <th>이메일<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="text" name="email" id="email" placeholder="예) timeproject@naver.com" value="${member.email }" >
                                     <button type="button" class="signup_overlap" onclick="checkEmail()">중복확인</button>                                  
                                     <input type="hidden" name="emailOverlap" value="n" disabled="disabled">                            
                                 </td>
                             </tr>
                             <tr>
                                 <th>휴대폰<span class="signup_check">*</span></th>
                                 <td>
                                     <input class="signup_input" type="tel" name="phone" id="phone" placeholder="숫자만 입력해주세요" maxlength="11" value="${member.phone }">
                                     <button class="signup_cartBtnOff" type="button" onclick="phoneAuthh()">인증번호 받기</button>                                  
                                     <div class="phone_auth">
                                     <input class="signup_input" type="tel" name="phoneAuth" id="phone" placeholder="인증번호를 입력해주세요" maxlength="4">
                                     <input type="hidden" value="n" name="phoneAuthCheck" disabled="disabled">
                                     <button class="signup_cartBtnOff" type="button" onclick="authCheck()">인증번호 인증</button>
                                     <p class="check_id_span_div">
                                  	<span class="check_id_span phone_auth_success"><i class="fa-solid fa-check"></i> 인증번호 확인</span> 	
                                  	<span class="check_id_span phone_auth_timer"></span> 	
                                     <span class="check_id_span phone_auth_error"><i class="fa-solid fa-xmark"></i> 인증번호 확인</span>
                                		</p>                               
                                 	</div>
                                 </td>
                             </tr>
                             <tr class="juso_tr">
                                 <th>주소<span class="signup_check">*</span></th>
                                 <td>
                                 	<br>
                                 	<div class="signup_jusosearch_div">
                                	     	<a href="#" class="signup_jusosearch" id="show">주소 검색</a><br>
                                 	    <span class="signup_juso_txt">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
                                     </div>
                                     <div class="signup_jusosearch_input">
                                     <input class="signup_input" type="text" name="address" readonly="readonly"><div style="height: 10px"></div>                      
                                     <input class="signup_input" type="text" name="addressSub" readonly="readonly">                        
                                     <input type="hidden" name="zipcode">      
                                     </div>                  
                                 </td>
                             </tr>
                             <tr>
                                 <th>성별</th>
                               	  <td class="signup_sex_input_td">
                                 	<label class="signup_select_input_label" onclick="genderRadioBtn(this)">
                                          <input type="radio" name="gender" value="male" id="male">
                                          <span class="gender_span">남자</span>
                                     </label>
                                 	<label class="signup_select_input_label" onclick="genderRadioBtn(this)">
                                          <input type="radio" name="gender" value="female" id="female">
                                          <span class="gender_span">여자</span>
                                     </label>
                                 	<label class="signup_select_input_label	" onclick="genderRadioBtn(this)">
                                          <input type="radio" name="gender" value="none" id="none">
                                          <span class="gender_span">선택안함</span> 
                                     </label>                                          
                                	 </td>
                             </tr>
                             <tr>
                                 <th>생년월일</th>
                                 <td>
                                 <div class="signup_birth_div">
                                     <input class="signup_birth_year_input signup_birth_input" id="year" type="text" name="birth_year" pattern="[0-9]+" size="4" maxlength="4" placeholder="YYYY">                    
                                     <span class="signup_birth_span"></span>
                                     <input class="signup_birth_month_input signup_birth_input" id="month" type="text" name="birth_month" pattern="[0-9]+" size="2" maxlength="2" placeholder="MM">                    
                                      <span class="signup_birth_span"></span>
                                     <input class="signup_birth_day_input signup_birth_input" id="day" type="text" name="birth_day" pattern="[0-9]+" size="2" maxlength="2" placeholder="DD"><br><br>
                                     <input type="hidden" name="birth">                   
                                 </div>
                                 </td>
                             </tr>                            
                         </table>
                            
			             <div class="signup_btn_div">                                
		                    <button type="button" class="member_info_del">탈퇴하기</button>
		                    <button type="submit" class="signup_submitBtn">회원정보수정</button>
			             </div>
		              </form>
                 </div>
                       
            </div>
        </div>
    </div>  
    <div class="juso_background">
        <div class="window">
		       	<div class="signup_address_input_div">
						<input type="hidden" name="zipcodeModal" class="zipcode" value="">
						<p class="address_tit">
							<span class="address_star">주소입력</span><br><br>	
						</p>
					<div class="address_search_main">
						<input type="text" name="addressModal" class="address" readonly value="">
						<button type="button" class="address_searchBtn" onclick="SignUpPost()">
						<i class="fa-solid fa-magnifying-glass"></i> 주소 찾기</button>
					</div>
					<div class="address_search_sub">
						<input type="text" name="addressSubModal" class="addressSub" placeholder="나머지 주소를 입력해주세요" data-max-length="79" value="">
					</div>		
					<div class="signup_address_btn_div" >
						<button type="button" class="signup_address_closeBtn" id="close">취소</button>
						<button type="button" class="signup_address_saveBtn" onclick="signupAddress()">저장</button>
		
					</div>
            </div>
        </div>
    </div>
    

    <div id="footer">
   		<%@ include file="../includes/footer.jsp"  %>
    </div>

</body>
<script>

	
	function show(){
	    document.querySelector(".juso_background").className = "juso_background show";
	}
	function close(){
	    document.querySelector(".juso_background").className = "juso_background";
	}
	
	document.querySelector("#show").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);
	

	

	$("#memberId").on("propertychange change keyup paste input", function() {
		
		const idSuccess = document.querySelector('.checK_id_six_success');
		const idError = document.querySelector('.checK_id_six_error');
		const overlapSuccess = document.querySelector('.checK_id_overlap_success');
		const overlapError = document.querySelector('.checK_id_overlap_error');
		const overLapId = document.querySelector('input[name="overLapId"]');
		
		const regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,16}$/;
		overLapId.value = 'n';
		
		if(regExp.test($(this).val())) {		
			idSuccess.style.display = 'block';
			idError.style.display = 'none';
		} else {
			idSuccess.style.display = 'none';
			idError.style.display = 'block';
		}
		
		if(overLapId.value == 'n') {
			overlapSuccess.style.display = 'none';
			overlapError.style.display = 'block';
		} else {
			overlapSuccess.style.display = 'block';
			overlapError.style.display = 'none';
		}
	});
 	$("#memberPw1").on("propertychange change keyup paste input", function() {
 		
 		const pwSuccess = document.querySelector('.checK_pw_success');
 		const pwError = document.querySelector('.checK_pw_error');


 		const regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
 		
		if(regExp.test($(this).val())) {		
			pwSuccess.style.display = 'block';
			pwError.style.display = 'none';
		} else {
			pwSuccess.style.display = 'none';
			pwError.style.display = 'block';
		}
	});
 	$("#memberPw2").on("propertychange change keyup paste input", function() {
 		const pwsameSuccess = document.querySelector('.checK_pwsame_success');
 		const pwsameError = document.querySelector('.checK_pwsame_error');
 		const pw1 = $("#memberPw1").val();
 		if (pw1 == $(this).val()){
			pwsameSuccess.style.display = 'block';
			pwsameError.style.display = 'none';
 		} else {
 			pwsameSuccess.style.display = 'none';
			pwsameError.style.display = 'block';
 		}
	});  
 	

 	$(".member_info_del").on("click", function(){
 		var result = confirm('탈퇴 하시겠습니까?');
 		
 		if(result){	
 			location.replace('/member/memberDelete');
 		}else{
 			return false;
 		}
 	});
	
 	
 	


 	
</script>

</html>