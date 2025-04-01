/*
    Kiko Barr, Julia Calkins, McKenna Kindle
    CS 325 - Fall 2024
    Last modified: 10-DEC-2024
*/

spool 325report5-results.txt

/* Purpose:
        This report shows simple statistics
        between all cats, unadopted cats, 
	and adopted cats that have been
	cared for by the cafe. This includes
	the total number of each, the average
	age of each, the highest age of each,
	the lowest age of each, and the average
	gender of each (with a number closer to 1
	indicating more male cats, and a number
	closer to 0 indicating more female cats

	This is useful for understanding what
	kind of cat may be more likely to be
	adopted, and can help the cafe predict
	what cats may be adopted and which may not
	when the cafe gets one from a shelter.
*/


CLEAR BREAKS
CLEAR COLUMNS
CLEAR COMPUTES

SET FEEDBACK OFF
SET LINESIZE 80

TTITLE 'Adoption Report:|Statistics of Adopted and Unadopted Cats'

SET PAGESIZE 7

COL num_cats_all HEADING 'Total Cats' FORMAT 99
COL num_cats_unadopted HEADING 'Unadopted Cats' FORMAT 99
COL num_cats_adopted HEADING 'Adopted Cats' FORMAT 99
COL avg_cat_age HEADING 'Average Age' FORMAT 9.99
COL high_age HEADING 'Oldest Cat' FORMAT 99
COL low_age HEADING 'Youngest Cat' FORMAT 9.9
COL avg_gender HEADING 'Average Gender' FORMAT 9.99

PROMPT
PROMPT Statistics of All Cats Cared for by the Cafe:
PROMPT For Average Gender, a value closer to 1
PROMPT indicates a higher average of male cats.

WITH all_cats_view AS (
    SELECT COUNT(*) AS num_cats_all,
           AVG(cat_age) AS avg_cat_age,
           MAX(cat_age) AS high_age,
           MIN(cat_age) AS low_age,
           AVG(CASE
                  WHEN cat_sex = 'M' THEN 1
                  WHEN cat_sex = 'F' THEN 0
               END) AS avg_gender
    FROM cat c
)
SELECT *
FROM all_cats_view;

TTITLE OFF
PROMPT
PROMPT Statistics of Unadopted Cats:

WITH unadopted_view AS (
    SELECT count(*) AS num_cats_unadopted, 
	   avg(cat_age) AS avg_cat_age,
	   max(cat_age) AS high_age,
	   min(cat_age) AS low_age,
	   avg(CASE
		  WHEN cat_sex = 'M' THEN 1
		  WHEN cat_sex = 'F' THEN 0
	       END) AS avg_gender
    FROM cat c
    WHERE NOT EXISTS (SELECT 'a'
		      FROM adoption a
		      WHERE c.cat_id = a.cat_id)
)
SELECT *
FROM unadopted_view;

PROMPT
PROMPT Statistics of Adopted Cats:
BTITLE 'Report Authorized By:|Cafe Manager'

WITH adopted_view AS (
    SELECT COUNT(*) AS num_cats_adopted, 
	   AVG(cat_age) AS avg_cat_age,
	   MAX(cat_age) AS high_age,
	   MIN(cat_age) AS low_age,
           AVG(CASE
                  WHEN cat_sex = 'M' THEN 1
                  WHEN cat_sex = 'F' THEN 0
               END) AS avg_gender
    FROM cat c
    WHERE EXISTS (SELECT 'a'
                  FROM adoption a
                  WHERE c.cat_id = a.cat_id)
)
SELECT *
FROM adopted_view;

SET PAGESIZE 14
SET LINESIZE 80

CLEAR COLUMNS
TTITLE OFF
BTITLE OFF

SPOOL OFF

