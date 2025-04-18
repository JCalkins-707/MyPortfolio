/*
   Kiko Barr, Julia Calkins, McKenna Kindle
   CS 325 - Fall 2024
   Last modified: 10-Dec-2024
*/

spool 325query-results.txt

------------------------------------------
prompt ===================================
prompt ~~~Query 1~~~
prompt Displays the books for sale at the cafe at their
prompt base price and at a 20% off holiday sale price

SET LINESIZE 100

COL book_title HEADING 'Book Title' FORMAT A35
COL author HEADING 'Author Name' FORMAT A15
COL item_base_price HEADING 'Normal Price' FORMAT $99.99
COL holiday_sale HEADING 'Holiday Sale Price' FORMAT $99.99

SELECT book_title, author_lname || ', ' || 
	SUBSTR(author_fname, 1, 1) || '.' AS author, 
	item_base_price, item_base_price * 0.8 
	AS holiday_sale
FROM book b, purchase_item p
WHERE b.item_code = p.item_code
ORDER BY holiday_sale;

SET LINESIZE 80

CLEAR COLUMNS

---------------------------------------------
prompt
prompt ======================================
prompt ~~~Query 2~~~
prompt Displays each book genre, how many books are
prompt tagged in that genre, and the average book
prompt price for each genre.

SET PAGESIZE 99

COL num_books HEADING 'Number of Books' FORMAT 99
COL avg_price HEADING 'Average Price' FORMAT $99.99

SELECT genre, COUNT(book_code) AS num_books,
	AVG(item_base_price) AS avg_price
FROM book_genre bg, purchase_item p
WHERE bg.book_code = p.item_code
	AND item_type = 'book'
GROUP BY genre
ORDER BY num_books desc;

SET PAGESIZE 14

CLEAR COLUMNS

-------------------------------------------------
prompt
prompt ==========================================
prompt ~~~Query 3~~~
prompt Shows the average purchase amount for each
prompt patron who is a loyalty member and has
prompt adopted a cat.

COL avg_purchase FORMAT $999.99

SELECT pa.patron_id, AVG(total_cost) AS avg_purchase
FROM purchase pu
     JOIN patron pa ON (pu.patron_id = pa.patron_id)
WHERE pa.patron_id IN (SELECT pa.patron_id
		       FROM patron
		       WHERE is_loyalty_member = 'Y')
      AND EXISTS (SELECT 'b'
		  FROM adoption a
		  WHERE a.adopted_by = pa.patron_id)
GROUP BY pa.patron_id
ORDER BY avg_purchase DESC;

CLEAR COLUMNS

-------------------------------------------------
prompt
prompt ==========================================
prompt ~~~Query 4~~~
prompt This query returns the first and last names
prompt and emails of loyalty member patrons. This
prompt is useful for loyalty member propotional
prompt email offers and coupons. 

SET PAGESIZE 99

COL patron_lname HEADING 'Last Name' FORMAT A15
COL patron_fname HEADING 'First Name' FORMAT A15
COL patron_email HEADING 'Email' FORMAT A30

(SELECT patron_lname, patron_fname, patron_email
 FROM patron p, patron_email_list pel
 WHERE p.patron_id = pel.patron_id)
MINUS
(SELECT patron_lname, patron_fname, patron_email
 FROM patron p, patron_email_list pel
 WHERE p.patron_id = pel.patron_id
       AND is_loyalty_member IN ('N'))
ORDER BY patron_lname desc;

SET PAGESIZE 14

CLEAR COLUMNS

-------------------------------------------------
prompt
prompt ==========================================
prompt ~~~Query 5~~~
prompt This query prompts the user to enter the name
prompt of a cat. It will return the associated cat info,
prompt and adoption info of the cat(s) with that name. 

SET LINESIZE 100

COL c.cat_id HEADING 'Cat ID' FORMAT A6
COL cat_name HEADING 'Cat Name' FORMAT A10
COL cat_age HEADING 'Age' FORMAT 9.9
COL cat_sex HEADING 'S' FORMAT A1
COL cat_breed HEADING 'Breed' FORMAT A17
COL date_acquired HEADING 'Date Acquired' FORMAT A13
COL shelter_id HEADING 'Shelter ID' FORMAT A10
COL is_adopted HEADING 'Adopted?' FORMAT A8

BREAK ON cat_id ON cat_name ON cat_age ON cat_sex -
ON date_acquired ON shelter_id ON is_adopted

WITH extended_cat_view AS (
     SELECT
	 c.cat_id, cat_name, cat_age, cat_sex, cat_breed,
	 date_acquired,
	 shelter_id,
	 CASE
	     WHEN EXISTS (SELECT 'b'
			  FROM adoption a
			  WHERE c.cat_id = a.cat_id)
		  THEN 'Y'
	     ELSE 'N'
	 END AS is_adopted
     FROM cat c, cat_breed cb
     WHERE c.cat_id = cb.cat_id
)
SELECT *
FROM extended_cat_view
WHERE cat_name = '&Cat_Name'
ORDER BY cat_id;

