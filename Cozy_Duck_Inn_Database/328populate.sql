/*
    Julia Calkins
    CS 328 - My Database Populate SQL Script
    Last modified: 25-Feb-2025
*/


---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating room table...

-- First Floor ('1--')

INSERT INTO room
VALUES
('101', 'HNK');

INSERT INTO room
VALUES
('102', 'HNK');

INSERT INTO room
VALUES
('103', 'HNQQ');

INSERT INTO room
VALUES
('104', 'HNQQ');

INSERT INTO room
VALUES
('105', 'HNK');

INSERT INTO room
VALUES
('106', 'HNQQ');

INSERT INTO room
VALUES
('107', 'HNQQ');

INSERT INTO room
VALUES
('108', 'HNQQ');

INSERT INTO room
VALUES
('109', 'HNQQ');

INSERT INTO room
VALUES
('110', 'HNK');

INSERT INTO room
VALUES
('111', 'SHNK');

INSERT INTO room
VALUES
('112', 'SHNQQ');

INSERT INTO room
VALUES
('113', 'HNQQ');

INSERT INTO room
VALUES
('114', 'NK');

INSERT INTO room
VALUES
('115', 'NQQ');

INSERT INTO room
VALUES
('116', 'NK');

INSERT INTO room
VALUES
('117', 'NQQ');

INSERT INTO room
VALUES
('118', 'NQQ');

INSERT INTO room
VALUES
('119', 'NK');

INSERT INTO room
VALUES
('120', 'NK');

INSERT INTO room
VALUES
('121', 'NK');

INSERT INTO room
VALUES
('122', 'HNQQ');

INSERT INTO room
VALUES
('123', 'HNK');

INSERT INTO room
VALUES
('124', 'SHNK');

INSERT INTO room
VALUES
('125', 'SHNQQ');

-- Second floor ('2--')

INSERT INTO room
VALUES
('200', 'NK');

INSERT INTO room
VALUES
('201', 'NQQ');

INSERT INTO room
VALUES
('202', 'NK');

INSERT INTO room
VALUES
('203', 'SNQQ');

INSERT INTO room
VALUES
('204', 'SHNK');

INSERT INTO room
VALUES
('205', 'NQQ');

INSERT INTO room
VALUES
('206', 'NK');

INSERT INTO room
VALUES
('207', 'NQQ');

INSERT INTO room
VALUES
('208', 'NK');

INSERT INTO room
VALUES
('209', 'SNQQ');

INSERT INTO room
VALUES
('210', 'HNQQ');

INSERT INTO room
VALUES
('211', 'HNK');

INSERT INTO room
VALUES
('212', 'NK');

INSERT INTO room
VALUES
('213', 'SHNQQ');

INSERT INTO room
VALUES
('214', 'NK');

INSERT INTO room
VALUES
('215', 'NQQ');

INSERT INTO room
VALUES
('216', 'SNK');

INSERT INTO room
VALUES
('217', 'NQQ');

INSERT INTO room
VALUES
('218', 'SHNK');

INSERT INTO room
VALUES
('219', 'NK');

INSERT INTO room
VALUES
('220', 'HNQQ');

INSERT INTO room
VALUES
('221', 'HNK');

INSERT INTO room
VALUES
('222', 'NK');

INSERT INTO room
VALUES
('223', 'SHNQQ');

INSERT INTO room
VALUES
('224', 'RNKK');

INSERT INTO room
VALUES
('225', 'SNK2');

-- Third Floor ('3--')

INSERT INTO room
VALUES
('300', 'NK');

INSERT INTO room
VALUES
('301', 'NQQ');

INSERT INTO room
VALUES
('302', 'SNK');

INSERT INTO room
VALUES
('303', 'SNQQ');

INSERT INTO room
VALUES
('304', 'SHNK');

INSERT INTO room
VALUES
('305', 'SHNQQ');

INSERT INTO room
VALUES
('306', 'RNKK');

INSERT INTO room
VALUES
('307', 'RNKKQQ');

INSERT INTO room
VALUES
('308', 'RNKQ2');

INSERT INTO room
VALUES
('309', 'SNK2');

INSERT INTO room
VALUES
('310', 'NK');

INSERT INTO room
VALUES
('311', 'NQQ');

INSERT INTO room
VALUES
('312', 'SNK');

INSERT INTO room
VALUES
('313', 'SNQQ');

INSERT INTO room
VALUES
('314', 'SHNK');

INSERT INTO room
VALUES
('315', 'SHNQQ');

INSERT INTO room
VALUES
('316', 'RNKK');

INSERT INTO room
VALUES
('317', 'RNKKQQ');

INSERT INTO room
VALUES
('318', 'RNKQ2');

INSERT INTO room
VALUES
('319', 'SNK2');

INSERT INTO room
VALUES
('320', 'NK');

