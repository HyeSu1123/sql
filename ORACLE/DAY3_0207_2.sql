--날짜 타입 : DATE, TIMESTAMP(TIMEZONE 설정 가능)
CREATE TABLE TABLE_DATE(
	ACOL DATE,
	BCOL TIMESTAMP ,
	CCOL TIMESTAMP DEFAULT SYSDATE	
	--값을 지정 안했을 때 기본값(DEFAULT) : SYSDATE는 현재 날짜/시간(서버)
	--클라이언트 컴퓨터의 시간은 CURRENT_DATE
);

--날짜 형식은 문자열 타입과 자동 캐스팅이 된다. ''안에 YYYY-MM-DD HH:MM:SS 문자열 형식으로 작성.
INSERT INTO TABLE_DATE
(ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');

SELECT  * FROM TABLE_DATE td ;


--문자열 타입
-- CHAR(길이) : 고정길이, 단위는 바이트
-- VARCHAR(길이) : 오라클에서 존재하고 사용하지 않는 예비 자료형
-- VARCHAR2(길이) : 가변형 길이,단위는 바이트 길이는 최대 길이이고 실제로 메모리는 데이터 크기만큼 사용한다.
-- 				   최대 2000바이트까지 사용할 수 있다. UTF-8 인코딩에서 한글은 3바이트, 영문/숫자/기호는 1바이트

CREATE TABLE TABLE_STRING(
	ACOL CHAR(10),
	BCOL VARCHAR2(10),
	CCOL NCHAR(10),
	DCOL NVARCHAR2(10)	
);

--CHAR 타입 확인
INSERT INTO TABLE_STRING(ACOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(ACOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(ACOL) VALUES ('가나다라');	-- 4글자 * 3바이트
INSERT INTO TABLE_STRING(ACOL) VALUES ('가나다');

--VARCHAR2 타입 확인 : CHAR 비교했을 때 추가되는 공백이 없다.
INSERT INTO TABLE_STRING(BCOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(BCOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(BCOL) VALUES ('가나다라');	-- 4글자 * 3바이트
INSERT INTO TABLE_STRING(BCOL) VALUES ('가나다');

--NCHAR 타입 확인 : 고정길이 , 단위는 문자개수
INSERT INTO TABLE_STRING(CCOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(CCOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(CCOL) VALUES ('가나다라');
INSERT INTO TABLE_STRING(CCOL) VALUES ('가나다라마바사아자차');  --10글자는 실행
INSERT INTO TABLE_STRING(CCOL) VALUES ('가나다라마바사아자차카'); --11글자는 오류


--NVARCHAR2 타입 확인 : 고정길이 , 단위는 문자개수 NCHAR 비교했을때 추가되는 공백이 없다
INSERT INTO TABLE_STRING(DCOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(DCOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(DCOL) VALUES ('가나다라');
INSERT INTO TABLE_STRING(DCOL) VALUES ('가나다라마바사아자차');  --10글자는 실행
INSERT INTO TABLE_STRING(DCOL) VALUES ('가나다라마바사아자차카'); --11글자는 오류

--각 나라별로 언어의 바이트가 다르기때문에
--여러가지 언어의 문자가 섞여있는 경우에는 NVARCHAR2 로 글자수로 계산하는것이 권고사항이다.
