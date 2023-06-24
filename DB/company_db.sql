-- Company Database Sample

-- Table structure for table regions

CREATE TABLE regions (
  REGION_ID INTEGER NOT NULL,
  REGION_NAME VARCHAR2(25) UNIQUE,
  PRIMARY KEY (REGION_ID)
);

-- Insert statements for regions

INSERT INTO regions (REGION_ID, REGION_NAME) VALUES
(1, 'Europe'),
(2, 'America'),
(3, 'Asia'),
(4, 'Middle East and Africa');


-- Table structure for table countries

CREATE TABLE countries (
  COUNTRY_ID VARCHAR2(2) NOT NULL,
  COUNTRY_NAME VARCHAR2(40),
  REGION_ID INTEGER,
  PRIMARY KEY (COUNTRY_ID),
  FOREIGN KEY (REGION_ID) REFERENCES regions(REGION_ID)
);

-- Insert statements for countries

INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
('AR', 'Argentina', 2),
('AU', 'Australia', 3),
('LT', 'Lithuania', 1),
('LV', 'Latvia', 1),
('EE', 'Estonia', 1),
('US', 'United States', 2);

-- Table structure for table locations

CREATE TABLE locations (
  LOCATION_ID NUMBER(4) NOT NULL,
  STREET_ADDRESS VARCHAR2(40),
  POSTAL_CODE VARCHAR2(12),
  CITY VARCHAR2(30) NOT NULL,
  STATE_PROVINCE VARCHAR2(25),
  COUNTRY_ID VARCHAR2(2),
  PRIMARY KEY (LOCATION_ID)
);

CREATE INDEX LOC_CITY_IX ON locations(CITY);
CREATE INDEX LOC_COUNTRY_IX ON locations(COUNTRY_ID);
CREATE INDEX LOC_STATE_PROVINCE_IX ON locations(STATE_PROVINCE);

-- Insert statements for locations

