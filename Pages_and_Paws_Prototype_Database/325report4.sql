/* McKenna Kindle, Julia Calkins, Kiko Barr
 * CS 325 - report 4
 * last modified: Dec 11, 2024
 */
spool 325report4-out.txt

prompt The cafe wants to compute the
prompt min, max, and average event ticket
prompt for each manager

BTITLE OFF
TTITLE OFF
TTITLE 'Min, Max and Avg of Manager Events'
BTITLE 'Report Authored By:|Cafe Manager'
col manager_id heading "Manager" format a10
col event_ticket_price heading "Ticket Price" format $999999.99
set pagesize 100
set feedback off

prompt =================================
prompt Min, Max, Avg for Managers
prompt ==================================

break on manager_id skip 2
COMPUTE min max avg of event_ticket_price on manager_id

select manager_id, event_ticket_price
from event
order by manager_id;


TTITLE OFF
BTITLE OFF
set pagesize 14
set feedback 6
clear columns breaks computes
spool off
