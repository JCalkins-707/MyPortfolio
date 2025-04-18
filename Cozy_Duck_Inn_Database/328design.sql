/*
    Julia Calkins
    CS 328 - My Database Design SQL Script
    Last modified: 24-Feb-2025
*/

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating room table...

DROP TABLE room CASCADE CONSTRAINTS;

CREATE TABLE room
(room_num char(3),
 room_type varchar2(7) NOT NULL CHECK (room_type IN ('NK', 
     'NQQ', 'SNK', 'SNQQ', 'RNKK', 'RNKKQQ', 'RNKQ2', 'SNK2',
     'HNQQ', 'HNK', 'SHNK', 'SHNQQ', 'RHNKKQQ', 'RNK', 'RNK2')),
 primary key(room_num)
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating guest table...

DROP TABLE guest CASCADE CONSTRAINTS;

CREATE TABLE guest
(guest_num char(7),
 guest_lname varchar2(60) NOT NULL,
 guest_fname varchar2(40) NOT NULL,
 guest_address varchar2(90) NOT NULL,
 guest_city varchar2(50) NOT NULL,
 guest_zip varchar2(10),
 guest_country varchar2(50) NOT NULL,
 primary key(guest_num)
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating guest_phone_num table...

DROP TABLE guest_phone_num CASCADE CONSTRAINTS;

CREATE TABLE guest_phone_num
(guest_num char(7),
 guest_phone varchar2(20),
 primary key(guest_num, guest_phone),
 foreign key(guest_num) references guest
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating guest_email_addr table...

DROP TABLE guest_email_addr CASCADE CONSTRAINTS;

CREATE TABLE guest_email_addr
(guest_num char(7),
 guest_email varchar2(100),
 primary key(guest_num, guest_email),
 foreign key(guest_num) references guest
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating reservation table...

DROP TABLE reservation CASCADE CONSTRAINTS;

CREATE TABLE reservation
(conf_num char(8),
 check_in_date date NOT NULL,
 check_out_date date NOT NULL,
 total_cost number(10, 2) NOT NULL,
 res_status varchar2(15) NOT NULL CHECK (res_status IN ('Reserved',
     'In House', 'Checked Out', 'Cancelled', 'No Show')),
 guest_num char(7),
 room_num char(3),
 occupants number NOT NULL,
 primary key(conf_num),
 foreign key(guest_num) references guest,
 foreign key(room_num) references room
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating transaction table...

DROP TABLE transaction CASCADE CONSTRAINTS;

CREATE TABLE transaction
(trans_num char(10),
 conf_num char(8),
 trans_date date NOT NULL,
 trans_amt number(10, 2) NOT NULL,
 trans_method varchar2(12) NOT NULL CHECK (trans_method IN 
     ('Cash', 'Credit', 'Debit', 'Direct Bill', 'Write Off')),
 primary key(trans_num),
 foreign key(conf_num) references reservation
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating employee table...

DROP TABLE employee CASCADE CONSTRAINTS;

CREATE TABLE employee
(empl_num char(4),
 empl_lname varchar2(60) NOT NULL,
 empl_fname varchar2(40) NOT NULL,
 role varchar2(20) NOT NULL CHECK (role IN ('Front Desk',
     'Housekeeping', 'Houseperson', 'Maintenance', 'Security',
     'Breakfast Attendant', 'Other', 'General')),
 wage number(5, 2) NOT NULL,
 hire_date date NOT NULL,
 shift varchar2(5) NOT NULL CHECK (shift IN ('AM', 
    'PM', 'Audit', 'Other')),
 is_mgr char(1) NOT NULL CHECK (is_mgr IN ('Y', 'N')),
 primary key(empl_num)
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating employee_phone_num table...

DROP TABLE employee_phone_num CASCADE CONSTRAINTS;

CREATE TABLE employee_phone_num
(empl_num char(4),
 empl_phone varchar2(20),
 primary key(empl_num, empl_phone),
 foreign key(empl_num) references employee
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating empl_res table...

DROP TABLE empl_res CASCADE CONSTRAINTS;

CREATE TABLE empl_res
(empl_num char(4),
 conf_num char(8),
 primary key(empl_num, conf_num),
 foreign key(empl_num) references employee,
 foreign key(conf_num) references reservation
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating waterfowl table...

DROP TABLE waterfowl CASCADE CONSTRAINTS;

CREATE TABLE waterfowl
(wf_num char(3),
 wf_name varchar2(30) NOT NULL,
 species varchar2(30) NOT NULL,
 breed varchar2(30),
 wf_age number NOT NULL,
 primary key(wf_num)
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating task table...

DROP TABLE task CASCADE CONSTRAINTS;

CREATE TABLE task
(task_num char(8),
 date_started date,
 date_ended date,
 task_type varchar2(12) NOT NULL,
 primary key(task_num)
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating empl_task table...


DROP TABLE empl_task CASCADE CONSTRAINTS;

CREATE TABLE empl_task
(empl_num char(4),
 task_num char(8),
 primary key(empl_num, task_num),
 foreign key(empl_num) references employee,
 foreign key(task_num) references task
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating room_service table...

DROP TABLE room_service CASCADE CONSTRAINTS;

CREATE TABLE room_service
(service_num char(8),
 room_num char(3),
 is_refused char(1) NOT NULL CHECK (is_refused IN ('Y', 'N')),
 primary key(service_num),
 foreign key(service_num) references task(task_num),
 foreign key(room_num) references room
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating work_order table...

DROP TABLE work_order CASCADE CONSTRAINTS;

CREATE TABLE work_order
(work_num char(8),
 room_num char(3),
 issue varchar2(20),
 outsource varchar2(50),
 primary key(work_num),
 foreign key(work_num) references task(task_num),
 foreign key(room_num) references room
);

-------------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt generating caretaker table...

DROP TABLE care CASCADE CONSTRAINTS;

CREATE TABLE care
(care_num char(8),
 wf_num char(3),
 care_specifics varchar2(20),
 primary key(care_num),
 foreign key(care_num) references task(task_num),
 foreign key(wf_num) references waterfowl
);
