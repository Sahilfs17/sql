SELECT * FROM EMP ORDER BY DEPTNO;

SELECT * FROM DEPT;

-- INNER-EQUI
SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E INNER JOIN DEPT D ON(E.DEPTNO = D.DEPTNO);
  
-- OUTER-EQUI
SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E LEFT JOIN DEPT D ON(E.DEPTNO = D.DEPTNO);
  
-- OUTER-EQUI
SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E RIGHT JOIN DEPT D ON(E.DEPTNO = D.DEPTNO);
  
-- OUTER-EQUI
SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E FULL JOIN DEPT D ON(E.DEPTNO = D.DEPTNO);
  
SELECT E.ENAME, E.SAL, D.DNAME
  FROM EMP E JOIN DEPT D ON(E.DEPTNO != D.DEPTNO);
  
-- INNER-NON-EQUI  
SELECT E.ENAME, E.SAL, S.GRADE
  FROM EMP E JOIN SALGRADE S ON(E.SAL BETWEEN S.LOSAL AND S.HISAL);
  
  
SELECT E.ENAME "EMPLOYEE", M.ENAME "MANGER"  
  FROM EMP E JOIN EMP M ON(E.MGR = M.EMPNO);
  
-- List those who get more than 'CLARK'

-- SELF - INNER - NON-EQUI

SELECT E1.ENAME, E1.SAL FROM EMP E1 JOIN EMP E2 ON (E1.SAL > E2.SAL)
  WHERE E2.ENAME = 'CLARK';
  
SELECT E1.ENAME, E1.SAL FROM EMP E1 JOIN EMP E2 ON (E1.SAL > E2.SAL AND E2.ENAME = 'CLARK'); -- INCORRECT

SELECT E.ENAME, D.DNAME
  FROM EMP E CROSS JOIN DEPT D;
  
/*Display the Empno, Ename, Salary, Dname, Location, Deptno, Job of all 
employees working at CJICAGO or working for ACCOUNTING dept with Annual
Salary>28000, but the Salary should not be=3000 or 2800 who doesn’t belongs to 
the Manager and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the ascending order of Deptno and 
descending order of job.*/

SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC, E.JOB
  FROM EMP E, DEPT D 
  WHERE (E.DEPTNO = D.DEPTNO) AND (D.LOC = 'CHICAGO' OR D.DNAME = 'ACCOUNTING');
  
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME, D.LOC, E.JOB
  FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO) 
  WHERE (D.LOC = 'CHICAGO' OR D.DNAME = 'ACCOUNTING') AND
        E.SAL * 12 > 28000  AND E.SAL NOT IN(3000, 2850) AND
        E.MGR IS NULL and
        SUBSTR(E.EMPNO, 3, 1) IN ('7', '3');
  
 -- Dept wise total salary
/*- Dept.Name     Total Salary
    ----------    ------------
    ACCOUNTING      20000
    RESEARCH        10000
    ...                     */
    
SELECT D.DNAME, SUM(E.SAL) AS TOTAL_SAL
  FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
  GROUP BY D.DNAME;
  
--221. List the Employees who are senior to their own MANAGERS.

SELECT E.EMPNO, E.ENAME, E.HIREDATE, M.ENAME, M.HIREDATE
  FROM EMP E JOIN EMP M ON(E.MGR = M.EMPNO)
  WHERE E.HIREDATE < M.HIREDATE;
  
  
-- 239. List the grade 2 and 3 emp of ChicagO

SELECT E.ENAME , E.SAL, E.DEPTNO, S.GRADE, D.LOC
  FROM EMP E LEFT JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
             LEFT JOIN SALGRADE S ON(E.SAL BETWEEN S.LOSAL AND S.HISAL)
--  WHERE S.GRADE IN(2, 3) AND D.LOC = 'CHICAGO';

-- 231. List all the employees by name and number along with their Manager’s name and 
-- number. Also List KING who has no ‘Manager’. 




  
  
  
  