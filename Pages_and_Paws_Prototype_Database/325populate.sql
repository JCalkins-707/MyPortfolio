/* Kiko Barr & Julia Calkins & McKenna Kindle
 * CS 325 Fall 2025 - populating tables
 * last modified: 10-DEC-2024
 */
-- deletion statements
prompt Delete Statements

delete from cat_caretaker;

delete from cat_breed;

delete from cat_training_class;

delete from book_signing;

delete from fundraiser;

delete from supervises;

delete from adoption;

delete from purchase_item_quantity;

delete from pastry;

delete from drink;

delete from book_genre;

delete from patron_email_list;

delete from volunteer;

delete from event;

delete from book;

delete from cat;

delete from purchase_item;

delete from shelter;

delete from purchase;

delete from employee;

delete from patron;
----------------------------------------------------------------------------
PROMPT Shelter

INSERT INTO Shelter
VALUES ('1001', 'San Francisco SPCA', '201 Alabama St', 'San Francisco', '94103');

INSERT INTO Shelter
VALUES ('1002', 'Give Me Shelter Cat Rescue', '1591 Sloat Blvd', 'San Francisco', '94132');

INSERT INTO Shelter
VALUES ('1003', 'Town Cats', '195 San Pedro Ave', 'Morgan Hill', '95037');

INSERT INTO Shelter
VALUES ('1004', 'Berkeley Humane', '2700 Ninth St', 'Berkeley', '94710');

INSERT INTO Shelter
VALUES ('1005', 'East Bay SPCA', '8323 Baldwin St', 'Oakland', '94621');

INSERT INTO Shelter
VALUES ('1006', 'Peninsula Humane Society', '1450 Rollins Rd', 'Burlingame', '94010');

INSERT INTO Shelter
VALUES ('1007', 'Humane Society Silicon Valley', '901 Ames Ave', 'Milpitas', '95035');

INSERT INTO Shelter
VALUES ('1008', 'Marin Humane', '171 Bel Marin Keys Blvd', 'Novato', '94949');

INSERT INTO Shelter
VALUES ('1009', 'Hopalong Animal Rescue', '945 22nd Ave', 'Oakland', '94606');

INSERT INTO Shelter
VALUES ('1010', 'Nine Lives Foundation', '3137 Jefferson Ave', 'Redwood City', '94062');

INSERT INTO Shelter
VALUES ('1011', 'FieldHaven Feline Center', '2754 Ironwood Ln', 'Lincoln', '95648');

INSERT INTO Shelter
VALUES ('1012', 'Homeless Cat Network', '1040 Park Pl', 'San Mateo', '94403');

INSERT INTO Shelter
VALUES ('1013', 'Jakes Place Cat Rescue', '1450 Grant Ave', 'Novato', '94945');

INSERT INTO Shelter
VALUES ('1014', 'Furry Friends Rescue', '45962 Warm Springs Blvd', 'Fremont', '94539');

INSERT INTO Shelter
VALUES ('1015', 'Animal Rescue Foundation', '2890 Mitchell Dr', 'Walnut Creek', '94598');

INSERT INTO Shelter
VALUES('1016', 'Sequoia Humane Society', '6073 Loma Ave', 'Eureka', '95503');

----------------------------------------------------------------------------
PROMPT Cat

-----1001
INSERT INTO cat
VALUES ('01AA01', 'Bella', 2, 'F', '25-FEB-2023', '1001');

INSERT INTO cat
VALUES ('01AA02', 'Princess', 2, 'F', '06-JUN-2023', '1001');

INSERT INTO cat
VALUES ('01AA03', 'Max', 2, 'M', '18-AUG-2023', '1001');

INSERT INTO cat
VALUES ('01AA04', 'Zeus', 1, 'M', '3-FEB-2024', '1001');

INSERT INTO cat
VALUES ('01AA05', 'Cocoa', 0.8, 'M', '17-MAY-2024', '1001');

INSERT INTO cat
VALUES ('01AA06', 'Maki', 1, 'M', '9-JUN-2024', '1001');

INSERT INTO cat
VALUES ('01AA07', 'Kiki', 0.5, 'F', '08-NOV-2024', '1001');

-----1002

INSERT INTO cat
VALUES ('02AA01', 'Seymour', 6, 'M', '23-MAR-2023', '1002');

INSERT INTO cat
VALUES ('02AA02', 'Callie', 3, 'F', '30-MAR-2023', '1002');

INSERT INTO cat
VALUES ('02AA03', 'Pilot', 4, 'M', '4-MAY-2023', '1002');

INSERT INTO cat
VALUES ('02AA04', 'Jack', 2, 'M', '09-JUN-2023', '1002');

INSERT INTO cat
VALUES ('02AA05', 'Jill', 2, 'F', '09-JUN-2023', '1002');

INSERT INTO cat
VALUES ('02AA06', 'Frank', 8, 'M', '23-SEP-2023', '1002');

INSERT INTO cat
VALUES ('02AA07', 'Leo', 6, 'M', '14-MAR-2024', '1002');

INSERT INTO cat
VALUES ('02AA08', 'Baxter', 1, 'M', '7-JUN-2024', '1002');

INSERT INTO cat
VALUES ('02AA09', 'Momo', 1, 'M', '19-AUG-2024', '1002');

INSERT INTO cat
VALUES ('02AA10', 'Persimmon', 2, 'F', '6-SEP-2024', '1002');


-----1003

INSERT INTO cat
VALUES ('03AA01', 'Poptart', 8, 'M', '09-APR-2023', '1003');

INSERT INTO cat
VALUES ('03AA02', 'Lucy', 7, 'F', '18-OCT-2023', '1003');

INSERT INTO cat
VALUES ('03AA03', 'Jinx', 5, 'M', '04-MAY-2024', '1003');

INSERT INTO cat
VALUES ('03AA04', 'Sam', 2, 'F', '18-JUN-2024', '1003');

INSERT INTO cat
VALUES ('03AA05', 'Max', 7, 'M', '14-AUG-2024', '1003');

INSERT INTO cat
VALUES ('03AA06', 'Achilles', 0.4, 'M', '30-OCT-2024', '1003');


-----1004

INSERT INTO cat
VALUES ('04AA01', 'Pluto', 4, 'M', '11-JUL-2023', '1004');

INSERT INTO cat
VALUES ('04AA02', 'Oliver', 1, 'M', '04-NOV-2023', '1004');

INSERT INTO cat
VALUES ('04AA03', 'Socks', 2, 'F', '26-FEB-2024', '1004');

INSERT INTO cat
VALUES ('04AA04', 'Brie', 4, 'F', '20-JUL-2024', '1004');

-----1005

INSERT INTO cat
VALUES ('05AA01', 'Milo', 9, 'M', '13-JUL-2023', '1005');

INSERT INTO cat
VALUES ('05AA02', 'Raven', 3, 'F', '20-DEC-2023', '1005');

INSERT INTO cat
VALUES ('05AA03', 'Ellie', 1, 'F', '24-APR-2024', '1005');


-----1006

INSERT INTO cat
VALUES ('06AA01', 'Tabitha', 3, 'F', '14-AUG-2023', '1006');



-----1007

INSERT INTO cat
VALUES ('07AA01', 'Oscar', 6, 'M', '02-SEP-2023', '1007');

INSERT INTO cat
VALUES ('07AA02', 'Boxes', 1, 'M', '31-JAN-2024', '1007');

INSERT INTO cat
VALUES ('07AA03', 'Silas', 0.8, 'M', '3-AUG-2024', '1007');

-----1008

INSERT INTO cat
VALUES ('08AA01', 'Eggo', 7, 'M', '08-SEP-2023', '1008');

INSERT INTO cat
VALUES ('08AA02', 'Rosie', 1, 'F', '28-MAR-2024', '1008');


-----1009

INSERT INTO cat
VALUES ('09AA01', 'Mittens', 3, 'F', '01-OCT-2023', '1009');

INSERT INTO cat
VALUES ('09AA02', 'Amira', 10, 'F', '30-NOV-2023', '1009');



-----1010

INSERT INTO cat
VALUES ('10AA01', 'Pookie', 7, 'M', '13-NOV-2023', '1010');

INSERT INTO cat
VALUES ('10AA02', 'Magic', 0.4, 'M', '1-JUL-2024', '1010');

INSERT INTO cat
VALUES ('10AA03', 'Mystic', 0.4, 'F', '1-JUL-2024', '1010');

INSERT INTO cat
VALUES ('10AA04', 'Mana', 0.4, 'M', '1-JUL-2024', '1010');

-----1011

INSERT INTO cat
VALUES ('11AA01', 'Khajiit', 2, 'M', '11-NOV-2023', '1011');

INSERT INTO cat
VALUES ('11AA02', 'Talos', 6, 'M', '11-NOV-2023', '1011');



-----1012

INSERT INTO cat
VALUES ('12AA01', 'Bean', 8, 'M', '16-NOV-2023', '1012');

INSERT INTO cat
VALUES ('12AA02', 'Alexie', 1, 'F', '20-MAY-2024', '1012');

INSERT INTO cat
VALUES ('12AA03', 'Persia', 0.7, 'F', '8-JUL-2024', '1012');

