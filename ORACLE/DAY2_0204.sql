-- DML : INSERT , SELECT , UPDATE , delete 형식

--데이터 조회 : SELECT 컬럼명1, 컬럼명2,...FROM 테이블명
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM STUDENTS;

-- 선택되는 컬럼은 필요한 것들로 한다.
-- 명령어 한 개 실행은 CTRL_ENTER, 여러명령 한번에 실행은 드래그하고 나서 ALT+X
SELECT STUNO, STU_NAME FROM STUDENTS;

--모든 컬럼을 선택할 때는 wildcard 문자 * 로 대체
SELECT * FROM STUDENTS;

--데이터 조회에 사용되는 조건 추가는 WHERE 뒤에 조건식 작성
SELECT * FROM STUDENTS WHERE STUNO =1;
SELECT * FROM STUDENTS WHERE STU_NAME ='최나나';
SELECT * FROM STUDENTS WHERE ENTER_DATE >'2020-06-01'; --DATE 타입은 문자열 ''기호 사용

--NULL 값 데이터를 조회하는 조건식
SELECT STUNO, STU_NAME , ENTER_DATE,ETC FROM STUDENTS WHERE ETC IS NULL;
SELECT STUNO, STU_NAME , ENTER_DATE, ETC FROM STUDENTS WHERE ETC IS NOT NULL;

--데이터 조회할 때 컬럼명 대신에 함수(COUNT,SUM,AVG,MAX,MIN)를 사용하는 방법
SELECT COUNT(*) FROM STUDENTS ;
SELECT MAX(STUNO) FROM STUDENTS s ; --s는 별칭(alias) 
SELECT MIN(STUNO) FROM STUDENTS s ; 

SELECT  MAX(STU_NAME) FROM STUDENTS s ;	--문자열타입의 컬럼은 사전식 비교하여 결과값을 구한다.
SELECT  MIN(STU_NAME) FROM STUDENTS s ;	

-- 데이터 조회 조건식에 IN, 또는 NOT IN : OR 조건식 대신에 사용한다.
SELECT * FROM STUDENTS s WHERE STUNO =1 OR STUNO =3 OR STUNO =4;
SELECT * FROM STUDENTS s WHERE STUNO IN (1,3,4); --동일한 컬럼에 대해 여러개 값을 OR 조건 검사


--데이터 추가(삽입) : INSERT INTO 테이블명(컬럼명1, 컬럼명2,...) VALUES(값1, 값2,...)
INSERT INTO STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');


--데이터 수정 : UPDATE 테이블명 SET 컬럼명1=값1, 컬럼명2=값2,....;
UPDATE STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';


--데이터 행단위 삭제 : DELETE FROM 테이블명 WHERE 컬럼명1=값1 AND 컬럼명2=값2,....
								  -- WHERE 삭제할 행에 대한 조건
DELETE FROM STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

