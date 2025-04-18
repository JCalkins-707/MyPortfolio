SPOOL report1-results.txt

prompt A single month of sales statistics broken
prompt out by each week. Analyses include the number
prompt of sales, average amount of each transaction,
prompt and the total revenue for each week.
prompt Also gives an overview of the items purchased
prompt divided out by each week.

BTITLE OFF
TITLE OFF
TTITLE 'Sales Statistics for|November 2024 by Week'
COL num_purchases HEADING '# of Sales'
COL avg_purchase_amt HEADING 'Avg. Purchase' FORMAT $999.99
COL week_total HEADING 'Week Total' FORMAT $999.99
COL item_name HEADING 'Item' FORMAT A25 WORD_WRAPPED
COL total_quantity_purchased HEADING '# Purchased'
SET PAGESIZE 20
SET FEEDBACK OFF

PROMPT

WITH sales_by_week AS (
    SELECT purchase_date, purchase_id, total_cost,
	  CASE
	      WHEN purchase_date BETWEEN
		 TO_DATE('03-NOV-2023', 'DD-MON-YYYY') AND
		 TO_DATE('09-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
		 THEN 'Week 1'
              WHEN purchase_date BETWEEN
		 TO_DATE('10-NOV-2024', 'DD-MON-YYYY') AND
	         TO_DATE('16-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
		 THEN 'Week 2'
	      WHEN purchase_date BETWEEN
		 TO_DATE('17-NOV-2024', 'DD-MON-YYYY') AND
		 TO_DATE('23-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
		 THEN 'Week 3'
	      WHEN purchase_date BETWEEN
		 TO_DATE('24-NOV-2024', 'DD-MON-YYYY') AND
		 TO_DATE('30-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
		 THEN 'Week 4'
	      ELSE 'Misc'
	   END AS week
    FROM purchase
)
SELECT week, AVG(total_cost) AS avg_purchase_amt,
       COUNT(purchase_id) AS num_purchases,
       SUM(total_cost) AS week_total
FROM sales_by_week
GROUP BY week
ORDER BY week;

TTITLE OFF

DROP VIEW sold_items;

CREATE VIEW sold_items AS
(SELECT pi.item_code, pastry_name AS Item_Name
FROM purchase_item pi
JOIN pastry on pi.item_code = pastry.item_code)
UNION
(SELECT pi.item_code, book_title AS Item_Name
FROM purchase_item pi
JOIN book on pi.item_code = book.item_code)
UNION
(SELECT pi.item_code, drink_name AS Item_Name
FROM purchase_item pi
JOIN drink on pi.item_code = drink.item_code);

PROMPT
PROMPT
PROMPT =========================================
PROMPT Week 1 Purchases Ranked by Most Purchased
PROMPT =========================================

SELECT si.item_name,
       SUM(quantity_purchased) AS total_quantity_purchased
FROM sold_items si
JOIN Purchase_item_quantity piq ON piq.item_code = si.item_code
JOIN purchase p ON p.purchase_id = piq.purchase_id
WHERE p.purchase_date BETWEEN
	to_date('03-NOV-2023', 'DD-MON-YYYY') AND
	to_date('09-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
GROUP BY si.item_code, si.item_name
ORDER BY SUM(quantity_purchased) DESC;

PROMPT
PROMPT =========================================
PROMPT Week 2 Purchases Ranked by Most Purchased
PROMPT =========================================

SELECT si.item_name,
       SUM(quantity_purchased) AS total_quantity_purchased
FROM sold_items si
JOIN Purchase_item_quantity piq ON piq.item_code = si.item_code
JOIN purchase p ON p.purchase_id = piq.purchase_id
WHERE p.purchase_date BETWEEN
	to_date('10-NOV-2024', 'DD-MON-YYYY') AND
	to_date('16-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
GROUP BY si.item_code, si.item_name
ORDER BY SUM(quantity_purchased) DESC;

PROMPT
PROMPT =========================================
PROMPT Week 3 Purchases Ranked by Most Purchased
PROMPT =========================================

SELECT si.item_name,
       SUM(quantity_purchased) AS total_quantity_purchased
FROM sold_items si
JOIN Purchase_item_quantity piq ON piq.item_code = si.item_code
JOIN purchase p ON p.purchase_id = piq.purchase_id
WHERE p.purchase_date BETWEEN
	to_date('17-NOV-2024', 'DD-MON-YYYY') AND
	to_date('23-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
GROUP BY si.item_code, si.item_name
ORDER BY SUM(quantity_purchased) DESC;

PROMPT
PROMPT =========================================
PROMPT Week 4 Purchases Ranked by Most Purchased
PROMPT =========================================

BTITLE 'Report Authored By:|Cafe Manager'

SELECT si.item_name,
       SUM(quantity_purchased) AS total_quantity_purchased
FROM sold_items si
JOIN Purchase_item_quantity piq ON piq.item_code = si.item_code
JOIN purchase p ON p.purchase_id = piq.purchase_id
WHERE p.purchase_date BETWEEN
	to_date('24-NOV-2024', 'DD-MON-YYYY') AND
	to_date('30-NOV-2024 23:59:59', 'DD-MON-YYYY HH24:MI:SS')
GROUP BY si.item_code, si.item_name
ORDER BY SUM(quantity_purchased) DESC;

BTITLE OFF
SET PAGESIZE 14
SET FEEDBACK 6
CLEAR COLUMNS

SPOOL OFF
