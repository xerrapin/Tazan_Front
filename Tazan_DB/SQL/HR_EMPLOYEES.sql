create table EMPLOYEES
(
    EMPLOYEE_ID    NUMBER(6)    not null
        constraint EMP_EMP_ID_PK
            primary key,
    FIRST_NAME     VARCHAR2(20),
    LAST_NAME      VARCHAR2(25) not null
        constraint EMP_LAST_NAME_NN
            check ("LAST_NAME" IS NOT NULL),
    EMAIL          VARCHAR2(25) not null
        constraint EMP_EMAIL_UK
            unique
        constraint EMP_EMAIL_NN
            check ("EMAIL" IS NOT NULL),
    PHONE_NUMBER   VARCHAR2(20),
    HIRE_DATE      DATE         not null
        constraint EMP_HIRE_DATE_NN
            check ("HIRE_DATE" IS NOT NULL),
    JOB_ID         VARCHAR2(10) not null
        constraint EMP_JOB_FK
            references JOBS
        constraint EMP_JOB_NN
            check ("JOB_ID" IS NOT NULL),
    SALARY         NUMBER(8, 2)
        constraint EMP_SALARY_MIN
            check (salary > 0),
    COMMISSION_PCT NUMBER(2, 2),
    MANAGER_ID     NUMBER(6)
        constraint EMP_MANAGER_FK
            references EMPLOYEES,
    DEPARTMENT_ID  NUMBER(4)
        constraint EMP_DEPT_FK
            references DEPARTMENTS
)
/

comment on table EMPLOYEES is 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.'
/

comment on column EMPLOYEES.EMPLOYEE_ID is 'Primary key of employees table.'
/

comment on column EMPLOYEES.FIRST_NAME is 'First name of the employee. A not null column.'
/

comment on column EMPLOYEES.LAST_NAME is 'Last name of the employee. A not null column.'
/

comment on column EMPLOYEES.EMAIL is 'Email id of the employee'
/

comment on column EMPLOYEES.PHONE_NUMBER is 'Phone number of the employee; includes country code and area code'
/

comment on column EMPLOYEES.HIRE_DATE is 'Date when the employee started on this job. A not null column.'
/

comment on column EMPLOYEES.JOB_ID is 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.'
/

comment on column EMPLOYEES.SALARY is 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)'
/

comment on column EMPLOYEES.COMMISSION_PCT is 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage'
/

comment on column EMPLOYEES.MANAGER_ID is 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)'
/

comment on column EMPLOYEES.DEPARTMENT_ID is 'Department id where employee works; foreign key to department_id
column of the departments table'
/

create index EMP_DEPARTMENT_IX
    on EMPLOYEES (DEPARTMENT_ID)
/

create index EMP_JOB_IX
    on EMPLOYEES (JOB_ID)
/

create index EMP_MANAGER_IX
    on EMPLOYEES (MANAGER_ID)
/

create index EMP_NAME_IX
    on EMPLOYEES (LAST_NAME, FIRST_NAME)
/

INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('2003-06-17', 'YYYY-MM-DD HH24:MI:SS'), 'AD_PRES', 24000.00, null, null, 90);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('2005-09-21', 'YYYY-MM-DD HH24:MI:SS'), 'AD_VP', 17000.00, null, 100, 90);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', TO_DATE('2001-01-13', 'YYYY-MM-DD HH24:MI:SS'), 'AD_VP', 17000.00, null, 100, 90);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('2006-01-03', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', 9000.00, null, 102, 60);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('2007-05-21', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', 6000.00, null, 103, 60);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', TO_DATE('2005-06-25', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', 4800.00, null, 103, 60);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', TO_DATE('2006-02-05', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', 4800.00, null, 103, 60);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', TO_DATE('2007-02-07', 'YYYY-MM-DD HH24:MI:SS'), 'IT_PROG', 4200.00, null, 103, 60);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', TO_DATE('2002-08-17', 'YYYY-MM-DD HH24:MI:SS'), 'FI_MGR', 12008.00, null, 101, 100);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', TO_DATE('2002-08-16', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', 9000.00, null, 108, 100);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (110, 'John', 'Chen', 'JCHEN', '515.124.4269', TO_DATE('2005-09-28', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', 8200.00, null, 108, 100);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', TO_DATE('2005-09-30', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', 7700.00, null, 108, 100);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', TO_DATE('2006-03-07', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', 7800.00, null, 108, 100);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', TO_DATE('2007-12-07', 'YYYY-MM-DD HH24:MI:SS'), 'FI_ACCOUNT', 6900.00, null, 108, 100);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', TO_DATE('2002-12-07', 'YYYY-MM-DD HH24:MI:SS'), 'PU_MAN', 11000.00, null, 100, 30);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', TO_DATE('2003-05-18', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', 3100.00, null, 114, 30);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', TO_DATE('2005-12-24', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', 2900.00, null, 114, 30);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', TO_DATE('2005-07-24', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', 2800.00, null, 114, 30);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', TO_DATE('2006-11-15', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', 2600.00, null, 114, 30);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', TO_DATE('2007-08-10', 'YYYY-MM-DD HH24:MI:SS'), 'PU_CLERK', 2500.00, null, 114, 30);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', TO_DATE('2004-07-18', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', 8000.00, null, 100, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', TO_DATE('2005-04-10', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', 8200.00, null, 100, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', TO_DATE('2003-05-01', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', 7900.00, null, 100, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', TO_DATE('2005-10-10', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', 6500.00, null, 100, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', TO_DATE('2007-11-16', 'YYYY-MM-DD HH24:MI:SS'), 'ST_MAN', 5800.00, null, 100, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', TO_DATE('2005-07-16', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3200.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', TO_DATE('2006-09-28', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2700.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (127, 'James', 'Landry', 'JLANDRY', '650.124.1334', TO_DATE('2007-01-14', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2400.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', TO_DATE('2008-03-08', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2200.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', TO_DATE('2005-08-20', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3300.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', TO_DATE('2005-10-30', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2800.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', TO_DATE('2005-02-16', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2500.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', TO_DATE('2007-04-10', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2100.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', TO_DATE('2004-06-14', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3300.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', TO_DATE('2006-08-26', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2900.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (135, 'Ki', 'Gee', 'KGEE', '650.127.1734', TO_DATE('2007-12-12', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2400.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', TO_DATE('2008-02-06', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2200.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', TO_DATE('2003-07-14', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3600.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', TO_DATE('2005-10-26', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3200.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (139, 'John', 'Seo', 'JSEO', '650.121.2019', TO_DATE('2006-02-12', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2700.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', TO_DATE('2006-04-06', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2500.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', TO_DATE('2003-10-17', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3500.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', TO_DATE('2005-01-29', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 3100.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', TO_DATE('2006-03-15', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2600.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', TO_DATE('2006-07-09', 'YYYY-MM-DD HH24:MI:SS'), 'ST_CLERK', 2500.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', TO_DATE('2004-10-01', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', 14000.00, 0.40, 100, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', TO_DATE('2005-01-05', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', 13500.00, 0.30, 100, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', TO_DATE('2005-03-10', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', 12000.00, 0.30, 100, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', TO_DATE('2007-10-15', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', 11000.00, 0.30, 100, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', TO_DATE('2008-01-29', 'YYYY-MM-DD HH24:MI:SS'), 'SA_MAN', 10500.00, 0.20, 100, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', TO_DATE('2005-01-30', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 10000.00, 0.30, 145, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', TO_DATE('2005-03-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 9500.00, 0.25, 145, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', TO_DATE('2005-08-20', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 9000.00, 0.25, 145, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', TO_DATE('2006-03-30', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 8000.00, 0.20, 145, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', TO_DATE('2006-12-09', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7500.00, 0.20, 145, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', TO_DATE('2007-11-23', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7000.00, 0.15, 145, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (156, 'Janette', 'King', 'JKING', '011.44.1345.429268', TO_DATE('2004-01-30', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 10000.00, 0.35, 146, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', TO_DATE('2004-03-04', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 9500.00, 0.35, 146, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', TO_DATE('2004-08-01', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 9000.00, 0.35, 146, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', TO_DATE('2005-03-10', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 8000.00, 0.30, 146, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', TO_DATE('2005-12-15', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7500.00, 0.30, 146, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', TO_DATE('2006-11-03', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7000.00, 0.25, 146, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', TO_DATE('2005-11-11', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 10500.00, 0.25, 147, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', TO_DATE('2007-03-19', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 9500.00, 0.15, 147, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', TO_DATE('2008-01-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7200.00, 0.10, 147, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', TO_DATE('2008-02-23', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 6800.00, 0.10, 147, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', TO_DATE('2008-03-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 6400.00, 0.10, 147, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', TO_DATE('2008-04-21', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 6200.00, 0.10, 147, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', TO_DATE('2005-03-11', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 11500.00, 0.25, 148, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', TO_DATE('2006-03-23', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 10000.00, 0.20, 148, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', TO_DATE('2006-01-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 9600.00, 0.20, 148, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', TO_DATE('2007-02-23', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7400.00, 0.15, 148, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', TO_DATE('2007-03-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7300.00, 0.15, 148, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', TO_DATE('2008-04-21', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 6100.00, 0.10, 148, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', TO_DATE('2004-05-11', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 11000.00, 0.30, 149, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', TO_DATE('2005-03-19', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 8800.00, 0.25, 149, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', TO_DATE('2006-03-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 8600.00, 0.20, 149, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', TO_DATE('2006-04-23', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 8400.00, 0.20, 149, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', TO_DATE('2007-05-24', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 7000.00, 0.15, 149, null);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', TO_DATE('2008-01-04', 'YYYY-MM-DD HH24:MI:SS'), 'SA_REP', 6200.00, 0.10, 149, 80);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', TO_DATE('2006-01-24', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3200.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', TO_DATE('2006-02-23', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3100.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', TO_DATE('2007-06-21', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2500.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', TO_DATE('2008-02-03', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2800.00, null, 120, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', TO_DATE('2004-01-27', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 4200.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', TO_DATE('2005-02-20', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 4100.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', TO_DATE('2006-06-24', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3400.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', TO_DATE('2007-02-07', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3000.00, null, 121, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', TO_DATE('2005-06-14', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3800.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', TO_DATE('2005-08-13', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3600.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', TO_DATE('2006-07-11', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2900.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', TO_DATE('2007-12-19', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2500.00, null, 122, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', TO_DATE('2004-02-04', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 4000.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', TO_DATE('2005-03-03', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3900.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (194, 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', TO_DATE('2006-07-01', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3200.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (195, 'Vance', 'Jones', 'VJONES', '650.501.4876', TO_DATE('2007-03-17', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2800.00, null, 123, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', TO_DATE('2006-04-24', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3100.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', TO_DATE('2006-05-23', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 3000.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', TO_DATE('2007-06-21', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2600.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', TO_DATE('2008-01-13', 'YYYY-MM-DD HH24:MI:SS'), 'SH_CLERK', 2600.00, null, 124, 50);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', TO_DATE('2003-09-17', 'YYYY-MM-DD HH24:MI:SS'), 'AD_ASST', 4400.00, null, 101, 10);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', TO_DATE('2004-02-17', 'YYYY-MM-DD HH24:MI:SS'), 'MK_MAN', 13000.00, null, 100, 20);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', TO_DATE('2005-08-17', 'YYYY-MM-DD HH24:MI:SS'), 'MK_REP', 6000.00, null, 201, 20);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', TO_DATE('2002-06-07', 'YYYY-MM-DD HH24:MI:SS'), 'HR_REP', 6500.00, null, 101, 40);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (204, 'Hermann', 'Baer', 'HBAER', '515.123.8888', TO_DATE('2002-06-07', 'YYYY-MM-DD HH24:MI:SS'), 'PR_REP', 10000.00, null, 101, 70);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', TO_DATE('2002-06-07', 'YYYY-MM-DD HH24:MI:SS'), 'AC_MGR', 12008.00, null, 101, 110);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', TO_DATE('2002-06-07', 'YYYY-MM-DD HH24:MI:SS'), 'AC_ACCOUNT', 8300.00, null, 205, 110);