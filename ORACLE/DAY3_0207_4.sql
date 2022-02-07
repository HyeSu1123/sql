--중요1: 고객과 상품 테이블의 행(ROW)데이터를 구분한 CUSTOM_ID,PCODE 는 중복되면 안된다.
	--	기본키 컬럼을 정한다(중복된 값과 NULL값은 저장이 안된다)
	--  SELECT 를 기본키 값으로 검색할 때 오직 1개의 행 결가가 조회된다
SELECT * FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID ='mina012';
--중요2: 예를들면 PRICE QUANTITY 등의 컬럼은 NULL이 되면 안된다.
	--	NOT NULL 컬럼으로 설정한다.(NULL 저장 안된다.)
--중요3: 고객과 상품테이블에 없는 CUSTOM_ID ,PRICE 컬럼값을 사용하면 정확성이 떨어진다
	--	외래키 컬럼을 정한다(다른 테이블에서 값을 참조한다.NULL 저장도 안한다.)
	--  외래키는 컬럼의 데이터가 참조값(다른테이블 컬럼)을 사용하게 하는것이 목적이다.

--위의 NOT NULL, 기본키, 외래키는 대표적인 제약조건(CONSTRAINT) 설정이다.
--제약조건을 설정한 테이블로 생성해 보자.

--고객 테이블
CREATE TABLE TBL_CUSTOM#(
	CUSTOM_ID VARCHAR2(20) PRIMARY KEY,	
	NAME NVARCHAR2(20) NOT NULL,		
	EMIL VARCHAR2(20),
	AGE NUMBER(3),
	REG_DATE TIMESTAMP DEFAULT SYSDATE
);
--상품 테이블 : 상품 코드(가변길이 20자리),카테고리(고정길이 2자리)
--									A1:전자제품, B1:식품
CREATE TABLE TBL_PRODUCT#(
	PCODE VARCHAR2(20) CONSTRAINT PK_PRODUCT PRIMARY KEY ,
	CATEGORY CHAR(2),
	PNAME NVARCHAR2(20) NOT NULL,
	PRICE NUMBER(9) NOT NULL
);

--구매 테이블 : 어느 고객이 무슨 상품을 구입하는가?
--구매 테이블의 기본키는 별도로 컬럼을 추가해보자.

CREATE TABLE TBL_BUY#(
	BUY_SEQ NUMBER(8), --구매정보 일련번호
	CUSTOM_ID VARCHAR2(20),
	PCODE VARCHAR2(20),
	QUANTITY NUMBER(5) NOT NULL,		--수량
	BUY_DATE TIMESTAMP,
	--제약조건키워드 제약조건이름 제약조건유형 (적용되는컬럼)
	CONSTRAINT PK_BUY_SEQ PRIMARY KEY (BUY_SEQ),
	CONSTRAINT FK_CUSTOM_ID FOREIGN KEY (CUSTOM_ID) --이 테이블의 컬럼명
		REFERENCES TBL_CUSTOM# (CUSTOM_ID),	--참조테이블과 그 컬럼명
	CONSTRAINT FK_PCODE FOREIGN KEY (PCODE)
		REFERENCES TBL_PRODUCT# (PCODE)
		--외래키로 설정될 수 있는 컬럼은 기본키 또는 UNIQUE(유일한) 에 대해서만 가능하다.
		--외래키 컬럼은 참조(REFERENCES)테이블의 컬럼값 중 하나로 저장할 수 있다.
);


--테이터의 추가 : INSERT
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mina012', '김미나', 'kimm@gmail.com', 20, SYSDATE);
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@korea.com', 32, SYSDATE);
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('yummi', '유미', 'yumm@daum.net', 28, SYSDATE);
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mj', '명준', 'MJ@naver.com', 29, SYSDATE);

--중요1: CUSTOM 테이블의 행(ROW)데이터를 구분한 CUSTOM_ID,PCODE 는 중복되면 안된다.
INSERT INTO TBL_CUSTOM#
(CUSTOM_ID, NAME, EMIL, AGE, REG_DATE)
VALUES('mj', '최모모', 'CHOI@naver.com', 33, SYSDATE);	--동일한 아이디를 넣을 수 없으므로 오류


INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '아이패드10', 880000);
INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '동원참치선물세트', 54000);
INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '모션데스크', 234500);

