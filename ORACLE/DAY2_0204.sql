-- DML : INSERT , SELECT , UPDATE , delete ����

--������ ��ȸ : SELECT �÷���1, �÷���2,...FROM ���̺��
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM STUDENTS;

-- ���õǴ� �÷��� �ʿ��� �͵�� �Ѵ�.
-- ��ɾ� �� �� ������ CTRL_ENTER, ������� �ѹ��� ������ �巡���ϰ� ���� ALT+X
SELECT STUNO, STU_NAME FROM STUDENTS;

--��� �÷��� ������ ���� wildcard ���� * �� ��ü
SELECT * FROM STUDENTS;

--������ ��ȸ�� ���Ǵ� ���� �߰��� WHERE �ڿ� ���ǽ� �ۼ�
SELECT * FROM STUDENTS WHERE STUNO =1;
SELECT * FROM STUDENTS WHERE STU_NAME ='�ֳ���';
SELECT * FROM STUDENTS WHERE ENTER_DATE >'2020-06-01'; --DATE Ÿ���� ���ڿ� ''��ȣ ���

--NULL �� �����͸� ��ȸ�ϴ� ���ǽ�
SELECT STUNO, STU_NAME , ENTER_DATE,ETC FROM STUDENTS WHERE ETC IS NULL;
SELECT STUNO, STU_NAME , ENTER_DATE, ETC FROM STUDENTS WHERE ETC IS NOT NULL;

--������ ��ȸ�� �� �÷��� ��ſ� �Լ�(COUNT,SUM,AVG,MAX,MIN)�� ����ϴ� ���
SELECT COUNT(*) FROM STUDENTS ;
SELECT MAX(STUNO) FROM STUDENTS s ; --s�� ��Ī(alias) 
SELECT MIN(STUNO) FROM STUDENTS s ; 

SELECT  MAX(STU_NAME) FROM STUDENTS s ;	--���ڿ�Ÿ���� �÷��� ������ ���Ͽ� ������� ���Ѵ�.
SELECT  MIN(STU_NAME) FROM STUDENTS s ;	

-- ������ ��ȸ ���ǽĿ� IN, �Ǵ� NOT IN : OR ���ǽ� ��ſ� ����Ѵ�.
SELECT * FROM STUDENTS s WHERE STUNO =1 OR STUNO =3 OR STUNO =4;
SELECT * FROM STUDENTS s WHERE STUNO IN (1,3,4); --������ �÷��� ���� ������ ���� OR ���� �˻�


--������ �߰�(����) : INSERT INTO ���̺��(�÷���1, �÷���2,...) VALUES(��1, ��2,...)
INSERT INTO STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');


--������ ���� : UPDATE ���̺�� SET �÷���1=��1, �÷���2=��2,....;
UPDATE STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';


--������ ����� ���� : DELETE FROM ���̺�� WHERE �÷���1=��1 AND �÷���2=��2,....
								  -- WHERE ������ �࿡ ���� ����
DELETE FROM STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

