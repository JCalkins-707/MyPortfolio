
/*
   Kiko Barr
   Julia Calkins
   McKenna Kindle


   CS 325 - Fall 2024
   Last modified: 11-DEC-2024


   Create-Table Statements

*/


drop table shelter cascade constraints;


/* Purpose:
         The shelter table is meant to keep track
         of what shelters donate cats to the cafe.


   Attributes:
         shelter_id: a 4-digit length ID number unique
            to every shelter. char(4) was chosen as a
            domain because the ID must be exactly
            4-digits long, no more and no less. The
            shelter_id is also unique, so it is a good
            choice for the primary key
        shelter_name: The business name of the shelter.
        varchar2(30) was chosen here because some
             shelters may have longer names, and it is
             extremely unlikely that all shelters will
             have names of the same string length, so
             fixed-size domain is avoided.
         shelter_street: street address of the shelter
             varchar2(40).
	 shelter_city: name of the city the shelter is
	     located in. varchar2(40)
         shelter_zip: The zip code of the shelter. This
             project assumes all shelters are in the
             United States, which has fixed-size zip codes
             of 5-digits. char(5) was used here to enforce
             fixed-size zip codes of 5-digits.
*/


create table shelter
(shelter_id char(4),
 shelter_name varchar2(30),
 shelter_street varchar2(40),
 shelter_city varchar2(40),
 shelter_zip char(5),
 primary key (shelter_id)
);


------------------------------------------


drop table cat cascade constraints;


/* Purpose:
         The cat table is meant to keep track of
        all the cats that are, or have been,
        in the care of the cafe for adoption. It
        also keeps track of which shelter donated
        the cat and when.
   
   Attributes:
         cat_id: a unique ID number for the cat. The cat
            ID is a fixed-size string of 6 digits or letters,
            such that '012345' and '1DA9EF' would both
             be acceptable IDs. char(6) is used to enforce
             a fixed-size ID string of 6 characters. No two
             cats can have the same ID number. Thus the
             uniqueness of the cat_id attribute makes it a
             good primary key.
         cat_name: the name of the cat. varchar2(16) is
             used for this attribute.
         cat_age: age of the cat, number
	 cat_sex: sex of the cat, char(1) within 'M'
	     and 'F'.
         date_acquired: the date the cat was acquired
             from the shelter. date was used as the domain
             here.
         shelter_id: the ID number of the shelter the cat
             was gotten from. foreign key, is the primary
             key of shelter.


*/


create table cat
(cat_id char(6),
 cat_name varchar2(16),
cat_age number,
cat_sex char(1) check(cat_sex in ('F', 'M')),
 date_acquired  date,
 shelter_id char(4),
 primary key (cat_id),
 foreign key (shelter_id) references shelter
);


----------------------------------------
drop table cat_breed;


/* Purpose: the cat_breed table stores the
        multi-valued attribute cat_breed for each cat.
        
       Attributes:
        cat_id: primary key of cat table, char(6).
        cat_breed: the breed of the cat. A cat can
                be of multiple breeds, stored across
                multiple entries. varchar2(20).
*/


create table cat_breed
(cat_id char(6),
 cat_breed varchar2(20),
 primary key (cat_id, cat_breed),
 foreign key (cat_id) references Cat
);
------------------------------------------


drop table volunteer cascade constraints;


/* Purpose:
         the purpose of this table is to keep track of
        volunteers within the cafe.
   
   Attributes:
         vol_id: a 4-character length string representing
             a unique volunteer. the first character of the
             volunteer's ID should be 'V', to signal that it
             is the ID of a volunteer, versus an employee ('E').
             char(4) is used here.
         vol_fname: first name of the volunteer. varchar2(15)
             is used here.
         vol_lname: last name of the volunteer. varchar2(30)
             is used here.
         vol_email: the cafe only keeps one volunteer email on
             file at a time. varchar2(80) is used here.
         vol_phone: the project assumes all volunteers have
             American or Canadian phone numbers (those of the format
             '123 456-7890'). char(12) is used here.
         vol_start_date: the date the volunteer's application
             is finalized.  date is used as the domain here
         vol_train_date: the date the volunteer has completed
             their volunteer training. date is used here.
         total_hrs_volunteered: the number of hours volunteering
             by the volunteer in total. number is used here, but
             volunteer hours cannot be less than 0.


*/