INSERT INTO room
VALUES
('321', 'NQQ');

-- Fourth Floor ('4--')

INSERT INTO room
VALUES
('400', 'SNK');

INSERT INTO room
VALUES
('401', 'SNQQ');

INSERT INTO room
VALUES
('402', 'SHNK');

INSERT INTO room
VALUES
('403', 'SHNQQ');

INSERT INTO room
VALUES
('404', 'RNK');

INSERT INTO room
VALUES
('405', 'RNKKQQ');

INSERT INTO room
VALUES
('406', 'RNKQ2');

INSERT INTO room
VALUES
('407', 'RNKK');

INSERT INTO room
VALUES
('408', 'SNK2');

INSERT INTO room
VALUES
('409', 'SNK');

INSERT INTO room
VALUES
('410', 'SNQQ');

INSERT INTO room
VALUES
('411', 'SHNK');

INSERT INTO room
VALUES
('412', 'SHNQQ');

INSERT INTO room
VALUES
('413', 'RNKK');

INSERT INTO room
VALUES
('414', 'RNKQ2');

INSERT INTO room
VALUES
('415', 'RNK2');

INSERT INTO room
VALUES
('416', 'RNK');

INSERT INTO room
VALUES
('417', 'SNK2');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating guest table...

-- 0000001
INSERT INTO guest
VALUES
('0000001', 'Smith', 'John', '123 Maple Street',
 'Springfield', '12345', 'United States');

-- 0000002
INSERT INTO guest
VALUES
('0000002', 'Johnson', 'Emily', '456 Oak Avenue',
 'Riverside', 'A7L8P0', 'Canada');

-- 0000003
INSERT INTO guest
VALUES
('0000003', 'Williams', 'Michael', '789 Pine Road',
 'Lakewood', 'KU720BB', 'United Kingdom');

-- 0000004
INSERT INTO guest
VALUES
('0000004', 'Brown', 'Olivia', '101 Birch Lane',
 'Greenwich', '9875', 'Australia');

-- 0000005
INSERT INTO guest
VALUES
('0000005', 'Davis', 'Daniel', '202 Cedar Drive',
 'Hilltown', '2468', 'New Zealand');

-- 0000006
INSERT INTO guest
VALUES
('0000006', 'Miller', 'Sophia', '303 Elm Boulevard',
 'Sunnydale', '13579', 'United States');

-- 0000007
INSERT INTO guest
VALUES
('0000007', 'Wilson', 'James', '404 Redwood Street',
 'Mapleton', 'K81K000', 'Ireland');

-- 0000008
INSERT INTO guest
VALUES
('0000008', 'Moore', 'Isabella', '505 Ash Place', 'Brooklyn',
 '10101', 'United States');

-- 0000009
INSERT INTO guest
VALUES
('0000009', 'Taylor', 'Ethan', '606 Willow Way',
 'Clearwater', 'UD902HJ', 'United Kingdom');

-- 0000010
INSERT INTO guest
VALUES
('0000010', 'Anderson', 'Grace', '707 Pinehill Avenue',
 'Lakeshore', 'Z3X4J5', 'Canada');


-- 0000011
INSERT INTO guest
VALUES
('0000011', 'Sasaki', 'Akira', '19-ki-3-8 Tamago',
 'Misawa', '0339934', 'Japan');


-- 0000012
INSERT INTO guest
VALUES
('0000012', 'Driverr', 'Miles', '2222 Peanut Butter Terrace',
 'Moscow', '83843', 'United States');


-- 0000013
INSERT INTO guest
VALUES
('0000013', 'Best', 'Ida', '30 Notreal Street',
 'Fortuna', '95540', 'United States');


-- 0000014
INSERT INTO guest
VALUES
('0000014', 'Jones', 'Almalexia', '888 Sunshine Court',
 'Balmora', '22322', 'United States');

-- 0000015
INSERT INTO guest
VALUES
('0000015', 'Petersberg', 'Peter', '999 Ashen Way',
 'Resdayn', '10001', 'United States');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating guest_phone_num table...

-- 0000001
INSERT INTO guest_phone_num
VALUES
('0000001', '1002003000');

INSERT INTO guest_phone_num
VALUES
('0000001', '1003004000');

INSERT INTO guest_phone_num
VALUES
('0000001', '1001111000');


-- 0000002
INSERT INTO guest_phone_num
VALUES
('0000002', '0010020003');


-- 0000003
INSERT INTO guest_phone_num
VALUES
('0000003', '1111223333');

-- 0000004
INSERT INTO guest_phone_num
VALUES
('0000004', '9999888777');

-- 0000005
INSERT INTO guest_phone_num
VALUES
('0000005', '001112222');

-- 0000006
INSERT INTO guest_phone_num
VALUES
('0000006', '8782124334');

