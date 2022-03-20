// Header 메뉴바 고정
$(document).ready(function() {
	
    var wind = $(window),
    header = $('#gnbMenu'),
    headerOffsetTop = header.offset().top;


    wind.scroll(function() {
    	
       if(wind.scrollTop()>= headerOffsetTop) {
        header.addClass('sticky');
        
       } else {
        header.removeClass('sticky');
      }
       
    });
    
    const login_user = document.querySelector('#login_user');  
    const login_user_menu = document.querySelector('.login_user_menu');  
    
    login_user.addEventListener('mouseover', function() {
    	
    	login_user_menu.style.display = 'block';
    });
    login_user_menu.addEventListener('mouseout', function() {
    	
    	login_user_menu.style.display = 'none';
	});
   
});


// 전체 검색
function search_form(){
	const searchForm = document.querySelector('#search_frm');
	const searchInput = document.querySelector("input[name='keyword']");
	searchForm.submit();
}


// 인덱스 Java Script
$(document).ready(function(){

    
    let totalNum = $(".main_img_box img").length;
    let imgWidth = $(".slider li").width();
    let imgTotalWidth = imgWidth * totalNum;

    let roll = setInterval(next, 10000);
    
    init()
    
    $(".nextBtn").click(function(){
        clearInterval(roll);
        next();
    });

    $(".prevBtn").click(function(){
        clearInterval(roll);
        prev();
    });

    function init() {
    $(".page span:first").text(1);
    $(".page span:last").text(totalNum); 
    $(".slider").width( imgTotalWidth );
    }

    $(".main_img_box > button").mouseleave(function(){
        let roll = setInterval(next, 1000);
    });

    function next() {
        $(".slider").stop().animate({marginLeft: -imgWidth}, 500, "swing", function(){
            $(".slider>li:first").appendTo(".slider");
            $(".slider").css({marginLeft: 0});
            let num = $(".slider>li:first").children("img").attr("alt");
            $(".page span:first").text(num);
        });
    }
    function prev() {
        $(".slider").css({marginLeft: -imgWidth}); 
        $(".slider>li:last").prependTo(".slider");
        $(".slider").animate({marginLeft: 0}, 500, "swing", function(){
            let num = $(".slider>li:first").children("img").attr("alt");
            $(".page span:first").text(num);
        });
    }


    $('.main_content_list').bxSlider({  

        minSlides: 4,

        maxSlides: 4,
      
        slideWidth: 300,

        pager : false,

        HideControlOnEnd : true
      
    });

});

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



//장바구니 전체선택
function selectAll(selectAll){
    const checkBoxs = document.getElementsByName('cartPage_checkbox_item_list');
    checkBoxs.forEach((checkBox) => {
        checkBox.checked = selectAll.checked;
    });
};