create table volunteer
(vol_id char(4),
 vol_fname varchar2(15),
 vol_lname varchar2(30),
 vol_email varchar2(80),
 vol_phone char(12),
 vol_start_date date,
 vol_train_date date,
 total_hrs_volunteered number check(total_hrs_volunteered > 0),
 primary key (vol_id)
);


-------------------------------------------------


drop table cat_caretaker;


/* Purpose: intersection table for the
         "volunteer cares for cat" relationship.
         every cat must have a volunteer caring for
         it, and can have many volunteers caring for it.
         volunteers do not have to care for any cats,
         but can care for many cats.


   Attributes:
         vol_id: primary key of the volunteer
             table. indicates what volunteer is caring
             for this cat. char(4)
         cat_id: primary key of the cat table,
             indicates what cat is being taken care of.
             uses char(6).
*/


create table cat_caretaker
(vol_id char(4),
 cat_id char(6),
 primary key (vol_id, cat_id),
 foreign key (vol_id) references volunteer,
 foreign key (cat_id) references cat
);


------------------------------------------


drop table patron cascade constraints;


/* Purpose: the patron table keeps information about
        each patron/customer account. every patron
        gets their own patron_id. a patron's first and
        last names are kept on file. a patron may put
        multiple emails on file with the cafe, but
        those are stored in the patron_email_list table.
         


   Attributes:
         patron_id: a unique 10-character length string
             representing a patron/customer account.
             the ID is fixed-length, but can have any
             combination of letters and numbers. char(10)
             was used here.
         patron_lname: last name of the patron. uses
             varchar2(30).
         patron_fname: first name of the patron. uses
             varchar2(15).
	 is_loyalty_member: indicates whether the patron
	     is a loyalty member with the cafe. 'Y' for
	     yes, 'N' for n.
*/


create table patron
(patron_id char(10),
 patron_lname varchar2(30),
 patron_fname varchar2(15),
 is_loyalty_member char(1) check(is_loyalty_member in ('Y', 'N')),
 primary key (patron_id)
);


-----------------------------------------


drop table patron_email_list;


/* Purpose: this is a table that tracks the
        multi-valued attribute patron_email.
        the primary key is a combination of
        patron_id and patron_email, allowing a
        patron to have multiple emails on file
        with the cafe.


   Attributes:
         patron_id: primary key of patron table.
            Refer to the patron table for a detailed
            description. Uses char(10).
         patron_email: email on file of the patron. A
            patron may have multiple emails on file with
            the cafe, stored in multiple different columns
            of the table. varchar2(40) is used here, since
            some email addresses can be quite long.
*/


create table patron_email_list
(patron_id char(10),
 patron_email varchar2(40),
 primary key (patron_id, patron_email),
 foreign key (patron_id) references patron
);


------------------------------------------


drop table employee cascade constraints;


/* Purpose:
          The table keeps track of information
          regarding all of the cafe's paid employees.


   Attributes:
         empl_id: a 4-character length ID for employees
             of the cafe. The IDs should start with 'E'
             to signal that they are employees, such as
             'E382' or 'E000'. char(4) was used here.
         empl_lname: the last name of the employee.
             varchar2(30)
         empl_fname: the first name of the employee.
             varchar2(15) used here.
         empl_email: the email of the employee on file.
             varchar2(80) is used here
         empl_phone: phone number of the employee. this
             project assumes all employees have American or
             Canadian phone numbers (those of the form
             123 456-7890). char(12) is used here
         empl_start_date: start date of the employee. date
         tax_id_on_file: states whether or not the employee
             has a tax_ID on file. Since the U.S. uses SSNs as
             tax IDs for citizens, that data is not stored on
             the table directly for confidentiality. char(1) is
             used here, denoting Y or N if the tax number is on
             file with the cafe. Only 'Y' and 'N' are accepted
             as inputs here.
         empl_wage: employee's hourly wage. the cafe does not
             do salaries, only hourly wage. decimal(5, 2) is used
             here.


*/


create table employee
(empl_id char(4),
 empl_lname varchar2(30),
 empl_fname varchar2(15),
 empl_email varchar2(80),
 empl_phone char(12),
 empl_start_date date,
 tax_id_on_file char(1) check(tax_id_on_file in ('Y', 'N')),
 empl_wage decimal(5, 2),
 primary key (empl_id)
);


