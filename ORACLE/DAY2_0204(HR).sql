-- 연습 문제
--1. JOBS테이블 문제
--1) MIN_SALARY 컬럼이 10000이상인 JOB_TITLE 조회
SELECT JOB_TITLE FROM JOBS WHERE MIN_SALARY >= 10000;

--2) JOB_TITLE  컬럼이 PROGRAMMER 인 레코드 조회
SELECT * FROM JOBS WHERE  JOB_TITLE ='Programmer';
--대소문자 상관없이 한다면 문자열 관력 오라클 함수 : UPPER(), LOWER()
SELECT * FROM JOBS WHERE UPPER(JOB_TITLE) = 'PROGRAMMER';
SELECT * FROM JOBS WHERE LOWER(JOB_TITLE) = 'programmer';

--3) MAX_SALARY 컬럼의 최대값 조회
SELECT MAX(MAX_SALARY) FROM JOBS j ;



--2. LOCATIONS 테이블 문제
--1)CITY 컬럼이 LONDON인 POSTAL_CODE 컬럼조회
SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY ='London';
SELECT POSTAL_CODE FROM LOCATIONS WHERE CITY ='Seattle';

--2) LOCATION_ID 컬럼이 1700,2700,2500 이 아니고 CITY 컬럼이 TOKYO인 행의 모든 커럼 조회
SEATIONS WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY ='Tokyo';


--3. employees 테이블
-- 통계함수 (집계함수)를 좀더 연습
SELECT COUNT(*) FROM EMPLOYEES e ;		-- 총 개수 : 107
SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID ='IT_PROG';	-- 조건 JOB_ID 직원수 : 5

SELECT AVG(SALARY) FROM EMPLOYEES e ;	--직원 평균 급여 :6461.83
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; --조건 JOB_ID 평균 급여 : 5760

SELECT MAX(SALARY) FROM EMPLOYEES e ; --직원 중 최고 급여 : 24000
SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID='IT_PROG'; --조건 JOB_ID 최고 급여 : 9000

SELECT MIN(SALARY) FROM EMPLOYEES e; --직원 중 최소 급여 : 2100
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; --조건 JOB_ID 최소 급여 : 4200

--통계 함수는 그룹함수로 불리기도 한다. 해당되는 함수의 결과값을 구하기 위해 여러 데이터들을 그룹화하고 실행한다.
--그룹 함수 결과와 다른 컬럼을 같이 조회할 수 없다. 아래 SQL은 오류
SELECT JOB_ID ,MAX(SALARY) FROM EMPLOYEES e ;

SELECT * FROM EMPLOYEES e2 WHERE SALARY = (
--위의 MAX, MIN 구한 SQL 명령을 하나씩 여기에 넣어보자.
--그리고 그 의미를 파악해 보자.
--SELECT MAX(SALARY) FROM EMPLOYEES e
--SELECT MAX(SALARY) FROM EMPLOYEES e WHERE JOB_ID='IT_PROG'
--SELECT MIN(SALARY) FROM EMPLOYEES e
SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'
); --SELECT 안에 쓰인 또 다른 SELECT 는 서브쿼리이다. 서브쿼리 결과값이 1개이므로 = 조건식에 사용할 수 있다

--IT_PROG 중에서 최소급여를 받는 사람의 FIRST_NAME, LAST_NAME 컬럼 조회하기
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES e 
WHERE SALARY =(SELECT MIN(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
AND JOB_ID = 'IT_PROG';


--아래명령은 오류-> 그룹함수는 반드시 SELECT 문으로 사용
SELECT JOB_ID , JOB_TITLE, MIN_SALARY FROM JOBS j2 
WHERE MIN_SALARY < AVG(MIN_SALARY);


--평균값 구하기
SELECT AVG(MIN_SALARY) FROM JOBS j;

--평균값을 조건식에 이용하기 (서브쿼리)
--min_salary 의 평균값보다 작은 행의 job_id, job_title 컬럼 조회
SELECT JOB_ID , JOB_TITLE, MIN_SALARY FROM JOBS j2 
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS j);


SELECT COUNTRY_NAME,REGION_ID FROM COUNTRIES c WHERE REGION_ID = '2';

SELECT * FROM COUNTRIES c WHERE REGION_ID = 2;

SELECT * FROM DEPARTMENTS d ;

SELECT AVG(DEPARTMENT_ID) FROM DEPARTMENTS d;

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID < (SELECT AVG(DEPARTMENT_ID) FROM DEPARTMENTS d);

SELECT * FROM DEPARTMENTS WHERE MANAGER_ID IS NULL;
SELECT * FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL;

SELECT MAX(MANAGER_ID) FROM DEPARTMENTS d WHERE LOCATION_ID = 1700;

SELECT * FROM DEPARTMENTS d WHERE LOCATION_ID IN (1700,1800);
