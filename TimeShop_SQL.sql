set define off;


--board 테이블
create table tbl_board(
    bno     number not null,        --게시물 번호
    bgno    number not null,        --게시판 분류번호
    title   varchar2(200) not null, --제목
    category varchar2(15) default '-', --카테고리
    content varchar2(4000),         --내용
    writer  varchar2(50) not null,  --이름
    regdate date default sysdate,   --작성일자
    viewcnt number default 0,       --조회수
    CONSTRAINT tbl_board_PK 
    PRIMARY KEY(bno) --게시물 기본키설정
);


--board 시퀀스 생성
create sequence seq_board 
start with 1
increment by 1;


--<상품 테이블>
create table tbl_goods(
    goodsNo number(20) not null,
    goodsCategory varchar2(20) not null,
    goodsName varchar2(200) not null,
    goodsContent varchar2(2000) not null,
    goodsPrice number(20) not null,
    goodsUnit varchar2(20) not null,
    goodsWeight varchar2(20) not null,
    goodsDelivery varchar2(50) not null,
    goodsPackage varchar2(100) not null,
    goodsAllergy varchar2(1000) not null,
    goodsImage varchar2(200) default 'noimage.jpg',
    goodsRegdate date default sysdate,
    goodsUpdatedate date default sysdate,
    CONSTRAINT pk_goods primary key (goodsNo)
);

--<상품 테이블 시퀀스>
create sequence seq_goods 
start with 1
increment by 1;


--<상품 : 건강식품>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[올케어]올케어 마늘의 왕', '진하게 농축해 담은 흑마늘', 48000, '1박스', '70ml*30포', '샛별배송/택배배송', '상온/종이포장', '없음', 'health1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[올케어]올케어 마늘의 여왕', '진하게 농축해 담은 흑마늘', 48000, '1박스', '70ml*30포', '샛별배송/택배배송', '상온/종이포장', '없음', 'health2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[올가비오]새싹보리 분말', '어린 새싹의 초록빛 생기', 9900, '1통', '80g', '샛별배송/택배배송', '상온/종이포장', '본 제품은 우유,계란,메밀,땅콩,대두,밀 등알 사용한 제품과 같은 시설에서 제조하고 있습니다', 'health3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[올가비오]대마종자유', '간편하게 섭취하는 식물성 오일', 13900, '1통', '1000ml*30캡', '샛별배송/택배배송', '상온/종이포장', '쇠고기함유', 'health4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[올가비오]유기농 여주환', '쌉사름함 없이 즐기는 여주', 13200, '1통', '120g', '샛별배송/택배배송', '상온/종이포장', '없음', 'health5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[올가비오]유기농 작두콩', '환으로 만들어 오래 즐기는 콩', 13200, '1통', '120g', '샛별배송/택배배송', '상온/종이포장', '없음', 'health6.jpg');

--<상품 : 면>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[풀무원]두부면', '식물성 단백질이 듬뿍 담긴 이색 면', 2600, '1팩', '100g', '샛별배송/택배배송', '냉장/스티로폼', '-대두 함유', 'noodle1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[폰타나]이탈리아 캄파니', '이탈이에서 만든 기본 파스타면', 2450, '1봉', '500g', '샛별배송/택배배송', '상온/종이포장', '-밀 함유', 'noodle2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[데체코]롱 파스타','롱파스타 6종 -스파게티/링귀네/카펠리니/탈리아펠레/시금치 페투치니', 3000, '1봉', '제품별 상이', '샛별배송/택배배송', '상온/종이포장', '-밀 함유', 'noodle3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[풀무원]수타식 우동사리면', '쫄깃하게 감기는 면발', 1100, '1봉', '210g', '샛별배송/택배배송', '상온/종이포장', '-밀,대두 함유', 'noodle4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[아레바로스]밀또띠아 3종', '또띠아,피자,브리또,타코등에 활용가능', 2580, '1개', '하단참조', '샛별배송/택배배송', '냉동/스티로폼', '-밀함유', 'noodle5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[천일식품]사누끼 우동면', '다가수 방식이라 촉촉 탱글한', 5150, '1팩', '230g X 5개입', '샛별배송/택배배송', '냉동/스티로폼', '-밀 함유', 'noodle6.jpg'); 

