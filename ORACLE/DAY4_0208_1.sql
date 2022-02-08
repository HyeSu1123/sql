--UPDATE ����
--UPDATE ���̺�� 
--SET ������ �÷��̸� = �� �� (,)�� �����ؼ� ����
--WHERE ������ �࿡ ���� ���ǽ�;

SELECT * FROM "TBL_CUSTOM#" tc ;
--UPDATE �� DELETE�� ���ǽ�(WHERE)�� ���Ǵ� ���� �����ϴ�
UPDATE "TBL_CUSTOM#" SET AGE=39
WHERE CUSTOM_ID ='yummi'; --�⺻Ű �÷� ��� ���ǽ��� 1�� �ุ �����ȴ�.

UPDATE "TBL_CUSTOM#" 
SET AGE =23, EMIL ='nana@korea.kr'
WHERE CUSTOM_ID = 'mj';

--custom_id : yummi �� mj�� ���� reg_date�� 2022�� 2�� 5�Ϸ� ����
UPDATE "TBL_CUSTOM#"
SET REG_DATE='2022-02-05'
WHERE CUSTOM_ID IN ('yummi','mj'); --IN �����ڴ� OR ��ü


--DELETE ����
--	DELETE FROM ���̺�� WHERE ���ǽ�;
-- ���õ����� �߰�
INSERT INTO "TBL_PRODUCT#" (PCODE,CATEGORY,PNAME,PRICE)
VALUES('GAL0112','A1','������20',912300);


DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='GAL0112'; 
--BUY#���̺� �������� ���� ���̶� ������ �ȴ�.
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='IPAD011'; --���� : ���Ἲ ����
--���� BUY#�� ������ �ȴٸ� ���Ἲ ����� ������ ���� �ʴ´�.

UPDATE "TBL_PRODUCT#" SET PNAME ='�����е�����'
WHERE PCODE ='IPAD011'; --BUY#���̺� �������� ���� ���̶� ���� �ȴ�.
UPDATE "TBL_PRODUCT#" SET PCODE  ='IPAD0111'
WHERE PCODE ='IPAD011'; --���� BUY#�� ������ �ȴٸ� ���Ἲ ����� ������ ���� �ʴ´�.


SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

-- ON DELETE , ON UPDATE (����Ŭ�� �ȵ�)�Ӽ� �����Ͽ� �ܷ�Ű �ٽ� �����Ѵ�.
ALTER TABLE IDEV."TBL_BUY#" 
	DROP CONSTRAINT "FK_TBL_PRODUCT#" ;
ALTER TABLE IDEV."TBL_BUY#" 
	ADD CONSTRAINT "FK_TBL_PRODUCT#" 
	FOREIGN KEY (PCODE) REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
	ON DELETE CASCADE;	
	--���Ἲ�� ���ؼ� �����ϴ� ���� �����Ǹ� �����ϴ� �൵ ������(���޾�)���� �����ȴ�.

--ALTER TABLE ����: DROP, ADD, MODIFY(���������� ���Ѵ�.)

--SELECT �� JOIN : �� �̻��� ���̺�(�ַ� ���������� ���̺�)�� �����Ͽ� �����͸� ��ȸ�ϴ� ���
--�� �̻��� ���̺��� ����� �÷��� ���� �� �÷��� �̿��Ͽ� JOIN �Ѵ�

--���� : SELECT ~~~ FROM ���̺�1 A, ���̺�2 B 
--				   WHERE A.�����÷�1=B.�����÷�2;

SELECT * FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE ;		--���� ����.EQUPAL
			
--JOIN �� ���� ��ɹ� ���� 2 (ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
JOIN "TBL_BUY#" tb 
ON tp.PCODE =tb.PCODE ;

-- mina012�� ������ ��ǰ���� �����ΰ�
SELECT tp.PNAME  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012';

--mina012�� ������ ��ǰ��� ���� ��ȸ�ϱ�
SELECT tp.PNAME,tp.PRICE  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012';

		--�����Ҷ�, ����� �÷��� ���̺���� �� �����ؾ��Ѵ�.
SELECT tp.PCODE ,tp.PNAME  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012';
		
SELECT PCODE ,PNAME  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012'; --����
		

--�ܺ����� ���� 2����
SELECT * FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE(+) ;		--�ܺ�����
			
--JOIN �� ���� ��ɹ� ���� 2 (ǥ��)
SELECT * FROM "TBL_PRODUCT#" tp 
	LEFT OUTER JOIN "TBL_BUY#" tb 	--������ �Ǵ� ���̺��� ���� TBL_PRODUCT
	ON tp.PCODE =tb.PCODE ;
		
--JOIN �� ���� ��ɹ� ���� 2 (ǥ��)
SELECT * FROM "TBL_BUY#" tp 
	RIGHT OUTER JOIN "TBL_PRODUCT#" tb 	--������ �Ǵ� ���̺��� ������ TBL_PRODUCT
	ON tp.PCODE =tb.PCODE ;		
		
		
--������ �׽�Ʈ �Ǵ� ������ ������ ���� ���̺��� ��� ������ �����ϱ�
--DELETE : ROLLBACK���� ���� ��� ����, TRUNCATE : ���� ��� �Ұ���
--TRUNCATE : ���������� ��, FK�� ��Ȱ��ȭ�ϰ� ������ �����ؾ� �Ѵ�

--TRUNCATE TABLE "TBL_BUY#" ; 	--���� ���̺� ������ ���� ����
--DELETE FROM "TBL_PRODUCT#" ;	--��ü ������ ������ �������� ��� -> Ȯ��
--TRUNCATE TABLE "TBL_CUSTOM#" ;--����