INSERT INTO cat
VALUES ('12AA04', 'Sophie', 2, 'F', '1-DEC-2024', '1012');


-----1013

INSERT INTO cat
VALUES ('13AA01', 'Jambon', 4, 'M', '01-JAN-2024', '1013');


-----1014

INSERT INTO cat
VALUES ('14AA01', 'Loki', 5, 'M', '01-MAY-2024', '1014');

INSERT INTO cat
VALUES ('14AA02', 'Sasha', 3, 'F', '17-MAY-2024', '1014');



-----1015

INSERT INTO cat
VALUES ('15AA01', 'Mirabell', 7, 'F', '02-JUN-2024', '1015');

INSERT INTO cat
VALUES ('15AA02', 'Peter', 2, 'M', '12-AUG-2024', '1015');

INSERT INTO cat
VALUES ('15AA03', 'Max', 0.5, 'M', '22-AUG-2024', '1015');

---1016

INSERT INTO cat
VALUES ('16AA01', 'Donatello', 0.9, 'M', '13-OCT-2024', '1016');

INSERT INTO cat
VALUES ('16AA02', 'Katrina', 3, 'F', '20-NOV-2024', '1016');


----------------------------------------------------------------------------
PROMPT Cat Breed

--01AA01
INSERT INTO cat_breed
VALUES ('01AA01', 'American Wirehair');

INSERT INTO cat_breed
VALUES ('01AA01', 'California Spangled');

--01AA02

INSERT INTO cat_breed
VALUES ('01AA02', 'Maine Coon');

--01AA03

INSERT INTO cat_breed
VALUES ('01AA03', 'American Wirehair');

--01AA04

INSERT INTO cat_breed
VALUES ('01AA04', 'Manx');

INSERT INTO cat_breed
VALUES ('01AA04', 'Ragdoll');

--01AA05

INSERT INTO cat_breed
VALUES ('01AA05', 'Abyssinian');

INSERT INTO cat_breed
VALUES ('01AA05', 'Burmilla');

--01AA06

INSERT INTO cat_breed
VALUES ('01AA06', 'Donskoy');

--01AA07

INSERT INTO cat_breed
VALUES ('01AA07', 'Siamese');

--02AA01
INSERT INTO cat_breed
VALUES ('02AA01', 'Aegean');

INSERT INTO cat_breed
VALUES ('02AA01', 'Russian Blue');

--02AA02
INSERT INTO cat_breed
VALUES ('02AA02', 'Scottish Fold');

--02AA03
INSERT INTO cat_breed
VALUES ('02AA03', 'Siberian');

INSERT INTO cat_breed
VALUES ('02AA03', 'Maine Coon');

--02AA04

INSERT INTO cat_breed
VALUES ('02AA04', 'Tonkinese');

INSERT INTO cat_breed
VALUES ('02AA04', 'American Shorthair');

--02AA05

INSERT INTO cat_breed
VALUES ('02AA05', 'British Shorthair');

--02AA06

INSERT INTO cat_breed
VALUES ('02AA06', 'Norwegian Forest');

INSERT INTO cat_breed
VALUES ('02AA06', 'American Longhair');

--02AA07

INSERT INTO cat_breed
VALUES ('02AA07', 'Ojos Azules');

--02AA08

INSERT INTO cat_breed
VALUES ('02AA08','Asian Semi-Longhair');

--02AA09

INSERT INTO cat_breed
VALUES ('02AA09', 'European Shorthair');

INSERT INTO cat_breed
VALUES ('02AA09', 'Manx');

INSERT INTO cat_breed
VALUES ('02AA09', 'Colorpoint Shorthair');

--02AA10

INSERT INTO cat_breed
VALUES ('02AA10', 'Chausie');

INSERT INTO cat_breed
VALUES ('02AA10', 'Korat');

--03AA01
INSERT INTO cat_breed
VALUES ('03AA01', 'Manx');

--03AA02
INSERT INTO cat_breed
VALUES ('03AA02', 'Ragdoll');

--03AA03
INSERT INTO cat_breed
VALUES ('03AA03', 'Somali');

INSERT INTO cat_breed
VALUES ('03AA03', 'Turkish Van');

INSERT INTO cat_breed
VALUES ('03AA03', 'British Shorthair');

--03AA04

INSERT INTO cat_breed
VALUES ('03AA04', 'Serengeti');

--03AA05

INSERT INTO cat_breed
VALUES ('03AA05', 'American Wirehair');

INSERT INTO cat_breed
VALUES ('03AA05', 'Sokoke');

--03AA06

INSERT INTO cat_breed
VALUES ('03AA06', 'Snowshoe');

--04AA01
INSERT INTO cat_breed
VALUES ('04AA01', 'American Curl');

INSERT INTO cat_breed
VALUES ('04AA01', 'Chantilly');

--04AA02

INSERT INTO cat_breed
VALUES ('04AA02', 'Turkish Angora');

--04AA03

INSERT INTO cat_breed
VALUES ('04AA03','American Curl');

INSERT INTO cat_breed
VALUES ('04AA03', 'Aegean');

--04AA04

INSERT INTO cat_breed
VALUES ('04AA04', 'Brazilian Shorthair');

INSERT INTO cat_breed
VALUES ('04AA04', 'Snowshoe');


--05AA01
INSERT INTO cat_breed
VALUES ('05AA01', ' Siberian');

INSERT INTO cat_breed
VALUES ('05AA01', 'British Longhair');

--05AA02

INSERT INTO cat_breed
VALUES ('05AA02', 'Asian Semi-Longhair');

--05AA03

INSERT INTO cat_breed
VALUES ('05AA03', 'American Bobtail');

--06AA01
INSERT INTO cat_breed
VALUES ('06AA01', 'Russian Blue');

INSERT INTO cat_breed
VALUES ('06AA01', 'Abyssinian');

INSERT INTO cat_breed
VALUES ('06AA01', 'American Curl');

--07AA01
INSERT INTO cat_breed
VALUES ('07AA01', 'American Bobtail');

INSERT INTO cat_breed
VALUES ('07AA01', 'Maine Coon');

--07AA02

INSERT INTO cat_breed
VALUES ('07AA02', 'Korat');

--07AA03

INSERT INTO cat_breed
VALUES ('07AA03', 'Pixie-Bob');

--08AA01
INSERT INTO cat_breed
VALUES ('08AA01', 'American Longhair');

INSERT INTO cat_breed
VALUES ('08AA01', 'Bengal');

INSERT INTO cat_breed
VALUES ('08AA01', 'Sokoke');

--08AA02

INSERT INTO cat_breed
VALUES ('08AA02', 'Maine Coon');

--09AA01
INSERT INTO cat_breed
VALUES ('09AA01', 'Manx');
INSERT INTO cat_breed
VALUES ('09AA01', 'Maine Coon');

--09AA02
INSERT INTO cat_breed
VALUES ('09AA02', 'Turkish Angora');
INSERT INTO cat_breed
VALUES ('09AA02', 'Tonkinese');

--10AA01
INSERT INTO cat_breed
VALUES ('10AA01', 'Norwegian Forest');

INSERT INTO cat_breed
VALUES ('10AA01', 'American Wirehair');

INSERT INTO cat_breed
VALUES ('10AA01', 'Serengeti');

--10AA02

INSERT INTO cat_breed
VALUES ('10AA02', 'Persian');

--10AA03

INSERT INTO cat_breed
VALUES ('10AA03', 'Persian');

--10AA04

INSERT INTO cat_breed
VALUES ('10AA04', 'Persian');

--11AA01
INSERT INTO cat_breed
VALUES ('11AA01', 'Pixie-Bob');

INSERT INTO cat_breed
VALUES ('11AA01', 'American Shorthair');

--11AA02
INSERT INTO cat_breed
VALUES ('11AA02', 'American Wirehair');

INSERT INTO cat_breed
VALUES ('11AA02', 'American Bobtail');

--12AA01
INSERT INTO cat_breed
VALUES ('12AA01', 'Munchkin');

--12AA02

INSERT INTO cat_breed
VALUES ('12AA02', 'Russian Blue');

INSERT INTO cat_breed
VALUES ('12AA02', 'European Shorthair');

--12AA03

INSERT INTO cat_breed
VALUES ('12AA03', 'Colorpoint Shorthair');

--12AA04

INSERT INTO cat_breed
VALUES ('12AA04', 'American Wirehair');

INSERT INTO cat_breed
VALUES ('12AA04', 'Chausie');

--13AA01
INSERT INTO cat_breed
VALUES ('13AA01', 'Chartreux');

--14AA01
INSERT INTO cat_breed
VALUES ('14AA01', 'Donskoy');

-- 14AA02
INSERT INTO cat_breed
VALUES ('14AA02', 'British Shorthair');

INSERT INTO cat_breed
VALUES ('14AA02', 'Munchkin');

--15AA01
INSERT INTO cat_breed
VALUES ('15AA01', 'European Shorthair');

--15AA02

INSERT INTO cat_breed
VALUES ('15AA02', 'Chantilly');

--15AA03

INSERT INTO cat_breed
VALUES ('15AA03', 'American Longhair');

INSERT INTO cat_breed
VALUES ('15AA03', 'Manx');

--16AA01