----------------------------------------------------


drop table supervises;


/* Purpose: intersection table for the relationship
         "employee supervises volunteer". an employee
         can supervise many volunteers. every volunteer
         is supervised by one or multiple employees.


   Attributes:
         supervisor: primary key of employee. indicates
             which employee is supervising the volunteer.
             char(4).
         vol_id: primary key of volunteer. indicates
             which volunteer is being supervised. char(4).
*/


create table supervises
(supervisor char(4),
 vol_id char(4),
 primary key (supervisor, vol_id),
 foreign key (supervisor) references employee(empl_id),
 foreign key (vol_id) references volunteer
);


-----------------------------------------


drop table adoption cascade constraints;


/* Purpose: the adoption table stores information
         about all adoptions that have taken place
         through the shelter.


   Attributes:
         adopt_id: an ID number that uniquely identifies
             each adoption instance. an adoption ID is fixed-length
             of the form '1234-56EK90', where the first 4 numbers are
             the id numbers of the shelter the cat is from, and
             the last 6 characters are the ID of the cat that
             was adopted. char(11) was used here.
         adopt_date: the date the cat was adopted out.
             date was used here.
         cat_id: the primary key of the cat table. char(6)
             authorized_by: the primary key of the employee
             table. refers to what employee oversaw and approved
             the adoption of the cat.
         adopted_by: the primary key of patron table. refers
             to what patron adopted the cat. char(10)
         
*/


create table adoption
(adopt_id char(11),
 adopt_date date,
 cat_id char(6),
 authorized_by char(4),
 adopted_by char(10),
 primary key (adopt_id),
 foreign key (cat_id) references cat,
 foreign key (authorized_by) references employee(empl_id),
 foreign key (adopted_by) references patron(patron_id)
);


----------------------------------------


drop table purchase cascade constraints;


/* Purpose: the purpose of the purchase table is
         to keep track of item sales that have happened
         between the cafe and a patron. this tracks the
         employee who checked the patron out, as well
         as the total cost of the transaction.
   
   Attributes:
         purchase_id: a unique id for every purchase
             that has been done. is fixed length at
             12-digits, thus char(12) is used here.
         total_cost: total cost of the purchase. can
             support transactions up to 99,999.99 in one
             instance. uses decimal(7, 2).
         purchase_date: what date the purchase happened
             on. uses date.
         clerk_id: primary key of employee. indicates
             which employee did the transaction. char(4).
         patron_id: primary key of patron. indicates
             which patron was buying something.
*/


create table purchase
(purchase_id char(12),
 total_cost decimal(7, 2),
 purchase_date timestamp,
 clerk_id char(4),
 patron_id char(10),
 primary key (purchase_id),
 foreign key (clerk_id) references employee(empl_id),
 foreign key (patron_id) references patron
);


----------------------------------------------------------


drop table purchase_item cascade constraints;


/* Purpose: Purchase_item is a supertype which
                includes pastry, book, and drink.
                This group includes every item that the
                cafe sells.


   Attribute:
         item_code: This is a 12-digit number stored as 
		char which is a unique identifier.
                Each good sold in the store gets its own code. 
		So cinnamon roll has one item_code. Each cinnamon
	        roll sold does not get its own code.
         item_type: purchase_item is a supertype for drink, pastry, and book.
         item_base_price: the price of the item as a decimal.
*/


create table purchase_item
(item_code char(12),
 item_type varchar(6)         check(item_type in
                ('drink', 'pastry', 'book')),
 item_base_price  decimal(5, 2),
 primary key (item_code)
);


-------------------------------------------


drop table pastry;


