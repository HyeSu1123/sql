-- ���θ� ���� (���� ��ǰ�� �����Ѵ�.)
--�����̺�
CREATE TABLE TBL_CUSTOM(
	CUSTOM_ID VARCHAR2(20),	--����/����/��ȣ
	NAME NVARCHAR2(20),		--�ѱ۵� �ٱ��� ���� ����
	EMIL VARCHAR2(20),
	AGE NUMBER(3),
	REG_DATE TIMESTAMP DEFAULT SYSDATE
);
--��ǰ ���̺� : ��ǰ �ڵ�(�������� 20�ڸ�),ī�װ�(�������� 2�ڸ�)
--									A1:������ǰ, B1:��ǰ
CREATE TABLE TBL_PRODUCT(
	PCODE VARCHAR2(20),
	CATEGORY CHAR(2),
	PNAME NVARCHAR2(20),
	PRICE NUMBER(9)
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
CREATE TABLE TBL_BUY(
	CUSTOM_ID VARCHAR2(20),
	PCODE VARCHAR2(20),
	QUANTITY NUMBER(5),		--����
	BUY_DATE TIMESTAMP
);

--�������� �߰� : INSERT
INSERT INTO TBL_CUSTOM
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, SYSDATE);
INSERT INTO TBL_CUSTOM
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, SYSDATE);
INSERT INTO TBL_CUSTOM
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('yummi', '����', 'yumm@daum.net', 28, SYSDATE);
INSERT INTO TBL_CUSTOM
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mj', '����', 'MJ@naver.com', 29, SYSDATE);

--�߿�1: CUSTOM ���̺��� ��(ROW)�����͸� ������ CUSTOM_ID,PCODE �� �ߺ��Ǹ� �ȵȴ�.
INSERT INTO TBL_CUSTOM
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mj', '�ָ��', 'CHOI@naver.com', 33, SYSDATE);


INSERT INTO TBL_PRODUCT
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�10', 880000);
INSERT INTO TBL_PRODUCT
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO TBL_PRODUCT
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);

--�߿�2: ������� PRICE QUANTITY ���� �÷��� NULL�� �Ǹ� �ȵȴ�.
--�� �ʼ� �����ͷ� ����Ǿ�� �Ѵ�.
INSERT INTO TBL_PRODUCT
(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '�ڵ���ǵ���ũ');


--��̳��� �����е� 1���� ���� �����߽��ϴ�.
INSERT INTO TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'IPAD011', 1, '2022-02-06');
--ȫ�浿�� �����е� 2���� ���� �����߽��ϴ�
INSERT INTO TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('hongGD', 'IPAD011', 2, '2022-02-07');
--�����̰� ��ġ������Ʈ 3���� ���� �����߽��ϴ�
INSERT INTO TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mj', 'DOWON123a', 3, '2022-02-06');
--��̳��� ��ǵ���ũ 1���� ���� �����߽��ϴ�
INSERT INTO TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'dk_143', 1, '2022-02-07');
--���̰� ��ġ������Ʈ 2���� ���� �����߽��ϴ�.
INSERT INTO TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('yummi', 'DOWON123a', 2, '2022-02-07');

--�߿�3: ���� ��ǰ���̺� ���� CUSTOM_ID ,PRICE �÷����� ����ϸ� ��Ȯ���� ��������
INSERT INTO TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mmi', 'D_123', 2, '2022-02-07');


SELECT * FROM TBL_BUY tb;
SELECT * FROM TBL_PRODUCT tp ;
SELECT * FROM TBL_CUSTOM tc ;