SET LINESIZE 80

CLEAR BREAKS
CLEAR COLUMNS

------------------------------------------------
prompt
prompt =========================================
prompt ~~~Query 6~~~
prompt This creates a view of the cats at
prompt the Cafe that have not yet been adopted.

COL cat_name FORMAT A12
COL cat_age FORMAT 9.9
COL cat_sex HEADING 'S' FORMAT A1
COL date_acquired FORMAT a13
COL shelter_id FORMAT A10

DROP VIEW unadopted_cats;

CREATE VIEW unadopted_cats AS
    SELECT *
    FROM cat c
    WHERE NOT EXISTS (SELECT 'b'
		      FROM adoption a
		      WHERE c.cat_id = a.cat_id);

SELECT * 
FROM unadopted_cats;

CLEAR COLUMNS

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 7~~~
prompt Shows the average number of cats a volunteer
prompt looks after based on the area code of
prompt their phone number.

COL avg_num_cats FORMAT 9.999

SELECT SUBSTR(vol_phone, 1, 3) area_code,
       AVG((SELECT COUNT(cat_id)
	    FROM cat_caretaker c
	    WHERE c.vol_id = v.vol_id)) avg_num_cats
FROM volunteer v
GROUP BY SUBSTR(vol_phone, 1, 3)
ORDER BY avg_num_cats DESC;

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 8~~~
prompt Answers the business question: which pastry
prompt and drink items were not sold in the
prompt month of November?

COL item_base_price FORMAT $99.99
COL item_name FORMAT A25 WORD_WRAPPED

CREATE OR REPLACE VIEW sold_items AS
(SELECT pi.item_code, pastry_name AS item_name
 FROM purchase_item pi
 	  JOIN pastry ON pi.item_code = pastry.item_code)
UNION
(SELECT pi.item_code, pastry_name AS item_name
 FROM purchase_item pi
 	  JOIN book on pi.item_code = book.item_code)
UNION
(SELECT pi.item_code, drink_name AS item_name
 FROM purchase_item pi
 	   JOIN drink ON (pi.item_code = drink.item_code))

BREAK ON item_type SKIP 1
SET PAGESIZE 30

SELECT pi.item_code, si.item_name, pi.item_type, pi.item_base_price
FROM purchase_item pi
	   JOIN sold_items si ON si.item_code = pi.item_code
WHERE NOT EXISTS (SELECT 'a'
		  FROM purchase_item_quantity piq
		  WHERE pi.item_code = piq.item_code)
      AND pi.item_code BETWEEN '1000000000' AND '4999999999'
ORDER BY pi.item_type;

CLEAR BREAKS
CLEAR COLUMNS
SET PAGESIZE 14

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 9~~~
prompt This query returns the patrons with the
prompt above average number of purchases.

SELECT patron_id, COUNT(purchase_id) AS purchase_count
FROM purchase
GROUP BY patron_id
HAVING COUNT(purchase_id) > (SELECT AVG(COUNT(purchase_id))
			     FROM purchase
			     GROUP BY patron_id)
ORDER BY purchase_count DESC;


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 10~~~
prompt Shows the employees with above average
prompt wages who are also event managers.

COL empl_lname HEADING 'Last Name' FORMAT A15
COL empl_wage HEADING '$ Per Hour' FORMAT $99.99

(SELECT empl_id, empl_lname, empl_wage
 FROM employee
 WHERE empl_wage > (SELECT AVG(empl_wage)
		    FROM employee))
INTERSECT
(SELECT empl_id, empl_lname, empl_wage
 FROM employee
 WHERE empl_id IN (SELECT manager_id
		   FROM event
		   WHERE event.manager_id = employee.empl_id))
ORDER BY empl_wage;

CLEAR COLUMNS


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 11~~~
prompt The cafe wants to create an email list for upcoming
prompt events that includes patrons, volunteers, and
prompt employees. The results should be distinct.

COL Last_Name FORMAT A11
COL First_Name LIKE Last_Name
COL Email FORMAT A35

BREAK ON Last_Name ON First_Name SKIP 1

(SELECT vol_lname AS Last_Name, vol_fname AS First_Name,
	vol_email AS Email
 FROM volunteer)
UNION
(SELECT empl_lname AS Last_Name, empl_fname AS First_Name,
 	empl_email AS Email
 FROM employee)
UNION
(SELECT patron_lname AS Last_Name, patron_fname AS First_Name,
	patron_email AS Email
 FROM patron p, patron_email_list pel
 WHERE p.patron_id = pel.patron_id)
ORDER BY last_name;

