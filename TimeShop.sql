--board ���̺�
create table tbl_board(
    bno     number not null,        --�Խù� ��ȣ
    title   varchar2(200) not null, --����
    content varchar2(4000),         --����
    writer  varchar2(50) not null,  --�̸�
    regdate date default sysdate,   --�ۼ�����
    viewcnt number default 0,       --��ȸ��
    PRIMARY key(bno)                --�Խù� ��ȣ �⺻Ű����
);
--board ������ ����
create sequence seq_board 
start with 1
increment by 1;



--board value
insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [���̺�] ���� ����(�� ����) �� 12�� (2022 3. 21 ~)', '
����, �ȳ��ϼ���.

"[���̺�] ���� ����(�� ����) �� 12��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- [���̺�] ���� ����(�� ����) �� 9�� : �̻���ķ� ���� Ŀ�� ��Ȯ�� ���ҷ� ������ ���� ����
- [������] ��� �ܹ� Ƽ (20����) �� 2 �� : ����� ���� �λ�

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� ���� �κ� ���� ������ �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 21��(��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [����] ������/���� �� 19 �� (2022 3. 16 ~)','����, �ȳ��ϼ���.

"[����] ������/���� �� 19 ��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ��ǰ�� ��, ������ �� �λ����� ���� �ܰ��� ����Ͽ� ��ǰ�� ����

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� ���� �κ� ���� ������ �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 16�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲
','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [���̹�] ��г� ��ȭ�� �� 2�� (2022 3. 19 ~)','
����, �ȳ��ϼ���.

"[���̹�] ��г� ��ȭ�� �� 2��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ������ �ܰ� �λ�

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� ���� �κ� ���� ������ �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 19��(��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [��Ŭ����] ���쿡 ���� ���� �� 7 �� (2022 3. 17 ~)','
����, �ȳ��ϼ���.

"[��Ŭ����] ���쿡 ���� ���� �� 7 ��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- [��Ŭ����] ���쿡 ���� ���� : ���� ���� ������� ���Ͽ� ���� ���
- [������ǰ] ������ 160g �� 6 �� : ���� ���� ������� ���� ���� ���

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� ���� �κ� ���� ������ �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 17��(��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲
','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [�Ľ���] �ٸ����� ����� ���� 750mL (2022 2. 28 ~)','
����, �ȳ��ϼ���.

"[�Ľ���] �ٸ����� ����� ���� 750mL" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ������ �λ�

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� �����κ� ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 2�� 28�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲
','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [�״Ͼ�] �츮�� ��� ������ �� 19�� (2022 3. 3 ~)','
����, �ȳ��ϼ���.

"[�״Ͼ�] �츮�� ��� ������ �� 19��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ����� ���� �λ����� ���� ����

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� �����κ� ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 3�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [������Ʈ][������] ������ڼ�Ʈ �� 19�� (2022 2. 28 ~)','
����, �ȳ��ϼ���.

"[������Ʈ][������] ������ڼ�Ʈ �� 19��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ���޻� ���� �λ����� ���� �ǸŰ� ����

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� �����κ� ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 2�� 28�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�������ϰ���] [���������̾�] ġ���� ��������� �ѱ (2022 3. 4 ~)','����, �ȳ��ϼ���.

"[���������̾�] ġ���� ��������� �ѱ" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �������� ����
- ������ �ü� ������ ���� �ǸŰ��� ����

���� ������ ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 4�� (��) ���� 11��~



���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲
','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [���Űģ] DOG �Ұ�� ȭ�� 1kg �� 64�� (2022 3. 2 ~)','
����, �ȳ��ϼ���.

"[���Űģ] DOG �Ұ�� ȭ�� 1kg �� 64��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- [���Űģ] DOG �߰�� ȭ�� 250g �� 62�� : ����� ���� ������� ���� �ǸŰ� �λ�
- [���չ�X�����] ������ �峭�� �� 1�� : �̺�Ʈ ����� ���� ���� ȯ��

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� �����κ� ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 2�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲
','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�������ϰ���] [�丮��] ġ��ĩ�� L���� SS 10���� �� 6�� (2022 2. 28 ~)','
����, �ȳ��ϼ���.

"[�丮��] ġ��ĩ�� L���� SS 10���� �� 6��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �������� ����
- ���� ����� Ȯ���� ���� �ǸŰ� ����

���� ������ ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 2�� 28�� (��) ���� 11��~



���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '	[�����λ����] [����Ÿ] ��������Ÿ �����̽� 85g �� 2�� (2022 3. 4 ~)','
����, �ȳ��ϼ���.

"[����Ÿ] ��������Ÿ �����̽� 85g �� 2��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ����ᰪ ������� ���� ���ް�, �ǸŰ� ����

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� �����κ� ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 4�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲
','Time');

insert into tbl_board (bno, title, content, writer)
values (seq_board.nextval, '[�����λ����] [���Ϻ��] ��ĵ��(ü��) �� 7�� (2022 3. 3 ~)','����, �ȳ��ϼ���.

"[���Ϻ��] ��ĵ��(ü��) �� 7��" ������ �����ϰ� �Ǿ� �ȳ��帳�ϴ�. 

# �����λ� ����
- ����� ���� �λ����� ���� ����

���� ������ ���ް��� ��µʿ� ����, �ø������� �ε����ϰ� �����κ� ���������� �ϰ� �� �� ���� ��Ź�帳�ϴ�.

# ���� ��������
 - 2022�� 3�� 3�� (��) ���� 11��~


���� ǰ��, �ո����� �������� �����帱 �� �ֵ��� �׻� �ּ��� ���ϰڽ��ϴ�. 

�����մϴ�.

�����ø� �帲','Time');


--<��ǰ ���̺�>
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

--<��ǰ ���̺� ������>
create sequence seq_goods 
start with 1
increment by 1;



--<��ǰ : �ǰ���ǰ>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[���ɾ�]���ɾ� ������ ��', '���ϰ� ������ ���� �渶��', 48000, '1�ڽ�', '70ml*30��', '�������/�ù���', '���/��������', '����', 'health1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[���ɾ�]���ɾ� ������ ����', '���ϰ� ������ ���� �渶��', 48000, '1�ڽ�', '70ml*30��', '�������/�ù���', '���/��������', '����', 'health2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[�ð����]���Ϻ��� �и�', '� ������ �ʷϺ� ����', 9900, '1��', '80g', '�������/�ù���', '���/��������', '�� ��ǰ�� ����,���,�޹�,����,���,�� ��� ����� ��ǰ�� ���� �ü����� �����ϰ� �ֽ��ϴ�', 'health3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[�ð����]�븶������', '�����ϰ� �����ϴ� �Ĺ��� ����', 13900, '1��', '1000ml*30ĸ', '�������/�ù���', '���/��������', '��������', 'health4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[�ð����]����� ����ȯ', '�Ի縧�� ���� ���� ����', 13200, '1��', '120g', '�������/�ù���', '���/��������', '����', 'health5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'diet', '[�ð����]����� �۵���', 'ȯ���� ����� ���� ���� ��', 13200, '1��', '120g', '�������/�ù���', '���/��������', '����', 'health6.jpg');


--<��ǰ : ��>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[Ǯ����]�κθ�', '�Ĺ��� �ܹ����� ��� ��� �̻� ��', 2600, '1��', '100g', '�������/�ù���', '����/��Ƽ����', '-��� ����', 'noodle1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[��Ÿ��]��Ż���� į�Ĵ�', '��Ż�̿��� ���� �⺻ �Ľ�Ÿ��', 2450, '1��', '500g', '�������/�ù���', '���/��������', '-�� ����', 'noodle2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[��ü��]�� �Ľ�Ÿ','���Ľ�Ÿ 6�� -���İ�Ƽ/���ͳ�/ī�縮��/Ż�����緹/�ñ�ġ ����ġ��', 3000, '1��', '��ǰ�� ����', '�������/�ù���', '���/��������', '-�� ����', 'noodle3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[Ǯ����]��Ÿ�� �쵿�縮��', '�̱��ϰ� ����� ���', 1100, '1��', '210g', '�������/�ù���', '���/��������', '-��,��� ����', 'noodle4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[�Ʒ��ٷν�]�жǶ�� 3��', '�Ƕ��,����,�긮��,Ÿ�ڵ Ȱ�밡��', 2580, '1��', '�ϴ�����', '�������/�ù���', '�õ�/��Ƽ����', '-������', 'noodle5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pastanoodle', '[õ�Ͻ�ǰ]�紩�� �쵿��', '�ٰ��� ����̶� ���� �ʱ���', 5150, '1��', '230g X 5����', '�������/�ù���', '�õ�/��Ƽ����', '-�� ����', 'noodle6.jpg'); 



--<��ǰ : ������>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[�����뷱��]������ ������ 6��', '��ä�ο� ������ ���� ������', 2600, '1��', '240g', '�������/�ù���', '����/��Ƽ����', '(��) ���� ����,�������,�޹�,����,��,���� ����� ��ǰ�� ���� �����ü����� ����', 'salad1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '����� ���� ������ 6��', '�� ����� ����� ��ô�Ǿ� �ٷ� ���� �� �ִ� �ż��� ������', 1390, '1��', '150g', '�������/�ù���', '����/��Ƽ����', '����', 'salad2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[Better me]�߰����� ť�� 6��','���׻��� �߰������� ����� ���� ť��', 1600, '1��', '100g', '�������/�ù���', '�õ�/��Ƽ����', '-�÷���,������:�߰��,���,��,������(��)����', 'salad3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[�ϸ�]���� �߰����� 4��', '�����ϰ� �����Դ� ���� �߰�����', 1700, '1��', '110g', '�������/�ù���', '����/��Ƽ����', '-����:�߰�� ����, ������:�߰��,��� ����', 'salad4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[����θ�������]������ 7��', '�� ���⿡ �´� ������ ����', 5900, 'PK', '�ɼǺ� ����', '�������/�ù���', '����/��Ƽ����', '-���������:����,ȣ��,��,���,��Ȳ��� ����', 'salad5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'saladchicken', '[ȫ������]�븸 ������ġ 3��', 'ȣ�л����� ���� �����', 2300, '1��', '�ɼǺ� ����', '�������/�ù���', '����/��Ƽ����', '-�� ������ġ:���,��,����,�ް�,�������,����,������(��)�߰������', 'salad6.jpg');

--<��ǰ : ������ ���ö�>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[ź����]������ �ѽ� ���ö�', '��ä�ο� �ѽĸ޴��� ���� ���ö�!', 4200, '1��', '200g', '�������/�ù���', '�õ�/��Ƽ����', '(��) ���� ����,�������,�޹�,����,��,���� ����� ��ǰ�� ���� �����ü����� ����', 'lunchbox1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[���̺��]����Ŷ �Ĵܰ��� ���ö�', '���� ��𼭵� �ս��� �Ĵ� ����', 3600, '1��', '�ɼǺ��� ����', '�������/�ù���', '�õ�/��Ƽ����', '����', 'lunchbox2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[�޹����]�븩�븩 ���� �ָԹ�','�����ϰ� ì�ܸԴ� �� �� �ָԹ�', 6900, '1��', '100gX5����', '�������/�ù���', '�õ�/��Ƽ����', '-�÷���,������:�߰��,���,��,������(��)����', 'lunchbox3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '�߰����� ��� ������', '�δ���� ���ְ� ���� �� ��', 2200, '1��', '200g', '�������/�ù���', '�õ�/��Ƽ����', '-����:�߰�� ����, ������:�߰��,��� ����', 'lunchbox4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[û����]����Ʋ�� ��� ������', '�������� ������ ���� ������', 2500, '1��', '200G', '�������/�ù���', '�õ�/��Ƽ����', '-���������:����,ȣ��,��,���,��Ȳ��� ����', 'lunchbox5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'lunchbox', '[��¾���̾�Ʈ]����3 ���ö� 5��', '���� �İ��� ��� ����� �޴� ����', 3500, '1��', '�ɼǺ� ����', '�������/�ù���', '�õ�/��Ƽ����', '-�� ������ġ:���,��,����,�ް�,�������,����,������(��)�߰������', 'lunchbox6.jpg');


--<��ǰ : ������ �����>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[���ý�Ź]�λ� ������', '������ ������ ������ ����', 9900, '1��', '325g', '�������/�ù���', '����/��Ƽ����', '(��) ���� ����,�������,�޹�,����,��,���� ����� ��ǰ�� ���� �����ü����� ����', 'pasta1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[���÷�]��� � �쵿', '[�������� ��� ���]�ʱ��� ��� ��� �쵿 �ѱ׸�', 4000, '1��', '313g', '�������/�ù���', '�õ�/��Ƽ����', '����', 'pasta2.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[�̿����� ���]«�� 2�κ�','������ �Ҹ��� ��� �� �׸�', 13200, '1��', '��ȭ��(250gX2����)', '�������/�ù���', '�õ�/��Ƽ����', '-�÷���,������:�߰��,���,��,������(��)����', 'pasta3.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[���� ���׶�]Į����', '���׶��� ��ǥ�޴��� ������', 5600, '1��', '196.5g', '�������/�ù���', '�õ�/��Ƽ����', '-����:�߰�� ����, ������:�߰��,��� ����', 'pasta4.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[�����ϳ���]�����ź �ұ���', '�Ż絿 ���μ���,�ϳ��̽� ���� �ұ�����', 6900, '1��', '750g', '�������/�ù���', '�õ�/��Ƽ����', '-���������:����,ȣ��,��,���,��Ȳ��� ����', 'pasta5.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pasta', '[�̿����� ���]¥��� 2�κ�', '�밡�� �����̴� �� �׸�', 9800, '1��', '1040g', '�������/�ù���', '�õ�/��Ƽ����', '-�� ������ġ:���,��,����,�ް�,�������,����,������(��)�߰������', 'pasta6.jpg');


--<��ǰ : ������ ī�װ� 4��>
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'snack', '[���ý�Ź]�λ� ����,���ġ', '�λ��� ���� �н�', 5900, '1��', '400g', '�������/�ù���', '�õ�/��Ƽ����', '(��) ���� ����,�������,�޹�,����,��,���� ����� ��ǰ�� ���� �����ü����� ����', 'snack1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'pizza', '[���︶��]���� ���� ������', '�پ��� �������� ä�� ����', 1900, '3��', '1�� 120g', '�������/�ù���', '�õ�/��Ƽ����', '����', 'pizza1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'poached', '[��ƮŬ����]�ѵ� ������','�����ϰ� ���� ������ ������', 3100, '1��', '120g', '�������/�ù���', '�õ�/��Ƽ����', '-�÷���,������:�߰��,���,��,������(��)����', 'poached1.jpg');
insert into tbl_goods (goodsNo, goodsCategory, goodsName, goodsContent, goodsPrice, goodsUnit, goodsWeight, goodsDelivery, goodsPackage, goodsAllergy, goodsImage)
values (seq_goods.nextval,'soup', '[������]ä�Ҹ� ���� �ڿ����� ä��ī��', '������ ���, ī���� �ǰ��� ����!', 1960, '1��', '160g', '�������/�ù���', '����/��Ƽ����', '-����:�߰�� ����, ������:�߰��,��� ����', 'soup1.jpg');





