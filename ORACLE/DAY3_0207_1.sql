--������ Ÿ��NUMBER ���� ���̺�
--NUMBER : �ڹٷ� ������ BYTE, SHORT,INT, LONG, FLOAT, DOUBLE
--		   NUMBER(��ü �ڸ���(���е�), �Ҽ��� �ڸ���)
--TABLE_NUMBER : ���̺� �̸�
CREATE TABLE TABLE_NUMBER(
	COL1 NUMBER,		-- �ڸ����� �������� ������ �ִ� 38�ڸ��̴�.
	COL2 NUMBER(5),
	COL3 NUMBER(7,2),
	COL4 NUMBER(2,5)
);
--�������� ����
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00012);

--COL2(5) Į���� �ڸ����� 6�� : ����
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 123456, 12345.67, 0.00012);

--COL3 (7,2)Į���� �Ҽ��� ���� �ڸ����� 2���� ���߱� ���� �ݿø� �Ѵ�.
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.678, 0.00012);

--COL3 (7,2) Į�� ��ü �ڸ��� 7�� : �Ҽ��� ���ϴ� �׻� 2��, �׸��� ������ 5�ڸ�
--�׷��� �����ΰ� 5�ڸ��� �ʰ��ϸ� 6�ڸ��� ������ ����.
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 123456.67, 0.00012);


--COL4 Į���� NUMBER(2,5) : ��ü ��ȿ�ڸ��� :5��
--�̶� �׻� ��ȿ�ڸ��� �ִ� 2��(0 ���� ����), ������ 3���� ������ 0�̴�.
--�Ҽ��� �ڸ��� �Ѿ�� �ݿø��Ѵ�.
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.000126);

--COL4 Į���� NUMBER(2,5) : �ּ� ������ 3���� ��ȿ�ڸ��� 0 -> �̰� �ƴ϶�� ����
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.0012);

--��)0.00012300 �� ��, ��ȿ�� ���� 0.000123 123�ڿ� �ִ� 00�� ��ȿ�� ���� �ƴϴ�
-- ������ �����ٸ� 0012300�ϸ� 12300�� ��ȿ�� ��������
--	    �տ� �ִ� 00�� ��ȿ�� ���� �ƴϴ�

--COL4 Į���� NUMBER(2,5) : 0�� 3�� �̻��̾�� �Ѵ�.
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.0000000123);

--COL4 Į���� NUMBER(2,5) : 0 ���� ����
INSERT INTO TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.0);
