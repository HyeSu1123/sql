--�߿�1: ���� ��ǰ ���̺��� ��(ROW)�����͸� ������ CUSTOM_ID,PCODE �� �ߺ��Ǹ� �ȵȴ�.
	--	�⺻Ű �÷��� ���Ѵ�(�ߺ��� ���� NULL���� ������ �ȵȴ�)
	--  SELECT �� �⺻Ű ������ �˻��� �� ���� 1���� �� �ᰡ�� ��ȸ�ȴ�
SELECT * FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID ='mina012';
--�߿�2: ������� PRICE QUANTITY ���� �÷��� NULL�� �Ǹ� �ȵȴ�.
	--	NOT NULL �÷����� �����Ѵ�.(NULL ���� �ȵȴ�.)
--�߿�3: ���� ��ǰ���̺� ���� CUSTOM_ID ,PRICE �÷����� ����ϸ� ��Ȯ���� ��������
	--	�ܷ�Ű �÷��� ���Ѵ�(�ٸ� ���̺��� ���� �����Ѵ�.NULL ���嵵 ���Ѵ�.)
	--  �ܷ�Ű�� �÷��� �����Ͱ� ������(�ٸ����̺� �÷�)�� ����ϰ� �ϴ°��� �����̴�.

--���� NOT NULL, �⺻Ű, �ܷ�Ű�� ��ǥ���� ��������(CONSTRAINT) �����̴�.
--���������� ������ ���̺�� ������ ����.

--�� ���̺�
CREATE TABLE TBL_CUSTOM#(
	CUSTOM_ID VARCHAR2(20) PRIMARY KEY,	
	NAME NVARCHAR2(20) NOT NULL,		
	EMIL VARCHAR2(20),
	AGE NUMBER(3),
	REG_DATE TIMESTAMP DEFAULT SYSDATE
);
--��ǰ ���̺� : ��ǰ �ڵ�(�������� 20�ڸ�),ī�װ�(�������� 2�ڸ�)
--									A1:������ǰ, B1:��ǰ
CREATE TABLE TBL_PRODUCT#(
	PCODE VARCHAR2(20) CONSTRAINT PK_PRODUCT PRIMARY KEY ,
	CATEGORY CHAR(2),
	PNAME NVARCHAR2(20) NOT NULL,
	PRICE NUMBER(9) NOT NULL
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
--���� ���̺��� �⺻Ű�� ������ �÷��� �߰��غ���.

CREATE TABLE TBL_BUY#(
	BUY_SEQ NUMBER(8), --�������� �Ϸù�ȣ
	CUSTOM_ID VARCHAR2(20),
	PCODE VARCHAR2(20),
	QUANTITY NUMBER(5) NOT NULL,		--����
	BUY_DATE TIMESTAMP,
	--��������Ű���� ���������̸� ������������ (����Ǵ��÷�)
	CONSTRAINT PK_BUY_SEQ PRIMARY KEY (BUY_SEQ),
	CONSTRAINT FK_CUSTOM_ID FOREIGN KEY (CUSTOM_ID) --�� ���̺��� �÷���
		REFERENCES TBL_CUSTOM# (CUSTOM_ID),	--�������̺�� �� �÷���
	CONSTRAINT FK_PCODE FOREIGN KEY (PCODE)
		REFERENCES TBL_PRODUCT# (PCODE)
		--�ܷ�Ű�� ������ �� �ִ� �÷��� �⺻Ű �Ǵ� UNIQUE(������) �� ���ؼ��� �����ϴ�.
		--�ܷ�Ű �÷��� ����(REFERENCES)���̺��� �÷��� �� �ϳ��� ������ �� �ִ�.
);


--�������� �߰� : INSERT
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, SYSDATE);
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, SYSDATE);
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('yummi', '����', 'yumm@daum.net', 28, SYSDATE);
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mj', '����', 'MJ@naver.com', 29, SYSDATE);

--�߿�1: CUSTOM ���̺��� ��(ROW)�����͸� ������ CUSTOM_ID,PCODE �� �ߺ��Ǹ� �ȵȴ�.
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mj', '�ָ��', 'CHOI@naver.com', 33, SYSDATE);	--������ ���̵� ���� �� �����Ƿ� ����


INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�10', 880000);
INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);