--<ī�װ� ���̺�>
create table tbl_category(
    categoryTitle varchar2(50),
    categoryMain varchar2(50),
    categorySub varchar2(20),
    categorySubTitle varchar2(50)
);

alter table tbl_category
add constraint pk_category primary key (categorySubTitle);


--<ī�װ� ���̺�>
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '������.�߰�����', 'saladchicken');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '���ö�.���', 'lunchbox');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '�Ľ�Ÿ.���', 'pasta');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '������.Ƣ��.����', 'snack');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '����.�ֵ���', 'pizza');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '����.������.����', 'poached');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('salad', '������.�����', '��.����.ī��', 'soup');

insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', '������', 'nutrients');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', '�����', 'lacto');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', 'ȫ��.�λ�.��', 'ginseng');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', '�ǰ���.�ǰ�����', 'healthdrink');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', '�ǰ��и�.�ǰ�ȯ', 'healthpowder');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', '���̾�Ʈ.�̳ʺ�Ƽ', 'diet');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('health', '�ǰ���ǰ', '���Ƶ�', 'child');


insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '��.���.�丮', '�Ľ�Ÿ.���', 'pastanoodle');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '��.���.�丮', '�а���.����.�ͽ�', 'flour');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '��.���.�丮', '�ұ�.����.��ŷ�', 'spice');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '��.���.�丮', '�Ŀ���.���⸧.����', 'oil');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '��.���.�丮', '���.����.���', 'seasoning');
insert into tbl_category (categoryTitle, categoryMain, categorySub, categorySubTitle)
values ('noodle', '��.���.�丮', '����.�ҽ�.�巹��', 'dressing');


--< ��ٱ��� ���̺� >
create table tbl_cart(
    cartNo number(10),
    memberId varchar2(200),
    goodsNo number(20),
    cartCount number(20)
);
--��ٱ��� ������
create SEQUENCE seq_cart
START WITH 1
INCREMENT by 1;

--< �ӽ� ȸ�� ���̺� >
create table tbl_member(
    memberId varchar2(200),
    memberPw varchar2(100),
    memberName varchar2(20),
    phone varchar2(30),
    email varchar2(100),
    CONSTRAINT pk_member PRIMARY key (memberId)
);

add CONSTRAINT fk_member foreign key (address) REFERENCES tbl_address (address);



--< �ּ� ���̺� >
create table tbl_address(
    address varchar2(200),
    addressSub varchar2(100),
    zipcode number(10),
    memberId varchar2(200)
);

--< �ֹ� ���̺�>

create table tbl_order(
    memberId varchar2(200),
    goodsNo number(20),
    goodsCount number(10),
    deliveryFee number(10)
);

--<���� ����>
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

commit;
