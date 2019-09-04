SELECT EMPNO,
       TO_CHAR(SUBSTR(EMPNO, 1)) || '**' AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
  WHERE LENGTH(ENAME) >= 5;
  
SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
    FROM EMP;
    
SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '¿ù¿äÀÏ'), 'YYYY-MM-DD') AS R_JOB,
       CASE
            WHEN COMM IS NULL THEN 'N/A'
            ELSE TO_CHAR(COMM)
       END AS COMM
    FROM EMP;
    
SELECT EMPNO, ENAME, MGR,
       CASE
        WHEN MGR IS NULL THEN LPAD('0', 4, '0')
        ELSE
            CASE TO_NUMBER(SUBSTR(MGR, 1, 2))
                WHEN 75 THEN '5555'
                WHEN 76 THEN '6666'
                WHEN 77 THEN '7777'
                WHEN 78 THEN '8888'
                ELSE TO_CHAR(MGR)
            END
        END AS CHG_MGR
    FROM EMP;
