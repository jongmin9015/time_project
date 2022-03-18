<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/326f61a68e.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="/resources/js/javascript.js" defer></script>
    <script src="/resources/js/member.js" defer></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>signup</title>
</head>
<body>
    <div id="header">
   		<%@ include file="../includes/header.jsp"  %>
    </div>
    <div id="warp">            
            <div class="signup_inner">
                <h2 class="signup_h2">회원가입</h2>
                <div class="signup_spanBox">
                    <span>*</span>
                    <span>필수입력사항</span>
                </div>
                <div class="signup_forminner">
                    <div class="signup_formBox">                        
                        <form action="#" name="signup_form" method="get">
                            <table class="signup_formtable">
                                <tr>
                                    <th>아이디<span class="signup_check">*</span></th>
                                    <td>
                                        <input class="signup_input" type="text" name="memberId" id="memberId" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" value="">
                                        <button type="button" class="signup_overlap signup_overlap_id" onclick="checkId()">중복확인</button>
                                        <input type="hidden" name="overLapId" value="n">
                                        <!-- <button type="button" class="signup_overlap signup_overlap_id_ok" onclick="id_check()">중복확인</button><br> -->
                                     <p class="check_id_span_div">
                                     	<span class="check_id_span checK_id_six_success"><i class="fa-solid fa-check"></i> 6자 이상의 영문 혹은 영문과 숫자를 조합</span> 	
                                        <span class="check_id_span checK_id_six_error"><i class="fa-solid fa-xmark"></i> 6자 이상의 영문 혹은 영문과 숫자를 조합</span>
                                        <span class="check_id_span checK_id_overlap_success"><i class="fa-solid fa-check"></i> 아이디 중복확인</span>
                                        <span class="check_id_span checK_id_overlap_error"><i class="fa-solid fa-xmark"></i> 아이디 중복확인</span> 	
                                    </p>
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
                                        <input class="signup_input" type="password" name="memberpw2" id="memberPw2" placeholder="비밀번호를 한번 더 입력해주세요">
                                    <p class="check_id_span_div">
                                     	<span class="check_id_span checK_pwsame_success"><i class="fa-solid fa-check"></i> 동일한 비밀번호를 입력해주세요</span> 	
                                        <span class="check_id_span checK_pwsame_error"><i class="fa-solid fa-xmark"></i> 동일한 비밀번호를 입력해주세요</span>	
                                    </p>                                      
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름<span class="signup_check">*</span></th>
                                    <td>
                                        <input class="signup_input" type="text" name="memberName" id="username" placeholder="이름을 입력해주세요">                                    
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일<span class="signup_check">*</span></th>
                                    <td>
                                        <input class="signup_input" type="text" name="email" id="email" placeholder="ex) timeproject@naver.com">
                                        <button type="button" class="signup_overlap" onclick="checkEmail()	">중복확인</button>                                  
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대폰<span class="signup_check">*</span></th>
                                    <td>
                                        <input class="signup_input" type="tel" name="phone" id="phone" placeholder="숫자만 입력해주세요">
                                        <button class="signup_cartBtnOff" type="button">인증번호 받기</button>                                  
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소<span class="signup_check">*</span></th>
                                    <td>
                                        <a href="#" class="signup_jusosearch" id="show">주소 검색</a><br>
                                        <span class="signup_juso_txt">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
                                        <input type="hidden" name="address">                        
                                        <input type="hidden" name="addressSub">                        
                                        <input type="hidden" name="zipcode">                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                  	  <td class="signup_sex_input_td">
                                    	<label class="signup_select_input_label" onclick="genderRadioBtn(this)">
                                             <input type="radio" name="gender">
                                                                    남자
                                        </label>
                                    	<label class="signup_select_input_label" onclick="genderRadioBtn(this)">
                                             <input type="radio" name="gender">
                                                                    여자
                                        </label>
                                    	<label class="signup_select_input_label	" onclick="genderRadioBtn(this)">
                                             <input type="radio" name="gender">
                                                                    선택안함
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
                                    </div>
                                    </td>
                                </tr>                            
                            </table>
                            <div class="signup_btn_div">                                
                                <button type="button" class="signup_backBtn" onclick="history.back()">이전으로</button>
                                <button type="submit" class="signup_submitBtn" onclick="signupform_check()">가입하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>  
    </div>
    
    
    <div class="juso_background">
        <div class="window">
            <div class="popup clear">
                <div class="popup_search_div">
                    <form action="#">                        
                        <input type="text" class="popup_search_input" placeholder="예) 판교역로 235, 분당 주공, 삼평동 681">
                        <button type="submit" class="popup_search_Btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
                <div class="popup_desc_div">
                    <h2 class="popup_tip">tip</h2>
                    <p class="popup_desc">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
                    <p class="popup_desc">도로명 + 건물번호</p>
                    <span class="popup_example">예) 판교역로 235,&nbsp;&nbsp;  제주 첨단로 242</span>
                    <p class="popup_desc2">지역명(동/리) + 번지</p>
                    <span class="popup_example">예) 삼평동 681,&nbsp;&nbsp; 제주 영평동 2181</span>
                    <p class="popup_desc2">지역명(동/리) + 건물명(아파트명)</p>
                    <span class="popup_example">예) 분당 주공,&nbsp;&nbsp; 연수동 주공3차</span>
                    <p class="popup_desc2">사서함명 + 번호</p>
                    <span class="popup_example">예) 분당우체국사서함 1~100</span>


                </div>
                <button id="close"><i class="fa-solid fa-xmark"></i></button>
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
	
	const idSuccess = document.querySelector('.checK_id_six_success');
	const idError = document.querySelector('.checK_id_six_error');
	const overlapSuccess = document.querySelector('.checK_id_overlap_success');
	const overlapError = document.querySelector('.checK_id_overlap_error');
	const overLapId = document.querySelector('input[name="overLapId"]');
	
	const pwSuccess = document.querySelector('.checK_pw_success');
	const pwError = document.querySelector('.checK_pw_error');
	const pwsameSuccess = document.querySelector('.checK_pwsame_success');
	const pwsameError = document.querySelector('.checK_pwsame_error');

	$("#memberId").on("propertychange change keyup paste input", function() {
		
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
 		const pw1 = $("#memberPw1").val();
 		if (pw1 == $(this).val()){
			pwsameSuccess.style.display = 'block';
			pwsameError.style.display = 'none';
 		} else {
 			pwsameSuccess.style.display = 'none';
			pwsameError.style.display = 'block';
 		}
	});  
</script>
</html>