-- 0000007
INSERT INTO guest_phone_num
VALUES
('0000007', '0000883333');

-- 0000008
INSERT INTO guest_phone_num
VALUES
('0000008', '6667778888');

-- 0000009
INSERT INTO guest_phone_num
VALUES
('0000009', '123001234');

-- 0000010
INSERT INTO guest_phone_num
VALUES
('0000010', '3337878778');

-- 0000011
INSERT INTO guest_phone_num
VALUES
('0000011', '2200009999');

-- 0000012
INSERT INTO guest_phone_num
VALUES
('0000012', '9994448888');

-- 0000013
INSERT INTO guest_phone_num
VALUES
('0000013', '2023039909');

-- 0000014
INSERT INTO guest_phone_num
VALUES
('0000014', '7770700770');

-- 0000015
INSERT INTO guest_phone_num
VALUES
('0000015', '4245356446');


---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating guest_email_addr table...

-- 0000001
INSERT INTO guest_email_addr
VALUES
('0000001', 'bigmanjohn@fakemail.com');

-- 0000002
INSERT INTO guest_email_addr
VALUES
('0000002', 'emmabear111@justanemail.ca');

-- 0000003
INSERT INTO guest_email_addr
VALUES
('0000003', 'number.one.gamer@notmail.com');

-- 0000004
INSERT INTO guest_email_addr
VALUES
('0000004', 'obrown@fakemail.com');

-- 0000005
INSERT INTO guest_email_addr
VALUES
('0000005', 'dantheman@notarealemail.net');

-- 0000006
INSERT INTO guest_email_addr
VALUES
('0000006', 'smiller333@worstelectric.com');

-- 0000007
INSERT INTO guest_email_addr
VALUES
('0000007', 'james007@fakemail.com');

-- 0000008
INSERT INTO guest_email_addr
VALUES
('0000008', 'iq.moore@duckdoctors.com');

-- 0000009
INSERT INTO guest_email_addr
VALUES
('0000009', 'doglover003@notmail.com');

-- 0000010
INSERT INTO guest_email_addr
VALUES
('0000010', 'anderson.g@notarealemail.net');

-- 0000011
INSERT INTO guest_email_addr
VALUES
('0000011', 'tamago.desu@fakemail.com');

-- 0000012
INSERT INTO guest_email_addr
VALUES
('0000012', 'vroom.vroom@notmail.com');

-- 0000013
INSERT INTO guest_email_addr
VALUES
('0000013', 'ie.best@duckdoctors.com');

-- 0000014
INSERT INTO guest_email_addr
VALUES
('0000014', 'bestof3@fakefake.net');

-- 0000015
INSERT INTO guest_email_addr
VALUES
('0000015', 'petepete@fakefake.net');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating reservation table...

INSERT INTO reservation
VALUES
('00000001', '01-JAN-2025', '02-JAN-2025', 209.99, 'Checked Out',
 '0000001', '417', 2);

('00000002', '01-JAN-2025', '03-JAN-2025', 379.99, 'Checked Out',
 '0000002', '215', 3);

('00000003', '01-JAN-2025', '02-JAN-2025', 249.99, 'Checked Out',
 '0000003', '404', 2);

('00000122', '22-FEB-2025', '26-FEB-2025', 1003.99, 'In House',
 '00000011', '312', 3);


---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating transaction table...

INSERT INTO transaction
VALUES
('0000000001', '00000001', '02-JAN-2025', 209.99, 'Credit');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating employee table...

INSERT INTO employee
VALUES
('HB01', 'Barbara', 'Hannah', 'General', 70.25, '21-DEC-2024',
 'Other', 'Y');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating employee_phone_num table...

INSERT INTO employee_phone_num
VALUES
('HB01', '0009990000');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating empl_res table...

INSERT INTO empl_res
VALUES
('HB01', '00000001');


---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating waterfowl table...

INSERT INTO waterfowl
VALUES
('001', 'Mochi', 'Duck', 'Call', 1);


---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating task table...

INSERT INTO task
VALUES
('R0000001', '02-JAN-2025', '02-JAN-2025', 'Room Service');

INSERT INTO task
VALUES
('W0000001', '01-JAN-2025', '01-JAN-2025', 'Work Order');

INSERT INTO task
VALUES
('C0000001', '23-DEC-2024', '23-DEC-2024', 'Care');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating empl_task table...

INSERT INTO empl_task
VALUES
('HB01', 'R0000001');



---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating room_service table...

INSERT INTO room_service
VALUES
('R0000001', '417', 'N');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating work_order table...

INSERT INTO work_order(work_num, room_num, issue)
VALUES
('W0000001', '202', 'Sink Clog');

---------------------------------------------
prompt
prompt~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt populating care table...

INSERT INTO care
VALUES
('C0000001', '001', 'Feeding');
