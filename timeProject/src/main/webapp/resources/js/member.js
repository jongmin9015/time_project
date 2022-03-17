//로그인 유효성
function login_check(){
    var id = document.getElementById("id");
    var pw = document.getElementById("password");

    if(id.value == ""){
        alert("아이디를 입력하세요.");
        id.focus();
        return false;
    };

    if(pw.value == ""){
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    };

    document.login_form.submit();

};


// 회원가입 성별 RADIO버튼
function genderRadioBtn(v){
	const radioLabel = document.querySelectorAll('.signup_select_input_label');
	
	v.onclick = function() {
		for(let i = 0; i < radioLabel.length; i++){
			if(v == radioLabel[i]) {
				radioLabel[i].classList.add('signup_select_input_label_on');
			} else
				radioLabel[i].classList.remove('signup_select_input_label_on');
		}
	}
	
}


// 아이디 중복 체크
function checkId() {
	
	
	const memberIdInput = document.querySelector('.signup_input');
	const overLapId = document.querySelector('input[name="overLapId"]');
	const memberId = memberIdInput.value;
	const overlapSuccess = document.querySelector('.checK_id_overlap_success');
	const overlapError = document.querySelector('.checK_id_overlap_error');
	
	if(memberId == ""){
		alert("아이디를 입력해주세요");
		memberIdInput.focus();
		return;
	}
	console.log(memberId);
	$.ajax({
		url : '/member/login/check/' + memberId,
		type : 'get',
		contentType : 'application/text; charset=UTF-8',
		success : function(res) {
			overLapId.value = 'y';
			overlapSuccess.style.display = 'block';
			overlapError.style.display = 'none';
			alert(res);
			
		},
		error : function (er) {
			overLapId.value = 'n';
			alert(er);
		}
	});
	
	
	
}