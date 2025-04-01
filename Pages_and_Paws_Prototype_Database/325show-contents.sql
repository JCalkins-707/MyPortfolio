/* Kiko Bar & Julia Calkins & McKenna Kindle
 * CS 325 - Showing table contents
 * last modified: Nov. 29 2024
 */

spool result-contents.txt

prompt ===== shelter =====
set linesize 80
set pagesize 98
col shelter_id heading ID format a4
col shelter_name heading Name format a29
col shelter_street heading "Street Addr." format a24
col shelter_city heading City format a13
col shelter_zip heading Zip format a5

select *
from shelter
order by shelter_id;


prompt ===== cat =====
col cat_id heading ID format a6
col cat_name heading Name format a8
col cat_age heading Age format 99
col cat_sex heading Male/|Female format a6
col date_acquired heading "Acquired On" format a10
col shelter_id heading Shelter format a7

select *
from cat
order by cat_id;


prompt ===== cat_breed =====
col cat_breed heading "Cat Breed" format a19
col cat_id heading "Cat ID" format a6
break on cat_id skip 1

select *
from cat_breed
order by cat_id;

prompt ==== cat_caretaker ====
col vol_id heading "Volunteer ID" format a12
break on vol_id skip 1
col cat_id heading "Cat ID" format a6

select *
from cat_caretaker
order by vol_id, cat_id;

clear breaks
prompt ====== volunteer ======
col vol_id heading ID format a4
col vol_lname heading Last|Name format a10
col vol_email heading Email format a16 WRAPPED
col vol_phone heading Phone format a12
col vol_start_date heading Start|Date
col vol_train_date heading Train|Date
col total_hrs_volunteered heading Total|Hrs format 999

select vol_id, vol_lname, vol_email,vol_phone,
       vol_start_date, vol_train_date, total_hrs_volunteered
from volunteer
order by vol_id;

prompt ======= patron =========
col patron_id heading Patron|ID format a10
col patron_lname heading Last|Name format a10
col patron_fname heading First|Name format a13
col is_loyalty_member heading Loyalty|Memb. format a7

select *
from patron
order by patron_id;

prompt ===== patron_email_list =====
col patron_id heading "Patron ID" format a10
col patron_email heading Email
break on patron_id

select *
from patron_email_list
order by patron_id;

prompt ===== employee =====
col empl_id heading ID format a4
col empl_lname heading Last|Name format a10
col empl_fname heading First|Name format a8
col empl_email heading Email format a11 WRAPPED
col empl_phone heading Phone format a12
col empl_start_date heading Started
col tax_id_on_file heading "Tax ID" format a6
col empl_wage heading Wage format $99.99

select *
from employee
order by empl_id;

prompt ===== supervises =====
col supervisor heading "Supervisor ID" format a13
break on supervisor skip 1
col vol_id heading "Volunteer ID" format a13

select *
from supervises
order by supervisor;

prompt ===== adoption =====
col adopt_id heading "Adoption ID" format a13
col adopt_date heading "Adopted On" format a12
col cat_id heading Cat format a8
col authorized_by heading "Authorized By" format a13
col adopted_by heading "Adopted By" format a11

select *
from adoption
order by adopt_id;

prompt ===== purchase =====
clear breaks
col purchase_id heading "Purchase ID" format a11
col total_cost heading Total format $99.99
col clerk_id heading "Clerk ID" format a8
col patron_id heading "Patron ID" format a9

select purchase_id, total_cost, to_char(purchase_date, 'DY-MON-YY HH12:MI:SS AM') "Purchased On",
       clerk_id, patron_id
from purchase
order by purchase_id;

prompt ===== purchase_item =====
col item_code heading "Item Code" format a12
col item_type heading "Item Type" format a9
break on item_type skip 1
col item_base_price heading "Base Price" format $99.99

select item_type, item_code, item_base_price
from purchase_item
order by item_code;

prompt ===== pastry =====
col pastry_name heading Name format a15 WOR
col has_gluten heading Gluten format a6
col has_nuts heading Nuts format a4
col has_dairy heading Dairy format a5
col has_soy heading Soy format a3
col is_vegan heading Vegan format a5

select *
from pastry
order by item_code;

prompt ===== drink =====
col item_code heading Item|Code
col drink_name heading Drink|Name format a15 WOR
col drink_temp heading Drink|Temp format a5
col drink_type heading Drink|Type format a16 WOR
col caffeine_content heading Caffeine|Amount format a8
col milk_type heading Milk|Type format a12
col is_sugar_free heading Sugar|Free format a5

select *
from drink
order by item_code;

prompt ===== book =====
col book_title heading Book|Title format a30 WOR
col author_lname heading Last|Name format a11
col author_fname heading First|Name format a10
col copies_in_stock heading Total|Copies format 999

select *
from book
order by item_code;

prompt ===== book_genre =====
col book_code heading "Book Code"
break on book_code skip 1
col genre heading "Book Genre"

select *
from book_genre
order by book_code;

prompt ===== event =====
col event_id heading ID
break on event_id skip 1
col event_name heading Name format a10 WOR
col event_start heading Start
col event_end heading End
col event_ticket_price heading "Price" format $99.99
col manager_id heading Manager format a7
col is_book_signing heading Book|Sign format a4
col is_fundraiser heading Fund-|raiser format a6
col is_cat_training_class heading Cat|Class format a5

select *
from event
order by event_id;

prompt ===== book_signing =====
clear breaks
col event_id heading "Event ID" format a8
col book_code heading "Book ID" format a12

select *
from book_signing
order by event_id;

prompt ===== fundraiser =====
col amount_raised heading "Amt Raised" format $99999999.99
col affiliated_group heading "Group Affiliate" format a20

select *
from fundraiser
order by event_id;

prompt ===== cat_training_class =====
col instructor_lname heading "Last Name" format a10
col instructor_fname heading "First Name"

select *
from cat_training_class
order by event_id;

prompt ===== purchase_item_quantity =====
clear breaks columns computes
col purchase_id heading "Purchase ID"
col item_code heading "Item Code"
col quantity_purchased heading Quantity
break on purchase_id skip 1

select *
from purchase_item_quantity
order by purchase_id, item_code;

clear breaks columns computes
spool off
