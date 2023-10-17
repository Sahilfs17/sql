SELECT * FROM EMP;

CREATE TABLE EMP_HIST(EMPNO INT, OLD_JOB VARCHAR2(20));

INSERT INTO EMP_HIST VALUES(7499, 'CLERK');
INSERT INTO EMP_HIST VALUES(7839, 'MANAGER');
INSERT INTO EMP_HIST VALUES(7902, 'SALESMAN');
INSERT INTO EMP_HIST VALUES(7902, 'CLERK');
INSERT INTO EMP_HIST VALUES(7934, 'PEON');
INSERT INTO EMP_HIST VALUES(7902, 'CLERK');
INSERT INTO EMP_HIST VALUES(7844, 'MANAGER');
INSERT INTO EMP_HIST VALUES(9999, 'CLERK');

SELECT * FROM EMP_HIST;

-- To fetch all emps whether their job was changed or not

SELECT EMPNO FROM EMP
  UNION
SELECT EMPNO FROM EMP_HIST;

-- All emps along with their old and new jobs

SELECT EMPNO EMP_ID, JOB DESIGNATION, 'CURRENT JOB' STATUS FROM EMP
  UNION
SELECT EMPNO , OLD_JOB , 'PREVIOUS JOB' FROM EMP_HIST ORDER BY DESIGNATION;

-- List those whose jobs were changed at least once.

SELECT DISTINCT EMPNO FROM EMP_HIST;

SELECT EMPNO FROM EMP
  INTERSECT
SELECT EMPNO FROM EMP_HIST;

-- List those who has got same job more than once

SELECT EMPNO, JOB FROM EMP
  INTERSECT
SELECT EMPNO, OLD_JOB FROM EMP_HIST;

-- List those whose jobs have not been changed even once

SELECT EMPNO FROM EMP
  MINUS
SELECT EMPNO FROM EMP_HIST;

SELECT EMPNO FROM EMP
  UNION ALL
SELECT EMPNO FROM EMP_HIST ORDER BY 1;

-- Full Outer Join

SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E LEFT JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
    UNION
SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E RIGHT JOIN DEPT D ON(E.DEPTNO = D.DEPTNO);
  