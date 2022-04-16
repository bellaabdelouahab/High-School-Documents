/*  creation de base de donnees  */

create table dept(
    deptno NUMBER,
    dname VARCHAR2(12), 
    loc VARCHAR2(25)
);
alter table dept add constraint dept_pk primary key(deptno);
alter table dept add CONSTRAINT dname_check CHECK (dname in('ACCOUNTING','RESEARCH','SALES','OPERATIONS'));

CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT EMP_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(15),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT DEPTNO_fk REFERENCES DEPT
);

INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-87','dd-mm-rr')-85,3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-7-87', 'dd-mm-yyyy')-51,1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
SAVEPOINT b;
commit ;
INSERT INTO EMP VALUES(7369,'Bidon',NULL,NULL,NULL,NULL,NULL,NULL);

rollback to b;

alter table EMP add constraint EMP_PK PRIMARY KEY(EMPNO); 

alter table EMP add constraint EMP_FK foreign key (DEPTNO) references dept(DPTNO); 

INSERT INTO EMP VALUES(7369,'WILSON','MANAGER',7839,to_date('17-11-1991','dd-mm-yyyy'),3500,600,10);
INSERT INTO EMP VALUES(7657,'WILSON','MANAGER',7839,to_date('17-11-1991','dd-mm-yyyy'),3500,600,50);
INSERT INTO EMP VALUES(7657,'WILSON','MANAGER',7000,to_date('17-11-1991','dd-mm-yyyy'),3500,600,10);
INSERT INTO EMP VALUES(7657,'WILSON','MANAGER',7839,to_date('17-11-1991','dd-mm-yyyy'),3500,600,10);

commit;

/*    mise a jour */


update dept set loc='PITTSBURGH' where loc='CHICAGO';

update EMP 
set sal=sal*1.1 where (job like 'SALES%' and comm> sal/2); 

update EMP 
set comm=(select AVG(comm) from EMP) where HIREDATE<'01/01/82' and comm IS NOT NULL;

delete from DEPT where DEPTNO=20 cascade constraints;


alter session set "_ORACLE_SCRIPT"=true;
create user TD_BD identified by yassine2002;