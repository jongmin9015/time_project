--notice ���̺�
create table tbl_board(
    bno     number not null,        --�Խù� ��ȣ
    title   varchar2(200) not null, --����
    content varchar2(4000),         --����
    writer  varchar2(50) not null,  --�̸�
    regdate date default sysdate,   --�ۼ�����
    viewcnt number default 0,       --��ȸ��
    PRIMARY key(bno)                --�Խù� ��ȣ �⺻Ű����
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