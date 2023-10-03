--------------------------------------------------------
--  File created - Tuesday-October-03-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
/
--------------------------------------------------------
--  DDL for Sequence DIEM_THI_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DIEM_THI_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 84 CACHE 21 NOORDER  NOCYCLE ;
/
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
/
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
/
--------------------------------------------------------
--  DDL for Sequence SINHVIENS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SINHVIENS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 36 NOCACHE  NOORDER  NOCYCLE ;
/
--------------------------------------------------------
--  DDL for Table SINH_VIEN
--------------------------------------------------------

  CREATE TABLE "SINH_VIEN" 
   (	"ID" NUMBER(10,0), 
	"TEN" VARCHAR2(20 BYTE), 
	"LOP_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
--------------------------------------------------------
--  DDL for Table LOP
--------------------------------------------------------

  CREATE TABLE "LOP" 
   (	"ID" NUMBER(10,0), 
	"TEN" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
--------------------------------------------------------
--  DDL for Table MON_HOC
--------------------------------------------------------

  CREATE TABLE "MON_HOC" 
   (	"ID" NUMBER(10,0), 
	"TEN" VARCHAR2(20 BYTE), 
	"SO_TIN_CHI" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;
/
--------------------------------------------------------
--  DDL for View V_DEPARTMENT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_DEPARTMENT" ("EMPLOYEE_ID", "FIRST_NAME", "LAST_NAME", "EMAIL", "PHONE_NUMBER", "HIRE_DATE", "JOB_ID", "SALARY", "COMMISSION_PCT", "MANAGER_ID", "DEPARTMENT_ID") AS 
  Select "EMPLOYEE_ID","FIRST_NAME","LAST_NAME","EMAIL","PHONE_NUMBER","HIRE_DATE","JOB_ID","SALARY","COMMISSION_PCT","MANAGER_ID","DEPARTMENT_ID" from employees where department_id is null;
/
--------------------------------------------------------
--  DDL for View V_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_EMPLOYEES" ("EMPLOYEE_ID", "FIRST_NAME", "LAST_NAME", "EMAIL", "PHONE_NUMBER", "HIRE_DATE", "JOB_ID", "SALARY", "COMMISSION_PCT", "MANAGER_ID", "DEPARTMENT_ID") AS 
  Select "EMPLOYEE_ID","FIRST_NAME","LAST_NAME","EMAIL","PHONE_NUMBER","HIRE_DATE","JOB_ID","SALARY","COMMISSION_PCT","MANAGER_ID","DEPARTMENT_ID" from employees where manager_id is null;
/
--------------------------------------------------------
--  DDL for View V_EMPLOYEESDETAIL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_EMPLOYEESDETAIL" ("EMPLOYEE_ID", "LAST_NAME", "DEPARTMENT_NAME", "SALARY", "SO_NAM") AS 
  select employees.employee_id,last_name,departments.department_name,salary, to_char(end_date,'yyyy')-to_char(start_date,'yyyy') so_nam from employees join departments on departments.department_id = employees.department_id join job_history on job_history.job_id = employees.job_id where salary > (select avg(salary) from employees);
/
--------------------------------------------------------
--  DDL for View V_REGION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "V_REGION" ("COUNTRY_NAME", "REGION_NAME") AS 
  Select country_name,region_name from regions join countries on countries.region_id = regions.region_id where region_name = 'Asia';
/
REM INSERTING into SINH_VIEN
SET DEFINE OFF;
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (15,'Nguyen Van T',3);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (16,'Nguyen Van T',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (17,'Nguyen Van T',5);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (18,'Nguyen Van T',6);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (19,'Nguyen Van Z',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (20,'Nguyen Van Z',5);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (21,'Nguyen Van Z',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (22,'Nguyen Van Z',6);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (23,'Nguyen Van Z',4);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (24,'Nguyen Van Z',3);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (25,'Nguyen Van N',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (26,'Nguyen Van N',6);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (27,'Nguyen Van N',5);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (28,'Nguyen Van N',3);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (29,'Nguyen Van N',4);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (30,'Nguyen Van N',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (31,'Nguyen Van T',5);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (32,'Nguyen Van T',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (33,'Nguyen Van T',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (34,'Nguyen Van T',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (35,'Nguyen Van T',6);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (7,'Nguyen Van G',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (8,'Nguyen Van H',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (9,'Nguyen Van I',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (10,'Nguyen Van J',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (11,'Nguyen Van K',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (12,'Nguyen Van L',6);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (1,'Nguyen Van T',3);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (2,'Nguyen Van B',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (3,'Nguyen Van C',4);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (4,'Nguyen Van D',4);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (5,'Nguyen Van E',2);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (6,'Nguyen Van F',6);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (0,'Nguyen Van T',1);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (14,'Nguyen Van T',4);
Insert into SINH_VIEN (ID,TEN,LOP_ID) values (13,'Nguyễn Văn L',3);
REM INSERTING into LOP
SET DEFINE OFF;
Insert into LOP (ID,TEN) values (1,'Lop 1');
Insert into LOP (ID,TEN) values (2,'Lop 2');
Insert into LOP (ID,TEN) values (3,'Lop 3');
Insert into LOP (ID,TEN) values (4,'Lop 4');
Insert into LOP (ID,TEN) values (5,'Lop 5');
Insert into LOP (ID,TEN) values (6,'Lop 6');
REM INSERTING into MON_HOC
SET DEFINE OFF;
Insert into MON_HOC (ID,TEN,SO_TIN_CHI) values (1,'Toan',4);
Insert into MON_HOC (ID,TEN,SO_TIN_CHI) values (2,'Tieng Anh',3);
Insert into MON_HOC (ID,TEN,SO_TIN_CHI) values (3,'Tieng Viet',2);
--------------------------------------------------------
--  DDL for Index SINH_VIEN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SINH_VIEN_PK" ON "SINH_VIEN" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
--------------------------------------------------------
--  DDL for Index LOP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOP_PK" ON "LOP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
--------------------------------------------------------
--  DDL for Index MON_HOC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MON_HOC_PK" ON "MON_HOC" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
/
--------------------------------------------------------
--  Constraints for Table SINH_VIEN
--------------------------------------------------------

  ALTER TABLE "SINH_VIEN" ADD CONSTRAINT "SINH_VIEN_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SINH_VIEN" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SINH_VIEN" MODIFY ("LOP_ID" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table LOP
--------------------------------------------------------

  ALTER TABLE "LOP" ADD CONSTRAINT "LOP_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "LOP" MODIFY ("ID" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table MON_HOC
--------------------------------------------------------

  ALTER TABLE "MON_HOC" ADD CONSTRAINT "MON_HOC_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MON_HOC" MODIFY ("ID" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Ref Constraints for Table SINH_VIEN
--------------------------------------------------------

  ALTER TABLE "SINH_VIEN" ADD CONSTRAINT "FK_LOPID" FOREIGN KEY ("LOP_ID")
	  REFERENCES "LOP" ("ID") ENABLE;
/
--------------------------------------------------------
--  DDL for Function GETSALGRADE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GETSALGRADE" (sal number) return number
is
temp number := 0;
hight number := 0;
low number := 0;
begin
select max(hisal), min(losal) into hight, low from salgrade;
if sal > hight then
return 6;
elsif sal < low then
return 0;
end if;

select grade into temp from salgrade where sal >= losal  and sal <= hisal;

return temp;
end;

/

/
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/

/
--------------------------------------------------------
--  DDL for Procedure DEMO_PROCEDURE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DEMO_PROCEDURE" (sal number)
is
temp number := 0;
hight number := 0;
low number := 0;
begin
insert into test(datetime, sal) values(sysdate, sal);
end;

/

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/

/
