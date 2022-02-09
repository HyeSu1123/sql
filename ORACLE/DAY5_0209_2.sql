--COMMIT, ROLLBACK 테스트
-- 디비버 AUTO COMMIT 설정을 변경해야 한다.
-- 방법 1)현재 편집기에 대해서만 변경(데이터베이스 메뉴 - 트랜잭션 모드 - MANUAL COMMIT)
-- 방법 2)DB 연결 유형을 AUTO COMMIT 을 해제 (윈도우 메뉴-설정-연결-연결유형을 AUTO COMMIT을 해제)


--실행순서 1번
SELECT * FROM TBL#;--현재상태 확인

DELETE FROM TBL# WHERE ACOL='momo';
SELECT * FROM TBL#; --확인

ROLLBACK ;	--DELETE 명령을 원래대로 되돌리기
SELECT * FROM TBL#; --확인

--실행순서 2번
DELETE FROM TBL# WHERE ACOL='momo';
SELECT * FROM TBL#; --확인
COMMIT;
SELECT * FROM TBL#;
ROLLBACK ;		--위에서 COMMIT 을 했으므로 DELETE 를 취소할 수 없다
SELECT * FROM TBL#;

--실행순서 3번
INSERT INTO TBL# (ACOL,AGE) VALUES('nana',30);
SELECT * FROM TBL#;
ROLLBACK ;
SELECT * FROM TBL#;

--실행순서 4번
INSERT INTO TBL# (ACOL,AGE) VALUES('nana22',33);
INSERT INTO TBL# (ACOL,AGE) VALUES('쯔위',29);
COMMIT;	--최종 COMMIT 또는 ROLLBACK 한 그 이후의 명령을 COMMIT 한다
UPDATE TBL# SET BCOL='test' WHERE ACOL='nana22';
DELETE FROM TBL# WHERE ACOL = 'main22';
ROLLBACK;	--최종 COMMIT 또는 ROLLBACK 한 그 이후의 명령을 ROLLBACK 한다

