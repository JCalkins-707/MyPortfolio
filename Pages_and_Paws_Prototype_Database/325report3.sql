/* Kiko Barr, Julia Calkins, & McKenna Kindle
 * CS 325 - Report 3
 * last modified: Dec 9 2024
 */
spool 325report3.txt

prompt Fundraisers have had vastly different
prompt amounts of funds raised. This report is to
prompt compare the average amount of funds raised
prompt based on the duration of the fundraiser,
prompt the group affiliated, ticket price, and
prompt whether it coincided with a book signing,
prompt cat training, both, or stand alone. This is
prompt to learn about the trends of fundraisers held.

BTITLE OFF
TTITLE OFF
TTITLE 'Fundraiser Comparisons|Regarding Different Areas of Interest'
col "Avg. Funds Raised" format $9999999.99
col affiliated_group heading Group|Affiliated format a12 WOR
col event_ticket_price heading "Ticket Price" format $9999.99
col type_combo heading "Event Types" format a10 WOR
set pagesize 25
set feedback off

prompt =========================================
prompt Avg. Funds Raised Based on Event Duration
prompt =========================================

SELECT (event_end - event_start) * 24 "Event Duration (Hrs)",
       AVG(amount_raised) "Avg. Funds Raised", COUNT(f.event_id) "Total Events"
FROM event e, fundraiser f
WHERE e.event_id = f.event_id
GROUP BY (event_end - event_start) * 24
ORDER BY "Avg. Funds Raised" DESC;

TTITLE OFF
prompt
prompt =========================================
prompt Fund Statistics Based on Group Affiliated
prompt =========================================

SELECT affiliated_group, AVG(amount_raised) "Avg. Funds Raised",
       COUNT(event_id) "Total Events"
FROM fundraiser
GROUP BY affiliated_group
ORDER BY "Avg. Funds Raised" DESC;

prompt
prompt =========================================
prompt 	Avg. Funds Raised Based on Ticket Price
prompt =========================================

SELECT event_ticket_price, AVG(amount_raised) "Avg. Funds Raised",
       COUNT(f.event_id) "Total Events"
FROM event e
JOIN fundraiser f ON e.event_id = f.event_id
GROUP BY event_ticket_price
ORDER BY "Avg. Funds Raised" DESC;

prompt
prompt =========================================
prompt   Fund Statistics based on Event Types
prompt =========================================

BTITLE 'Report Authored By:|Cafe Manager'

WITH event_types AS (
     SELECT amount_raised, f.event_id, affiliated_group,
	   CASE
                WHEN is_fundraiser = 'Y' AND is_book_signing = 'Y'AND is_cat_training_class = 'Y'
                     THEN 'Fundraiser, Book Signing and Cat Training Class'
                WHEN is_fundraiser = 'Y' AND is_book_signing = 'Y'
                     THEN 'Fundraiser and Book Signing'
                WHEN is_fundraiser = 'Y' AND is_cat_training_class = 'Y'
                     THEN 'Fundraiser and Cat Training Class'
        	WHEN is_fundraiser = 'Y' THEN 'Fundraiser'
 	    END AS type_combo
     FROM event e, fundraiser f
     WHERE e.event_id = f.event_id
)
SELECT type_combo, AVG(amount_raised) "Avg. Funds Raised",
       COUNT(event_id) "Total Events"
FROM event_types
GROUP BY type_combo
ORDER BY "Avg. Funds Raised" DESC;

BTITLE OFF
clear columns breaks computes
set pagesize 14
set feedback 6

spool off