INSERT INTO cat_breed
VALUES ('16AA01', 'Burmilla'):

--16AA02

INSERT INTO cat_breed
VALUES ('16AA02', 'Munchkin');

INSERT INTO cat_breed
VALUES ('16AA02', 'Ragamuffin');


----------------------------------------------------------------------------
PROMPT Volunteer

INSERT INTO volunteer
VALUES ('V001', 'Jack', 'Jillington', 'jack.h.jillington02@notmail.com',
	 '000-982-2120', '03-FEB-2023', '10-FEB-2023', 389);

INSERT INTO volunteer
VALUES ('V002', 'Ana', 'Amari', 'nano-gir89@fakemail.net', '000-982-8787',
	'03-FEB-2023', '10-FEB-2023', 364);

INSERT INTO volunteer
VALUES ('V003', 'Bella', 'Swan', 'forks_girl90@notarealaddress.com',
	'000-982-7878', '05-FEB-2023', '10-FEB-2023', 299);

INSERT INTO volunteer
VALUES ('V004', 'Divath', 'Fyr', 'fyr.divath@telfyr.mw', '002-344-7285',
	'16-FEB-2023', '20-FEB-2023', 400);

INSERT INTO volunteer
VALUES ('V005', 'Akande', 'Ogundimu', 'akande_doomfist@talon.org',
	'002-223-4356', '24-MAR-2023', '25-MAR-2023', 202);

INSERT INTO volunteer
VALUES ('V006', 'Jin', 'Sakai', 'jsakai_ghost@feudaltsushima.jp',
	'001-658-2660', '19-JUN-2023', '23-JUN-2023', 190);

INSERT INTO volunteer
VALUES ('V007', 'Gabriel', 'Reyes', 'gabriel.reyes@fakemail.net',
	'020-165-5388', '30-JUN-2023', '01-JUL-2023',  261);

INSERT INTO volunteer
VALUES ('V008', 'Alain', 'Dufont', 'alain_the_bandit@notmail.com',
	'003-443-3271', '03-AUG-2023', '08-AUG-2023', 197);

INSERT INTO volunteer
VALUES ('V009', 'Ellie', 'Vater', 'ellievater38@notarealaddress.com',
	'003-621-5403', '07-OCT-2023', '08-OCT-2023', 84);

INSERT INTO volunteer
VALUES ('V010', 'Martin', 'Septim', 'akatosh_is_king@weynonpriory.cy',
	'001-192-8631', '11-OCT-2023', '15-OCT-2023', 100);

INSERT INTO volunteer
VALUES ('V011', 'Smith', 'John', 'johnnyjohn@talon.org',
	'000-111-2222', '30-OCT-2023', '05-NOV-2023', 203);

INSERT INTO volunteer
VALUES ('V012', 'Anita', 'Koffee', 'koffeelover83@fakemail.net',
	'003-465-5709', '10-DEC-2023', '14-DEC-2023', 116);

INSERT INTO volunteer
VALUES ('V013', 'Nathan', 'Drake', 'number1treasurehunter@fakemail.net',
	'004-899-2030', '17-JAN-2024', '20-JAN-2024', 87);

INSERT INTO volunteer
VALUES ('V014', 'Warren', 'Peace', 'pwarr13@fake.edu',
	'000-359-7134', '17-JAN-2024', '20-JAN-2024', 111);

INSERT INTO volunteer
VALUES ('V015', 'Wayne', 'Bruce', 'batmanreal@notmail.com',
	'100-345-9823', '11-APR-2024', '11-APR-2024', 500);

INSERT INTO volunteer
VALUES ('V016', 'Hana', 'Song', 'gamergirl007@notarealaddress.com',
	'020-986-1213', '1-AUG-2024', '9-AUG-2024', 76);

INSERT INTO volunteer
VALUES ('V017', 'Kat', 'Dogman', 'katdog101@fakemail.com',
	'100-301-6710', '18-SEP-2024', '28-SEP-2024', 82);

INSERT INTO volunteer
VALUES ('V018', 'Preston', 'Garvey', 'garvey.preston19@notmail.com',
	'020-083-3810', '19-NOV-2024', '26-NOV-2024', 30);


----------------------------------------------------------------------------
PROMPT cat_caretaker

--V001
INSERT INTO cat_caretaker
VALUES('V001', '01AA01');’

INSERT INTO cat_caretaker
VALUES('V001', '01AA02');

INSERT INTO cat_caretaker
VALUES('V001', '02AA01');

INSERT INTO cat_caretaker
VALUES('V001', '02AA07');

INSERT INTO cat_caretaker
VALUES('V001', '03AA01');

INSERT INTO cat_caretaker
VALUES('V001', '04AA02');

INSERT INTO cat_caretaker
VALUES('V001', '04AA03');

INSERT INTO cat_caretaker
VALUES('V001', '07AA03');

INSERT INTO cat_caretaker
VALUES('V001', '12AA03');

INSERT INTO cat_caretaker
VALUES('V001', '12AA04');



--V002
INSERT INTO cat_caretaker
VALUES('V002', '03AA02');

INSERT INTO cat_caretaker
VALUES('V002', '01AA03');

INSERT INTO cat_caretaker
VALUES('V002', '05AA03');

INSERT INTO cat_caretaker
VALUES('V002', '03AA06');

INSERT INTO cat_caretaker
VALUES('V002', '02AA03');

INSERT INTO cat_caretaker
VALUES('V002', '12AA02');


--V003
INSERT INTO cat_caretaker
VALUES('V003', '02AA02');

INSERT INTO cat_caretaker
VALUES('V003', '02AA08');

INSERT INTO cat_caretaker
VALUES('V003', '03AA03');

INSERT INTO cat_caretaker
VALUES('V003', '04AA01');

INSERT INTO cat_caretaker
VALUES('V003', '05AA01');

INSERT INTO cat_caretaker
VALUES('V003', '06AA01');

INSERT INTO cat_caretaker
VALUES('V003', '07AA02');


--V004
INSERT INTO cat_caretaker
VALUES('V004', '01AA04');

INSERT INTO cat_caretaker
VALUES('V004', '01AA05');

INSERT INTO cat_caretaker
VALUES('V004', '07AA01');

INSERT INTO cat_caretaker
VALUES('V004', '08AA01');

INSERT INTO cat_caretaker
VALUES('V004', '09AA01');

INSERT INTO cat_caretaker
VALUES('V004', '10AA02');

INSERT INTO cat_caretaker
VALUES('V004', '10AA03');

INSERT INTO cat_caretaker
VALUES('V004', '10AA04');

INSERT INTO cat_caretaker
VALUES('V004', '15AA02');

INSERT INTO cat_caretaker
VALUES('V004', '16AA01');


--V005
INSERT INTO cat_caretaker
VALUES('V005', '02AA04');

INSERT INTO cat_caretaker
VALUES('V005', '02AA05');

INSERT INTO cat_caretaker
VALUES('V005', '02AA06');

INSERT INTO cat_caretaker
VALUES('V005', '09AA02');

INSERT INTO cat_caretaker
VALUES('V005', '10AA01');

INSERT INTO cat_caretaker
VALUES('V005', '12AA04');


--V006
INSERT INTO cat_caretaker
VALUES('V006', '02AA07');

INSERT INTO cat_caretaker
VALUES('V006', '02AA10');

INSERT INTO cat_caretaker
VALUES('V006', '04AA03');

INSERT INTO cat_caretaker
VALUES('V006', '11AA01');

INSERT INTO cat_caretaker
VALUES('V006', '02AA09');

INSERT INTO cat_caretaker
VALUES('V006', '05AA02');


--V008
INSERT INTO cat_caretaker
VALUES('V008', '03AA06');

INSERT INTO cat_caretaker
VALUES('V008', '11AA02');

INSERT INTO cat_caretaker
VALUES('V008', '12AA01');

INSERT INTO cat_caretaker
VALUES('V008', '08AA02');

INSERT INTO cat_caretaker
VALUES('V008', '15AA03');


--V009
INSERT INTO cat_caretaker
VALUES('V009', '01AA06');

INSERT INTO cat_caretaker
VALUES('V009', '13AA01');

INSERT INTO cat_caretaker
VALUES('V009', '14AA01');

INSERT INTO cat_caretaker
VALUES('V009', '14AA02');

INSERT INTO cat_caretaker
VALUES('V009', '16AA02');


--V011
INSERT INTO cat_caretaker
VALUES('V011', '03AA05');

INSERT INTO cat_caretaker
VALUES('V011', '10AA02');

INSERT INTO cat_caretaker
VALUES('V011', '10AA03');

INSERT INTO cat_caretaker
VALUES('V011', '10AA04');

INSERT INTO cat_caretaker
VALUES('V011', '15AA01');

--V012

INSERT INTO cat_caretaker
VALUES('V012', '01AA07');

INSERT INTO cat_caretaker
VALUES('V012', '03AA04');

--V013
INSERT INTO cat_caretaker
VALUES('V013', '02AA10');

INSERT INTO cat_caretaker
VALUES('V013', '04AA04');

--V015
INSERT INTO cat_caretaker
VALUES('V015', '05AA03');

--V017
INSERT INTO cat_caretaker
VALUES('V017', '16AA01');