--<상품 : 샐러드>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[스윗밸런스]오늘의 샐러드 6종', '다채로운 토핑을 얹은 샐러드', 2600, '1통', '240g', '샛별배송/택배배송', '냉장/스티로폼', '(굴) 함유 쇠고기,돼지고기,메밀,땅콩,게,잣을 사용한 제품과 같은 제조시설에서 제조', 'salad1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '무농약 간편 샐러드 6종', '내 맘대로 골라담고 세척되어 바로 먹을 수 있는 신선한 샐러드', 1390, '1팩', '150g', '샛별배송/택배배송', '냉장/스티로폼', '없음', 'salad2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[Better me]닭가슴살 큐브 6종','무항생제 닭가슴살을 사용한 간편 큐브', 1600, '1팩', '100g', '샛별배송/택배배송', '냉동/스티로폼', '-플레인,블랙페퍼:닭고기,대두,밀,조개류(굴)함유', 'salad3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[하림]냉장 닭가슴살 4종', '간편하게 꺼내먹는 냉장 닭가슴살', 1700, '1팩', '110g', '샛별배송/택배배송', '냉장/스티로폼', '-훈제:닭고기 함유, 블랙페퍼:닭고기,대두 함유', 'salad4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[어게인리프레쉬]샐러드 7종', '내 취향에 맞는 샐러드 고르기', 5900, 'PK', '옵션별 상이', '샛별배송/택배배송', '냉장/스티로폼', '-연어샐러드:우유,호두,잣,대두,아황산류 함유', 'salad5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[홍루이젠]대만 샌드위치 3종', '호밀빵으로 더한 고소함', 2300, '1개', '옵션별 상이', '샛별배송/택배배송', '냉장/스티로폼', '-햄 샌드위치:대두,밀,우유,달걀,돼지고기,쇠고기,조개류(굴)닭고기함유', 'salad6.jpg');

--<상품 : 샐러드 도시락>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[탄단지]가벼운 한식 도시락', '다채로운 한식메뉴로 즐기는 도시락!', 4200, '1팩', '200g', '샛별배송/택배배송', '냉동/스티로폼', '(굴) 함유 쇠고기,돼지고기,메밀,땅콩,게,잣을 사용한 제품과 같은 제조시설에서 제조', 'lunchbox1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[마이비밀]라이킷 식단관리 도시락', '언제 어디서든 손쉬운 식단 관리', 3600, '1팩', '옵션별로 상이', '샛별배송/택배배송', '냉동/스티로폼', '없음', 'lunchbox2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[햇반쿡반]노릇노릇 구운 주먹밥','간편하게 챙겨먹는 한 끼 주먹밥', 6900, '1팩', '100gX5개입', '샛별배송/택배배송', '냉동/스티로폼', '-플레인,블랙페퍼:닭고기,대두,밀,조개류(굴)함유', 'lunchbox3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '닭가슴살 곤약 볶음밥', '부담없이 맛있게 즐기는 한 끼', 2200, '1팩', '200g', '샛별배송/택배배송', '냉동/스티로폼', '-훈제:닭고기 함유, 블랙페퍼:닭고기,대두 함유', 'lunchbox4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[청정원]라이틀리 곤약 볶음밥', '가볍지만 알차게 즐기는 볶음밥', 2500, '1봉', '200G', '샛별배송/택배배송', '냉동/스티로폼', '-연어샐러드:우유,호두,잣,대두,아황산류 함유', 'lunchbox5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[고온어다이어트]시즌3 도시락 5종', '맛과 식감을 모두 고려한 메뉴 구성', 3500, '1팩', '옵션별 상이', '샛별배송/택배배송', '냉동/스티로폼', '-햄 샌드위치:대두,밀,우유,달걀,돼지고기,쇠고기,조개류(굴)닭고기함유', 'lunchbox6.jpg');

--<상품 : 샐러드 간편식>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[로컬식탁]부산 비빔당면', '집에서 만나는 시장의 별미', 9900, '1팩', '325g', '샛별배송/택배배송', '냉장/스티로폼', '(굴) 함유 쇠고기,돼지고기,메밀,땅콩,게,잣을 사용한 제품과 같은 제조시설에서 제조', 'pasta1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[더플랜]목련 어묵 우동', '[극한직업 어묵편 방송]탱글한 어묵이 담긴 우동 한그릇', 4000, '1개', '313g', '샛별배송/택배배송', '냉동/스티로폼', '없음', 'pasta2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[이연복의 목란]짬뽕 2인분','매콤한 불맛이 담긴 한 그릇', 13200, '1팩', '중화면(250gX2개입)', '샛별배송/택배배송', '냉동/스티로폼', '-플레인,블랙페퍼:닭고기,대두,밀,조개류(굴)함유', 'pasta3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[전주 베테랑]칼국수', '베테랑의 대표메뉴를 집에서', 5600, '1팩', '196.5g', '샛별배송/택배배송', '냉동/스티로폼', '-훈제:닭고기 함유, 블랙페퍼:닭고기,대두 함유', 'pasta4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[마이하노이]고기폭탄 쌀국수', '신사동 가로수길,하노이식 정통 쌀국수집', 6900, '1팩', '750g', '샛별배송/택배배송', '냉동/스티로폼', '-연어샐러드:우유,호두,잣,대두,아황산류 함유', 'pasta5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[이연복의 목란]짜장면 2인분', '대가가 선보이는 한 그릇', 9800, '1팩', '1040g', '샛별배송/택배배송', '냉동/스티로폼', '-햄 샌드위치:대두,밀,우유,달걀,돼지고기,쇠고기,조개류(굴)닭고기함유', 'pasta6.jpg');

