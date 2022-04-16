create TABLE countries(
    country_id CHAR(2) not null,
    country_name VARCHAR2(20),
    region_id NUMBER
);

DESCRIBE countries;

create table departement(
	departement_id NUMBER(4) not null ,
    departement_name varchar2(30) not null,
    manage_id NUMBER(6),
    location_id NUMBER(4)
);
DESCRIBE departement;

create table employee(
    employee_id number(6) not null,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) not null,
    email VARCHAR2(25) not null,
    phone_number VARCHAR2(20),
    hire_date DATE not null,
    job_id VARCHAR2(10) not null,
    salary NUMBER(8,2),
    commission_pct Number(2,2),
    manager_id NUMBER(6),
    departement_id NUMBER(4)
);
DESCRIBE employee;

create table jobs(
	job_id VARCHAR2(10) not null ,
    job_title VARCHAR2(35) not null,
    min_salary NUMBER(5),
    max_salary NUMBER(6)
);
DESCRIBE jobs;

create table job_grades(
	grade_level varchar2(3),
    lowes_sale NUMBER,
    heighest_sale NUMBER
);
DESCRIBE job_grades;

create table job_history(
    employee_id NUMBER(6) not null,
    start_date date not null,
    end_date date not null,
    job_id VARCHAR2(10) not null,
    department_id   NUMBER(4)
);
describe job_history;

create table locations(
    location_id NUMBER(4) not null,
    street_adress VARCHAR2(40),
    postal_code VARCHAR2(12),
    city VARCHAR2(30) not null,
    state_province VARCHAR2(20),
    country_id char(2)
);
describe locations;

create table regions(
    region_id number not null,
    region_name varchar2(25)
);
describe regions;
describe variable;
alter table regions add constraint reg PRIMARY key(region_id);
alter table countries add constraint countr_id primary key(country_id);
alter table departement add constraint demp_id primary key(departement_id);
alter table employee add constraint emp_id primary key(employee_id);
alter table jobs add constraint jobs_id primary key(job_id);
alter table job_grades add constraint grade_id primary key(grade_level);
alter table job_history add constraint em_id primary key(employee_id,job_id,department_id);
alter table locations add constraint loc_id primary key(location_id);
SAVEPOINT a;
commit ;
rollback to a;
/* foreign keys */
alter table countries add constraint countr_idfr FOREIGN key(region_id) references regions(region_id);
alter table departement add constraint dep_fr FOREIGN key(location_id) references locations(location_id);
alter table departement add constraint dep2_fr FOREIGN key(manage_id) references employee(employee_id);
alter table job_history add constraint jb_h_fr FOREIGN key(employee_id) references employee(employee_id);
alter table job_history add constraint jb_h2_fr FOREIGN key(job_id) references jobs(job_id);
alter table job_history add constraint jb_h3_fr FOREIGN key(department_id) references departement(departement_id);
alter table locations add constraint count_fr foreign key(country_id) references countries(country_id);
alter table locations modify location_id NUMBER(4);
SAVEPOINT b;
commit ;

/* check const */
alter table employee add constraint emp_ch check(phone_number>0);
alter table employee add constraint sala_ch check(salary>0);
alter table employee add constraint emp_unique unique(email);

alter table jobs add constraint job_ch check(max_salary>min_salary);
desc jobs;

/* insert of values  */
insert into countries values('CA','canada',2);
insert into countries values ('DE','GERMANY',1);
insert into countries values ('UK','UNITED KINGDOM',1);
insert into countries values ('US','INITED STATE AMIRICA',2);

select * from countries;

insert into regions values(1,'europe');
insert into regions values(2,'american');
insert into regions values(3,'asia');
insert into regions values(4,'middle east and aferica');
select * from regions;

INSERT INTO locations VALUES 
   ( 1400 
   , '2014 Jabberwocky Rd'
   , '26192'
   , 'Southlake'
   , 'Texas'
   , 'US'
   );
INSERT INTO locations VALUES 
   ( 1500 
   , '2011 Interiors Blvd'
   , '99236'
   , 'South San Francisco'
   , 'California'
   , 'US'
   );
INSERT INTO locations VALUES 
   ( 1700 
   , '2004 Charade Rd'
   , '98199'
   , 'Seattle'
   , 'Washington'
   , 'US'
   );
INSERT INTO locations VALUES 
   ( 1800 
   , '147 Spadina Ave'
   , 'M5V 2L7'
   , 'Toronto'
   , 'Ontario'
   , 'CA'
   );
INSERT INTO locations VALUES 
   ( 2500 
   , 'Magdalen Centre, The Oxford Science Park'
   , 'OX9 9ZB'
   , 'Oxford'
   , 'Oxford'
   , 'UK'
   );
desc locations;
select * from locations;
/**/
ALTER TABLE departement DISABLE CONSTRAINT dep2_fr;
INSERT INTO departement VALUES 
   ( 10
   , 'Administration'
   , 200
   , 1700
   );
INSERT INTO departement VALUES 
   ( 20
   , 'Marketing'
   , 201
   , 1800
   );
INSERT INTO departement VALUES 
   ( 50
   , 'Shipping'
   , 121
   , 1500
   );
INSERT INTO departement VALUES 
   ( 60 
   , 'IT'
   , 103
   , 1400
   );
INSERT INTO departement VALUES 
   ( 80 
   , 'Sales'
   , 145
   , 2500
   );
   
   INSERT INTO departement VALUES 
   ( 90 
   , 'Executive'
   , 100
   , 1700
   );
   INSERT INTO departement VALUES 
   ( 110 
   , 'Accounting'
   , 205
   , 1700
   );
   INSERT INTO departement VALUES 
   ( 190 
   , 'Contracting'
   , NULL
   , 1700
   );
select * from departement;

INSERT INTO jobs VALUES 
   ( 'AD_PRES'
   , 'President'
   , 20000
   , 40000
   );
   INSERT INTO jobs VALUES 
   ( 'AD_VP'
   , 'Administration Vice President'
   , 15000
   , 30000
   );
INSERT INTO jobs VALUES 
   ( 'AD_ASST'
   , 'Administration Assistant'
   , 3000
   , 6000
   );
   INSERT INTO jobs VALUES 
   ( 'AC_MGR'
   , 'Accounting Manager'
   , 8200
   , 16000
   );
INSERT INTO jobs VALUES 
   ( 'AC_ACCOUNT'
   , 'Public Accountant'
   , 4200
   , 9000
   );
   INSERT INTO jobs VALUES 
   ( 'SA_MAN'
   , 'Sales Manager'
   , 10000
   , 20000
   );
INSERT INTO jobs VALUES 
   ( 'SA_REP'
   , 'Sales Representative'
   , 6000
   , 12000
   );
select * from jobs;
commit ;