/* Purpose: Pastry is a subtype of purchase_item
                and has data specific to every pastry
            that the cafe sells.




   Attributes:
         item_code: primary key of purchase_item.
         date_made: date the pastry was made. uses date.
         expiration_date: date the pastry goes bad. uses
         date.
         pastry_name: name of the pastry. varchar2(40)
         has_gluten: indicates if this pastry is vegan. 'Y'
             for "yes, it is vegan" and 'N' for 'No, not vegan'.
             uses char(1) and only accepts 'Y' and 'N'.
         has_nuts: indicates if this pastry has nuts. 'Y'
             for "yes, it is has nuts" and 'N' for 'No, no nuts'.
             uses char(1) and only accepts 'Y' and 'N'
         has_dairy: indicates if this pastry has dairy. 'Y'
             for "yes, it has dairy" and 'N' for 'No, no dairy'.
             uses char(1) and only accepts 'Y' and 'N'
         has_soy: indicates if this pastry has soy. 'Y'
             for "yes, it is has soy" and 'N' for 'No, no soy'.
             uses char(1) and only accepts 'Y' and 'N'
         is_vegan: indicates if this pastry is vegan. 'Y'
             for "yes, it is vegan" and 'N' for 'No, not vegan'.
             uses char(1) and only accepts 'Y' and 'N'
*/


create table pastry
(item_code char(12),
 pastry_name varchar2(40),
 has_gluten char(1) check(has_gluten in ('Y', 'N')),
 has_nuts char(1) check(has_nuts in ('Y', 'N')),
 has_dairy char(1) check(has_dairy in ('Y', 'N')),
 has_soy char(1) check(has_soy in ('Y', 'N')),
 is_vegan char(1) check(is_vegan in ('Y', 'N')),
 primary key (item_code),
 foreign key (item_code) references purchase_item
);


------------------------------------------------


drop table drink;


/* Purpose:
        Drink is a subtype of purchase_item
            and has data specific to every drink
        that the cafe sells.


   Attributes:
         item_code: primary key of purchase_item.
              char(12)
         drink_name: name of the drink. varchar2(40)
         drink_temp: temp of the drink (hot/iced).
         drink_type: the type of drink, such as coffee,
              tea, soda, water, etc. varchar2(15)
         caffeine_content: the caffeine content of the
              drink. varchar2(8)
         milk_type: the type of milk used (if any),
              such as whole milk, soy milk, etc.
              varchar2(15).
         is_sugar_free: indicates if this drink is sugar
              free. Uses char(1), where 'Y' indicates "yes,
              sugar free", and 'N' indicates "No, not sugar
              free". Only accepts Y and N.
*/


create table drink
(item_code  char(12),
 drink_name varchar2(40),
 drink_temp varchar(10) check(drink_temp in ('hot', 'cold')),
 drink_type varchar2(15) check(drink_type in ('tea', 'coffee', 'espresso drink', 'soft drink', 'other')),
 caffeine_content varchar2(8) check(caffeine_content in ('none', 'extreme', 'high', 'medium', 'low')),
 milk_type varchar2(15),
 is_sugar_free char(1) check(is_sugar_free in ('Y', 'N')),
 primary key (item_code),
 foreign key (item_code) references purchase_item
);


-------------------------------------------------


drop table book cascade constraints;


/* Purpose:
        Book is a subtype of purchase_item and
            has data specific to every book that
        the cafe sells.
   
   Attributes:
         item_code: primary key of purchase_item,
              char(12)
         book_title: title of the book. varchar2(255)
         author_lname: last name of the author.
              varchar2(30)
         author_fname: first name of the author.
              varchar2(15)
         copies_in_stock: quantity of books in the
              cafe's inventory. integer used.
*/


create table book
(item_code char(12),
 book_title varchar2(255),
 author_lname varchar2(30),
 author_fname varchar2(15),
 copies_in_stock integer,
 primary key (item_code),
 foreign key (item_code) references purchase_item
);
-------------------------------------------------
drop table book_genre;


/* Purpose:
         Book_genre keeps track of the multi-
         valued attribute book_genre for a book
         instance.


   Attributes:
         book_code: primary key of purchase_item.
         book_genre: Book genres must be in one of the given categories,
                 but can be in multiple.
*/


create table book_genre
(book_code char(12),
 genre varchar2(30)         check(genre in
                 ('Fiction', 'Non-Fiction', 'Fantasy', 'Sci_Fi', 'Mystery', 'Dystopian',
                  'Thriller', 'Horror', 'Romance',
                 'Historical_fiction', 'YA', 'Children',
                 'Graphic_novel', 'History', 'Self_help',
                          'Travel', 'Cooking', 'Business',
                 'Religion_Spirituality', 'True_Crime',
                 'Biography_Memoir', 'Semi_Autobiographical')),
 primary key (book_code, genre),
 foreign key (book_code) references book(item_code)
);