--<상품 : 샐러드 카테고리 4종>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'snack', '[로컬식탁]부산 물떡,어묵꼬치', '부산의 별미 분식', 5900, '1봉', '400g', '샛별배송/택배배송', '냉동/스티로폼', '(굴) 함유 쇠고기,돼지고기,메밀,땅콩,게,잣을 사용한 제품과 같은 제조시설에서 제조', 'snack1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pizza', '[서울마님]간편 간식 떡구이', '다양한 토핑으로 채운 떡귀', 1900, '3개', '1개 120g', '샛별배송/택배배송', '냉동/스티로폼', '없음', 'pizza1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'poached', '[미트클레버]한돈 떡갈비','간편하게 즐기는 도톰한 떡갈비', 3100, '1팩', '120g', '샛별배송/택배배송', '냉동/스티로폼', '-플레인,블랙페퍼:닭고기,대두,밀,조개류(굴)함유', 'poached1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'soup', '[순수람]채소를 담은 자연주의 채담카레', '새싹이 듬뿍, 카레의 건강한 변신!', 1960, '1봉', '160g', '샛별배송/택배배송', '냉장/스티로폼', '-훈제:닭고기 함유, 블랙페퍼:닭고기,대두 함유', 'soup1.jpg');

--<카테고리 테이블>
create table tbl_category(
    categoryTitle varchar2(50),
    categoryMain varchar2(50),
    categorySub varchar2(20),
    categorySubTitle varchar2(50)
);
alter table tbl_category
add constraint pk_category primary key (categorySubTitle);


--<카테고리 테이블>
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '샐러드.닭가슴살', 'saladchicken');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '도시락.밥류', 'lunchbox');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '파스타.면류', 'pasta');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '떡볶이.튀김.순대', 'snack');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '피자.핫도그', 'pizza');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '폭립.떡갈비.안주', 'poached');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '샐러드.간편식', '죽.스프.카레', 'soup');

insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '영양제', 'nutrients');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '유산균', 'lacto');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '홍삼.인삼.꿀', 'ginseng');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '건강즘.건강음료', 'healthdrink');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '건강분말.건강환', 'healthpowder');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '다이어트.이너뷰티', 'diet');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '건강식품', '유아동', 'child');

insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '면.양념.요리', '파스타.면류', 'pastanoodle');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '면.양념.요리', '밀가루.가루.믹스', 'flour');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '면.양념.요리', '소금.설탕.향신료', 'spice');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '면.양념.요리', '식용유.참기름.오일', 'oil');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '면.양념.요리', '양념.액젓.장류', 'seasoning');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '면.양념.요리', '식초.소스.드레싱', 'dressing');

--< 장바구니 테이블 >
create table tbl_cart(
    cartNo number(10),
    memberId varchar2(200),
    goodsNo number(20),
    cartCount number(20)
);

--장바구니 시퀀스
create SEQUENCE seq_cart
START WITH 1
INCREMENT by 1;


--< 멤버 테이블 >
create table tbl_member(
    memberId varchar2(200),
    memberPw varchar2(100),
    memberName varchar2(20),
    phone varchar2(30),
    email varchar2(100), 
    address varchar2(100),
    addressSub varchar2(100),
    zipcode varchar2(10),
    gender varchar2(10),
    birth date,
    regDate date default sysdate,
    CONSTRAINT pk_member PRIMARY key (memberId)
);
add CONSTRAINT fk_member foreign key (address) REFERENCES tbl_address (address);


--< 주소 테이블 >
create table tbl_address(
    address varchar2(200),
    addressSub varchar2(100),
    zipcode varchar2(10),
    memberId varchar2(200)
);

--< 주문 테이블>
create table tbl_order(
    memberId varchar2(200),
    goodsNo number(20),
    goodsCount number(10),
    deliveryFee number(10)
);

--<결제 정보>
create table tbl_pay(
    memberId varchar2(200),
    orderGoodsName varchar2(200),
    orderName varchar2(200),
    orderPhone varchar2(30),
    orderEmail varchar2(30),
    deliveryName varchar2(20),
    deliveryPhone varchar2(30),
    deliveryLocation varchar2(20),
    deliveryMessage varchar2(200),
    entrancePw varchar2(10),
    etcLocation varchar2(300),
    totalPrice number(10),
    address varchar2(200),
    addressSub varchar2(200),
    zipcode number(10),
    payMethod varchar2(20),
    payId varchar2(200),
    constraint pk_pay primary key (memberId)	
);

--< 스프링 시큐리티 권한 >
create table tbl_member_auth(
    memberId varchar2(200),
    auth varchar2(50),
    CONSTRAINT fk_member_auth foreign key(memberId) REFERENCES tbl_member(memberId)
);
alter table tbl_member_auth modify auth varchar2(50) default 'role_member';


--< 자동 로그인 >
  create table persistent_logins (	
    username VARCHAR2(64) NOT NULL, 
	series VARCHAR2(64) primary key,
	token VARCHAR2(64) NOT NULL, 
	last_used TIMESTAMP (6) NOT NULL
     );