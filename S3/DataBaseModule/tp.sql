/*    Creation des tableaux   */

CREATE TABLE countries(
    country_id CHAR(2),
    country_name VARCHAR2(40),
    region_id NUMBER
);
DESCRIBE countries;

CREATE TABLE departments(
    department_id NUMBER(4),
    department_name VARCHAR2(30),
    manager_id NUMBER(6),
    location_id NUMBER(4)
); 
DESCRIBE departments;

CREATE TABLE employees(
    employee_id NUMBER(6),
    first_name VARCHAR2(20),
    last_name VARCHAR2(25),
    email VARCHAR2(25),
    phone_number VARCHAR2(20),
    hire_date DATE DEFAULT SYSDATE,
    job_id VARCHAR2(10),
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4)
);
DESCRIBE employees;

CREATE TABLE jobs(
    job_id VARCHAR2(10),
    job_title VARCHAR2(35),
    min_salary NUMBER(6),
    max_salary NUMBER(6)
);
DESC jobs;

CREATE TABLE job_grades(
    grade_level VARCHAR2(3),
    lowest_sal NUMBER,
    highest_sal NUMBER
);
desc job_grades;

CREATE TABLE job_history(
    employee_id NUMBER(6),
    start_date DATE DEFAULT sysdate,
    end_date DATE,
    job_id VARCHAR2(10),
    departement_id NUMBER(4)
);
desc job_history;

CREATE TABLE locations(
    location_id number(4),
    street_adresse VARCHAR2(40),
    postal_code VARCHAR2(12),
    city VARCHAR2(30),
    state_province VARCHAR2(25),
    country_id CHAR(2)
);
desc locations;

CREATE TABLE regions(
    region_id NUMBER,
    region_name VARCHAR2(25)
);
desc regions;

/*   foreigne keys  */

ALTER TABLE countries add constraint count_prim primary key(country_id);
ALTER TABLE departments add constraint depa_prim primary key(department_id);
ALTER TABLE employees add constraint emp_prim primary key(employee_id);
ALTER TABLE jobs add constraint job_prim primary key(job_id);
ALTER TABLE job_grades add constraint grade_job_prim primary key(grade_level);
ALTER TABLE job_history add constraint history_job_prim primary key(employee_id,job_id,departement_id);
ALTER TABLE locations add constraint location_prim primary key(location_id);
ALTER TABLE regions add constraint region_prim primary key(region_id);

/*    REFERENCE KEY   */

savepoint  a;
commit ;

alter table countries add constraint count_ref FOREIGN key(region_id) references regions(region_id);
alter table departments add constraint depa_ref FOREIGN key(location_id) references locations(location_id);
alter table departments add constraint depa2_ref FOREIGN key(manager_id) references employees(employee_id);
alter table employees add constraint emp1_ref foreign key(job_id) references jobs(job_id);
alter table employees add constraint emp2_ref foreign key(department_id) references departments(department_id);
alter table job_history add constraint jobh1_ref foreign key(employee_id) references employees(employee_id);
alter table job_history add constraint jobh2_ref foreign key(job_id) references jobs(job_id);
alter table job_history add constraint jobh3_ref foreign key(departement_id) references departments(department_id);
alter table locations add constraint loc_ref foreign key(country_id) references countries(country_id);

savepoint  b;
commit ;

/*  other constraint   */
alter table countries modify country_id not null;
desc countries;
alter table departments modify department_id not null;
alter table departments modify department_name not null;
desc departments;
alter table employees modify employee_id not null;
alter table employees modify last_name not null;
alter table employees modify email not null;
alter table employees modify hire_date not null;
alter table employees modify job_id not null;
desc employees;
alter table jobs modify job_id not null;
alter table jobs modify job_title not null;
desc jobs
alter table job_history modify employee_id not null;
alter table job_history modify start_date not null;
alter table job_history modify end_date not null;
desc job_history;
alter table locations modify location_id not null;
alter table locations modify city not null;
desc locations;SS
alter table regions modify region_id not null;
desc regions;
alter table employees add constraint sala_ch check(salary>0);
alter table employees add constraint emp_unique unique(email);
alter table jobs add constraint job_ch check(max_salary>min_salary);
alter table job_grades add constraint job_grad_ch check(highest_sal>lowest_sal);
savepoint c;
commit ;