--V018
INSERT INTO cat_caretaker
VALUES('V018', '12AA04');


----------------------------------------------------------------------------
PROMPT Employee

INSERT INTO employee
VALUES ('E001', 'Cosades', 'Caius', 'c.cosades87@fakemail.net',
	'000-982-5654', '03-FEB-2023', 'Y', 30.00);

INSERT INTO employee
VALUES ('E002', 'Arsgonne', 'Mike', 'speed_racer007@notmail.com',
	 '000-883-9921', '03-FEB-2023', 'Y', 29.50);

INSERT INTO employee
VALUES ('E003', 'Ziegler', 'Angela', 'aziegler@notarealaddress.com',
	 '010-065-0332', '09-FEB-2023', 'Y', 35.10);

INSERT INTO employee
VALUES ('E004', 'Fiege', 'Emmerson', 'coolguy@weynonpriory.cy',
	'000-606-1444', '11-FEB-2023', 'Y', 29.50);

INSERT INTO employee
VALUES ('E005', 'Basto', 'Mary', 'mbast99@fakemail.net',
	'002-444-2827', '13-MAR-2023', 'N', 30.00);

INSERT INTO employee
VALUES ('E006', 'Lee', 'Brock', 'broccoliman73@notmail.com',
	 '123-456-7890', '15-MAR-2023', 'Y', 18.50);

INSERT INTO employee
VALUES ('E007', 'Pines', 'Stan', 'stantheman73@fakeaddress.com',
	 '987-654-3210', '29-MAY-2023', 'Y', 19.25);

INSERT INTO employee
VALUES ('E008', 'Porter', 'Amy', 'amy123@notarealaddress.com',
	'234-567-8901', '13-JUL-2023', 'Y', 18.75);

INSERT INTO employee
VALUES ('E009', 'Clearwater', 'Crystal', 'lil_princess33@notmail.com',
	 '567-890-1234', '01-OCT-2023', 'Y', 19.80);

INSERT INTO employee
VALUES ('E010', 'Grimes', 'Rick', 'rick.g@fakeaddress.com',
	'890-123-4567', '15-FEB-2024', 'Y', 18.60);

INSERT INTO employee
VALUES ('E011', 'Banner', 'Bruce', 'b.banner123@notarealaddress.com',
	'123-789-0456', '07-JUN-2024', 'Y', 19.50);

INSERT INTO employee
VALUES ('E012', 'Monella', 'Sal', 's.monella@quack.edu',
	 '456-789-0123', '27-NOV-2024', 'Y', 18.90);

INSERT INTO employee
VALUES ('E013', 'Annette', 'Clair', 'anne76@notmail.com',
	'001-332-7869', '22-SEP-2024', 'Y', 18.00);

INSERT INTO employee
VALUES ('E014', 'Henderson', 'Ray', 'rayman99@fakeaddress.com',
	'004-434-5521', '23-OCT-2024', 'N', 16.00);

INSERT INTO employee
VALUES ('E015', 'Oba', 'Yozo', 'oba.y1930@notarealaddress.com',
	'010-543-8943', '27-NOV-2024', 'N', 16.00); 

----------------------------------------------------------------------------
PROMPT supervises

--E001
INSERT INTO supervises
VALUES('E001', 'V001');

INSERT INTO supervises
VALUES('E001', 'V002');

INSERT INTO supervises
VALUES('E001', 'V003');

INSERT INTO supervises
VALUES('E001', 'V004');

INSERT INTO supervises
VALUES('E001', 'V005');

INSERT INTO supervises
VALUES('E001', 'V017');

--E002
INSERT INTO supervises
VALUES('E002', 'V006');

INSERT INTO supervises
VALUES('E002', 'V007');

INSERT INTO supervises
VALUES('E002', 'V008');

INSERT INTO supervises
VALUES('E002', 'V016');

INSERT INTO supervises
VALUES('E002', 'V018');

--E003
INSERT INTO supervises
VALUES('E003', 'V009');

INSERT INTO supervises
VALUES('E003', 'V010');

INSERT INTO supervises
VALUES('E003', 'V011');

INSERT INTO supervises
VALUES('E003', 'V012');

INSERT INTO supervises
VALUES('E003', 'V013');

INSERT INTO supervises
VALUES('E003', 'V014');

INSERT INTO supervises
VALUES('E003', 'V015');

--E004
INSERT INTO supervises
VALUES('E004', 'V006');
    
INSERT INTO supervises
VALUES('E004', 'V007');

INSERT INTO supervises
VALUES('E004', 'V008');

INSERT INTO supervises
VALUES('E004', 'V009');

--E005
INSERT INTO supervises
VALUES('E005', 'V010');

INSERT INTO supervises
VALUES('E005', 'V011');

INSERT INTO supervises
VALUES('E005', 'V012');

INSERT INTO supervises
VALUES('E005', 'V013');

INSERT INTO supervises
VALUES('E005', 'V014');

--E006
INSERT INTO supervises
VALUES('E006', 'V014');

INSERT INTO supervises
VALUES('E006', 'V015');

----------------------------------------------------------------------------
PROMPT Patron

INSERT INTO Patron
VALUES ('P001', 'Finn', 'Huckleberry', 'Y');

INSERT INTO Patron
VALUES ('P002', 'Gatsby', 'Jay', 'N');

INSERT INTO Patron
VALUES ('P003', 'Karenina', 'Anna', 'Y');

INSERT INTO Patron
VALUES ('P004', 'Bennet', 'Elizabeth', 'N');

INSERT INTO Patron
VALUES ('P005', 'Gray', 'Dorian', 'Y');

INSERT INTO Patron
VALUES ('P006', 'Quixote', 'Don', 'N');

INSERT INTO Patron
VALUES ('P007', 'Kynes', 'Chani', 'Y');

INSERT INTO Patron
VALUES ('P008', 'Belacqua', 'Lyra', 'N');

INSERT INTO Patron
VALUES ('P009', 'Ariza', 'Florentino', 'Y');

INSERT INTO Patron
VALUES ('P010', 'Achebe', 'Okonkwo', 'N');

INSERT INTO Patron
VALUES ('P011', 'Shigekuni', 'Haruki', 'Y');

INSERT INTO Patron
VALUES ('P012', 'Lannister', 'Tyrion', 'N');

INSERT INTO Patron
VALUES ('P013', 'Dent', 'Arthur', 'Y');

INSERT INTO Patron
VALUES ('P014', 'Masur', 'Sam', 'N');

INSERT INTO Patron
VALUES ('P015', 'Laurence', 'William', 'Y');

INSERT INTO Patron
VALUES ('P016', 'Raymonde', 'Kirsten', 'N');

----------------------------------------------------------------------------
PROMPT patron_email_list

--P001
INSERT INTO patron_email_list
VALUES('P001', 'berrysforlife@fakefake.com');

INSERT INTO patron_email_list
VALUES('P001', 'finhucks@fakefake.com');

--P002
INSERT INTO patron_email_list
VALUES('P002', 'bookluver222@notreal.net');

--P003
INSERT INTO patron_email_list
VALUES('P003', 'anneKare@fakeaddress.org');

--P004
INSERT INTO patron_email_list
VALUES('P004', 'minestrone11@fakemail.net');

--P005
INSERT INTO patron_email_list
VALUES('P005', 'picturesarecool@notreal.net');

--P006
INSERT INTO patron_email_list
VALUES('P006', 'coolknight@addreessfake.com');

--P007
INSERT INTO patron_email_list
VALUES('P007', 'kynes1@fake.edu');

--P008
INSERT INTO patron_email_list
VALUES('P008', 'lyralyra@weynonpriory.cy');

--P009
INSERT INTO patron_email_list
VALUES('P009', 'arizabuisness@buinness.org');

--P010
INSERT INTO patron_email_list
VALUES('P010', 'broccolisoup@fakefake.com');

--P011
INSERT INTO patron_email_list
VALUES('P011', 'hkuni99@fake.edu');

INSERT INTO patron_email_list
VALUES('P011', 'strawberrypudding@notreal.net');

--P012
INSERT INTO patron_email_list
VALUES('P012', 'catsareverycool@fake.net');

--P013
INSERT INTO patron_email_list
VALUES('P013', 'arthurlikeshiking@fakefake.com');

--P014
INSERT INTO patron_email_list
VALUES('P014', 'samIam@notarealaddress.org');

INSERT INTO patron_email_list
VALUES('P014', 'smasur7@fake.edu');

--P015
INSERT INTO patron_email_list
VALUES('P015', 'willlauren@notmail.com');

--P016
INSERT INTO patron_email_list
VALUES('P016', 'raymode1@notmail.com');

INSERT INTO patron_email_list
VALUES('P016', 'kirstenr.buisness@buisness.org');

INSERT INTO patron_email_list
VALUES('P016', 'monde200@fakefake.com');

----------------------------------------------------------------------------
PROMPT adoption

INSERT INTO adoption
VALUES('1001-01AA01', '15-MAR-2023', '01AA01', 'E001', 'P001');

INSERT INTO adoption
VALUES('1002-02AA01', '10-APR-2023', '02AA01', 'E004', 'P004');