--�߿�2: ������� PRICE QUANTITY ���� �÷��� NULL�� �Ǹ� �ȵȴ�.
--�� �ʼ� �����ͷ� ����Ǿ�� �Ѵ�.
INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '�ڵ���ǵ���ũ');	--������ �������Ƿ� ���� NULL�� ������ ����

--����Ŭ������ �Ϸù�ȣ�� �ڵ����� �����ؼ� ����ϰ� �� �� �ִ� ������ ����� �ִ�.
CREATE SEQUENCE TBL_BUY_SEQ;
--�ѹ� ������� �������� ���� �ǵ��� �� ����.

--�������� ���� ����� �ʹٸ� �����ϰ� �ٽ� ������ �Ѵ�
-- DROP SEQUENCE TBL_BUY_SEQ ;
-- �׸��� ���̺��� �����͵� �����ؾ� �ϰ� �ٽ� ������ ����/������ �߰��ؾ��Ѵ�.

--��̳��� �����е� 1���� ���� �����߽��ϴ�.
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mina012', 'IPAD011', 1, '2022-02-06');
--ȫ�浿�� �����е� 2���� ���� �����߽��ϴ�
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'hongGD', 'IPAD011', 2, '2022-02-07');
--�����̰� ��ġ������Ʈ 3���� ���� �����߽��ϴ�
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mj', 'DOWON123a', 3, '2022-02-06');
--��̳��� ��ǵ���ũ 1���� ���� �����߽��ϴ�
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mina012', 'dk_143', 1, '2022-02-07');
--���̰� ��ġ������Ʈ 2���� ���� �����߽��ϴ�.
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'yummi', 'DOWON123a', 2, '2022-02-07');

--�߿�3: ���� ��ǰ���̺� ���� CUSTOM_ID ,PRICE �÷����� ����ϸ� ��Ȯ���� ��������
--�ܷ�Ű�� ������ CUSTOM_ID�� TBL_CUSTOM# ���̺��� �����Ѵ�.
--���� ���̺��� CUSTOM_ID �÷����� ���� ���� ������ �� ����.

INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mmi', 'D_123', 2, '2022-02-07');	--����

--��ǰ�� ���������� �ܷ�Ű�� ������ PCODE�� TBL_PRODUCT# ���̺��� �����Ѵ�.
--���� ���̺��� PCODE �÷����� ���� ���� ������ �� ����.(�ܷ�Ű ����, ���Ἲ �������� ����)

SELECT * FROM TBL_BUY# tb;
SELECT * FROM TBL_PRODUCT# tp ;
SELECT * FROM TBL_CUSTOM# tc ;

--1. custom# ���̺��� age �� 30�� �̻� ��� ���� ��ȸ
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE >='30';

--2. custom# ���̺��� custom_id 'yummi' �� email ��ȸ
SELECT EMIL FROM TBL_CUSTOM# WHERE CUSTOM_ID ='yummi';

--3. product# ���̺��� category 'A2' �� pname ��ȸ
SELECT PNAME FROM "TBL_PRODUCT#" tp WHERE CATEGORY ='A2';

--4. product# ���̺��� price �� �ְ� ��ȸ
SELECT MAX(PRICE) FROM "TBL_PRODUCT#" tp ;

--5. buy# ���̺��� 'IPAD011' �ѱ��� ���� ��ȸ
SELECT SUM(QUANTITY) FROM "TBL_BUY#" tb WHERE PCODE = 'IPAD011';

--6. buy# ���̺��� custom_id 'mina012' �� ��� ���� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE CUSTOM_ID ='mina012';

--7. buy# ���̺��� pcode �� '1'�� ���Ե� �� ��ȸ
SELECT *FROM TBL_BUY# tb WHERE PCODE ='1'; --������ġ ��ȸ
SELECT *FROM TBL_BUY# tb WHERE PCODE LIKE '%1%'; --�κ���ġ ��ȸ : 1�� ����
SELECT *FROM TBL_BUY# tb WHERE PCODE LIKE '1%'; --�κ���ġ ��ȸ : 1�� ����
SELECT *FROM TBL_BUY# tb WHERE PCODE LIKE '%1'; --�κ���ġ ��ȸ : 1�� ������

--8. BUY# ���̺��� PCODE �� 'on'�� �����ϴ� �� ��ȸ
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE '%ON%';


