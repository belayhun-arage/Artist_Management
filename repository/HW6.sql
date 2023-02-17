

-- 1
Create a procedure that takes in a DNAME (Department Name) value as an incoming parameter
and show the total number of employees for that department, include DEPT_ID, DNAME, and a
count of the number of employees in that department as output.

CREATE PROCEDURE GetEMPLOYEES(IN DNAME VARCHAR(14))
BEGIN
  SELECT DEPT.DEPT_ID, DEPT.DNAME, 
    COUNT(EMP.EMP_ID) AS total_emp,
  FROM DEPT,EMP 
  WHERE DEPT.DEPT_ID = EMP.DEPT_ID
  GROUP BY DEPT.DEPT_ID
END;

-- 2
Create a procedure that takes in a Grade_ID value as in incoming parameter and show all the
Employee’s that have that Salary grade. The output should be: employee full name
(concatenate first and last name), the employee’s salary, and salary range (losal – hisal) for that
salary grade.

CREATE PROCEDURE EMPLOYEESSALARYGRADE(IN GRADE_ID INT(3))
BEGIN
  SELECT EMP.E_LAST_NAME + EMP.E_FIRST_NAME, EMP.SAL
  FROM EMP 
  JOIN SALGRADE
    ON SALGRADE.GRADE_ID=EMP.GRADE_ID
  GROUP BY EMP.EMP_ID
END;

3. Create the best index (show create command) that would be helpful to both these queries, and
prove the index is being used with the Explain command:
Select e_last_name, hiredate, sal from employee where e_last_name = ‘Smith’;
Select e_last_name, e_fist_name, dept_id from employee where e_last_name = ‘Smith’
and e_first_name = ‘Jonn’;

CREATE INDEX INDX_EMP ON EMP(e_last_name,hiredate,sal)
EXPLAIN Select e_last_name, hiredate, sal from EMP where e_last_name = "Smith";  

CREATE BITMAP INDEX emp_dept_indx 
ON     EMP(e_last_name,e_fist_name,dept_id), DEPT(dept_id) 
FROM   EMP, DEPT
WHERE  DEPT.DEPT_ID=EMP.DEPT_ID;
EXPLAIN Select e_last_name, e_fist_name, DEPT_ID from EMP,DEPT JOIN DEPT ON DEPT.DEPT_ID=EMP.DEPT_ID AND e_last_name = "Smith" AND e_first_name = "Jonn";


4. Create a procedure that has one input parameter a value for MGR_ID , and an out parameter to
return the employee id with the oldest hire date for that manager (so the most senior employee
that reports to that manager). You will have to do a little research on the output parameter and
how to use it.

CREATE PROCEDURE OLDESTEMPLOYEES(IN MGR_ID INT(4), OUT oldest_emp INT(4))
BEGIN
  SELECT EMP.E_FIRST_NAME
  INTO oldest_emp
  FROM EMP 
  WHERE EMP.MGR_ID=MGR_ID AND EMP.HIREDATE=min(HIREDATE)
END;

5. Which one of these should have an index (explain why)? 
A query that runs every hour with MGR_ID in the PREDICATE clause, or  a query that runs once a month with DEPT_ID in theWHERE clause? 

A query that runs every hour with MGR_ID in the PREDICATE clause
Show the create index command for the one you picked. 
CREATE INDEX INDX_EMP ON EMP(MGR_ID,e_fist_name,sal);

Create a SELECT query that will utilize the index you created and prove it was used with the Explain command.
EXPLAIN Select MGR_ID, e_fist_name, sal from EMP where e_fist_name = "Miller";

-- 

-- 


