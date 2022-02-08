--UPDATE 형식
--UPDATE 테이블명 
--SET 수정할 컬럼이름 = 값 을 (,)로 구분해서 나열
--WHERE 수정할 행에 대한 조건식;

SELECT * FROM "TBL_CUSTOM#" tc ;
--UPDATE 와 DELETE는 조건식(WHERE)이 사용되는 것이 안전하다
UPDATE "TBL_CUSTOM#" SET AGE=39
WHERE CUSTOM_ID ='yummi'; --기본키 컬럼 사용 조건식은 1개 행만 수정된다.

UPDATE "TBL_CUSTOM#" 
SET AGE =23, EMIL ='nana@korea.kr'
WHERE CUSTOM_ID = 'mj';

--custom_id : yummi 와 mj에 대해 reg_date를 2022년 2월 5일로 변경
UPDATE "TBL_CUSTOM#"
SET REG_DATE='2022-02-05'
WHERE CUSTOM_ID IN ('yummi','mj'); --IN 연산자는 OR 대체


--DELETE 형식
--	DELETE FROM 테이블명 WHERE 조건식;
-- 샘플데이터 추가
INSERT INTO "TBL_PRODUCT#" (PCODE,CATEGORY,PNAME,PRICE)
VALUES('GAL0112','A1','갤럭시20',912300);


DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='GAL0112'; 
--BUY#테이블에 참조하지 않은 값이라서 삭제가 된다.
DELETE FROM "TBL_PRODUCT#" tp WHERE PCODE ='IPAD011'; --오류 : 무결성 위배
--만약 BUY#에 참조가 된다면 무결성 위배로 삭제가 되지 않는다.

UPDATE "TBL_PRODUCT#" SET PNAME ='아이패드프로'
WHERE PCODE ='IPAD011'; --BUY#테이블에 참조하지 않은 값이라서 수정 된다.
UPDATE "TBL_PRODUCT#" SET PCODE  ='IPAD0111'
WHERE PCODE ='IPAD011'; --만약 BUY#에 참조가 된다면 무결성 위배로 수정이 되지 않는다.


SELECT * FROM "TBL_CUSTOM#" tc ;
SELECT * FROM "TBL_PRODUCT#" tp ;
SELECT * FROM "TBL_BUY#" tb ;

-- ON DELETE , ON UPDATE (오라클은 안됨)속성 변경하여 외래키 다시 생성한다.
ALTER TABLE IDEV."TBL_BUY#" 
	DROP CONSTRAINT "FK_TBL_PRODUCT#" ;
ALTER TABLE IDEV."TBL_BUY#" 
	ADD CONSTRAINT "FK_TBL_PRODUCT#" 
	FOREIGN KEY (PCODE) REFERENCES IDEV."TBL_PRODUCT#"(PCODE) 
	ON DELETE CASCADE;	
	--무결성을 위해서 참조하는 값이 삭제되면 참조하는 행도 연쇄적(연달아)으로 삭제된다.

--ALTER TABLE 형식: DROP, ADD, MODIFY(제약조건은 못한다.)

--SELECT 의 JOIN : 둘 이상의 테이블(주로 참조관계의 테이블)을 연결하여 데이터를 조회하는 명령
--둘 이상의 테이블은 공통된 컬럼을 갖고 이 컬럼을 이용하여 JOIN 한다

--형식 : SELECT ~~~ FROM 테이블1 A, 테이블2 B 
--				   WHERE A.공통컬럼1=B.공통컬럼2;

SELECT * FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE ;		--동등 조인.EQUPAL
			
--JOIN 을 쓰는 명령문 형식 2 (표준)
SELECT * FROM "TBL_PRODUCT#" tp 
JOIN "TBL_BUY#" tb 
ON tp.PCODE =tb.PCODE ;

-- mina012가 구매한 상품명은 무엇인가
SELECT tp.PNAME  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012';

--mina012가 구매한 상품명과 가격 조회하기
SELECT tp.PNAME,tp.PRICE  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012';

		--조인할때, 공통된 컬럼은 테이블명을 꼭 지정해야한다.
SELECT tp.PCODE ,tp.PNAME  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012';
		
SELECT PCODE ,PNAME  FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE AND CUSTOM_ID ='mina012'; --오류
		

--외부조인 형식 2가지
SELECT * FROM "TBL_PRODUCT#" tp ,"TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE(+) ;		--외부조인
			
--JOIN 을 쓰는 명령문 형식 2 (표준)
SELECT * FROM "TBL_PRODUCT#" tp 
	LEFT OUTER JOIN "TBL_BUY#" tb 	--기준이 되는 테이블은 왼쪽 TBL_PRODUCT
	ON tp.PCODE =tb.PCODE ;
		
--JOIN 을 쓰는 명령문 형식 2 (표준)
SELECT * FROM "TBL_BUY#" tp 
	RIGHT OUTER JOIN "TBL_PRODUCT#" tb 	--기준이 되는 테이블은 오른쪽 TBL_PRODUCT
	ON tp.PCODE =tb.PCODE ;		
		
		
--데이터 테스트 또는 데이터 관리를 위해 테이블의 모든 데이터 삭제하기
--DELETE : ROLLBACK으로 삭제 취소 가능, TRUNCATE : 삭제 취소 불가능
--TRUNCATE : 참조관계일 때, FK를 비활성화하고 데이터 삭제해야 한다

--TRUNCATE TABLE "TBL_BUY#" ; 	--참조 테이블 데이터 먼저 삭제
--DELETE FROM "TBL_PRODUCT#" ;	--전체 데이터 삭제시 디비버에서 경고 -> 확인
--TRUNCATE TABLE "TBL_CUSTOM#" ;--오류