/*  insert les elements  */
INSERT INTO regions VALUES ( 1, 'Europe');
INSERT INTO regions VALUES ( 2, 'Americas' );
INSERT INTO regions VALUES ( 3, 'Asia');
INSERT INTO regions VALUES ( 4, 'Middle East and Africa' );
select * from regions;
INSERT INTO countries VALUES ( 'CA', 'Canada', 2 );
INSERT INTO countries VALUES ( 'DE', 'Germany', 1 );
INSERT INTO countries VALUES ( 'UK', 'United Kingdom', 1);
INSERT INTO countries VALUES ( 'US', 'United States of America', 2);
select * from countries;
INSERT INTO locations VALUES ( 1400 , '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO locations VALUES ( 1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO locations VALUES ( 1700 , '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO locations VALUES( 1800 , '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
INSERT INTO locations VALUES ( 2500 , 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
select * from locations;
ALTER TABLE departments DISABLE CONSTRAINT depa2_ref;
INSERT INTO departments VALUES ( 10, 'Administration', 200, 1700);
INSERT INTO departments VALUES ( 20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES ( 50, 'Shipping', 121, 1500);
INSERT INTO departments VALUES ( 60 , 'IT', 103, 1400);
INSERT INTO departments VALUES ( 80 , 'Sales', 145, 2500);
INSERT INTO departments VALUES ( 90 , 'Executive', 100, 1700);
INSERT INTO departments VALUES ( 110 , 'Accounting', 205, 1700);
INSERT INTO departments VALUES ( 190 , 'Contracting', NULL, 1700);
select * from departments;
INSERT INTO jobs VALUES ( 'AD_PRES', 'President', 20000, 40000);
INSERT INTO jobs VALUES ( 'AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO jobs VALUES ( 'AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO jobs VALUES ( 'AC_MGR', 'Accounting Manager', 8200, 16000);
INSERT INTO jobs VALUES ( 'AC_ACCOUNT', 'Public Accountant', 4200, 9000);
INSERT INTO jobs VALUES ( 'SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO jobs VALUES ( 'SA_REP', 'Sales Representative', 6000, 12000);
INSERT INTO jobs VALUES ( 'ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO jobs VALUES ( 'ST_CLERK', 'Stock Clerk', 2000, 5000);
INSERT INTO jobs VALUES  ( 'IT_PROG' , 'Programmer' , 4000 , 10000);
INSERT INTO jobs VALUES ( 'MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO jobs VALUES ( 'MK_REP', 'Marketing Representative', 4000, 9000);
select * from jobs;
INSERT INTO employees VALUES    ( 100   , 'Steven'   , 'King'   , 'SKING'   , '515.123.4567'   ,'17-7-1987' , 'AD_PRES'   , 24000   , NULL   , NULL   , 90   );
INSERT INTO employees VALUES    ( 101   , 'Neena'   , 'Kochhar'   , 'NKOCHHAR'   , '515.123.4568'   ,'21-9-1989' , 'AD_VP'   , 17000   , NULL   , 100   , 90   );
INSERT INTO employees VALUES    ( 102   , 'Lex'   , 'De Haan'   , 'LDEHAAN'   , '515.123.4569'   , '13-1-1993' , 'AD_VP'   , 17000   , NULL   , 100   , 90   );
INSERT INTO employees VALUES    ( 103   , 'Alexander'   , 'Hunold'   , 'AHUNOLD'   , '590.423.4567'   , '03-1-1990'  , 'IT_PROG'   , 9000   , NULL   , 102   , 60   );
INSERT INTO employees VALUES    ( 104   , 'Bruce'   , 'Ernst'   , 'BERNST'   , '590.423.4568'   , '21-5-1991'  , 'IT_PROG'   , 6000   , NULL   , 103   , 60   );
INSERT INTO employees VALUES    ( 107   , 'Diana'   , 'Lorentz'   , 'DLORENTZ'   , '590.423.5567'   , '07-2-1999'   , 'IT_PROG'   , 4200   , NULL   , 103   , 60   );
INSERT INTO employees VALUES    ( 124   , 'Kevin'   , 'Mourgos'   , 'KMOURGOS'   , '650.123.5234'   , '16-11-1999'  , 'ST_MAN'   , 5800   , NULL   , 100   , 50   );
INSERT INTO employees VALUES    ( 141   , 'Trenna'   , 'Rajs'   , 'TRAJS'   , '650.121.8009'   , '17-10-1995'  , 'ST_CLERK'   , 3500   , NULL   , 124   , 50   );
INSERT INTO employees VALUES    ( 142   , 'Curtis'   , 'Davies'   , 'CDAVIES'   , '650.121.2994'   , '29-1-1997', , 'ST_CLERK'   , 3100   , NULL   , 124   , 50   );
INSERT INTO employees VALUES    ( 143   , 'Randall'   , 'Matos'   , 'RMATOS'   , '650.121.2874'   , '15-3-1998' , 'ST_CLERK'   , 2600   , NULL   , 124   , 50   );
INSERT INTO employees VALUES    ( 144   , 'Peter'   , 'Vargas'   , 'PVARGAS'   , '650.121.2004'   , '09-7-1998' , 'ST_CLERK'   , 2500   , NULL   , 124   , 50   );
INSERT INTO employees VALUES    ( 149   , 'Eleni'   , 'Zlotkey'   , 'EZLOTKEY'   , '011.44.1344.429018'   ,'29-1-2000' , 'SA_MAN'   , 10500   , .2   , 100   , 80   );
INSERT INTO employees VALUES    ( 174   , 'Ellen'   , 'Abel'   , 'EABEL'   , '011.44.1644.429267'   , '11-5-1996'  , 'SA_REP'   , 11000   , .30   , 149   , 80   );
INSERT INTO employees VALUES    ( 176   , 'Jonathon'   , 'Taylor'   , 'JTAYLOR'   , '011.44.1644.429265'   , '24-3-1998' , 'SA_REP'   , 8600   , .20   , 149   , 80   );
INSERT INTO employees VALUES    ( 178   , 'Kimberely'   , 'Grant'   , 'KGRANT'   , '011.44.1644.429263'   , '24-5-1999' , 'SA_REP'   , 7000   , .15   , 149   , NULL   );
INSERT INTO employees VALUES    ( 200   , 'Jennifer'   , 'Whalen'   , 'JWHALEN'   , '515.123.4444'   , '17-9-1987', 'AD_ASST'   , 4400   , NULL   , 101   , 10   );
INSERT INTO employees VALUES    ( 201   , 'Michael'   , 'Hartstein'   , 'MHARTSTE'   , '515.123.5555'   ,'17-2-1996' , 'MK_MAN'   , 13000   , NULL   , 100   , 20   );
INSERT INTO employees VALUES    ( 202   , 'Pat'   , 'Fay'   , 'PFAY'   , '603.123.6666'   , '17-8-1997' , 'MK_REP'   , 6000   , NULL   , 201   , 20   );
INSERT INTO employees VALUES    ( 205   , 'Shelley'   , 'Higgins'   , 'SHIGGINS'   , '515.123.8080'   , '07-6-1994' , 'AC_MGR'   , 12000   , NULL   , 101   , 110   );
INSERT INTO employees VALUES    ( 206   , 'William'   , 'Gietz'   , 'WGIETZ'   , '515.123.8181'   , '07-6-1994' , 'AC_ACCOUNT'   , 8300   , NULL   , 205   , 110   );
select * from employees;

INSERT INTO job_history VALUES (102   ,'13-1-1993', '24-7-1998', 'IT_PROG'   , 60);
INSERT INTO job_history VALUES (101   ,'21-9-1989','27-10-1993' , 'AC_ACCOUNT'   , 110);
INSERT INTO job_history VALUES (101   , '28-10-1993',  , '15-3-1997' , 'AC_MGR'   , 110);
INSERT INTO job_history VALUES (201   , '17-2-1996'   , '19-12-1999'  , 'MK_REP'   , 20);
INSERT INTO job_history VALUES (114   ,'24-3-1998'  , '31-12-1999' , 'ST_CLERK'   , 50   );
INSERT INTO job_history VALUES (122   , '01-1-1999'   , '31-12-1999'  , 'ST_CLERK'   , 50   );
INSERT INTO job_history VALUES (200   , '17-12-1987' ,'17-6-1993' , 'AD_ASST'   , 90   );
INSERT INTO job_history VALUES (176   , '24-3-1998'  , '31-12-1998' , 'SA_REP'   , 80   );
INSERT INTO job_history VALUES (176   , '01-1-1999'  , '31-12-1999' , 'SA_MAN'   , 80   );
INSERT INTO job_history VALUES (200   , '01-7-1994' , '31-12-1998'  , 'AC_ACCOUNT'   , 90   );
select * from job_history;

insert into job_grades values('A',1000,2999);
insert into job_grades values('B',3000,5999);
insert into job_grades values('C',6000,9999);
insert into job_grades values('D',10000,14999);
insert into job_grades values('E',15000,24999);
insert into job_grades values('F',25000,40000);
select * from job_grades;
/* select les tables*/
select * from job_grades;
select * from job_history;
select * from employees;
select * from jobs;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
/*affiche constraint d'un table*/
select constraint_name,constraint_type,search_condition from user_constraints Where table_name = 'EMPLOYEES';