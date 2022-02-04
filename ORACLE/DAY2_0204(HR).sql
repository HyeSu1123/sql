-- ���� ����
--1. JOBS���̺� ����
--1) MIN_SALARY �÷��� 10000�̻��� JOB_TITLE ��ȸ
SELECT JOB_TITLE FROM JOBS WHERE MIN_SALARY >= 10000;

--2) JOB_TITLE  �÷��� PROGRAMMER �� ���ڵ� ��ȸ
SELECT * FROM JOBS WHERE  JOB_TITLE ='Programmer';
--��ҹ��� ������� �Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� : UPPER(), LOWER()
SELECT * FROM JOBS WHERE UPPER(JOB_TITLE) = 'PROGRAMMER';
SELECT * FROM JOBS WHERE LOWER(JOB_TITLE) = 'programmer';

--3) MAX_SALARY �÷��� �ִ밪 ��ȸ
SELECT MAX(MAX_SALARY) FROM JOBS j ;

--min_salary �� ��հ����� ���� ���� job_id, job_title �÷� ��ȸ -> GROUP ���� �Ŀ� �ٽ� �غ���
 SELECT JOB_ID , JOB_TITLE FROM JOBS j WHERE MIN_SALARY < AVG(MIN_SALARY); -- ������ ����

--2. LOCATIONS ���̺� ����
--1)CITY �÷��� LONDON�� POSTAL_CODE �÷���ȸ
SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY ='London';
SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY ='Seattle';

--2) LOCATION_ID �÷��� 1700,2700,2500 �� �ƴϰ� CITY �÷��� TOKYO�� ���� ��� Ŀ�� ��ȸ
SELECT * FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY ='Tokyo';