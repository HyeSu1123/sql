--COMMIT, ROLLBACK �׽�Ʈ
-- ���� AUTO COMMIT ������ �����ؾ� �Ѵ�.
-- ��� 1)���� �����⿡ ���ؼ��� ����(�����ͺ��̽� �޴� - Ʈ����� ��� - MANUAL COMMIT)
-- ��� 2)DB ���� ������ AUTO COMMIT �� ���� (������ �޴�-����-����-���������� AUTO COMMIT�� ����)


--������� 1��
SELECT * FROM TBL#;--������� Ȯ��

DELETE FROM TBL# WHERE ACOL='momo';
SELECT * FROM TBL#; --Ȯ��

ROLLBACK ;	--DELETE ����� ������� �ǵ�����
SELECT * FROM TBL#; --Ȯ��

--������� 2��
DELETE FROM TBL# WHERE ACOL='momo';
SELECT * FROM TBL#; --Ȯ��
COMMIT;
SELECT * FROM TBL#;
ROLLBACK ;		--������ COMMIT �� �����Ƿ� DELETE �� ����� �� ����
SELECT * FROM TBL#;

--������� 3��
INSERT INTO TBL# (ACOL,AGE) VALUES('nana',30);
SELECT * FROM TBL#;
ROLLBACK ;
SELECT * FROM TBL#;

--������� 4��
INSERT INTO TBL# (ACOL,AGE) VALUES('nana22',33);
INSERT INTO TBL# (ACOL,AGE) VALUES('����',29);
COMMIT;	--���� COMMIT �Ǵ� ROLLBACK �� �� ������ ����� COMMIT �Ѵ�
UPDATE TBL# SET BCOL='test' WHERE ACOL='nana22';
DELETE FROM TBL# WHERE ACOL = 'main22';
ROLLBACK;	--���� COMMIT �Ǵ� ROLLBACK �� �� ������ ����� ROLLBACK �Ѵ�

