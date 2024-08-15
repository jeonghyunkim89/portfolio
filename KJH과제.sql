--[Basic SELECT]
-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"���� ǥ���ϵ��� �Ѵ�.
SELECT DEPARTMENT_NAME "�а� ��", CATEGORY "�迭"
FROM TB_DEPARTMENT;

-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
SELECT DEPARTMENT_NAME || '�� ������ ' || CAPACITY || ' �� �Դϴ�.' "�а��� ����"
FROM TB_DEPARTMENT;

-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�.
-- �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)
SELECT STUDENT_NAME
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = 001 AND SUBSTR(STUDENT_SSN,8,1)=2 AND ABSENCE_YN = 'Y';

-- 4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�. �� ����ڵ��� �й��� ������ ���� ��
-- ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.  A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119');

-- 5. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
--WHERE CAPACITY >= 20 AND 30 >= CAPACITY;
WHERE CAPACITY BETWEEN 20 AND 30;

-- 6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�.
-- �׷� �� ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT PROFESSOR_NAME 
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�. ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;
--WHERE DEPARTMENT_NO NOT BETWEEN 001 AND 063;

-- 8. ������û�� �Ϸ��� �Ѵ�. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;

-- 10. 02 �й� ���� �����ڵ��� ������ ������� �Ѵ�. ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '%����%' AND ABSENCE_YN = 'N' AND SUBSTR(ENTRANCE_DATE,1,2) = 02;
--WHERE SUBSTR(STUDENT_ADDRESS, 1, 2) = '����' AND ABSENCE_YN = 'N' AND SUBSTR(ENTRANCE_DATE,1,2) = 02;

--[Additional SELECT - �Լ�]
-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--(��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
/*
SELECT STUDENT_NO "�й�", STUDENT_NAME "�̸�", TO_CHAR(ENTRANCE_DATE, 'YY/MM/DD') "���г⵵"
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = '002'
ORDER BY 3;
*/
SELECT STUDENT_NO "�й�", STUDENT_NAME "�̸�", ENTRANCE_DATE "���г⵵"
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�.
--�� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����.
--(* �̶� �ùٸ��� �ۼ��� SQL������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

--3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
--��, �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�.
--(��, ���� �� 2000�� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� �Ѵ�. ���̴� ���������� ����Ѵ�.)
SELECT PROFESSOR_NAME "�����̸�", FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(PROFESSOR_SSN,1,6), 'YYMMDD'))/12) "����"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8,1) = '1'
ORDER BY FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(PROFESSOR_SSN,1,6), 'YYMMDD'))/12);

--4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
--��� ����� ? "�̸�"�� �������� �Ѵ�. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(PROFESSOR_NAME,2) "�̸�"
FROM TB_PROFESSOR;

--5. �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. ��� ã�Ƴ� ���ΰ�? �̶�, 19 �쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RRMMDD')) > 19;

--6. 2020�� ũ���������� ���� �����ΰ�?
SELECT TO_CHAR(TO_DATE('20201225','RRRRMMDD'), 'DAY')
FROM DUAL;

--7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?
--�� TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?
SELECT TO_DATE('99/10/11', 'YY/MM/DD')
FROM DUAL; -- 2099�� 10�� 11��
SELECT TO_DATE('49/10/11', 'YY/MM/DD')
FROM DUAL; -- 2049�� 10�� 11��
SELECT TO_DATE('99/10/11', 'RR/MM/DD')
FROM DUAL; -- 1999�� 10�� 11��
SELECT TO_DATE('49/10/11', 'RR/MM/DD')
FROM DUAL; -- 2049�� 10�� 11��

--8. �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����ϰ� �Ǿ��ִ�.
--2000�⵵ ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

--9. �й��� A517178 �� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
--��, �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ���Ѵ�
SELECT ROUND(AVG(POINT),1) ����
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

--10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� ������� ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO �а���ȣ, COUNT(*) �л���
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO;

--11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ��� �˾Ƴ��� SQL ���� �ۼ��Ͻÿ�.
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

--12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
--��, �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.
SELECT SUBSTR(TERM_NO, 1,4) �⵵, ROUND(AVG(POINT),1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1,4);

--13. �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO �а��ڵ��, COUNT(DECODE(ABSENCE_YN, 'Y', 1)) "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO;

--14. �� ���б��� �ٴϴ� ��������(��٣���)�л����� �̸��� ã���� �Ѵ�. � SQL ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME �����̸�, COUNT(*) "������ ��"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1;

