
# Table of Contents

1.  [Humboldt Community Access and Resource Center: The Studio - Portfolio Manaement System](#org1055606)
    1.  [Project Overview](#org844fe04)
    2.  [Acknowledgments](#orgab8b037)
    3.  [Dependencies](#org572c906)
    4.  [Installation](#org33124ce)
    5.  [ADMINISTRATION](#orgabfd0c4)



<a id="org1055606"></a>

# Humboldt Community Access and Resource Center: The Studio - Portfolio Manaement System


<a id="org844fe04"></a>

## Project Overview

This project is designed to catalog and manage artist profiles, portfolios, and storage for the Humboldt Community Access and Resource center.
It provides tools for users to organize and showcase their work effectively, and for staff to update and manage The Studio&rsquo;s collection.


<a id="orgab8b037"></a>

## Acknowledgments

This project was made possible with the help of:

-   The Cal Poly Humboldt CS club under the leadership of Lily Yassemi
-   The MDN web development reference and Django documentation
-   Third-party Django tutorials provided by FreeCodeCamp and GeeksForGeeks
-   Our lovely mentors, without whom this would not be possible: Todd, Edwin and John.
-   Guidance and direction


<a id="org572c906"></a>

## Dependencies

-   This project was built against the following:
    -   MariaDB
    -   Python 3.12
-   Additionally, there are required python packages which are included in the requirements.txt file.


<a id="org33124ce"></a>

## Installation

-   This tool was deployed using MacOS using brew, but the process should be similar with other UNIX systems (linux etc.) with package managers.
    -   Install dependencies as directed for your platform, using the following resources:
        <https://wiki.python.org/moin/BeginnersGuide/Download>
        <https://mariadb.com/kb/en/getting-installing-and-upgrading-mariadb/>
-   clone this repository using the following command:
    
          git clone https://github.com/kikobarr/HCAR_Portfolio_Mgmt/
          cd HCAR_Portfolio_Mgmt
          #+end_src bash
        - Create and enter a python virtual environment
          #+begin_src bash
        python3 -m venv venv
        source ./venv/bin/activate
-   Install python dependencies
    
        pip install -r requirements.txt
-   Start and configure your sql server
    
        service mariadb start
        mysql -u root -p
    
    -   from within the database software. create a user for the database
        
            >> CREATE USER 'root'@'localhost' IDENTIFIED BY 'mySecurepassword';
            >> CREATE SCHEMA mySchemaName
            >> .exit
-   configure django setings
    in settings.py, ensure that your credentials match your mariaDB credentials
    
        DATABASES = {
            # ...
            'NAME': 'mySchemaName',
            'PASSWORD': 'mySecurePassword'
            # ...
-   Create a superuser for adminstering the database
    
        python3 manage.py createsuperuser
        #end_src python
        - Run the server
          #+begin_src python
        python3 manage.py runserver


<a id="orgabfd0c4"></a>

## ADMINISTRATION

-   Log in to 127.0.0.1:8080/admin

