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
values (SEQ_BOARD.nextval, 'test02', 'content02', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test03', 'content03', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test04', 'content04', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test05', 'content05', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test06', 'content06', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test07', 'content07', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test08', 'content08', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test09', 'content09', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test10', 'content10', 'Time');

insert into tbl_board(bno, title, content, writer)
values (SEQ_BOARD.nextval, 'test11', 'content11', 'Time');

commit;

select * from tbl_board;

select rownum rn, bno, title, content, writer, regdate, viewcnt
from tbl_board
order by bno;

select rownum rn,bno, title, content, writer, regdate, viewcnt
from (select *
        from tbl_board
        order by bno)
limit 0, 10
order by rn;