CLEAR BREAKS
CLEAR COLUMNS

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 12~~~
prompt A patron said that they recently played with a 
prompt cat that they really liked, but they cannot
prompt remember its name. They think it ended with
prompt "Tart". This query searches the
prompt database for the cat.

SELECT cat_id, cat_name AS "Possible Matches"
FROM cat c
WHERE cat_name LIKE '%tart'
      AND NOT EXISTS (SELECT 'b'
		      FROM adoption a
		      WHERE a.cat_id = c.cat_id
			    AND a.adopt_date IS NOT NULL);

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 13~~~
prompt Answers the business question:
prompt What is the cumulative amount spent by each
prompt patron on purchases?

COL total_spending FORMAT $999.99

SELECT pat.patron_id, SUM(total_cost) AS total_spending
FROM purchase pur
     JOIN patron pat ON (pur.patron_id = pat.patron_id)
GROUP BY pat.patron_id
ORDER BY total_spending DESC;

CLEAR COLUMNS

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 14~~~
prompt Answers the business question:
prompt What items were sold most at the cafe?
prompt Shows top 5 best-selling items. 

COL item_name FORMAT A25 word_wrapped
SET PAGESIZE 60

DROP VIEW sold_items;

CREATE VIEW sold_items AS
    (SELECT pi.item_code, pastry_name AS Item_Name
     FROM purchase_item pi
          JOIN pastry pa ON (pi.item_code = pa.item_code))
    UNION
    (SELECT pi.item_code, book_title AS Item_Name
     FROM purchase_item pi
          JOIN book b ON (pi.item_code = b.item_code)) 
    UNION
    (SELECT pi.item_code, drink_name AS Item_Name
     FROM purchase_item pi
          JOIN drink d ON (pi.item_code = d.item_code));

SELECT si.item_code, si.item_name, SUM(quantity_purchased)
       AS total_quantity_purchased
FROM sold_items si
     JOIN purchase_item_quantity piq ON (piq.item_code = si.item_code)
GROUP BY si.item_code, si.item_name
ORDER BY total_quantity_purchased DESC, si.item_code
FETCH first 5 rows with ties;

CLEAR COLUMNS
SET PAGESIZE 14

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 15~~~
prompt A query that displays the top 3 fundraisers that
prompt raised the most money, displaying the event name,
prompt group affiliate, total amount raised, and the last
prompt name of the employee overseeing it.

COL event_name HEADING 'Event Name' FORMAT A30
COL affiliated_group HEADING 'Affiliate' FORMAT a20
COL amount_raised HEADING 'Amt Raised' FORMAT $99,999
COL empl_lname HEADING 'Manager L Name' FORMAT A15

SELECT event_name, affiliated_group, amount_raised, empl_lname
FROM (SELECT event_name, affiliated_group, amount_raised, empl_lname
      FROM event ev
           JOIN fundraiser f ON (f.event_id = ev.event_id)
	   JOIN employee em ON (em.empl_id = ev.manager_id)
      ORDER BY amount_raised DESC)
WHERE rownum <= 3;

CLEAR COLUMNS


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 16~~~
prompt The average price of a cat training class based
prompt on the cat trainer, ordered by most expensive
prompt ticket price.

COL avg_ticket_price HEADING 'Average Ticket Price' FORMAT $999.99

SELECT instructor_fname || ' ' || instructor_lname AS
       "Instructor Name", AVG(event_ticket_price) AS
       avg_ticket_price
FROM cat_training_class ctc, event e
WHERE ctc.event_id = e.event_id
GROUP BY instructor_fname || ' ' || instructor_lname
ORDER BY avg_ticket_price;

CLEAR COLUMNS

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 17~~~
prompt The number of cats tagged as each breed.

SET PAGESIZE 99

SELECT cat_breed AS "Cat Breed", COUNT(c.cat_id) AS "Num Cats"
FROM cat c, cat_breed b
WHERE c.cat_id = b.cat_id
GROUP BY cat_breed
ORDER BY "Num Cats" DESC;

SET PAGESIZE 14


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 18~~~
prompt See file 325trigger.sql for query 18

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 19~~~
prompt See file 325trigger.sql for query 19

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 20~~~
prompt A view that shows the attributes for events with
prompt more than one subtype.
prompt For example, if an event is both a cat training
prompt class and a fundraiser, it would display the
prompt affiliated groups, trainer last name, and the
prompt total amount raised. If an event is not of a
prompt particular subclass, it will display N/A or 0,
prompt depending on if the columns is a number or string.

DROP VIEW event_details;

SET LINESIZE 100

COL e.event_id HEADING 'Event ID' FORMAT A10
COL event_name HEADING 'Event Name' FORMAT A15
COL event_start HEADING 'Event Date' FORMAT A10
COL book_code HEADING 'Book ID' FORMAT A10
COL amount_raised HEADING 'Amt Raised' FORMAT $99,999
COL affiliated_group HEADING 'Affiliate' FORMAT A10
COL instructor_fname HEADING 'Inst. F Name' FORMAT A10
COL instructor_lname HEADING 'Inst. L Name' FORMAT A15

