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

//itemView 상세페이지 탭메뉴 classadd
$(document).ready(function(){
    document.getElementsByClassName('itemView_tab_menu_tit')[0].onclick = function(){click1()};
    function click1(){
        document.getElementsByClassName('itemView_tab_menu_tit')[0].classList.add('itemView_tab_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[1].classList.remove('itemView_tab_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[2].classList.remove('itemView_tab_on');
    };
    document.getElementsByClassName('itemView_tab_menu_tit')[1].onclick = function(){click2()};
    function click2(){
        document.getElementsByClassName('itemView_tab_menu_tit')[1].classList.add('itemView_tab_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[0].classList.remove('itemView_tab_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[2].classList.remove('itemView_tab_on');
    };
    document.getElementsByClassName('itemView_tab_menu_tit')[2].onclick = function(){click3()};
    function click3(){
        document.getElementsByClassName('itemView_tab_menu_tit')[2].classList.add('itemView_tab_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[0].classList.remove('itemView_tab_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[1].classList.remove('itemView_tab_on');
    };
});

//payPage 선택별 결제창 보이기
function cardCheck(value){
    let cardView = document.getElementById('payPage_card_view');
    let simpleView = document.getElementById('payPage_simple_view');

    if (value == "kakao-pay") {
        cardView.style.display = "none";
        simpleView.style.display = "none";
    }else if(value == "c"){
        cardView.style.display = "block";
        simpleView.style.display = "none";
    }else if(value == "p"){
        cardView.style.display = "none";
        simpleView.style.display = "none";
    };    
};

//payPage simple 클릭이벤트
function menuClick(){
    let cardView = document.getElementById('payPage_card_view');
    let simpleView = document.getElementById('payPage_simple_view');
    let simple = document.getElementById('payPage_simple_click');
    simple.onclick = function(){
        simpleView.style.display = "block";
        cardView.style.display = "none";
    };
}

//payPage 신용카드 목록 이벤트
function cardSelect(){
    let cardList = document.getElementById('payPage_card_select_card');
    let monthList = document.getElementById('payPage_card_select_month')
    let cardListView = document.getElementById('card_select_list_card');
    let monthListView = document.getElementById('card_select_list_month');
    cardList.onclick = function(){
        cardListView.classList.toggle('card_select_list_on')
        monthListView.classList.remove('card_select_list_on')
    };
    monthList.onclick = function(){
        monthListView.classList.toggle('card_select_list_on')
        cardListView.classList.remove('card_select_list_on')
    };
};

//payPage 카드 목록 클릭
function cardSelectClick(v){
    let cardListView = document.getElementById('card_select_list_card');    
    let viewBox = document.getElementById('payPage_card_select_card');

    
    viewBox.innerText = v.innerText;
    cardListView.classList.remove('card_select_list_on');
};

//payPage 카드 할부 목록 클릭
function monthSelectClick(v){
    let viewBox = document.getElementById('payPage_card_select_month');
    let monthListView = document.getElementById('card_select_list_month');
    
    viewBox.innerText = v.innerText;
    monthListView.classList.remove('card_select_list_on');
};

//payPage 카드 선택 이벤트
function cardaddClass(v){
    let liTag = document.querySelectorAll('.payPage_pay_select_menu_list>li');    
    v.onclick = function(){

        for (let i = 0; i < liTag.length; i++) {
            if (v == liTag[i]) {
                liTag[i].classList.add('payPage_pay_menu_on');
            }else{
                liTag[i].classList.remove('payPage_pay_menu_on');
            };            
        };
        
    };
};

//payPage 간편결제 체크박스 이벤트
function simpleRadioEvent(v){
    let simpleRadio = document.querySelectorAll('.payPage_simple_radio');

    v.onclick = function(){
        for (let i = 0; i < simpleRadio.length; i++) {
            if(v == simpleRadio[i]){
                simpleRadio[i].classList.add('payPage_simple_radio_on');
            }else{
                simpleRadio[i].classList.remove('payPage_simple_radio_on');
            };
            
        };
    };
};

//payPage 가격 합계
$(document).ready(function(){
    let item = document.querySelectorAll('.payPage_item_list_price');
    let payBtn = document.querySelector('.payPage_paymant_btn');
    let itemPrice = document.querySelector('.payPage_orderitem_total_price');
    let itemPrice2 = document.querySelector('.payPage_orderitem_itemprice');
    let deliveryPrice = document.querySelector('.payPage_orderitem_delivery_price').innerHTML;
    let orderTotalPrice = document.querySelector('.payPage_orderitem_add_total');
    let point = document.querySelector('.payPage_orderitem_point_num').innerHTML;
    point = Number(point.replace(',','').replace('원',''));

    let price = 0;
    let totalPrice = 0;

    for (let i = 0; i < item.length; i++) {
        let num = parseInt(item[i].innerHTML.replace(',','').replace('원',''));
        price += parseInt(num);
    }
    
    itemPrice.innerText = price.toLocaleString();
    itemPrice2.innerHTML = price.toLocaleString();
    totalPrice = Number(deliveryPrice.replace(',','')) + price - point;
    orderTotalPrice.innerHTML = totalPrice.toLocaleString();
    payBtn.value = totalPrice.toLocaleString() + "원 결제하기";
});