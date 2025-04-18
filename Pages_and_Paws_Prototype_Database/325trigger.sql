
SPOOL trigger-results.txt

PROMPT =================================
PROMPT  ~~~Query 18~~~

PROMPT 
PROMPT When a book is purchased, the trigger reduces copies_in_stock 
PROMPT for the book by the quantity  purchased. The trigger does this 
PROMPT by seeing if a book (which always has an item code between 
PROMPT '5111111111' and '7999999999') was purchased.

CREATE OR REPLACE TRIGGER decrement_stock_after_purchase
AFTER INSERT ON purchase_item_quantity
FOR EACH ROW
BEGIN
	IF :NEW.item_code BETWEEN '5111111111' AND '7999999999' THEN
    	UPDATE book
    	SET copies_in_stock = copies_in_stock - :NEW.quantity_purchased
    	WHERE item_code = :NEW.item_code;
	END IF;
END;
/


prompt =================================
prompt ~~~Query 19~~~
Prompt If the inventory for books is 5 or below, this trigger will automatically
Prompt add the book to a table which keeps track of books to order.

DROP TABLE books_to_order;

CREATE TABLE books_to_order (
order_id                NUMBER GENERATED ALWAYS AS IDENTITY,
book_id                 char(12),
copies_in_stock integer,
alert_date              date,
PRIMARY KEY     (order_id));

CREATE OR REPLACE TRIGGER book_stock_low
AFTER UPDATE OF copies_in_stock ON book
FOR EACH ROW
BEGIN
        IF :NEW.copies_in_stock <= 5 THEN
        INSERT INTO books_to_order (book_id, copies_in_stock, alert_date)
        VALUES (:NEW.item_code, :NEW.copies_in_stock, SYSDATE);
        END IF;
END;
/

prompt =================================
prompt ~~~Testing Triggers~~~

PROMPT Check the list books_to_order.  

SELECT * FROM books_to_order;

PROMPT Copies of 5111111130 aka Fahrenheit 451 in stock BEFORE purchase/trigger:

SELECT item_code, copies_in_stock
FROM book
WHERE item_code = '5111111130';

PROMPT Someone purchases 1 copy of Fahrenheit 451.

INSERT INTO Purchase VALUES ('P000000029', 7.00, TO_TIMESTAMP('03-NOV-2024 13:06:25', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P001');

INSERT INTO Purchase_item_quantity VALUES ('P000000029', '5111111130', 1);

PROMPT Copies of 5111111130 aka Fahrenheit 451 in stock AFTER purchase/trigger:

SELECT item_code, copies_in_stock
FROM book
WHERE item_code = '5111111130';

PROMPT Copies of 5111111127 aka The Giver in stock BEFORE purchase/trigger:
SELECT item_code, copies_in_stock
FROM book
WHERE item_code = '5111111127';

PROMPT Someone buys 12 copies of The Giver.

INSERT INTO Purchase VALUES ('P000000030', 7.00, TO_TIMESTAMP('03-NOV-2024 13:06:25', 'DD-MON-YYYY HH24:MI:SS'), 'E006', 'P001');

INSERT INTO Purchase_item_quantity VALUES ('P000000001', '5111111127', 12);

PROMPT Copies of 5111111127 aka The Giver in stock AFTER purchase/trigger:

SELECT item_code, copies_in_stock
FROM book
WHERE item_code = '5111111127';

PROMPT 
PROMPT Since both purchases reduced the total copies in stock to at or 
PROMPT below 5, they should have activated the other trigger to add them
PROMPT to the trigger log called books_to_order

SELECT * FROM books_to_order;

SPOOL OFF
