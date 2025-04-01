/*
    Kiko Barr, Julia Calkins, McKenna Kindle
    CS 325 - Fall 2024
    Last modified: 10-Dec-2024
*/

spool 325report6-results.txt

/* Purpose:
	The purpose of this report is to show
	the supervision structure of the relationship
	between employees, volunteers, and cats.
	It shows the names and id numbers of the
	volunteers and the employees who
	supervise them, and the cats who are cared
	for by each volunteer.

	In the scenario, this report might be used
	to show who the volunteer must defer to. Or
	it may show what employee is overseeing the
	care of each cat who is not yet adopted.
*/

SET FEEDBACK OFF
SET PAGESIZE 60
SET LINESIZE 90

TTITLE 'Report 6: Cat Supervision List'
BTITLE 'Report Authorized By:|Cafe Manager' 


COL supervisor_identity heading 'Supervisor' format a23
COL volunteer_identity heading 'Volunteer' format a23
COL cat_identity heading 'Cat' format a18

BREAK ON supervisor_identity SKIP 1 ON volunteer_identity

DROP VIEW cats_volunteers_supervisors;

CREATE VIEW cats_volunteers_supervisors AS
    SELECT supervisor || ' - ' || empl_lname ||
	   ', ' || empl_fname AS supervisor_identity,
	    s.vol_id || ' - ' || vol_lname ||
	    ', ' || vol_fname AS volunteer_identity, 
	    cct.cat_id || ' - ' || cat_name as cat_identity
    FROM supervises s
	 JOIN cat_caretaker cct ON (s.vol_id = cct.vol_id)
         JOIN employee e ON (s.supervisor = e.empl_id)
	 JOIN volunteer v ON (cct.vol_id = v.vol_id)
	 JOIN cat c ON (cct.cat_id = c.cat_id)
WHERE cct.cat_id NOT IN (SELECT a.cat_id
	                 FROM adoption a
	         	 WHERE cct.cat_id = a.cat_id);

BREAK ON supervisor_identity ON -
volunteer_identity SKIP 1 ON cat_identity

SELECT *
FROM cats_volunteers_supervisors
ORDER BY supervisor_identity, volunteer_identity,
	 cat_identity;

CLEAR BREAKS
CLEAR COLUMNS

SET FEEDBACK 6
SET PAGESIZE 14
SET LINESIZE 100

TTITLE OFF
BTITLE OFF

SPOOL OFF