-----------------------------------------


drop table event cascade constraints;


/* Purpose: the event table tracks all past and
         future events at the cafe. an event can be
         a book signing, a fundraiser, a cat training
         class, a combination of these, or none of these.


   Attribute:
         event_id: the unique id number of each event
              instance. uses a 6-digit string of the form
              '123456'. char(6) is used.
         event_name: name of the event. varchar2(100).
         event_start: the time the event starts.
              stored as date, uses HH24:MM to store hours
         event_end_time: the time the event ends.
	      stored as date, uses HH24:MM to store hours
         event_ticket_price: price of admission to the
              event. decimal(5, 2) is used here for numbers
              up to 999.99
         manager_id: the primary key of employee. refers
              to the employee overseeing the event.
         is_book_signing: uses char(1), with 'Y' indicating
               this is a book signing event, and 'N' indicating
               it is not
         is_fundraiser: uses char(1), with 'Y' indicating
               this is a fundraiser event, and 'N' indicating
               it is not
         is_cat_training_class: uses char(1), with 'Y'
               indicating this is a cat training class event,
                and 'N' indicating it is not


*/


create table event
(event_id char(6),
 event_name varchar2(100),
 event_start date,
 event_end date,
 event_ticket_price decimal(5, 2),
 manager_id char(4),
 is_book_signing char(1) check(is_book_signing in ('Y', 'N')),
 is_fundraiser char(1) check(is_fundraiser in ('Y', 'N')),
 is_cat_training_class char(1) check(is_cat_training_class in ('Y', 'N')),
 primary key (event_id),
 foreign key (manager_id) references employee (empl_id)
);


------------------------------------------


drop table book_signing;


/* Purpose: Book_signing is a sub-type of the
                Event supertype. Authors will read
                excerpts from the book, answer audience
                questions, and sign books. All books featured
                in book signings are sold at the cafe as well.


   Attributes:
         event_id: primary key of event. char(6)
         book_code: the book_code is equivalent to the
              item_code


*/


create table book_signing
(event_id char(6),
 book_code char(12),
 primary key (event_id),
 foreign key (event_id) references event,
 foreign key (book_code) references book(item_code)
);


-----------------------------------------


drop table fundraiser;


/* Purpose: Fundraiser is a sub-type of the
                Event supertype. The cafe puts on
            fundraisers to collect donations
                for itself and other affiliated groups
                like animal shelters or other groups
                which are aligned with its mission.


   Attributes:
         event_id: primary key of event. char(6)
         amount_raised: amount raised from the
              fundraising event. decimal(10, 2).
         affiliated_group: These are other groups which
                           can accept donations like animal
                           shelters or book/cat related groups.
			   uses varchar2(40)
*/


create table fundraiser
(event_id char(6),
 amount_raised decimal(10,2),
 affiliated_group varchar2(40),
 primary key (event_id),
 foreign key (event_id) references event
);


-----------------------------------------


drop table cat_training_class;


/* Purpose: Cat_training_class is a sub-type of the
                Event supertype. The cafe hosts
                classes where community members can learn
                about how they can train their cats. For
                example, litter training kittens and basic
                commands like fetch and rollover. Each class
                is led by one instructor.


   Attribute:
         event_id: primary key of event. char(6)
         instructor_lname: last name of the cat
              class instructor. varchar2(30)
         instructor_fname: first name of the cat
              class instructor. varchar2(15)
*/


create table cat_training_class
(event_id char(6),
 instructor_lname varchar2(30),
 instructor_fname varchar2(15),
 primary key (event_id),
 foreign key (event_id) references event
);


----------------------------------------


drop table purchase_item_quantity;


/* Purpose: an association table that tracks
         how many of each item are purchased.


   Attributes:
         purchase_id: primary key of purchase.
              char(12)
         item_code: primary key of purchase_item.
              char(6)
         quantity_purchased: how many of an item
         are purchased in this instance. uses number.
*/


create table purchase_item_quantity
(purchase_id char(12),
 item_code char(12),
 quantity_purchased number,
 primary key (purchase_id, item_code),
 foreign key (purchase_id) references purchase,
 foreign key (item_code) references purchase_item
);