--15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ����, �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
--(��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT NVL(SUBSTR(TERM_NO, 1,4),' ') �⵵, NVL(SUBSTR(TERM_NO,5,2),' ') �б�, ROUND(AVG(POINT),1) "�б� �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1,4), SUBSTR(TERM_NO,5,2))
ORDER BY SUBSTR(TERM_NO, 1,4),SUBSTR(TERM_NO,5,2);

--[Additional SELECT - Option]
--1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�, ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.
SELECT STUDENT_NAME �л��̸�, STUDENT_ADDRESS �ּ���
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

--2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

--3. �ּ����� �������� ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸��� �й�, �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�.
--��, ���������� "�л��̸�", "�й�", "������ �ּ�"�� ��µǵ��� ����.
SELECT STUDENT_NAME "�л��̸�", STUDENT_NO "�й�", STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '����%' AND STUDENT_NO LIKE '9%'
    OR STUDENT_ADDRESS LIKE '���%' AND STUDENT_NO LIKE '9%'
ORDER BY STUDENT_NAME;

--4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
--(���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�Ƴ����� ����)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR P
    JOIN TB_DEPARTMENT S ON P.DEPARTMENT_NO = S.DEPARTMENT_NO
WHERE S.DEPARTMENT_NAME = '���а�'
ORDER BY PROFESSOR_SSN;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = '005'
ORDER BY PROFESSOR_SSN;

--5. 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�.
--������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��غ��ÿ�.
SELECT STUDENT_NO, TO_CHAR(POINT, '9.99') POINT
FROM TB_GRADE
WHERE CLASS_NO = 'C3118100' AND TERM_NO = '200402'
ORDER BY POINT DESC, STUDENT_NO ASC;

--6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT S
    JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY STUDENT_NAME;

SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT 
    JOIN TB_DEPARTMENT  USING (DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

--7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
    
--8. ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO);

--9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�.
--�̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C
    JOIN TB_CLASS_PROFESSOR CP ON C.CLASS_NO = CP.CLASS_NO
    JOIN TB_PROFESSOR P ON CP.PROFESSOR_NO = P.PROFESSOR_NO
    JOIN TB_DEPARTMENT D ON P.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE CATEGORY = '�ι���ȸ';

--10. �������а��� �л����� ������ ���Ϸ��� �Ѵ�. �����а� �л����� "�й�", "�л� �̸�", "��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
--(��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT STUDENT_NO "�й�", STUDENT_NAME "�л� �̸�", ROUND(AVG(POINT),1) "��ü ����"
FROM TB_STUDENT
    JOIN TB_GRADE USING (STUDENT_NO)
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME;

--11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ� ����
--�а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ���� �ۼ��Ͻÿ�.
--��, �������� "�а��̸�", "�л��̸�", "���������̸�"���� ��µǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME "�а��̸�", STUDENT_NAME "�л��̸�", PROFESSOR_NAME "���������̸�"
FROM TB_DEPARTMENT
    JOIN TB_STUDENT S USING (DEPARTMENT_NO)
    JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
WHERE STUDENT_NO = 'A313047';

--12. 2007 �⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� �����б⸦ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, TERM_NO "TERM_NAME"
FROM TB_STUDENT S
    JOIN TB_GRADE G ON S.STUDENT_NO = G.STUDENT_NO
    JOIN TB_CLASS C ON G.CLASS_NO = C.CLASS_NO
WHERE TERM_NO LIKE '2007%' AND CLASS_NAME = '�ΰ������';

--13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� �����̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS C
    LEFT JOIN TB_CLASS_PROFESSOR CP ON C.CLASS_NO = CP.CLASS_NO
    JOIN TB_DEPARTMENT D ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE CATEGORY = '��ü��' AND PROFESSOR_NO IS NULL;

--14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� �Ѵ�.
--�л��̸��� �������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������"���� ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�.
--��, �������� "�л��̸�", "��������"�� ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.
SELECT STUDENT_NAME "�л��̸�", NVL(PROFESSOR_NAME, '�������� ������') "��������"
FROM TB_STUDENT S
    LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
     JOIN TB_DEPARTMENT D  ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
WHERE DEPARTMENT_NAME = '���ݾƾ��а�'
ORDER BY STUDENT_NO;

--15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а��̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO "�й�", STUDENT_NAME "�̸�", DEPARTMENT_NAME "�а��̸�", TRUNC(AVG(POINT),8) "����"
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    JOIN TB_GRADE USING (STUDENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING AVG(POINT) >= 4.0;

--16. ȯ�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NO, CLASS_NAME, TRUNC(AVG(POINT),8) "AVG(POINT)"
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    JOIN TB_GRADE USING (CLASS_NO)
WHERE DEPARTMENT_NAME = 'ȯ�������а�'
    AND CLASS_TYPE LIKE '����%'
GROUP BY CLASS_NO, CLASS_NAME;

--17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                        FROM TB_STUDENT
                        WHERE STUDENT_NAME = '�ְ���');
--18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME
FROM (SELECT STUDENT_NO, STUDENT_NAME, AVG(POINT)
      FROM TB_STUDENT
            JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
            JOIN TB_GRADE USING (STUDENT_NO)
      WHERE DEPARTMENT_NAME = '������а�'
      GROUP BY STUDENT_NO, STUDENT_NAME
      ORDER BY AVG(POINT) DESC)
WHERE ROWNUM = 1;

--19. �� ������б��� "ȯ�������а�"�� ���� ���� �迭 �а����� �а� �� �������� ������ �ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�.
--��, �������� "�迭 �а���", "��������"���� ǥ�õǵ��� �ϰ�, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ����Ѵ�.
SELECT DEPARTMENT_NAME "�迭 �а���", ROUND(AVG(POINT),1) "��������"
FROM TB_DEPARTMENT
        JOIN TB_CLASS USING (DEPARTMENT_NO)
        JOIN TB_GRADE USING (CLASS_NO)
WHERE CATEGORY = (SELECT CATEGORY
                    FROM TB_DEPARTMENT
                    WHERE DEPARTMENT_NAME = 'ȯ�������а�')
    AND CLASS_TYPE LIKE '����%'
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;

--[DDL]
--1. �迭 ������ ������ ī�װ� ���̺��� ������� �Ѵ�. ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

--2. ���� ������ ������ ���̺��� ������� �Ѵ�. ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

--3. TB_CATEGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
--(KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� �Ѵٸ� �̸��� ������ �˾Ƽ� ������ �̸��� ����Ѵ�.)
ALTER TABLE TB_CATEGORY ADD CONSTRAINT CATEGORY_PK PRIMARY KEY(NAME);

--4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;

--5. �� ���̺��� �÷� ���� NO�� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����, �÷����� NAME �� ���� ���������� ���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
ALTER TABLE TB_CATEGORY MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);
ALTER TABLE TB_CLASS_TYPE MODIFY NAME VARCHAR2(20);

--6. �� ���̺��� NO�÷��� NAME�÷��� �̸��� ���� TB_ �� ������ ���̺� �̸��� �տ� ���� ���·� �����Ѵ�.
ALTER TABLE TB_CATEGORY RENAME COLUMN NO TO CATEGORY_NO;
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_TYPE_NAME;

--7. TB_CATAGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ���� �����Ͻÿ�.
--Primary Key �� �̸��� ?PK_ + �÷��̸�?���� �����Ͻÿ�. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CATEGORY DROP CONSTRAINT CATEGORY_PK;
ALTER TABLE TB_CATEGORY ADD CONSTRAINT PK_CATEGORY_NAME PRIMARY KEY (CATEGORY_NAME);
ALTER TABLE TB_CLASS_TYPE DROP CONSTRAINT SYS_C008406;
ALTER TABLE TB_CLASS_TYPE ADD CONSTRAINT PK_CLASS_TYPE_NO PRIMARY KEY (CLASS_TYPE_NO);

--Oracle������ PRIMARY KEY ���������� �̸��� ���� RENAME�ϴ� ����� �������� �ʴ´�.
--PRIMARY KEY ���������� �����ϰ� �ٽ� �߰��ϴ� ������� �̸��� �����ϴ� ���� �Ϲ����� �����̴�.
--�̰��� �����ͺ��̽��� ���Ἲ�� �����ϱ� ���� �Ϲ����� �����̴�.

--8. ������ ���� INSERT ���� �����Ѵ�.
INSERT INTO TB_CATEGORY VALUES('����', 'Y');
INSERT INTO TB_CATEGORY VALUES('�ڿ�����', 'Y');
INSERT INTO TB_CATEGORY VALUES('����', 'Y');
INSERT INTO TB_CATEGORY VALUES('��ü��', 'Y');
INSERT INTO TB_CATEGORY VALUES('�ι���ȸ', 'Y');
COMMIT;

--9. TB_DEPARTMENT�� CATEGORY�÷��� TB_CATEGORY���̺��� CATEGORY_NAME�÷��� �θ����� �����ϵ���
--FOREIGN KEY �� �����Ͻÿ�. �� �� KEY �̸��� FK_���̺��̸�_�÷��̸����� �����Ѵ�. (ex. FK_DEPARTMENT_CATEGORY )
ALTER TABLE TB_DEPARTMENT
    ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY(CATEGORY)
    REFERENCES TB_CATEGORY (CATEGORY_NAME);

--10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW �� ������� �Ѵ�. �Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�.
GRANT CREATE VIEW TO C##WORKBOOK;
CREATE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO �й�
    , STUDENT_NAME �л��̸�
    , STUDENT_ADDRESS �ּ�
    FROM TB_STUDENT;

SELECT *
FROM VW_�л��Ϲ�����;

--11. �� ������б��� 1 �⿡ �� ���� �а����� �л��� ���������� ���� ����� �����Ѵ�.
--�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸����� �����Ǿ� �ִ� VIEW �� ����ÿ�.
--�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ�
--(��, �� VIEW �� �ܼ� SELECT���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.)
CREATE VIEW VW_�������
AS SELECT STUDENT_NAME �л��̸�
          , DEPARTMENT_NAME �а��̸�
          , NVL(PROFESSOR_NAME, '������������') ���������̸�
    FROM TB_STUDENT
        LEFT JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
        LEFT JOIN TB_PROFESSOR USING (DEPARTMENT_NO)
GROUP BY STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
ORDER BY DEPARTMENT_NAME;

SELECT *
FROM VW_�������;

--12. ��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW �� �ۼ��� ����.
DROP VIEW VW_�а����л���;
CREATE VIEW VW_�а����л���
AS SELECT DEPARTMENT_NAME
          , COUNT(*) STUDENT_COUNT
    FROM TB_STUDENT
        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;

SELECT *
FROM VW_�а����л���;

--13. ������ ������ �л��Ϲ����� View �� ���ؼ� �й��� A213046 �� �л��� �̸��� �����̸����� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
UPDATE VW_�л��Ϲ�����
    SET �л��̸� = '������'
WHERE �й� = 'A213046';
--VIEW�� ��Ī�� ����ؼ� ����� ������, �ش� COLUMN�� ������ ������ ��Ī�� �̿��� �����Ѵ�.

--14. 13�������� ���� VIEW �� ���ؼ� �����Ͱ� ����� �� �ִ� ��Ȳ�� �������� VIEW�� ��� �����ؾ� �ϴ��� �ۼ��Ͻÿ�.
WITH READ ONLY : �並 ��ȸ�� �����ϵ��� �ϴ� �ɼ�
CREATE [OR REPLACE] [FORCE | (NOFORCE)] VIEW ���̸�(=���)
    AS ��������
    [WITH CHECK OPTION]
    [WITH READ ONLY];

--15. �� ������б��� �ų� ������û �Ⱓ�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ���� ������ �ǰ� �ִ�. �ֱ� 3 ���� �������� �����ο��� ���� ���Ҵ� 3������ ã�� ������ �ۼ��غ��ÿ�.
SELECT �����ȣ, 
       �����̸�, 
       ������������
FROM (
    SELECT CLASS_NO AS �����ȣ, 
           CLASS_NAME AS �����̸�, 
           COUNT(*) AS ������������
    FROM TB_CLASS
    JOIN TB_GRADE USING (CLASS_NO)
    WHERE SUBSTR(TERM_NO, 1, 4) IN('2007', '2008', '2009')
    GROUP BY CLASS_NO, CLASS_NAME
    ORDER BY COUNT(*) DESC
)
WHERE ROWNUM <= 3;

--[DML]
--1. �������� ���̺�(TB_CLASS_TYPE)�� �Ʒ��� ���� �����͸� �Է��Ͻÿ�.
INSERT INTO TB_CLASS_TYPE VALUES('01', '�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES('02', '��������');
INSERT INTO TB_CLASS_TYPE VALUES('03', '�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES('04', '���缱��');
INSERT INTO TB_CLASS_TYPE VALUES('05', '������');

SELECT*
FROM TB_CLASS_TYPE;

DELETE FROM TB_CLASS_TYPE
WHERE CLASS_TYPE_NO = '05';

UPDATE TB_CLASS_TYPE
SET CLASS_TYPE_NO = '02';

--2. �� ������б� �л����� ������ ���ԵǾ� �ִ� �л��Ϲ����� ���̺��� ������� �Ѵ�. �Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (���������� �̿��Ͻÿ�)
CREATE TABLE TB_�л��Ϲ�����
AS SELECT STUDENT_NO �й�, STUDENT_NAME �̸�, STUDENT_ADDRESS �ּ�
    FROM TB_STUDENT;
    
--3. ������а� �л����� �������� ���ԵǾ� �ִ� �а����� ���̺��� ������� �Ѵ�. 
--�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (��Ʈ : ����� �پ���, �ҽŲ� �ۼ��Ͻÿ�)
CREATE TABLE TB_������а�����
AS SELECT STUDENT_NO �й�, STUDENT_NAME �̸�, TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,6)),'RRRR-MM-DD') ����⵵, NVL(PROFESSOR_NAME, '������������') �����̸�
   FROM TB_STUDENT S
     LEFT JOIN TB_PROFESSOR P ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
     LEFT JOIN TB_DEPARTMENT D ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
   WHERE DEPARTMENT_NAME = '������а�';

--4. �� �а����� ������ 10% ������Ű�� �Ǿ���. �̿� ����� SQL ���� �ۼ��Ͻÿ�. (��, �ݿø��� ����Ͽ� �Ҽ��� �ڸ����� ������ �ʵ��� �Ѵ�)
UPDATE TB_DEPARTMENT
SET CAPACITY = ROUND(CAPACITY+(CAPACITY*0.1)); 

--SELECT DEPARTMENT_NAME, ROUND(CAPACITY+(CAPACITY*0.1))
--FROM TB_DEPARTMENT;

--5. �й� A413042 �� �ڰǿ� �л��� �ּҰ� "����� ���α� ���ε� 181-21 "�� ����Ǿ��ٰ� �Ѵ�. �ּ����� �����ϱ� ���� ����� SQL ���� �ۼ��Ͻÿ�.
UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
WHERE STUDENT_NO = 'A413042' AND STUDENT_NAME = '�ڰǿ�';

--SELECT STUDENT_NAME, STUDENT_ADDRESS
--FROM TB_STUDENT
--WHERE STUDENT_NO = 'A413042';

--6. �ֹε�Ϲ�ȣ ��ȣ���� ���� �л����� ���̺��� �ֹι�ȣ ���ڸ��� �������� �ʱ�� �����Ͽ���. �� ������ �ݿ��� ������ SQL ������ �ۼ��Ͻÿ�.
UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);

--7. ���а� ����� �л��� 2005 �� 1 �б⿡ �ڽ��� ������ '�Ǻλ�����' ������ �߸��Ǿ��ٴ� ���� �߰��ϰ�� ������ ��û�Ͽ���.
--��� ������ Ȯ�� ���� ��� �ش� ������ ������ 3.5 �� ����Ű�� �����Ǿ���. ������ SQL ���� �ۼ��Ͻÿ�.
UPDATE TB_GRADE
SET POINT = '3.5'
WHERE STUDENT_NO = ( SELECT STUDENT_NO
                     FROM TB_STUDENT
                        JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
                     WHERE STUDENT_NAME = '�����'
                          AND DEPARTMENT_NAME = '���а�')
    AND CLASS_NO = ( SELECT CLASS_NO
                     FROM TB_CLASS
                     WHERE CLASS_NAME = '�Ǻλ�����')
    AND TERM_NO = '200501';
    
    SELECT TERM_NO, POINT, CLASS_NAME
    FROM TB_GRADE
        JOIN TB_STUDENT USING (STUDENT_NO)
        JOIN TB_CLASS USING (CLASS_NO)
    WHERE STUDENT_NAME = '�����' AND CLASS_NAME = '�Ǻλ�����';
    
--8. ���� ���̺�(TB_GRADE) ���� ���л����� �����׸��� �����Ͻÿ�.
DELETE FROM TB_GRADE
WHERE STUDENT_NO IN ( SELECT STUDENT_NO 
                     FROM TB_STUDENT
                     WHERE ABSENCE_YN = 'Y');
                     
                     SELECT STUDENT_NO
                     FROM TB_GRADE
                        JOIN TB_STUDENT USING (STUDENT_NO)
                    WHERE ABSENCE_YN = 'Y';