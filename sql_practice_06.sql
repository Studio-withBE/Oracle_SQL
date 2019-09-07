SELECT JOB, EMPNO, ENAME, SAL, DEPTNO,
       (SELECT DNAME
            FROM DEPT
          WHERE DEPT.DEPTNO = EMP.DEPTNO) AS DNAME
    FROM EMP
  WHERE JOB = (SELECT JOB
                    FROM EMP
                  WHERE ENAME = 'ALLEN');
-------------------------------------------------------------

SELECT EMPNO, ENAME,
       (SELECT DNAME
            FROM DEPT
          WHERE EMP.DEPTNO = DEPT.DEPTNO) AS DNAME,
       HIREDATE,
       (SELECT LOC
            FROM DEPT
          WHERE EMP.DEPTNO = DEPT.DEPTNO) AS LOC,
       SAL,
       (SELECT GRADE
            FROM SALGRADE
          WHERE EMP.SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP
  WHERE SAL > (SELECT AVG(SAL)
                    FROM EMP)
ORDER BY SAL DESC, EMPNO;
-------------------------------------------------------------

SELECT EMPNO, ENAME, JOB, DEPTNO,
       (SELECT DNAME
            FROM DEPT
          WHERE EMP.DEPTNO = DEPT.DEPTNO) AS DNAME,
        (SELECT LOC
            FROM DEPT
          WHERE EMP.DEPTNO = DEPT.DEPTNO) AS LOC
    FROM EMP
  WHERE EMP.DEPTNO = 10
        AND JOB NOT IN (SELECT JOB
                            FROM EMP
                          WHERE EMP.DEPTNO = 30);
-------------------------------------------------------------

SELECT EMPNO, ENAME, SAL,
       (SELECT GRADE
            FROM SALGRADE
          WHERE SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP
  WHERE SAL > (SELECT MAX(SAL)
                 FROM EMP
                WHERE JOB = 'SALESMAN')
ORDER BY EMPNO;