SPOOL report2-results.txt

CLEAR BREAKS
CLEAR COMPUTES
TTITLE 'Spending Habits of Cafe|Loyalty Members'
SET FEEDBACK OFF
SET PAGESIZE 100

PROMPT
PROMPT The purpose of this report is to analyze the spending
PROMPT habits of patrons who are Loyalty Members. Loyalty 
PROMPT Members bring in the most revenue throughout the year
PROMPT so insights from this report can be used to make decisions
PROMPT about what new products we can offer at the cafe that will 
PROMPT be most impactful.
PROMPT


CREATE OR REPLACE VIEW sold_items AS
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

BREAK ON patron_id SKIP 1
COMPUTE SUM OF total_cost ON patron_id
COL item_name HEADING 'Item' FORMAT A25 WORD_WRAPPED

SELECT DISTINCT p.patron_id, si.item_name
FROM purchase p
JOIN purchase_item_quantity piq ON p.purchase_id = piq.purchase_id
JOIN sold_items si ON si.item_code = piq.item_code
WHERE p.patron_id IN (
    SELECT patron_id
    FROM patron
    WHERE is_loyalty_member = 'Y'
)
ORDER BY p.patron_id, si.item_name;

TTITLE OFF

PROMPT ===========================================================
PROMPT What are the top five items purchased by loyalty members?
PROMPT ===========================================================

SET PAGESIZE 14

SELECT si.item_name,
       SUM(quantity_purchased) total_quantity_purchased
FROM sold_items si
JOIN Purchase_item_quantity piq ON piq.item_code = si.item_code
JOIN purchase p ON p.purchase_id = piq.purchase_id
WHERE p.patron_id IN (
    SELECT patron_id
    FROM patron
    WHERE is_loyalty_member = 'Y'
) 
GROUP BY si.item_code, si.item_name
ORDER BY SUM(quantity_purchased) DESC, si.item_code
FETCH first 5 rows with ties;

PROMPT
PROMPT
PROMPT ===========================================================
PROMPT Are loyalty members more likely to adopt a cat 
PROMPT than non-loyalty members?
PROMPT ===========================================================

BTITLE 'Report Authored By:|Cafe Manager'
COL is_loyalty_member HEADING 'Is Loyalty Member' FORMAT A17

SELECT is_loyalty_member,
       COUNT(adopt_id) AS "Number of Adoptions"
FROM patron
JOIN adoption ON patron.patron_id = adoption.adopted_by
GROUP BY is_loyalty_member
ORDER BY is_loyalty_member;

CLEAR BREAKS
CLEAR COLUMNS
CLEAR COMPUTES
SET PAGESIZE 14
BTITLE OFF

SPOOL OFF