INSERT INTO locations (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(1000, 'Vilnius gatve 12', '01013', 'Vilnius', NULL, 'LT'),
(1100, 'K. Donelaicio g. 64', '44248', 'Kaunas', NULL, 'LT'),
(1200, 'Dzirnavu iela 71', 'LV-1011', 'Riga', NULL, 'LV'),
(1300, 'Skolas iela 15', 'LV-1010', 'Riga', NULL, 'LV'),
(1400, 'F.Kuhlbarsi 1', '10128', 'Tallinn', NULL, 'EE'),
(1500, 'Zemait�s g. 16', '03201', 'Vilnius', NULL, 'LT'),
(1600, 'Ganibu dambis 7A', 'LV-1045', 'Riga', NULL, 'LV'),
(1700, 'Raua 6', '10124', 'Tallinn', NULL, 'EE'),
(1800, 'Kauno g. 34', '03202', 'Vilnius', NULL, 'LT'),
(1900, 'Ganibu dambis 17A', 'LV-1045', 'Riga', NULL, 'LV'),
(2000, 'Savanoriu pr. 1', '03116', 'Vilnius', NULL, 'LT'),
(2100, 'Pylimo 6', '01117', 'Vilnius', NULL, 'LT'),
(2200, 'Teatro g. 9b', '03107', 'Vilnius', NULL, 'LT'),
(2300, 'Brivibas gatve 201', 'LV-1039', 'Riga', NULL, 'LV'),
(2400, 'Vilnius gatve 11', '01013', 'Vilnius', NULL, 'LT'),
(2500, 'Dzirnavu iela 37-45', 'LV-1010', 'Riga', NULL, 'LV'),
(2600, 'Estonia puiestee 9', '11314', 'Tallinn', NULL, 'EE'),
(2700, 'Estonia pst 7', '10143', 'Tallinn', NULL, 'EE'),
(2800, 'Estonia pst 11', '10141', 'Tallinn', NULL, 'EE'),
(2900, 'Ravala puiestee 2', '10145', 'Tallinn', NULL, 'EE'),
(3000, 'R�vala puiestee 3', '10145', 'Tallinn', NULL, 'EE'),
(3100, 'Vilnius gatve 13', '01013', 'Vilnius', NULL, 'LT'),
(3200, 'J. Jasinskio g. 1', '01111', 'Vilnius', NULL, 'LT'),
(3300, '3095 Griffin Rd', '14428', 'Riga', 'New York', 'US');


-- Table structure for table departments

CREATE TABLE departments (
  DEPARTMENT_ID NUMBER(4) NOT NULL,
  DEPARTMENT_NAME VARCHAR2(30) NOT NULL,
  MANAGER_ID NUMBER(6),
  LOCATION_ID NUMBER(4),
  PRIMARY KEY (DEPARTMENT_ID),
  FOREIGN KEY (MANAGER_ID) REFERENCES employees(EMPLOYEE_ID)
);

CREATE INDEX DEPT_LOCATION_IX ON departments(LOCATION_ID);

-- Insert statement for departments

INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(10, 'Administration', 200, 1700),
(20, 'Marketing', 201, 1800),
(30, 'Purchasing', 114, 1700),
(40, 'Human Resources', 203, 2400),
(50, 'Shipping', 121, 1500),
(60, 'IT', 103, 1400),
(70, 'Public Relations', 204, 3300),
(80, 'Sales', 145, 2500),
(90, 'Executive', 100, 1700),
(100, 'Finance', 108, 1700),
(110, 'Accounting', 205, 1700),
(120, 'Treasury', 0, 1700),
(130, 'Corporate Tax', 0, 1700),
(140, 'Control And Credit', 0, 1700),
(150, 'Shareholder Services', 0, 1700),
(160, 'Benefits', 0, 1700),
(170, 'Manufacturing', 0, 1700),
(180, 'Construction', 0, 1700),
(190, 'Contracting', 0, 1700),
(200, 'Operations', 0, 1700),
(210, 'IT Support', 0, 1700),
(220, 'NOC', 0, 1700),
(230, 'IT Helpdesk', 0, 1700),
(240, 'Government Sales', 0, 1700),
(250, 'Retail Sales', 0, 1700),
(260, 'Recruiting', 0, 1700),
(270, 'Payroll', 0, 1700);

-- Table structure for table employees

CREATE TABLE employees (
  EMPLOYEE_ID NUMBER(6) NOT NULL,
  FIRST_NAME VARCHAR2(20),
  LAST_NAME VARCHAR2(25) NOT NULL,
  EMAIL VARCHAR2(25) NOT NULL UNIQUE,
  PHONE_NUMBER VARCHAR2(20),
  HIRE_DATE DATE NOT NULL,
  JOB_ID VARCHAR2(10) NOT NULL,
  SALARY NUMBER(8,2),
  COMMISSION_PCT NUMBER(2,2),
  MANAGER_ID NUMBER(6),
  DEPARTMENT_ID NUMBER(4),
  PRIMARY KEY (EMPLOYEE_ID)
);

CREATE INDEX EMP_DEPARTMENT_IX ON employees(DEPARTMENT_ID);
CREATE INDEX EMP_JOB_IX ON employees(JOB_ID);
CREATE INDEX EMP_MANAGER_IX ON employees(MANAGER_ID);
CREATE INDEX EMP_NAME_IX ON employees(LAST_NAME, FIRST_NAME);

-- Insert statements for employees

INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(100, 'Steven', 'King', 'SKING', '+37012345671', DATE '1987-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '+37012345684', DATE '1987-06-18', 'AD_VP', 17000.00, 0.00, 100, 60),
(102, 'Lex', 'De Haan', 'LDEHAAN', '+37012345697', DATE '1987-06-19', 'AD_VP', 17000.00, 0.00, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '+37042345678', DATE '1987-06-20', 'IT_PROG', 9000.00, 0.00, 102, 60),
(104, 'Bruce', 'Ernst', 'BERNST', '+37042345686', DATE '1987-06-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', '+37042344569', DATE '1987-06-22', 'IT_PROG', 4800.00, 0.00, 103, 60),
(106, 'Valli', 'Pataballa', 'VPATABAL', '+37042374560', DATE '1987-06-23', 'IT_PROG', 4800.00, 0.00, 103, 60),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '+37042335567', DATE '1987-06-24', 'IT_PROG', 4200.00, 0.00, 103, 60),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '+37012414569', DATE '1987-06-25', 'FI_MGR', 12000.00, 0.00, 101, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '+37012474169', DATE '1987-06-26', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
(110, 'John', 'Chen', 'JCHEN', '+37012494269', DATE '1987-06-27', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '+37012424369', DATE '1987-06-28', 'FI_ACCOUNT', 7700.00, 0.00, 108, 100),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '+3701244469', DATE '1987-06-29', 'FI_ACCOUNT', 7800.00, 0.00, 108, 100),
(113, 'Luis', 'Popp', 'LPOPP', '+37012464567', DATE '1987-06-30', 'FI_ACCOUNT', 6900.00, 0.00, 108, 100),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '+37012784561', DATE '1987-07-01', 'PU_MAN', 11000.00, 0.00, 100, 30),
(115, 'Alexander', 'Khoo', 'AKHOO', '+3701274562', DATE '1987-07-02', 'PU_CLERK', 3100.00, 0.00, 114, 30),
(116, 'Shelli', 'Baida', 'SBAIDA', '+3701274563', DATE '1987-07-03', 'SY_ANA', 2900.00, 0.00, 114, 60),
(117, 'Sigal', 'Tobias', 'STOBIAS', '+37012764564', DATE '1987-07-04', 'PU_CLERK', 2800.00, 0.00, 114, 30),
(118, 'Guy', 'Himuro', 'GHIMURO', '+37012764565', DATE '1987-07-05', 'SY_ANA', 2600.00, 0.00, 114, 60),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '+37012714566', DATE '1987-07-06', 'PU_CLERK', 2500.00, 0.00, 114, 30),
(120, 'Matthew', 'Weiss', 'MWEISS', '+3711231234', DATE '1987-07-07', 'ST_MAN', 8000.00, 0.00, 100, 50),
(121, 'Adam', 'Fripp', 'AFRIPP', '+37112362234', DATE '1987-07-08', 'ST_MAN', 8200.00, 0.00, 100, 50),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '+37112383234', DATE '1987-07-09', 'ST_MAN', 7900.00, 0.00, 100, 50),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '+37112344234', DATE '1987-07-10', 'ST_MAN', 6500.00, 0.00, 100, 50),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '+37112345234', DATE '1987-07-11', 'ST_MAN', 5800.00, 0.00, 100, 50),
(125, 'Julia', 'Nayer', 'JNAYER', '+37112401214', DATE '1987-07-12', 'ST_CLERK', 3200.00, 0.00, 120, 50),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '+37112461224', DATE '1987-07-13', 'ST_CLERK', 2700.00, 0.00, 120, 50),
(127, 'James', 'Landry', 'JLANDRY', '+371124.1334', DATE '1987-07-14', 'ST_CLERK', 2400.00, 0.00, 120, 50),
(128, 'Steven', 'Markle', 'SMARKLE', '+3711241434', DATE '1987-07-15', 'ST_CLERK', 2200.00, 0.00, 120, 50),
(129, 'Laura', 'Bissot', 'LBISSOT', '+3711245234', DATE '1987-07-16', 'ST_CLERK', 3300.00, 0.00, 121, 50),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '+3711246234', DATE '1987-07-17', 'ST_CLERK', 2800.00, 0.00, 121, 50),
(131, 'James', 'Marlow', 'JAMRLOW', '+3711247234', DATE '1987-07-18', 'ST_CLERK', 2500.00, 0.00, 121, 50),
(132, 'TJ', 'Olson', 'TJOLSON', '+3711248234', DATE '1987-07-19', 'ST_CLERK', 2100.00, 0.00, 121, 50),
(133, 'Jason', 'Mallin', 'JMALLIN', '+371121934', DATE '1987-07-20', 'ST_CLERK', 3300.00, 0.00, 122, 50),
(134, 'Michael', 'Rogers', 'MROGERS', '+3711271834', DATE '1987-07-21', 'ST_CLERK', 2900.00, 0.00, 122, 50),
(135, 'Ki', 'Gee', 'KGEE', '+371127.1734', DATE '1987-07-22', 'ST_CLERK', 2400.00, 0.00, 122, 50),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '+3711271634', DATE '1987-07-23', 'ST_CLERK', 2200.00, 0.00, 122, 50),
(137, 'Renske', 'Ladwig', 'RLADWIG', '+3711211234', DATE '1987-07-24', 'ST_CLERK', 3600.00, 0.00, 123, 50),
(138, 'Stephen', 'Stiles', 'SSTILES', '+3711212034', DATE '1987-07-25', 'ST_CLERK', 3200.00, 0.00, 123, 50),
(139, 'John', 'Seo', 'JSEO', '+3711212019', DATE '1987-07-26', 'ST_CLERK', 2700.00, 0.00, 123, 50),
(140, 'Joshua', 'Patel', 'JPATEL', '+3711211834', DATE '1987-07-27', 'ST_CLERK', 2500.00, 0.00, 123, 50),
(141, 'Trenna', 'Rajs', 'TRAJS', '+3711218009', DATE '1987-07-28', 'ST_CLERK', 3500.00, 0.00, 124, 50),
(142, 'Curtis', 'Davies', 'CDAVIES', '+3711212994', DATE '1987-07-29', 'ST_CLERK', 3100.00, 0.00, 124, 50),
(143, 'Randall', 'Matos', 'RMATOS', '+3711212874', DATE '1987-07-30', 'ST_CLERK', 2600.00, 0.00, 124, 50),
(144, 'Peter', 'Vargas', 'PVARGAS', '+3711212004', DATE '1987-07-31', 'ST_CLERK', 2500.00, 0.00, 124, 50),
(145, 'John', 'Russell', 'JRUSSEL', '+3724429268', DATE '1987-08-01', 'SA_MAN', 14000.00, 0.40, 100, 80),
(146, 'Karen', 'Partners', 'KPARTNER', '+3724413444268', DATE '1987-08-02', 'SA_MAN', 13500.00, 0.30, 100, 80),
(147, 'Alberto', 'Errazuriz', 'AERRAZUR', '+37244429278', DATE '1987-08-03', 'SA_MAN', 14000.00, 0.30, 100, 80),
(148, 'Gerald', 'Cambrault', 'GCAMBRAU', '+37244619268', DATE '1987-08-04', 'SA_MAN', 11000.00, 0.30, 100, 80),
(149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '+3724413448', DATE '1987-08-05', 'SA_MAN', 10500.00, 0.20, 100, 80),
(150, 'Peter', 'Tucker', 'PTUCKER', '+3724998268', DATE '1987-08-06', 'SA_REP', 10000.00, 0.30, 145, 80),
(151, 'David', 'Bernstein', 'DBERNSTE', '+372445268', DATE '1987-08-07', 'SA_REP', 9500.00, 0.25, 145, 80),
(152, 'Peter', 'Hall', 'PHALL', '+37244.1344.478968', DATE '1987-08-08', 'SA_REP', 9000.00, 0.25, 145, 80),
(153, 'Christopher', 'Olsen', 'COLSEN', '+3724418718', DATE '1987-08-09', 'SA_REP', 8000.00, 0.20, 145, 80),
(154, 'Nanette', 'Cambrault', 'NCAMBRAU', '+37213987668', DATE '1987-08-10', 'SA_REP', 7500.00, 0.20, 145, 80),
(155, 'Oliver', 'Tuvault', 'OTUVAULT', '+58544486508', DATE '1987-08-11', 'SA_REP', 7000.00, 0.15, 145, 70),
(156, 'Janette', 'King', 'JKING', '+37244.1345.429268', DATE '1987-08-12', 'SA_REP', 10000.00, 0.35, 146, 80),
(157, 'Patrick', 'Sully', 'PSULLY', '+37244.1345.929268', DATE '1987-08-13', 'SA_REP', 9500.00, 0.35, 146, 80),
(158, 'Allan', 'McEwen', 'AMCEWEN', '+3724829268', DATE '1987-08-14', 'SA_REP', 9000.00, 0.35, 146, 80),
(159, 'Lindsey', 'Smith', 'LSMITH', '+372445729268', DATE '1987-08-15', 'SA_REP', 8000.00, 0.30, 146, 80),
(160, 'Louise', 'Doran', 'LDORAN', '+3721349268', DATE '1987-08-16', 'SA_REP', 7500.00, 0.30, 146, 80),
(161, 'Sarath', 'Sewall', 'SSEWALL', '+585345529268', DATE '1987-08-17', 'SA_REP', 7000.00, 0.25, 146, 70),
(162, 'Clara', 'Vishney', 'CVISHNEY', '+37244469268', DATE '1987-08-18', 'SA_REP', 10500.00, 0.25, 147, 80),
(163, 'Danielle', 'Greene', 'DGREENE', '+37244229268', DATE '1987-08-19', 'SA_REP', 9500.00, 0.15, 147, 80),
(164, 'Mattea', 'Marvins', 'MMARVINS', '+37241346268', DATE '1987-08-20', 'SA_REP', 7200.00, 0.10, 147, 80),
(165, 'David', 'Lee', 'DLEE', '+37243469268', DATE '1987-08-21', 'SA_REP', 6800.00, 0.10, 147, 80),
(166, 'Sundar', 'Ande', 'SANDE', '+372134629268', DATE '1987-08-22', 'SA_REP', 6400.00, 0.10, 147, 80),
(167, 'Amit', 'Banda', 'ABANDA', '+37244134668', DATE '1987-08-23', 'SA_REP', 6200.00, 0.10, 147, 80),
(168, 'Lisa', 'Ozer', 'LOZER', '+3724413468', DATE '1987-08-24', 'SA_REP', 11500.00, 0.25, 148, 80),
(169, 'Harrison', 'Bloom', 'HBLOOM', '+37244829268', DATE '1987-08-25', 'SA_REP', 10000.00, 0.20, 148, 80),
(170, 'Tayler', 'Fox', 'TFOX', '+37241329268', DATE '1987-08-26', 'SA_REP', 9600.00, 0.20, 148, 80),
(171, 'William', 'Smith', 'WSMITH', '+372443268', DATE '1987-08-27', 'SA_REP', 7400.00, 0.15, 148, 80),
(172, 'Elizabeth', 'Bates', 'EBATES', '+37244529268', DATE '1987-08-28', 'SA_REP', 7300.00, 0.15, 148, 80),
(173, 'Sundita', 'Kumar', 'SKUMAR', '+37243429268', DATE '1987-08-29', 'SA_REP', 6100.00, 0.10, 148, 80),
(174, 'Ellen', 'Abel', 'EABEL', '+37246429267', DATE '1987-08-30', 'SA_REP', 11000.00, 0.30, 149, 80),
(175, 'Alyssa', 'Hutton', 'AHUTTON', '+37264429266', DATE '1987-08-31', 'SA_REP', 8800.00, 0.25, 149, 80),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '+3724429265', DATE '1987-09-01', 'SA_REP', 8600.00, 0.20, 149, 80),
(177, 'Jack', 'Livingston', 'JLIVINGS', '+37244644.429264', DATE '1987-09-02', 'SA_REP', 8400.00, 0.20, 149, 80),
(178, 'Kimberely', 'Grant', 'KGRANT', '+372416429263', DATE '1987-09-03', 'SA_REP', 7000.00, 0.15, 149, 0),
(179, 'Charles', 'Johnson', 'CJOHNSON', '+37264429262', DATE '1987-09-04', 'SA_REP', 6200.00, 0.10, 149, 80),
(180, 'Winston', 'Taylor', 'WTAYLOR', '+37150876', DATE '1987-09-05', 'SH_CLERK', 3200.00, 0.00, 120, 50),
(181, 'Jean', 'Fleaur', 'JFLEAUR', '+37150877', DATE '1987-09-06', 'SH_CLERK', 3100.00, 0.00, 120, 50),
(182, 'Martha', 'Sullivan', 'MSULLIVA', '+371507878', DATE '1987-09-07', 'SH_CLERK', 2500.00, 0.00, 120, 50),
(183, 'Girard', 'Geoni', 'GGEONI', '+37150779', DATE '1987-09-08', 'SY_ANA', 2800.00, 0.00, 120, 60),
(184, 'Nandita', 'Sarchand', 'NSARCHAN', '+37150876', DATE '1987-09-09', 'SH_CLERK', 4200.00, 0.00, 121, 50),
(185, 'Alexis', 'Bull', 'ABULL', '+3715076', DATE '1987-09-10', 'SY_ANA', 4100.00, 0.00, 121, 60),
(186, 'Julia', 'Dellinger', 'JDELLING', '+371503876', DATE '1987-09-11', 'SH_CLERK', 3400.00, 0.00, 121, 50),
(187, 'Anthony', 'Cabrio', 'ACABRIO', '+371509876', DATE '1987-09-12', 'SH_CLERK', 3000.00, 0.00, 121, 50),
(188, 'Kelly', 'Chung', 'KCHUNG', '+3715051876', DATE '1987-09-13', 'SY_ANA', 3800.00, 0.00, 122, 60),
(189, 'Jennifer', 'Dilly', 'JDILLY', '+3715052876', DATE '1987-09-14', 'SH_CLERK', 3600.00, 0.00, 122, 50),
(190, 'Timothy', 'Gates', 'TGATES', '+37150513876', DATE '1987-09-15', 'SH_CLERK', 2900.00, 0.00, 122, 50),
(191, 'Randall', 'Perkins', 'RPERKINS', '+37150514876', DATE '1987-09-16', 'SH_CLERK', 2500.00, 0.00, 122, 50),
(192, 'Sarah', 'Bell', 'SBELL', '+37150181876', DATE '1987-09-17', 'SH_CLERK', 4000.00, 0.00, 123, 50),
(193, 'Britney', 'Everett', 'BEVERETT', '+37150132876', DATE '1987-09-18', 'SH_CLERK', 3900.00, 0.00, 123, 50),
(194, 'Samuel', 'McCain', 'SMCCAIN', '+371501.3876', DATE '1987-09-19', 'SH_CLERK', 3200.00, 0.00, 123, 50),
(195, 'Vance', 'Jones', 'VJONES', '+3715014876', DATE '1987-09-20', 'SH_CLERK', 2800.00, 0.00, 123, 50),
(196, 'Alana', 'Walsh', 'AWALSH', '+3715079811', DATE '1987-09-21', 'SY_ANA', 3100.00, 0.00, 124, 60),
(197, 'Kevin', 'Feeney', 'KFEENEY', '+3715079822', DATE '1987-09-22', 'SH_CLERK', 3000.00, 0.00, 124, 50),
(198, 'Donald', 'OConnell', 'DOCONNEL', '+3715079833', DATE '1987-09-23', 'SH_CLERK', 2600.00, 0.00, 124, 50),
(199, 'Douglas', 'Grant', 'DGRANT', '+44505079844', DATE '1987-09-24', 'SH_CLERK', 2600.00, 0.00, 124, 50),
(200, 'Jennifer', 'Whalen', 'JWHALEN', '+3701234444', DATE '1987-09-25', 'AD_ASST', 4400.00, 0.00, 101, 10),
(201, 'Michael', 'Hartstein', 'MHARTSTE', '+3701235555', DATE '1987-09-26', 'SY_ANA', 13000.00, 0.00, 100, 60),
(202, 'Pat', 'Fay', 'PFAY', '6031236666', DATE '1987-09-27', 'MK_REP', 6000.00, 0.00, 201, 20),
(203, 'Susan', 'Mavris', 'SMAVRIS', '+3701237777', DATE '1987-09-28', 'HR_REP', 6500.00, 0.00, 101, 40),
(204, 'Hermann', 'Baer', 'HBAER', '+3701238888', DATE '1987-09-29', 'SY_ANA', 10000.00, 0.00, 101, 60),
(205, 'Shelley', 'Higgins', 'SHIGGINS', '+3701238080', DATE '1987-09-30', 'AC_MGR', 12000.00, 0.00, 101, 110),
(206, 'William', 'Gietz', 'WGIETZ', '+3701238181', DATE '1987-10-01', 'AC_ACCOUNT', 8300.00, 0.00, 205, 110);

