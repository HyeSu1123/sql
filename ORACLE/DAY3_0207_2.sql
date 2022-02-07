--��¥ Ÿ�� : DATE, TIMESTAMP(TIMEZONE ���� ����)
CREATE TABLE TABLE_DATE(
	ACOL DATE,
	BCOL TIMESTAMP ,
	CCOL TIMESTAMP DEFAULT SYSDATE	
	--���� ���� ������ �� �⺻��(DEFAULT) : SYSDATE�� ���� ��¥/�ð�(����)
	--Ŭ���̾�Ʈ ��ǻ���� �ð��� CURRENT_DATE
);

--��¥ ������ ���ڿ� Ÿ�԰� �ڵ� ĳ������ �ȴ�. ''�ȿ� YYYY-MM-DD HH:MM:SS ���ڿ� �������� �ۼ�.
INSERT INTO TABLE_DATE
(ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');

SELECT  * FROM TABLE_DATE td ;


--���ڿ� Ÿ��
-- CHAR(����) : ��������, ������ ����Ʈ
-- VARCHAR(����) : ����Ŭ���� �����ϰ� ������� �ʴ� ���� �ڷ���
-- VARCHAR2(����) : ������ ����,������ ����Ʈ ���̴� �ִ� �����̰� ������ �޸𸮴� ������ ũ�⸸ŭ ����Ѵ�.
-- 				   �ִ� 2000����Ʈ���� ����� �� �ִ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE TABLE_STRING(
	ACOL CHAR(10),
	BCOL VARCHAR2(10),
	CCOL NCHAR(10),
	DCOL NVARCHAR2(10)	
);

--CHAR Ÿ�� Ȯ��
INSERT INTO TABLE_STRING(ACOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(ACOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(ACOL) VALUES ('�����ٶ�');	-- 4���� * 3����Ʈ
INSERT INTO TABLE_STRING(ACOL) VALUES ('������');

--VARCHAR2 Ÿ�� Ȯ�� : CHAR ������ �� �߰��Ǵ� ������ ����.
INSERT INTO TABLE_STRING(BCOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(BCOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(BCOL) VALUES ('�����ٶ�');	-- 4���� * 3����Ʈ
INSERT INTO TABLE_STRING(BCOL) VALUES ('������');

--NCHAR Ÿ�� Ȯ�� : �������� , ������ ���ڰ���
INSERT INTO TABLE_STRING(CCOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(CCOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(CCOL) VALUES ('�����ٶ�');
INSERT INTO TABLE_STRING(CCOL) VALUES ('�����ٶ󸶹ٻ������');  --10���ڴ� ����
INSERT INTO TABLE_STRING(CCOL) VALUES ('�����ٶ󸶹ٻ������ī'); --11���ڴ� ����


--NVARCHAR2 Ÿ�� Ȯ�� : �������� , ������ ���ڰ��� NCHAR �������� �߰��Ǵ� ������ ����
INSERT INTO TABLE_STRING(DCOL) VALUES ('abcdefghij');
INSERT INTO TABLE_STRING(DCOL) VALUES ('abcde');
INSERT INTO TABLE_STRING(DCOL) VALUES ('�����ٶ�');
INSERT INTO TABLE_STRING(DCOL) VALUES ('�����ٶ󸶹ٻ������');  --10���ڴ� ����
INSERT INTO TABLE_STRING(DCOL) VALUES ('�����ٶ󸶹ٻ������ī'); --11���ڴ� ����

--�� ���󺰷� ����� ����Ʈ�� �ٸ��⶧����
--�������� ����� ���ڰ� �����ִ� ��쿡�� NVARCHAR2 �� ���ڼ��� ����ϴ°��� �ǰ�����̴�.
