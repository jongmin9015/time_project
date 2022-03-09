//회원가입 유효성
function signupform_check(){
    var id = document.getElementById("userid");
    var pw1 = document.getElementById("userpw1");
    var pw2 = document.getElementById("userpw2");
    var name = document.getElementById("username");
    var email = document.getElementById("email");
    var phone = document.getElementById("phone");
    var male = document.getElementById("male");
    var female = document.getElementById("female");
    var none = document.getElementById("none");
    var year = document.getElementById("year");
    var month = document.getElementById("month");
    var day = document.getElementById("day");
    var reg = /^[0-9]+/g;

    if(id.value == ""){
        alert("아이디를 입력하세요.");
        id.focus();
        return false;
    };

    // var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

    // if(!pwdCheck.test(pw1.value)){
    //     alert("비밀번호는 영문자+조합+특수문자 조합으로 8~25자리 사용해야 합니다.");
    //     pw1.focus();
    //     return false;
    // };

    if (pw1.value !== pw2.value) {
        alert("비밀번호가 일치하지 않습니다..");
        pd2.focus();
        return false;
    };

    if (name.value == "") {
        alert("이름을 입력하세요.");
        name.focus();
        return false;
    };

    if (email.value == "") {
        alert("이메일 주소를 입력하세요.");
        email.focus();
        return false;
    };

    if (!reg.test(phone.value)) {
        alert("전화번호는 숫자만 입력할 수 있습니다.");
        phone.focus();
        return false;
    };

    if (!reg.test(year.value)) {
        alert("생년월일은 숫자만 입력할 수 있습니다.");
        year.focus();
        return false;
    };

    if (!reg.test(month.value)) {
        alert("생년월일은 숫자만 입력할 수 있습니다.");
        month.focus();
        return false;
    };

    if (!reg.test(day.value)) {
        alert("생년월일은 숫자만 입력할 수 있습니다.");
        day.focus();
        return false;
    };

    if (!female.checked && !male.checked && !none.checked) {
        alert("성별을 선택해 주세요.");
        none.focus();
        return false;
    };

    document.signup_form.submit();
};

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

//장바구니 전체선택
function selectAll(selectAll){
    const checkboxs = document.getElementsByName('cartPage_checkbox_item_list');

    checkboxs.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    });
};

//장바구니 선택 갯수 카운트 및 상품 가격 합계
function getCheckedCnt(){
    const query = 'input[class="cartPage_item_count_check"]:checked';
    const selectedElements = document.querySelectorAll(query);
    const selectedElementsCnt = selectedElements.length;
    document.getElementById('cartPage_item_select_num1').innerText = selectedElementsCnt;
    document.getElementById('cartPage_item_select_num2').innerText = selectedElementsCnt;
 

    // var add = "";
    // var item = document.getElementsByClassName('cartPage_item_count_check');
    // for(i = 0; i < item.length; i++){
    //     var result = item[i].getAttribute("checked");
    //     console.log(item[i].getAttribute("checked"));
    //     if(result){
    //         add += prices[i];
    //     };
    // };

    // console.log(add);
};

//장바구니 목록 갯수 카운트
function getAllListCnt(){
    const query = 'input[class="cartPage_item_count_check"]';
    const selectedElements = document.querySelectorAll(query);
    const selectedElementsCnt = selectedElements.length;
    document.getElementById('cartPage_item_all_num1').innerText = selectedElementsCnt;
    document.getElementById('cartPage_item_all_num2').innerText = selectedElementsCnt;
};

// 상품번호로 상품정보 조회
function get(goodsNo, callback, error) {
	$.get("/shop/cart/" + goodsNo, function(result) {
		if(callback){
			callback(result);
		}
	}).fail(function(xhr, status, err) {
		if(error){
			error(err);
		}
	})
}

// 모달창에서 장바구니 담기
function put(cart, callback, error) {
	$.ajax({
		url : '/shop/cart/put',
		type : 'POST',
		data : JSON.stringify(cart),
		contentType : "application/json; charset=utf-8",
		dataType : 'text',
		success : function(result) {
			if(callback){
				callback(result);
			}
		},
		error : function(er) {
			if(error){
				error(er)
			}
		}
	});
}




// 콤마 숫자형 문자열을 정수로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}

// 숫자 문자열을 콤마 숫자형으로 
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}