--중요2: 예를들면 PRICE QUANTITY 등의 컬럼은 NULL이 되면 안된다.
--꼭 필수 데이터로 저장되어야 한다.
INSERT INTO TBL_PRODUCT#
(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '자동모션데스크');	--가격이 빠졌으므로 오류 NULL을 넣을수 없다

--오라클에서는 일련번호를 자동으로 증가해서 사용하게 할 수 있는 시퀀스 기능이 있다.
CREATE SEQUENCE TBL_BUY_SEQ;
--한번 만들어진 시퀀스는 값을 되돌릴 수 없다.

--시퀀스를 새로 만들고 싶다면 삭제하고 다시 만들어야 한다
-- DROP SEQUENCE TBL_BUY_SEQ ;
-- 그리고 테이블의 데이터도 삭제해야 하고 다시 시퀀스 생성/데이터 추가해야한다.

--김미나가 아이패드 1개를 어제 구매했습니다.
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mina012', 'IPAD011', 1, '2022-02-06');
--홍길동이 아이패드 2개를 오늘 구매했습니다
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'hongGD', 'IPAD011', 2, '2022-02-07');
--명준이가 참치선물세트 3개를 어제 구매했습니다
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mj', 'DOWON123a', 3, '2022-02-06');
--김미나가 모션데스크 1개를 오늘 구매했습니다
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mina012', 'dk_143', 1, '2022-02-07');
--유미가 참치선물세트 2개를 오늘 구매했습니다.
INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'yummi', 'DOWON123a', 2, '2022-02-07');

--중요3: 고객과 상품테이블에 없는 CUSTOM_ID ,PRICE 컬럼값을 사용하면 정확성이 떨어진다
--외래키로 설정된 CUSTOM_ID는 TBL_CUSTOM# 테이블을 참조한다.
--참조 테이블의 CUSTOM_ID 컬럼값에 없는 것을 저장할 수 없다.

INSERT INTO TBL_BUY#
(BUY_SEQ, CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(TBL_BUY_SEQ.NEXTVAL, 'mmi', 'D_123', 2, '2022-02-07');	--오류

--상품도 마찬가지고 외래키로 설정된 PCODE는 TBL_PRODUCT# 테이블을 참조한다.
--참조 테이블의 PCODE 컬럼값에 없는 것을 저장할 수 없다.(외래키 위반, 무결성 제약조건 위반)

SELECT * FROM TBL_BUY# tb;
SELECT * FROM TBL_PRODUCT# tp ;
SELECT * FROM TBL_CUSTOM# tc ;

--1. custom# 테이블에서 age 가 30세 이상 모든 내용 조회
SELECT * FROM "TBL_CUSTOM#" tc WHERE AGE >='30';

--2. custom# 테이블에서 custom_id 'yummi' 의 email 조회
SELECT EMIL FROM TBL_CUSTOM# WHERE CUSTOM_ID ='yummi';

--3. product# 테이블에서 category 'A2' 의 pname 조회
SELECT PNAME FROM "TBL_PRODUCT#" tp WHERE CATEGORY ='A2';

--4. product# 테이블에서 price 의 최고값 조회
SELECT MAX(PRICE) FROM "TBL_PRODUCT#" tp ;

--5. buy# 테이블에서 'IPAD011' 총구매 수량 조회
SELECT SUM(QUANTITY) FROM "TBL_BUY#" tb WHERE PCODE = 'IPAD011';

--6. buy# 테이블에서 custom_id 'mina012' 의 모든 내용 조회
SELECT * FROM "TBL_BUY#" tb WHERE CUSTOM_ID ='mina012';

--7. buy# 테이블에서 pcode 가 '1'이 포함된 것 조회
SELECT *FROM TBL_BUY# tb WHERE PCODE ='1'; --완전일치 조회
SELECT *FROM TBL_BUY# tb WHERE PCODE LIKE '%1%'; --부분일치 조회 : 1을 포함
SELECT *FROM TBL_BUY# tb WHERE PCODE LIKE '1%'; --부분일치 조회 : 1로 시작
SELECT *FROM TBL_BUY# tb WHERE PCODE LIKE '%1'; --부분일치 조회 : 1로 끝나는

--8. BUY# 테이블에서 PCODE 에 'on'을 포함하는 것 조회
SELECT * FROM "TBL_BUY#" tb WHERE PCODE LIKE '%ON%';