INSERT INTO adoption
VALUES('1002-02AA02', '02-APR-2023', '02AA02', 'E005', 'P002');

INSERT INTO adoption
VALUES('1003-03AA02', '22-DEC-2023', '03AA02', 'E005', 'P014');

INSERT INTO adoption
VALUES('1003-03AA03', '23-MAY-2024', '03AA03', 'E007', 'P008');

INSERT INTO adoption
VALUES('1005-05AA01', '09-AUG-2023', '05AA01', 'E007', 'P001');

INSERT INTO adoption
VALUES('1008-08AA01', '11-OCT-2023', '08AA01', 'E007', 'P010');

INSERT INTO adoption
VALUES('1009-09AA01', '11-OCT-2023', '09AA01', 'E007', 'P010');

INSERT INTO adoption
VALUES('1009-09AA02', '22-DEC-2023', '09AA02', 'E003', 'P015');

INSERT INTO adoption
VALUES('1010-10AA01', '29-DEC-2023', '10AA01', 'E003', 'P006');

INSERT INTO adoption
VALUES('1011-11AA01', '03-JAN-2024', '11AA01', 'E005', 'P012');

INSERT INTO adoption
VALUES('1012-12AA01', '27-NOV-2023', '12AA01', 'E005', 'P006');

INSERT INTO adoption
VALUES('1014-14AA01', '14-MAY-2024', '14AA01', 'E002', 'P003');

INSERT INTO adoption
VALUES('1014-14AA02', '31-MAY-2024', '14AA02', 'E003', 'P006');

INSERT INTO adoption
VALUES('1015-15AA01', '01-JUL-2024', '15AA01', 'E003', 'P006');

INSERT INTO adoption
VALUES('1012-12AA03', '12-JUL-2024', '12AA03', 'E005', 'P014');

----------------------------------------------------------------------------
PROMPT Purchase_Item

INSERT INTO Purchase_Item
VALUES ('1111111111', 'drink', 3.50);

INSERT INTO Purchase_Item
VALUES ('1111111112', 'drink', 3.00);

INSERT INTO Purchase_Item
VALUES ('1111111113', 'drink', 4.00);

INSERT INTO Purchase_Item
VALUES ('1111111114', 'drink', 3.75);

INSERT INTO Purchase_Item
VALUES ('1111111115', 'drink', 4.25);

INSERT INTO Purchase_Item
VALUES ('1111111116', 'drink', 2.50);

INSERT INTO Purchase_Item
VALUES ('1111111117', 'drink', 2.80);

INSERT INTO Purchase_Item
VALUES ('1111111118', 'drink', 3.50);

INSERT INTO Purchase_Item
VALUES ('1111111119', 'drink', 3.00);

INSERT INTO Purchase_Item
VALUES ('1111111120', 'drink', 4.50);

INSERT INTO Purchase_Item
VALUES ('1111111121', 'drink', 2.80);

INSERT INTO Purchase_Item
VALUES ('1111111122', 'drink', 5.99);

INSERT INTO Purchase_Item
VALUES ('1111111123', 'drink', 2.99);

INSERT INTO Purchase_Item
VALUES ('1111111124', 'drink', 2.99);

INSERT INTO Purchase_Item
VALUES ('1111111125', 'drink', 3.99);

INSERT INTO Purchase_Item
VALUES ('1111111126', 'drink', 3.50);

INSERT INTO Purchase_Item
VALUES ('1111111127', 'drink', 3.50);

INSERT INTO Purchase_Item
VALUES ('1111111128', 'drink', 4.50);

INSERT INTO Purchase_Item
VALUES ('1111111129', 'drink', 4.50);

INSERT INTO Purchase_Item
VALUES ('3111111111', 'pastry', 4.50);

INSERT INTO Purchase_Item
VALUES ('3111111112', 'pastry', 3.75);

INSERT INTO Purchase_Item
VALUES ('3111111113', 'pastry', 3.75);

INSERT INTO Purchase_Item
VALUES ('3111111114', 'pastry', 4.25);

INSERT INTO Purchase_Item
VALUES ('3111111115', 'pastry', 3.50);

