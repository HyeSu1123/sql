--동등 조인 형식 1
SELECT * FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE ;		--동등 조인.EQUPAL
			
--JOIN 을 쓰는 명령문 형식 2 (표준)
SELECT * FROM "TBL_PRODUCT#" tp 
JOIN "TBL_BUY#" tb 
ON tp.PCODE =tb.PCODE ;

--DOWON123a를 구매한 사용자 이름과 구매날짜조회
SELECT tb.BUY_DATE ,tc.NAME FROM "TBL_BUY#" tb ,"TBL_CUSTOM#" tc 
WHERE tc.CUSTOM_ID =tb.CUSTOM_ID AND PCODE ='DOWON123a';

SELECT tc.NAME ,tb.BUY_DATE  FROM "TBL_CUSTOM#" tc 
JOIN "TBL_BUY#" tb ON tc.CUSTOM_ID = tb.CUSTOM_ID 
WHERE PCODE ='DOWON123a';

--day05 alter table 형식
CREATE TABLE TBL#(
	ACOL VARCHAR2(30) NOT NULL,
	BCOL VARCHAR2(10),
	CCOL NUMBER(3)
);

INSERT INTO TBL#(CCOL) VALUES(12);            --오류 : NOT NULL컬럼이 값이 저장이 안됐다
INSERT INTO TBL#(BCOL,CCOL) VALUES('xytz',12);--오류 : NOT NULL컬럼이 값이 저장이 안됐다
INSERT INTO TBL#(ACOL,CCOL) VALUES('main',12);--실행

--컬럼추가
ALTER TABLE TBL# ADD(DCOL TIMESTAMP DEFAULT SYSDATE);
SELECT * FROM TBL#;

--컬럼 변경
ALTER TABLE TBL# MODIFY (CCOL NUMBER(3) DEFAULT '0');
INSERT INTO TBL#(ACOL,CCOL) VALUES ('main22',12);
INSERT INTO TBL#(ACOL) VALUES ('main22');

--컬럼 제거(DROP)
ALTER TABLE TBL# DROP COLUMN DCOL;

--제약 조건 추가(제약 조건 이름 지정이 필요함)
ALTER TABLE TBL# ADD CONSTRAINT PK_TBL# PRIMARY KEY(ACOL);
--위의 INSERT 명령어 때문에 제약조건 위배(main22가 두개였어서 안됐음) -> 삭제후 기본키 추가
--중복값이 있는 경우 중복되는 행을 삭제하고 기본키 추가해야함
DELETE FROM TBL# WHERE ACOL='main22'AND CCOL =0;

--기존 제약 조건은 변경명령어는 없다 -> 기존 제약 조건 삭제 후 다시 생성해야한다
ALTER TABLE TBL# DROP CONSTRAINT PK_TBL#;

--TBL# 테이블에 AGE 컬럼을 생성한다 CHECK 제약 조건: 16이상 90이하의 값
ALTER TABLE TBL# ADD AGE NUMBER(3) CHECK (AGE BETWEEN 16 AND 90); --AGE >=16 AND AGE <=90
INSERT INTO TBL#(ACOL,AGE) VALUES ('apple',23); --실행
INSERT INTO TBL#(ACOL,AGE) VALUES ('applee',90);--실행
INSERT INTO TBL#(ACOL,AGE) VALUES ('apple',99); --90을 넘어서 오류

--TBL# 테이블에 GENDER(성별) 컬럼을 생성한다 CHECK 제약 조건: 'M','F'
ALTER TABLE TBL# ADD GENDER CHAR(1) CHECK (GENDER IN ('M','F'));
INSERT INTO TBL#(ACOL,GENDER) VALUES ('momo','F'); --실행
INSERT INTO TBL#(ACOL,GENDER) VALUES ('momo','X'); --제약조건 위반 오류

--SELECT 에 사용하는 오라클 함수
--조회결과를 조작하는 함수 : EX) AGE 컬럼이 값이 NULL일때 0, GENDER 'M'이면 남성,'F'면 여성
SELECT * FROM TBL#;
SELECT ACOL,NVL(AGE,0) AS "AGE2", DECODE(GENDER,'M','남성','F','여성') AS "GENDER2"
FROM TBL#;
SELECT ACOL,NVL(AGE,0) AGE2, DECODE(GENDER,'M','남성','F','여성') GENDER2
FROM TBL#;
--NVL은 NULL VALUE 약자, AS는 컬럼명의 별칭지어주기(AS 생략가능)

--DROP TABLE 
DROP TABLE TBL222222#; --이름에 해당되는 테이블 전체 삭제됨.

