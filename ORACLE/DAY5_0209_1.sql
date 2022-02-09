--���� ���� ���� 1
SELECT * FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE ;		--���� ����.EQUPAL
			
--JOIN �� ���� ��ɹ� ���� 2 (ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
JOIN "TBL_BUY#" tb 
ON tp.PCODE =tb.PCODE ;

--DOWON123a�� ������ ����� �̸��� ���ų�¥��ȸ
SELECT tb.BUY_DATE ,tc.NAME FROM "TBL_BUY#" tb ,"TBL_CUSTOM#" tc 
WHERE tc.CUSTOM_ID =tb.CUSTOM_ID AND PCODE ='DOWON123a';

SELECT tc.NAME ,tb.BUY_DATE  FROM "TBL_CUSTOM#" tc 
JOIN "TBL_BUY#" tb ON tc.CUSTOM_ID = tb.CUSTOM_ID 
WHERE PCODE ='DOWON123a';

--day05 alter table ����
CREATE TABLE TBL#(
	ACOL VARCHAR2(30) NOT NULL,
	BCOL VARCHAR2(10),
	CCOL NUMBER(3)
);

INSERT INTO TBL#(CCOL) VALUES(12);            --���� : NOT NULL�÷��� ���� ������ �ȵƴ�
INSERT INTO TBL#(BCOL,CCOL) VALUES('xytz',12);--���� : NOT NULL�÷��� ���� ������ �ȵƴ�
INSERT INTO TBL#(ACOL,CCOL) VALUES('main',12);--����

--�÷��߰�
ALTER TABLE TBL# ADD(DCOL TIMESTAMP DEFAULT SYSDATE);
SELECT * FROM TBL#;

--�÷� ����
ALTER TABLE TBL# MODIFY (CCOL NUMBER(3) DEFAULT '0');
INSERT INTO TBL#(ACOL,CCOL) VALUES ('main22',12);
INSERT INTO TBL#(ACOL) VALUES ('main22');

--�÷� ����(DROP)
ALTER TABLE TBL# DROP COLUMN DCOL;

--���� ���� �߰�(���� ���� �̸� ������ �ʿ���)
ALTER TABLE TBL# ADD CONSTRAINT PK_TBL# PRIMARY KEY(ACOL);
--���� INSERT ��ɾ� ������ �������� ����(main22�� �ΰ���� �ȵ���) -> ������ �⺻Ű �߰�
--�ߺ����� �ִ� ��� �ߺ��Ǵ� ���� �����ϰ� �⺻Ű �߰��ؾ���
DELETE FROM TBL# WHERE ACOL='main22'AND CCOL =0;

--���� ���� ������ �����ɾ�� ���� -> ���� ���� ���� ���� �� �ٽ� �����ؾ��Ѵ�
ALTER TABLE TBL# DROP CONSTRAINT PK_TBL#;

--TBL# ���̺� AGE �÷��� �����Ѵ� CHECK ���� ����: 16�̻� 90������ ��
ALTER TABLE TBL# ADD AGE NUMBER(3) CHECK (AGE BETWEEN 16 AND 90); --AGE >=16 AND AGE <=90
INSERT INTO TBL#(ACOL,AGE) VALUES ('apple',23); --����
INSERT INTO TBL#(ACOL,AGE) VALUES ('applee',90);--����
INSERT INTO TBL#(ACOL,AGE) VALUES ('apple',99); --90�� �Ѿ ����

--TBL# ���̺� GENDER(����) �÷��� �����Ѵ� CHECK ���� ����: 'M','F'
ALTER TABLE TBL# ADD GENDER CHAR(1) CHECK (GENDER IN ('M','F'));
INSERT INTO TBL#(ACOL,GENDER) VALUES ('momo','F'); --����
INSERT INTO TBL#(ACOL,GENDER) VALUES ('momo','X'); --�������� ���� ����

--SELECT �� ����ϴ� ����Ŭ �Լ�
--��ȸ����� �����ϴ� �Լ� : EX) AGE �÷��� ���� NULL�϶� 0, GENDER 'M'�̸� ����,'F'�� ����
SELECT * FROM TBL#;
SELECT ACOL,NVL(AGE,0) AS "AGE2", DECODE(GENDER,'M','����','F','����') AS "GENDER2"
FROM TBL#;
SELECT ACOL,NVL(AGE,0) AGE2, DECODE(GENDER,'M','����','F','����') GENDER2
FROM TBL#;
--NVL�� NULL VALUE ����, AS�� �÷����� ��Ī�����ֱ�(AS ��������)

--DROP TABLE 
DROP TABLE TBL222222#; --�̸��� �ش�Ǵ� ���̺� ��ü ������.

