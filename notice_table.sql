--notice 테이블
create table tbl_board(
    bno     number not null,        --게시물 번호
    title   varchar2(200) not null, --제목
    content varchar2(4000),         --내용
    writer  varchar2(50) not null,  --이름
    regdate date default sysdate,   --작성일자
    viewcnt number default 0,       --조회수
    PRIMARY key(bno)                --게시물 번호 기본키설정
);

create sequence seq_board 
start with 1
increment by 1;

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test01', 'content01', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test02', 'content03', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test04', 'content04', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test05', 'content05', 'Time');

commit;

select * from tbl_board;