-- Table structure for table job_history

CREATE TABLE job_history (
  EMPLOYEE_ID NUMBER(6) NOT NULL,
  START_DATE DATE NOT NULL,
  END_DATE DATE NOT NULL,
  JOB_ID VARCHAR2(10) NOT NULL,
  DEPARTMENT_ID NUMBER(4),
  PRIMARY KEY (EMPLOYEE_ID, START_DATE)
);

CREATE INDEX JHIST_DEPARTMENT_IX ON job_history(DEPARTMENT_ID);
CREATE INDEX JHIST_EMPLOYEE_IX ON job_history(EMPLOYEE_ID);
CREATE INDEX JHIST_JOB_IX ON job_history(JOB_ID);

-- Insert statements for job_history

INSERT INTO job_history (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID) VALUES
(102, DATE '1993-01-13', DATE '1998-07-24', 'IT_PROG', 60),
(101, DATE '1989-09-21', DATE '1993-10-27', 'AC_ACCOUNT', 110),
(101, DATE '1993-10-28', DATE '1997-03-15', 'AC_MGR', 110),
(201, DATE '1996-02-17', DATE '1999-12-19', 'MK_REP', 20),
(114, DATE '1998-03-24', DATE '1999-12-31', 'ST_CLERK', 50),
(122, DATE '1999-01-01', DATE '1999-12-31', 'ST_CLERK', 50),
(200, DATE '1987-09-17', DATE '1993-06-17', 'AD_ASST', 90),
(176, DATE '1998-03-24', DATE '1998-12-31', 'SA_REP', 80),
(176, DATE '1999-01-01', DATE '1999-12-31', 'SA_MAN', 80),
(200, DATE '1994-07-01', DATE '1998-12-31', 'AC_ACCOUNT', 90),
(0, DATE '0000-00-00', DATE '0000-00-00', '', 0);