CREATE VIEW event_details AS
    SELECT e.event_id, event_name, event_start,
	   COALESCE(b.book_code, 'N/A') book_code,
	   COALESCE(f.amount_raised, 0) amount_raised,
	   COALESCE(f.affiliated_group, 'N/A') 
		affiliated_group,
	   COALESCE(c.instructor_fname, 'N/A')
		instructor_fname,
	   COALESCE(c.instructor_lname, 'N/A')
		instructor_lname
FROM event e
     	LEFT JOIN book_signing b  ON (e.event_id = b.event_id)
	LEFT JOIN fundraiser f ON (e.event_id = f.event_id)
	LEFT JOIN cat_training_class c ON (e.event_id = 
		c.event_id);

SELECT *
FROM event_details;

SET LINESIZE 80

CLEAR COLUMNS


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 21~~~
prompt A query to list the events that an employee
prompt has managed. It will display the employee
prompt name, the event date, and the event_id


COL empl_name HEADING 'Employee Name' FORMAT A20
COL event_id HEADING 'Event ID' FORMAT A8
COL event_start HEADING 'Event Date' FORMAT A10

BREAK ON empl_name skip 1

SELECT empl_fname || ' ' || empl_lname empl_name,
	   event_id, event_start
FROM event ev
     JOIN employee em ON (ev.manager_id = em.empl_id);

CLEAR BREAKS
CLEAR COLUMNS


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 22~~~
prompt Suppose we want to find the employees that
prompt supervised specific volunteers. This query
prompt will display the employee name, start date,
prompt and wage for every employee that supervises.
prompt This query will allow us to input an employee
prompt ID and return the corresponding supervisor(s).

COL empl HEADING 'Supervisor' FORMAT A20
COL empl_start_date HEADING 'Hire Date' FORMAT A10
COL empl_wage HEADING '$ Per Hour' FORMAT $99.99

SELECT empl_fname || ' ' || empl_lname AS empl, 
       empl_start_date, empl_wage
FROM employee e
WHERE empl_id IN (SELECT supervisor
		  FROM supervises s
		  WHERE e.empl_id = s.supervisor
			AND vol_id = '&vol_input');
CLEAR COLUMNS


-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 23~~~
prompt A query that shows the book price, number
prompt of copies, the event name, and event start
prompt date for a book signing event, ordered by
prompt the start date in descending order for
prompt events between August 12 and September 30
prompt 2024.

COL event_name HEADING 'Event Name' FORMAT A42
COL event_start HEADING 'Event Date' FORMAT A10
COL item_base_price HEADING 'Book Price' FORMAT $99.99
COL num_copies HEADING 'Copies' FORMAT 99

SELECT event_name, event_start, item_base_price,
	   copies_in_stock AS num_copies
FROM event e
	 JOIN book_signing bs ON (e.event_id = bs.event_id)
	 JOIN book b ON (bs.book_code = b.item_code)
	 JOIN purchase_item p ON (b.item_code = p.item_code)
WHERE event_start BETWEEN '19-AUG-2024' AND '30-SEP-2024'
ORDER BY event_start DESC;

CLEAR COLUMNS
-----------------------------------------------

prompt
prompt ========================================
prompt ~~~Query 24~~~
prompt A query that finds the lowest wage of an
prompt employee out of employees that were hired
prompt for that month.

COL month_hired HEADING 'Month Hired' FORMAT A11
COL lowest_wage HEADING 'Lowest Wage' FORMAT $99.99

SELECT TO_CHAR(empl_start_date, 'MM-YYYY') AS month_hired,
	   MIN(empl_wage) AS lowest_wage
FROM employee
GROUP BY TO_CHAR(empl_start_date, 'MM-YYYY')
ORDER BY month_hired;

CLEAR COLUMNS

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 25~~~
prompt For training purposes, a new barista needs
prompt to know what they can serve to
prompt a patron who cannot have gluten

SELECT DISTINCT pi.item_code, pastry_name, item_base_price
FROM pastry pa, purchase_item pi
WHERE pa.item_code = pi.item_code
     AND has_gluten IN ('N')
ORDER BY pi.item_code;

-----------------------------------------------
prompt
prompt ========================================
prompt ~~~Query 26~~~
prompt Shows the average total sales of each employee
prompt who has been a clerk.

COL sale_avg HEADING 'Sales Average' FORMAT $999.99

SELECT clerk_id, AVG(total_cost) sale_avg
FROM purchase
GROUP BY clerk_id
ORDER BY sale_avg;

CLEAR COLUMNS

-----------------------------------------------

spool off