INSERT INTO Purchase_Item
VALUES ('3111111116', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111117', 'pastry', 2.99);

INSERT INTO Purchase_Item
VALUES ('3111111118', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111119', 'pastry', 4.99);

INSERT INTO Purchase_Item
VALUES ('3111111120', 'pastry', 4.99);

INSERT INTO Purchase_Item
VALUES ('3111111121', 'pastry', 6.99);

INSERT INTO Purchase_Item
VALUES ('3111111122', 'pastry', 3.99);

INSERT INTO Purchase_Item
VALUES ('3111111123', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111124', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111125', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111126', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111127', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111128', 'pastry', 1.99);

INSERT INTO Purchase_Item
VALUES ('3111111129', 'pastry', 5.99);

INSERT INTO Purchase_Item
VALUES ('3111111130', 'pastry', 5.99);

INSERT INTO Purchase_Item
VALUES ('5111111111', 'book', 15.99);

INSERT INTO Purchase_Item
VALUES ('5111111112', 'book', 12.99);

INSERT INTO Purchase_Item
VALUES ('5111111113', 'book', 9.99);

INSERT INTO Purchase_Item
VALUES ('5111111114', 'book', 10.99);

INSERT INTO Purchase_Item
VALUES ('5111111115', 'book', 14.99);

INSERT INTO Purchase_Item
VALUES ('5111111116', 'book', 13.99);

INSERT INTO Purchase_Item
VALUES ('5111111117', 'book', 16.99);

INSERT INTO Purchase_Item
VALUES ('5111111118', 'book', 15.99);

INSERT INTO Purchase_Item
VALUES ('5111111119', 'book', 11.99);

INSERT INTO Purchase_Item
VALUES ('5111111120', 'book', 12.99);

INSERT INTO Purchase_Item
VALUES ('5111111121', 'book', 18.99);

INSERT INTO Purchase_Item
VALUES ('5111111122', 'book', 10.99);

INSERT INTO Purchase_Item
VALUES ('5111111123', 'book', 13.99);

INSERT INTO Purchase_Item
VALUES ('5111111124', 'book', 14.99);

INSERT INTO Purchase_Item
VALUES ('5111111125', 'book', 13.99);

INSERT INTO Purchase_Item
VALUES ('5111111126', 'book', 11.99);

INSERT INTO Purchase_Item
VALUES ('5111111127', 'book', 9.99);

INSERT INTO Purchase_Item
VALUES ('5111111128', 'book', 14.99);

INSERT INTO Purchase_Item
VALUES ('5111111129', 'book', 10.99);

INSERT INTO Purchase_Item
VALUES ('5111111130', 'book', 9.99);

INSERT INTO Purchase_Item
VALUES ('5111111131', 'book', 10.99);

INSERT INTO Purchase_Item
VALUES ('5111111132', 'book', 18.99);


----------------------------------------------------------------------------
PROMPT Pastry

INSERT INTO Pastry
VALUES ('3111111111', 'Chocolate Croissant', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111112', 'Banana Nut Muffin', 'Y', 'Y', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111113', 'Blueberry Muffin', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111114', 'Cinnamon Roll', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111115', 'Seasonal Scone', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111116', 'Snickerdoodle Cookie', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111117', 'Brownie', 'Y', 'Y', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111118', 'Chocolate Chip Cookie', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111119', 'Seasonal Danish', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111120', 'Vegan Lemon Bars', 'N', 'N', 'N', 'N', 'Y');

INSERT INTO Pastry
VALUES ('3111111121', 'Vegan Flourless Chocolate Tart', 'N', 'N', 'N', 'N', 'Y');

INSERT INTO Pastry
VALUES ('3111111122', 'Vegan Muffins', 'Y', 'N', 'N', 'N', 'Y');

INSERT INTO Pastry
VALUES ('3111111123', 'Chocolate Donut', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111124', 'Maple Bar', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111125', 'Powdered Donut', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111126', 'Jelly-filled Donut', 'Y', 'N', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111127', 'Gluten-free Vegan Donut', 'N', 'N', 'N', 'N', 'Y');

INSERT INTO Pastry
VALUES ('3111111128', 'Fruit-filled Mochi', 'N', 'N', 'N', 'N', 'Y');

INSERT INTO Pastry
VALUES ('3111111129', 'Peanut Butter and Jelly Croissant', 'Y', 'Y', 'Y', 'N', 'N');

INSERT INTO Pastry
VALUES ('3111111130', 'Soy Bacon Parmesan Puffs', 'Y', 'N', 'Y', 'Y', 'N');

----------------------------------------------------------------------------
PROMPT Drink

INSERT INTO Drink
VALUES ('1111111111', 'Espresso', 'hot', 'espresso drink', 'high', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111112', 'Americano', 'hot', 'coffee', 'medium', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111113', 'Latte', 'hot', 'espresso drink', 'medium', 'whole milk', 'N');

INSERT INTO Drink
VALUES ('1111111114', 'Cappuccino', 'hot', 'espresso drink', 'medium', 'whole milk', 'N');

INSERT INTO Drink
VALUES ('1111111115', 'Mocha', 'hot', 'espresso drink', 'high', 'whole milk', 'N');

INSERT INTO Drink
VALUES ('1111111116', 'Hot Brewed Tea', 'hot', 'tea', 'medium', NULL, 'Y');

INSERT INTO Drink
VALUES ('1111111117', 'Iced Brewed Tea', 'cold', 'tea', 'medium', NULL, 'Y');

INSERT INTO Drink
VALUES ('1111111118', 'Matcha Latte', 'hot', 'espresso drink', 'low', 'soy milk', 'N');

INSERT INTO Drink
VALUES ('1111111119', 'Drip Coffee', 'hot', 'coffee', 'medium', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111120', 'Iced Coffee', 'cold', 'coffee', 'high', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111121', 'Hot Chocolate', 'hot', 'other', 'none',
	'whole milk', 'N');

INSERT INTO Drink
VALUES ('1111111122', 'Affogato', 'cold', 'espresso drink',
	'high', 'whole milk', 'N');

INSERT INTO Drink
VALUES ('1111111123', 'Italian Soda', 'cold', 'soft drink', 'none', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111124', 'Sugar-free Italian Soda', 'cold', 
	'soft drink', 'none', NULL, 'Y');

INSERT INTO Drink
VALUES ('1111111125', 'Frappuccino', 'cold', 'espresso drink', 'high', 'whole milk', 'N');

INSERT INTO Drink
VALUES ('1111111126', 'Yerba Mate', 'cold', 'tea', 'high', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111127', 'Cold Brew', 'cold', 'coffee', 'extreme', NULL, 'Y');

INSERT INTO Drink
VALUES ('1111111128', 'Energy Drink Infusion', 'cold', 'other', 'extreme', NULL, 'N');

INSERT INTO Drink
VALUES ('1111111129', 'Sugar-free Energy Drink Infusion', 'cold',
	'other', 'extreme', NULL, 'Y');

----------------------------------------------------------------------------
PROMPT Book

INSERT INTO book
VALUES ('5111111111', 'Uzumaki', 'Ito', 'Junji', 8);

INSERT INTO book
VALUES ('5111111112', 'Dune', 'Herbert', 'Frank', 10);

INSERT INTO book
VALUES ('5111111113', 'Pride and Prejudice', 'Austen', 'Jane', 15);

INSERT INTO book
VALUES ('5111111114', '1984', 'Orwell', 'George', 20);

INSERT INTO book
VALUES ('5111111115', 'To Kill a Mockingbird', 'Lee', 'Harper', 25);

INSERT INTO book
VALUES ('5111111116', 'The Song of Achilles', 'Miller', 'Madeline', 12);

INSERT INTO book
VALUES ('5111111117', 'Atomic Habits', 'Clear', 'James', 18);

INSERT INTO book
VALUES ('5111111118', 'The Subtle Art of Not Giving a F*ck', 'Manson', 'Mark', 22);

INSERT INTO book
VALUES ('5111111119', 'The Alchemist', 'Coelho', 'Paulo', 17);

INSERT INTO book
VALUES ('5111111120', 'I Know Why the Caged Bird Sings', 'Angelou', 'Maya', 10);

INSERT INTO book
VALUES ('5111111121', '1Q84', 'Murakami', 'Haruki', 8);

INSERT INTO book
VALUES ('5111111122', 'The Great Gatsby', 'Fitzgerald', 'F. Scott', 15);

INSERT INTO book
VALUES ('5111111123', 'Oryx and Crake', 'Atwood', 'Margaret', 12);

INSERT INTO book
VALUES ('5111111124', 'The 5 Love Languages', 'Chapman', 'Gary', 20);

INSERT INTO book
VALUES ('5111111125', 'No Country for Old Men', 'McCarthy', 'Cormac', 10);

INSERT INTO book
VALUES ('5111111126', 'Little Women', 'Alcott', 'Louisa May', 18);

INSERT INTO book
VALUES ('5111111127', 'The Giver', 'Lowry', 'Lois', 16);

INSERT INTO book
VALUES ('5111111128', 'The Night Circus', 'Morgenstern', 'Erin', 12);

INSERT INTO book
VALUES ('5111111129', 'The Catcher in the Rye', 'Salinger', 'J.D.', 14);

INSERT INTO book
VALUES ('5111111130', 'Fahrenheit 451', 'Bradbury', 'Ray', 6);

INSERT INTO book
VALUES ('5111111131', 'No Longer Human', 'Dazai', 'Osamu', 2);

INSERT INTO book
VALUES ('5111111132', 'No Longer Human', 'Ito', 'Junji', 5);

----------------------------------------------------------------------------
PROMPT Book_Genre
    
--11
INSERT INTO Book_genre
VALUES ('5111111111', 'Horror');

INSERT INTO Book_genre
VALUES ('5111111111', 'Graphic_novel');

--12
INSERT INTO Book_genre
VALUES ('5111111112', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111112', 'Sci_Fi');

--13
INSERT INTO Book_genre
VALUES ('5111111113', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111113', 'Romance');

--14
INSERT INTO Book_genre
VALUES ('5111111114', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111114', 'Dystopian');

--15
INSERT INTO Book_genre
VALUES ('5111111115', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111115', 'Historical_fiction');

--16
INSERT INTO Book_genre
VALUES ('5111111116', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111116', 'Historical_fiction');

--17
INSERT INTO Book_genre
VALUES ('5111111117', 'Non-Fiction');


INSERT INTO Book_genre
VALUES ('5111111117', 'Self_help');

--18
INSERT INTO Book_genre
VALUES ('5111111118', 'Non-Fiction');

INSERT INTO Book_genre
VALUES ('5111111118', 'Self_help');

--19
INSERT INTO Book_genre
VALUES ('5111111119', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111119', 'Fantasy');

--20
INSERT INTO Book_genre
VALUES ('5111111120', 'Non-Fiction');

INSERT INTO Book_genre
VALUES ('5111111120', 'Biography_Memoir');

--21
INSERT INTO Book_genre
VALUES ('5111111121', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111121', 'Sci_Fi');

--22
INSERT INTO Book_genre
VALUES ('5111111122', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111122', 'Romance');

--23
INSERT INTO Book_genre
VALUES ('5111111123', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111123', 'Dystopian');

--24
INSERT INTO Book_genre
VALUES ('5111111124', 'Non-Fiction');

INSERT INTO Book_genre
VALUES ('5111111124', 'Self_help');

--25
INSERT INTO Book_genre
VALUES ('5111111125', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111125', 'Thriller');

--26
INSERT INTO Book_genre
VALUES ('5111111126', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111126', 'Children');

--27
INSERT INTO Book_genre
VALUES ('5111111127', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111127', 'YA');

INSERT INTO Book_genre
VALUES ('5111111127', 'Dystopian');

--28
INSERT INTO Book_genre
VALUES ('5111111128', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111128', 'Fantasy');

--29
INSERT INTO Book_genre
VALUES ('5111111129', 'Fiction');

INSERT INTO Book_genre
VALUES ('5111111129', 'YA');

--30
INSERT INTO Book_genre
VALUES ('5111111130', 'Dystopian');

INSERT INTO Book_genre
VALUES ('5111111130', 'Fiction');

--31
INSERT INTO Book_genre
VALUES ('5111111131', 'Semi_Autobiographical');

--32
INSERT INTO Book_genre
VALUES ('5111111132', 'Horror');

INSERT INTO Book_genre
VALUES ('5111111132', 'Graphic_novel');

INSERT INTO Book_genre
VALUES ('5111111132', 'Semi_Autobiographical');

----------------------------------------------------------------------------
PROMPT Purchase

INSERT INTO Purchase
VALUES ('P000000001', 7.00,
	TO_TIMESTAMP('03-NOV-2024 13:06:25', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P001');

INSERT INTO Purchase
VALUES ('P000000002', 4.99,
	TO_TIMESTAMP('08-NOV-2024 12:45:00', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P002');

INSERT INTO Purchase
VALUES ('P000000003', 6.99,
	TO_TIMESTAMP('12-NOV-2024 15:17:49', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P003');

INSERT INTO Purchase
VALUES ('P000000004', 5.74,
	TO_TIMESTAMP('06-NOV-2024 18:00:41', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P004');

INSERT INTO Purchase
VALUES ('P000000005', 9.24,
	TO_TIMESTAMP('10-NOV-2024 14:16:41', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P005');

INSERT INTO Purchase
VALUES ('P000000006', 7.49,
	TO_TIMESTAMP('07-NOV-2024 14:58:21', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P006');

INSERT INTO Purchase
VALUES ('P000000007', 9.79,
	TO_TIMESTAMP('04-NOV-2024 12:33:53', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P007');

INSERT INTO Purchase
VALUES ('P000000008', 3.50,
	TO_TIMESTAMP('18-NOV-2024 18:00:31', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P008');

INSERT INTO Purchase
VALUES ('P000000009', 10.50,
	TO_TIMESTAMP('11-NOV-2024 17:44:16', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P009');

INSERT INTO Purchase
VALUES ('P000000010', 8.00,
	TO_TIMESTAMP('13-NOV-2024 15:03:48', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P010');

INSERT INTO Purchase
VALUES ('P000000011', 9.74,
	TO_TIMESTAMP('14-NOV-2024 14:04:04', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P011');

INSERT INTO Purchase
VALUES ('P000000012', 8.29,
	TO_TIMESTAMP('05-NOV-2024 17:00:04', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P012');

INSERT INTO Purchase
VALUES ('P000000013', 15.98,
	TO_TIMESTAMP('17-NOV-2024 14:35:22', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P013');

INSERT INTO Purchase
VALUES ('P000000014', 11.29,
	TO_TIMESTAMP('21-NOV-2024 10:53:37', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P014');

INSERT INTO Purchase
VALUES ('P000000015', 13.99,
	TO_TIMESTAMP('19-NOV-2024 10:06:09', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P015');

INSERT INTO Purchase
VALUES ('P000000016', 11.99,
	TO_TIMESTAMP('09-NOV-2024 17:35:00', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P016');

INSERT INTO Purchase
VALUES ('P000000017', 8.80,
	TO_TIMESTAMP('16-NOV-2024 16:03:35', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P005');

INSERT INTO Purchase
VALUES ('P000000018', 10.75,
	TO_TIMESTAMP('23-NOV-2024 17:40:00', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P001');

INSERT INTO Purchase
VALUES ('P000000019', 15.99,
	TO_TIMESTAMP('20-NOV-2024 13:02:44', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P013');

INSERT INTO Purchase
VALUES ('P000000020', 12.99,
	TO_TIMESTAMP('24-NOV-2024 14:54:31', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P005');

INSERT INTO Purchase
VALUES ('P000000021', 9.99,
	TO_TIMESTAMP('25-NOV-2024 12:05:46', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P013');

INSERT INTO Purchase
VALUES ('P000000022', 10.99,
	TO_TIMESTAMP('22-NOV-2024 14:08:08', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P003');

INSERT INTO Purchase
VALUES ('P000000023', 14.99,
	TO_TIMESTAMP('28-NOV-2024 13:43:14', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P001');

INSERT INTO Purchase
VALUES ('P000000024', 13.99,
	TO_TIMESTAMP('27-NOV-2024 14:50:26', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P005');

INSERT INTO Purchase
VALUES ('P000000025', 16.99,
	TO_TIMESTAMP('29-NOV-2024 13:35:27', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P013');

INSERT INTO Purchase
VALUES ('P000000026', 55.96,
	TO_TIMESTAMP('30-NOV-2024 17:07:03', 'DD-MON-YYYY HH24:MI:SS'), 'E002', 'P001');

INSERT INTO Purchase
VALUES ('P000000027', 26.49,
	TO_TIMESTAMP('09-NOV-2024 18:00:00', 'DD-MON-YYYY HH24:MI:SS'), 'E009', 'P002');

INSERT INTO Purchase
VALUES ('P000000028', 17.98,
	TO_TIMESTAMP('14-NOV-2024 11:38:07', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P013');

---------------------------------------------------------------------------------------------
PROMPT Purchase_item_quantity

--1
INSERT INTO Purchase_item_quantity
VALUES ('P000000001', '1111111111', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000001', '3111111115', 1);

--2
INSERT INTO Purchase_item_quantity
VALUES ('P000000002', '1111111112', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000002', '3111111116', 1);

--3
INSERT INTO Purchase_item_quantity
VALUES ('P000000003', '1111111113', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000003', '3111111117', 1);

--4
INSERT INTO Purchase_item_quantity
VALUES ('P000000004', '1111111114', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000004', '3111111118', 1);

--5
INSERT INTO Purchase_item_quantity
VALUES ('P000000005', '1111111115', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000005', '3111111119', 1);

--6
INSERT INTO Purchase_item_quantity
VALUES ('P000000006', '1111111116', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000006', '3111111120', 1);

--7
INSERT INTO Purchase_item_quantity
VALUES ('P000000007', '1111111117', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000007', '3111111121', 1);

--8
INSERT INTO Purchase_item_quantity
VALUES ('P000000008', '1111111118', 1);

--9
INSERT INTO Purchase_item_quantity
VALUES ('P000000009', '1111111111', 2);

INSERT INTO Purchase_item_quantity
VALUES ('P000000009', '3111111115', 1);

--10
INSERT INTO Purchase_item_quantity
VALUES ('P000000010', '1111111113', 2);

--11
INSERT INTO Purchase_item_quantity
VALUES ('P000000011', '1111111115', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000011', '1111111116', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000011', '3111111117', 1);

--12
INSERT INTO Purchase_item_quantity
VALUES ('P000000012', '1111111117', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000012', '1111111118', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000012', '3111111118', 1);

--13
INSERT INTO Purchase_item_quantity
VALUES ('P000000013', '1111111119', 2);

INSERT INTO Purchase_item_quantity
VALUES ('P000000013', '3111111119', 2);

--14
INSERT INTO Purchase_item_quantity
VALUES ('P000000014', '1111111121', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000014', '1111111111', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000014', '3111111120', 1);

--15
INSERT INTO Purchase_item_quantity
VALUES ('P000000015', '1111111112', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000015', '1111111113', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000015', '3111111121', 1);

--16
INSERT INTO Purchase_item_quantity
VALUES ('P000000016', '1111111114', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000016', '1111111115', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000016', '3111111122', 1);

--17
INSERT INTO Purchase_item_quantity
VALUES ('P000000017', '1111111116', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000017', '1111111117', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000017', '3111111115', 1);

--18
INSERT INTO Purchase_item_quantity
VALUES ('P000000018', '1111111118', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000018', '1111111119', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000018', '3111111114', 1);

--19
INSERT INTO Purchase_item_quantity
VALUES ('P000000019', '5111111111', 1);

--20
INSERT INTO Purchase_item_quantity
VALUES ('P000000020', '5111111112', 1);

--21
INSERT INTO Purchase_item_quantity
VALUES ('P000000021', '5111111113', 1);

--22
INSERT INTO Purchase_item_quantity
VALUES ('P000000022', '5111111114', 1);

--23
INSERT INTO Purchase_item_quantity
VALUES ('P000000023', '5111111115', 1);

--24
INSERT INTO Purchase_item_quantity
VALUES ('P000000024', '5111111116', 1);

--25
INSERT INTO Purchase_item_quantity
VALUES ('P000000025', '5111111117', 1);

--26
INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '1111111111', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '1111111112', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '1111111113', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '1111111114', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '1111111115', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '3111111115', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '3111111116', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '3111111117', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '5111111111', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000026', '5111111112', 1);

--27
INSERT INTO Purchase_item_quantity
VALUES ('P000000027', '1111111111', 2);

INSERT INTO Purchase_item_quantity
VALUES ('P000000027', '3111111115', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000027', '5111111111', 1);

--28
INSERT INTO Purchase_item_quantity
VALUES ('P000000028', '1111111112', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000028', '3111111116', 1);

INSERT INTO Purchase_item_quantity
VALUES ('P000000028', '5111111112', 1);

----------------------------------------------------------------------------
PROMPT Event

INSERT INTO Event
VALUES ('222221', 'Book Signing of Oryx and Crake with Margaret Atwood',
    	TO_DATE('15-JAN-2024 18:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('15-JAN-2024 20:00', 'DD-MON-YYYY HH24:MI'),
    	15.00, 'E005', 'Y', 'N', 'N');

INSERT INTO Event
VALUES ('222222', 'Book Signing of The 5 Love Languages with Gary Chapman',
    	TO_DATE('20-FEB-2024 18:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('20-FEB-2024 20:00', 'DD-MON-YYYY HH24:MI'),
    	15.00, 'E006', 'Y', 'N', 'N');

INSERT INTO Event
VALUES ('222223', 'Book Signing of The Night Circus with Erin Morgenstern',
    	TO_DATE('10-MAR-2024 18:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('10-MAR-2024 20:00', 'DD-MON-YYYY HH24:MI'),
    	15.00, 'E008', 'Y', 'N', 'N');

INSERT INTO Event
VALUES ('222224', 'Book Signing Fundraiser The Subtle Art of Not Giving a F*ck with Mark Manson',
    	TO_DATE('25-APR-2024 18:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('25-APR-2024 21:00', 'DD-MON-YYYY HH24:MI'),
    	25.00, 'E013', 'Y', 'Y', 'N');

INSERT INTO Event
VALUES ('222225', 'Book Signing Fundraiser of No Longer Human with Junji Ito',
    	TO_DATE('12-MAY-2024 18:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('12-MAY-2024 21:00', 'DD-MON-YYYY HH24:MI'),
    	30.00, 'E015', 'Y', 'Y', 'N');

INSERT INTO Event
VALUES ('222226', 'Leash Training Your Cat',
    	TO_DATE('02-JUN-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('02-JUN-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	10.00, 'E005', 'N', 'N', 'Y');

INSERT INTO Event
VALUES ('222227', 'Basic Tricks for Your Cat',
    	TO_DATE('09-JUN-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('09-JUN-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	10.00, 'E006', 'N', 'N', 'Y');

INSERT INTO Event
VALUES ('222228', 'Basic Training For Your Kitten',
    	TO_DATE('16-JUN-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('16-JUN-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	10.00, 'E008', 'N', 'N', 'Y');

INSERT INTO Event
VALUES ('222229', 'Leash Training Your Cat',
    	TO_DATE('23-JUN-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('23-JUN-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	10.00, 'E013', 'N', 'N', 'Y');

INSERT INTO Event
VALUES ('222230', 'Basic Tricks for Your Cat',
    	TO_DATE('30-JUN-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('30-JUN-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	10.00, 'E015', 'N', 'N', 'Y');

INSERT INTO Event
VALUES ('222231', 'Meowgical Winter Fundraiser',
    	TO_DATE('20-DEC-2024 14:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('20-DEC-2024 18:00', 'DD-MON-YYYY HH24:MI'),
    	20.00, 'E005', 'N', 'Y', 'N');

INSERT INTO Event
VALUES ('222232', 'Purrfect Valentine Fundraiser',
    	TO_DATE('14-FEB-2024 16:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('14-FEB-2024 19:00', 'DD-MON-YYYY HH24:MI'),
    	25.00, 'E006', 'N', 'Y', 'N');

INSERT INTO Event
VALUES ('222233', 'Catsgiving Gala',
    	TO_DATE('27-NOV-2024 16:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('27-NOV-2024 19:00', 'DD-MON-YYYY HH24:MI'),
    	30.00, 'E013', 'N', 'Y', 'N');

INSERT INTO Event
VALUES ('222234', 'Shelter Support Night',
    	TO_DATE('15-JUL-2024 17:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('15-JUL-2024 21:00', 'DD-MON-YYYY HH24:MI'),
    	20.00, 'E015', 'N', 'Y', 'N');

INSERT INTO Event
VALUES ('222235', 'Adopt-A-Cat Fundraiser',
    	TO_DATE('12-AUG-2024 16:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('12-AUG-2024 20:00', 'DD-MON-YYYY HH24:MI'),
    	25.00, 'E008', 'N', 'Y', 'N');

INSERT INTO Event
VALUES ('222236', 'Little Women Read Along Fundraiser',
	    TO_DATE('18-AUG-2024 9:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('18-AUG-2024 15:00', 'DD-MON-YYYY HH24:MI'),
    	15.00, 'E003', 'Y', 'Y', 'N');

INSERT INTO Event
VALUES ('222237', 'Giving Felines Homes - Book Fundraiser',
        TO_DATE('30-AUG-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('30-AUG-2024 15:00', 'DD-MON-YYYY HH24:MI'),
    	16.00, 'E003', 'Y', 'Y', 'N');

INSERT INTO Event
VALUES ('222238', 'The Great Catsby - Socialize Your Cat!',
	    TO_DATE('30-AUG-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('30-AUG-2024 15:00', 'DD-MON-YYYY HH24:MI'),
    	18.00, 'E003', 'Y', 'N', 'Y');


INSERT INTO Event
VALUES ('222239', 'To Catch a Cat - Book Fundraiser and Class',
	    TO_DATE('01-SEP-2024 11:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('01-SEP-2024 16:00', 'DD-MON-YYYY HH24:MI'),
    	18.00, 'E002', 'Y', 'Y', 'Y');

INSERT INTO Event
VALUES ('222240', 'Alchemy and Your Cat',
	    TO_DATE('10-SEP-2024 8:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('10-SEP-2024 10:00', 'DD-MON-YYYY HH24:MI'),
    	11.00, 'E003', 'Y', 'N', 'Y');

INSERT INTO Event
VALUES ('222241', 'The Subtle Art of Entertaining Your Cat',
	    TO_DATE('19-SEP-2024 9:30', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('19-SEP-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	11.00, 'E003', 'Y', 'N', 'Y');

INSERT INTO Event
VALUES ('222242', 'Dune Fundraiser and Signing',
	    TO_DATE('25-SEP-2024 11:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('25-SEP-2024 13:00', 'DD-MON-YYYY HH24:MI'),
    	20.00, 'E003', 'Y', 'Y', 'N');

INSERT INTO Event
VALUES ('222243', 'Atomic Habits of Your Cat',
	    TO_DATE('26-SEP-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('26-SEP-2024 16:00', 'DD-MON-YYYY HH24:MI'),
    	14.00, 'E004', 'Y', 'N', 'Y');

INSERT INTO Event
VALUES ('222244', 'Fahren-Cat - Fundraiser and Cat Temperaments',
	    TO_DATE('30-SEP-2024 9:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('30-SEP-2024 13:00', 'DD-MON-YYYY HH24:MI'),
    	14.00, 'E009', 'Y', 'Y', 'Y');

INSERT INTO Event
VALUES ('222245', 'The Song of Your Cat - What that Meow Means',
	    TO_DATE('06-OCT-2024 7:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('06-OCT-2024 11:00', 'DD-MON-YYYY HH24:MI'),
    	25.00, 'E010', 'Y', 'N', 'Y');


INSERT INTO EVENT
VALUES('222246', 'Dog Exposure for Cats and Fundraiser',
	    TO_DATE('07-OCT-2024 7:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('07-OCT-2024 15:00', 'DD-MON-YYYY HH24:MI'),
    	15.00, 'E010', 'N', 'Y', 'Y');

INSERT INTO EVENT
VALUES('222247', 'Raising Kittens and Adopt-A-Cat Fundraiser',
	    TO_DATE('11-OCT-2024 8:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('11-OCT-2024 11:00', 'DD-MON-YYYY HH24:MI'),
    	26.00, 'E010', 'N', 'Y', 'Y');

INSERT INTO EVENT
VALUES('222248', 'Homes for Felines Fundraiser',
	    TO_DATE('12-OCT-2024 9:00', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('12-OCT-2024 13:00', 'DD-MON-YYYY HH24:MI'),
    	17.00, 'E010', 'N', 'Y', 'N');

INSERT INTO EVENT
VALUES('222249', 'Litter Training Your Cat',
	    TO_DATE('15-OCT-2024 9:45', 'DD-MON-YYYY HH24:MI'),
    	TO_DATE('15-OCT-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    	5.00, 'E010', 'N', 'N', 'Y');

----------------------------------------------------------------------------
PROMPT Book_signing

INSERT INTO Book_signing
VALUES (222221, '5111111123');

INSERT INTO Book_signing
VALUES (222222, '5111111124');

INSERT INTO Book_signing
VALUES (222223, '5111111128');

INSERT INTO Book_signing
VALUES (222224, '5111111118');

INSERT INTO Book_signing
VALUES (222225, '5111111132');

INSERT INTO Book_signing
VALUES(222236, '5111111126');

INSERT INTO Book_signing
VALUES(222237, '5111111127');

INSERT INTO Book_signing
VALUES(222238, '5111111122');

INSERT INTO Book_signing
VALUES(222239, '5111111129');

INSERT INTO Book_signing
VALUES(222240, '5111111119');

INSERT INTO Book_signing
VALUES(222241, '5111111118');

INSERT INTO Book_signing
VALUES(222242, '5111111112');

INSERT INTO Book_signing
VALUES(222243, '5111111117');

INSERT INTO Book_signing
VALUES(222244, '5111111130');

INSERT INTO Book_signing
VALUES(222245, '5111111116');

----------------------------------------------------------------------------
PROMPT Fundraiser

INSERT INTO Fundraiser
VALUES (222224, 825, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222225, 2110, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222231, 40250, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222232, 950, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222233, 32308, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222234, 25200, 'San Francisco SPCA');

INSERT INTO Fundraiser
VALUES (222235, 980, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222236, 7003, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222237, 2046, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222239, 12955, 'San Francisco SPCA');

INSERT INTO Fundraiser
VALUES (222242, 900, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222244, 655, 'Pages and Paws Cafe');

INSERT INTO Fundraiser
VALUES (222246, 1011, 'San Francisco SPCA');

INSERT INTO Fundraiser
VALUES (222247, 934, 'San Francisco SPCA');

INSERT INTO Fundraiser
VALUES (222248, 3000, 'San Francisco SPCA');

----------------------------------------------------------------------------
PROMPT Cat_training_class

INSERT INTO Cat_training_class
VALUES (222226, 'Patel', 'Arjun');

INSERT INTO Cat_training_class
VALUES (222229, 'Patel', 'Arjun');

INSERT INTO Cat_training_class
VALUES (222227, 'Tran', 'Amy');

INSERT INTO Cat_training_class
VALUES (222230, 'Tran', 'Amy');

INSERT INTO Cat_training_class
VALUES (222228, 'Brown', 'Sophia');

INSERT INTO Cat_training_class
VALUES(222238, 'Brown', 'Sophia');

INSERT INTO Cat_training_class
VALUES(222239, 'Stark', 'Tony');

INSERT INTO Cat_training_class
VALUES(222240, 'Stark', 'Tony');

INSERT INTO Cat_training_class
VALUES(222241, 'Stark', 'Tony');

INSERT INTO Cat_training_class
VALUES(222243, 'Rhee', 'Glenn');

INSERT INTO Cat_training_class
VALUES(222244, 'Rhee', 'Glenn');

INSERT INTO Cat_training_class
VALUES(222245, 'Rhee', 'Glenn');

INSERT INTO Cat_training_class
VALUES(222246, 'Greene', 'Hershel');

INSERT INTO Cat_training_class
VALUES(222247, 'Greene', 'Hershel');

INSERT INTO Cat_training_class
VALUES(222249, 'Horvath', 'Dale');