-- Table structure for table jobs

CREATE TABLE jobs (
  JOB_ID VARCHAR2(10) NOT NULL,
  JOB_TITLE VARCHAR2(35) NOT NULL,
  MIN_SALARY NUMBER(6),
  MAX_SALARY NUMBER(6),
  PRIMARY KEY (JOB_ID)
);

-- Insert statement for jobs

INSERT INTO jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
('AD_PRES', 'President', 20000, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('AD_ASST', 'Administration Assistant', 3000, 6000),
('FI_MGR', 'Project Manager', 8200, 16000),
('FI_ACCOUNT', 'Accountant', 4200, 9000),
('AC_MGR', 'Accounting Manager', 8200, 16000),
('AC_ACCOUNT', 'Public Accountant', 4200, 9000),
('SA_MAN', 'Sales Manager', 10000, 20000),
('SA_REP', 'Sales Representative', 6000, 12000),
('PU_MAN', 'Purchasing Manager', 8000, 15000),
('PU_CLERK', 'Purchasing Clerk', 2500, 5500),
('ST_MAN', 'Stock Manager', 5500, 8500),
('ST_CLERK', 'Stock Clerk', 2000, 5000),
('SH_CLERK', 'Shipping Clerk', 2500, 5500),
('IT_PROG', 'Programmer', 4000, 10000),
('SY_ANA', 'System Analyst', 9000, 15000),
('MK_REP', 'Marketing Representative', 4000, 9000),
('HR_REP', 'Human Resources Representative', 4000, 9000),
('PR_REP', 'Public Relations Representative', 4500, 10500);

COMMIT;