//장바구니 선택 갯수 카운트 및 상품 가격 합계
function getCheckedCnt(){
    const query = 'input[class="cartPage_item_count_check"]:checked';
    const selectedElements = document.querySelectorAll(query);
    const selectedElementsCnt = selectedElements.length;
    document.getElementById('cartPage_item_select_num1').innerText = selectedElementsCnt;
    document.getElementById('cartPage_item_select_num2').innerText = selectedElementsCnt;
 
};
function cntCheck(){
    const query = 'input[class="cartPage_item_count_check"]:checked';
    const selectedElements = document.querySelectorAll(query);
    const selectedElementsCnt = selectedElements.length;
   
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
// 장바구니에서 삭제
function removeCart(cartNo, callback, error) {
	$.ajax({
		url : '/shop/cart/' + cartNo,
		type : 'DELETE',
		success : function (result) {
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




// 장바구니 결제 금액
function cartPrice() {
	let totalPrice = 0;
	const goodsPrices = document.querySelectorAll(".goodsPriceCount");

	goodsPrices.forEach((goodsPrice) => {
		const checkBox = goodsPrice.parentNode.parentNode.firstChild.nextSibling.firstChild.nextSibling;
		let checked = checkBox.getAttribute("checked")
		if(checked == 'checked') {
			totalPrice = totalPrice + stringNumberToInt(goodsPrice.innerText);
		}
		
	})
	
	return priceToString(totalPrice);
}

// 장바구니 배송비
function deleivery(deliveryFee) {
	
	const deleveryFeeTag = document.querySelector(".cartPage_amount_delivery_num");
	const deleveryMessageTag = document.querySelector(".cartPage_deliveryMessage");
	const totalPriceTag = document.querySelector(".totalPrice");
	const originalDeliveryFee = deliveryFee;

	if (stringNumberToInt(totalPriceTag.innerText) >= 20000 || stringNumberToInt(totalPriceTag.innerText) <= 0){
		deliveryFee = 0;
		deleveryFeeTag.innerText = deliveryFee;
		deleveryMessageTag.innerText = "";	
	} else {	
		const lackPrice = 20000 - stringNumberToInt(totalPriceTag.innerText);
		deliveryFee = originalDeliveryFee;
		deleveryFeeTag.innerText = (priceToString(deliveryFee));
		deleveryMessageTag.innerText = (priceToString(lackPrice)+"원 추가 주문 시, 무료배송");
	}
}
// 장바구니 총 결제 금액
function amountPrice() {
	
	const amountPriceTag = document.querySelector(".amountPrice");
	const deleveryFeeTag = document.querySelector(".cartPage_amount_delivery_num");
	const totalPriceTag = document.querySelector(".totalPrice");
	const totalPrice = stringNumberToInt(totalPriceTag.innerText);
	const deleveryFee = stringNumberToInt(deleveryFeeTag.innerText);
	const amountPrice = totalPrice + deleveryFee;
	amountPriceTag.innerText = priceToString(amountPrice);
	
	const addressInput = document.querySelector(".address_input");
	
}

// 장바구니 선택 삭제
function selectRemove(){
	const checkBoxs = document.querySelectorAll('.cartPage_item_count_check'); 
	checkBoxs.forEach((checkBox) => {	  	
		const checked = checkBox.getAttribute("checked");
		const cartNoTag = checkBox.parentNode.parentNode.lastChild.previousSibling;
		const cartNo = cartNoTag.getAttribute("href");
		
		if(checked == 'checked') {
			removeCart(cartNo);
			checkBox.parentNode.parentNode.parentNode.remove();
		}
	})
}

// 배송지 입력
function showPopUp() { 
	//창 크기 지정 
	const width = 500; 
	const height = 500; 
	//pc화면기준 가운데 정렬
	const left = (window.screen.width / 2) - (width/2); 
	const top = (window.screen.height / 4); 
	//윈도우 속성 지정
	const windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes'; 
	//연결하고싶은url
	const url = '/address/cart?memberId=' + memberId;

	//등록된 url 및 window 속성 기준으로 팝업창을 연다. 
	window.open(url, "hello popup", windowStatus); 
}

//배송지 입력 (배송지 변경)
function showPopUpdate() { 
	//창 크기 지정 
	const width = 500; 
	const height = 500; 
	//pc화면기준 가운데 정렬
	const left = (window.screen.width / 2) - (width/2); 
	const top = (window.screen.height / 4); 
	//윈도우 속성 지정
	const windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes'; 
	//연결하고싶은url
	const url = '/address/cart?memberId=' + memberId +'&form=update';

	//등록된 url 및 window 속성 기준으로 팝업창을 연다. 
	window.open(url, "hello popup", windowStatus); 
}


// 장바구니 주문전 주문 삭제(초기화)
function deleteOrder(memberId){
	
	$.ajax({
		url : "/shop/order/" + memberId,
		type : 'delete'
	});
}

// 장바구니에서 주문하기
function insertOrder() {
	
	const addressInput = document.querySelector(".cartPage_address");
	
	if (addressInput.innerText == ""){
		alert("배송지를 입력하세요");
		return;
	}
	
	deleteOrder(memberId);
	
	const query = 'input[class="cartPage_item_count_check"]:checked';
    const selectedElements = document.querySelectorAll(query);
    let deliveryFee = document.querySelector(".cartPage_amount_delivery_num").innerText;
    
    selectedElements.forEach((checkGoods) => {
    	const checkGood = checkGoods.dataset;
    	
    	const order = {
    		memberId : memberId,
    		goodsNo : checkGood.goodsno,
    		goodsCount : checkGood.goodscount,   
    		deliveryFee : parseInt(deliveryFee)
    	}
    	
    	$.ajax({
    		url : "/shop/order/insert",
    		type : "post",
    		data : JSON.stringify(order),
    		dateType : "json",
    		contentType : "application/json; charset=UTF-8"
    	});   	
    });
    
    const orderForm = document.querySelector(".order_moveForm")
    const deliveryForm = document.querySelector("input[name='deliveryFee']");
    deliveryForm.value = stringNumberToInt(deliveryFee);
       
    orderForm.submit();
	
   
}



//itemView 상세페이지 탭메뉴
$(document).ready(function(){
    document.getElementsByClassName('itemView_tab_menu_tit')[0].onclick = function(){click1()};
    function click1(){
        document.getElementsByClassName('itemView_tab_menu_tit')[0].classList.add('tab_menu_tit_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[1].classList.remove('tab_menu_tit_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[2].classList.remove('tab_menu_tit_on');
    };
    document.getElementsByClassName('itemView_tab_menu_tit')[1].onclick = function(){click2()};
    function click2(){
        document.getElementsByClassName('itemView_tab_menu_tit')[1].classList.add('tab_menu_tit_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[0].classList.remove('tab_menu_tit_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[2].classList.remove('tab_menu_tit_on');
    };
    document.getElementsByClassName('itemView_tab_menu_tit')[2].onclick = function(){click3()};
    function click3(){
        document.getElementsByClassName('itemView_tab_menu_tit')[2].classList.add('tab_menu_tit_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[0].classList.remove('tab_menu_tit_on');
        document.getElementsByClassName('itemView_tab_menu_tit')[1].classList.remove('tab_menu_tit_on');
    };
});

// itemView Count Button
function countBtn(btn) {

	const countInput = document.querySelector('.itemView_count_input');
	const priceTag = document.querySelector('.itemView_total_price');
	const goodsPrice = document.querySelector('.itemView_price').innerText;
	
	if (btn.getAttribute('class') == 'itemView_btn itemViewDown') {
		
		let count = countInput.value;		
		if (count == 1) return;	
		countInput.value = count - 1;
		const price =   stringNumberToInt(goodsPrice);
		priceTag.innerText = priceToString(price * countInput.value);
		
	} else if (btn.getAttribute('class') == 'itemView_btn itemViewUp'){
		
		let count = countInput.value;		
		countInput.value = parseInt(count) + 1;
		const price =   stringNumberToInt(goodsPrice);
		priceTag.innerText = priceToString(price * countInput.value);
	}
}

// itemView 장바구니 담기
function itemViewCart(){
	
	const count = document.querySelector('.itemView_count_input').value;
	const cart = {
			goodsNo : goodsNo,
			memberId : memberId,
			cartCount : count
	}
		
	put(cart, function(result) {
		alert(result);
	});
	
}

//payPage 선택별 결제창 보이기
function cardCheck(value){
    let cardView = document.getElementById('payPage_card_view');
    let simpleView = document.getElementById('payPage_simple_view');
    let kakaopayView = document.getElementById('kakaopayment');

    const payMethoInput = document.querySelector("input[name='payMethod']");
    payMethoInput.value = value;
    console.log(payMethoInput.value);
    
    if (value == "kakaopay") {
        cardView.style.display = "none";
        simpleView.style.display = "none";
        kakaopayView.classList.add('payPage_kakaopay_on');
    } else if(value == "c"){
        cardView.style.display = "block";
        simpleView.style.display = "none";
        kakaopayView.classList.remove('payPage_kakaopay_on');
    } else if(value == "phone"){
        cardView.style.display = "none";
        simpleView.style.display = "none";
        kakaopayView.classList.remove('payPage_kakaopay_on');
    } else if (value == "card"){
        cardView.style.display = "none";
        simpleView.style.display = "none";
        kakaopayView.classList.remove('payPage_kakaopay_on');
    }
    
    ;    
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
    let totalPriceInput = document.querySelector('.paypage_totalprice_input');

    
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
    totalPriceInput.value = totalPrice;
});

// 배송지 설정 팝업
function showPopUpDelivery() { 
	//창 크기 지정 
	const width = 500; 
	const height = 500; 
	//pc화면기준 가운데 정렬
	const left = (window.screen.width / 2) - (width/2); 
	const top = (window.screen.height / 4); 
	//윈도우 속성 지정
	const windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes'; 
	//연결하고싶은url
	const url = '/shop/order/delivery?orderName=' + orderName +"&orderPhone=" + orderPhone;
	//등록된 url 및 window 속성 기준으로 팝업창을 연다. 
	window.open(url, "hello popup", windowStatus); 
}

// 결제페이지 배송지 설정
function locationAddClass(v){
    let locationRadio = document.querySelectorAll('.delivery_info_locaion_radio');   

    v.onclick = function(){
    
        for (let i = 0; i < locationRadio.length; i++) {
            if (v == locationRadio[i]) {
            	locationRadio[i].classList.add('delivery_info_locaion_radio_on');
            }else{
            	locationRadio[i].classList.remove('delivery_info_locaion_radio_on');
            };            
        };
        
    };
};

// 결제페이지 배송지 설정
function messageAddClass(v){
    let messageRadio = document.querySelectorAll('.message_simple_radio');   

    v.onclick = function(){
    
        for (let i = 0; i < messageRadio.length; i++) {
            if (v == messageRadio[i]) {
            	messageRadio[i].classList.add('message_simple_radio_on');
            }else{
            	messageRadio[i].classList.remove('message_simple_radio_on');
            };            
        };
        
    };
};

// 결제페이지 배송지 설정 NOTICE
function noticeDisplay(value) {	
	const entrance = document.querySelector(".delivery_entrance");
	const door = document.querySelector(".delivery_notice_door");
	const security = document.querySelector(".delivery_notice_security");
	const post = document.querySelector(".delivery_notice_post");
	const etc = document.querySelector(".delivery_notice_etc");
	const etcLocation = document.querySelector(".delivery_location_etc");
	
	if(value == "security") {
		door.style.display = "none";
		entrance.style.display = "none";
		security.style.display = "block";
		post.style.display = "none";
		etc.style.display = "none";
		etcLocation.style.display = "none";
	} else if (value == "post") {
		door.style.display = "none";
		entrance.style.display = "none";
		security.style.display = "none";
		post.style.display = "block";
		etc.style.display = "none";
		etcLocation.style.display = "none";
	} else if (value == "etc") {
		door.style.display = "none";
		entrance.style.display = "none";
		security.style.display = "none";
		post.style.display = "none";
		etc.style.display = "block";
		etcLocation.style.display = "block";
	} else if (value == "door") {
		door.style.display = "block";
		entrance.style.display = "block";
		security.style.display = "none";
		post.style.display = "none";
		etc.style.display = "none";
		etcLocation.style.display = "none";
	}
}

// 주문자 정보와 동일
function sameOrder(value) {
	const sameBtn = document.querySelector(".delivery_sameBtn");
	const nameInput = document.querySelector(".orderName");
	const phoneInput = document.querySelector(".orderPhone");
	
	
	if (value == "x") {
		nameInput.setAttribute("value", orderName);
		phoneInput.setAttribute("value", orderPhone);
		sameBtn.value = "y";
	} else if (value == "y"){
		nameInput.setAttribute("value", "");
		phoneInput.setAttribute("value", "");
		sameBtn.value = "x";
	}
}

// 배송지 정보 페이지 입력
function deliveryInsertInfo() {
	
	const deliveryLocationTag = opener.document.querySelector(".payPage_receiving_txt");
	const deliveryMessageTag = opener.document.querySelector(".payPage_receiving_message_time");
	const deliveryNameTag = opener.document.querySelector(".payPage_receiving_name");
	const deliveryPhoneTag = opener.document.querySelector(".payPage_receiving_phone");
	
	const entrancePwInput = opener.document.querySelector("input[name='entrancePw']");
	const etcLocationInput = opener.document.querySelector("input[name='etcLocation']");
	const deliveryLocationInput = opener.document.querySelector("input[name='deliveryLocation']");
	const deliveryMessageInput = opener.document.querySelector("input[name='deliveryMessage']");
	const deliveryNameInput = opener.document.querySelector("input[name='deliveryName']");
	const deliveryPhoneInput = opener.document.querySelector("input[name='deliveryPhone']");
	
	
	const deliveryName = document.querySelector("input[name='deliveryName']");
	const deliveryPhone = document.querySelector("input[name='deliveryPhone']");	
	const entrancePw = document.querySelector("input[name='entrancePw']").value;
	const etcLocation = document.querySelector("input[name='etcLocation']").value;
	
	if(deliveryName.value == "") {
		alert("받으실 분 이름을 입력하세요");
		deliveryName.focus();
		return false;
	} else if (deliveryPhone.value == "") {
		alert("받으실 분 핸드폰번호를 입력하세요");
		deliveryPhone.focus();
		return false;
	}
	
	let deliveryMessage = document.querySelector("input[name='deliveryMessage']:checked").dataset.name;	
	let deliveryLocation = document.querySelector("input[name='deliveryLocation']:checked").dataset.name;
	
	
	
	deliveryMessageTag.innerText = deliveryMessage;
	
	if (deliveryLocation == '기타 장소'){
		deliveryLocationTag.innerText = etcLocation;
		
	} else {
		deliveryLocationTag.innerText = deliveryLocation;
	}
	
	deliveryNameTag.innerText = deliveryName.value;
	deliveryPhoneTag.innerText = deliveryPhone.value;
	
	
	
	// input에 데이터 넣기
	entrancePwInput.value = entrancePw;
	etcLocationInput.value = etcLocation;
	deliveryLocationInput.value = deliveryLocation
	deliveryMessageInput.value = deliveryMessage
	deliveryNameInput.value = deliveryName.value;
	deliveryPhoneInput.value = deliveryPhone.value;
	
	window.close();
}




// 배송지 정보 입력창 닫기
function closePopUp() {
	window.close();
}


// 결제 페이지 유효성 검사
function payInfoCheck(){
	
	const orderName = document.querySelector("#orderName");
	const orderPhone = document.querySelector("#orderPhone");
	const orderEmail = document.querySelector("#orderEmail");
	const deliveryInfo = document.querySelector(".payPage_receiving_txt");
	const agreeCheck = document.querySelector(".agreeCheck");
	
	if(orderName.value == "") {
		alert("보내는 분 이름을 입력해주세요");
		orderName.focus();
		return false;
	} else if (orderPhone.value == "") {
		alert("보내는 분 핸드폰번호를 입력해주세요");
		orderPhone.focus();
		return false;
	} else if (orderEmail.value == "") {
		alert("보내는 분 이메일을 입력해주세요");
		orderEmail.focus();
		return false;
	} else if (deliveryInfo.innerText == "") {
		alert("받으실 분 정보를 입력해주세요");
		deliveryInfo.focus();
		return false;
	}	else if (agreeCheck.checked == false) {
		alert("개인정보 제공에 동의해주세요");
		agreeCheck.focus();
		return false;
	}
	
	return true;
	
}





// 콤마 숫자형 문자열을 정수로 변환
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}


// 숫자 문자열을 콤마 숫자형으로 
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}




// notice form
function notice_search_frm(){
	if(document.getElementById("notice_input_box").value == ''){
		alert("검색어를 입력해주세요.")
		return false;
	}
	document.getElementById('notice_frm').submit();
}
//notice page click addClass
function notice_page_addClass(v){
    let num = document.querySelectorAll('.notice_page_num');
    for (let i = 0; i < num.length; i++) {
        if(v == num[i]){
            num[i].classList.add('notice_page_on');
        }else if(v != num[i]){
            num[i].classList.remove('notice_page_on');
        }
        
    }
}

//noticewriter 등록 버튼
function noticeWriter_form(){
    document.getElementById('noticewriter_frm').submit();
}

//noticeView textarea 공백제거
$(document).ready(function(){
    document.querySelector('.noticeView_inp_content').value.trim();
    document.querySelector('.noticeWrite_inp_content').value.trim();
});

