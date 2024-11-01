        
        #Olist E-commerce Database Setup

This project documents the setup of a MySQL database using a public dataset from Olist, Brazil’s largest online marketplace. The data includes order, product, customer, and seller information from approximately 100,000 transactions conducted between 2016 and 2018. 

 #Project Overview
The primary goal is to structure the dataset within MySQL, facilitating multi-dimensional analysis of e-commerce performance across areas like order status, customer satisfaction, payment methods, delivery efficiency, and more. To enhance insights, geolocation data allows for geographic analyses, and a marketing funnel dataset can be incorporated for marketing-related queries.

            #Data Cleaning
            The raw dataset files required substantial cleaning to ensure compatibility with SQL standards and optimal performance in the MySQL environment. This section explains the steps to prepare the data for successful loading and use in MySQL.

            #Duplicate Removal
            Duplicates were removed from all tables to prevent data redundancy and ensure the integrity of the records.

            #Datetime Formatting
            All date-related fields were converted to SQL-compatible datetime formats. This step involved adjusting formats across various columns, like purchase_date, delivery_date, and review_date, to maintain consistency in the database.

            #Special Character Handling
            Certain text fields contained commas within comments, which could misinterpret data fields. Commas were removed using Excel’s Find and Replace function to ensure proper data parsing during loading.

            #Breakline Removal
            Some comment fields included line breaks, which SQL interprets as new rows, causing issues during data import. Using Excel’s Find and Replace with Ctrl + J, these line breaks were removed, ensuring smooth data loading.

            #Encoding Standardization
            To support special characters in customer names, cities, and other text fields, the files were saved in UTF-8 format using Notepad. This encoding ensured that all characters were compatible with MySQL’s reading requirements.

            #Directory Setup for File Loading
            All cleaned CSV files were saved to a specific directory (C:\ProgramData\MySQL\MySQL Server 9.0\Uploads). This allowed for easy access during the data loading stage and bypassed MySQL’s secure-file-priv restriction, which otherwise limits file imports from external locations.

    #Database Creation
    With the data cleaned and ready, the next step was to set up the MySQL database structure to hold the various tables. Each table is designed to capture unique aspects of the dataset, such as customer details, order items, payments, reviews, and products.

    #Database Initialization
    A new database named Brazil was created in MySQL to house the Olist dataset.

    #Character Encoding
    UTF-8 character encoding was set to ensure compatibility with special characters across all tables.

    #Table Structure
    The database structure was organized into seven key tables, each dedicated to a specific component of the dataset:

            Customers Table: Captures customer details such as unique customer IDs, location (city and state), and zip code.
            Order Items Table: Stores information on individual items within orders, including product and seller IDs, item price, and freight cost.
            Payments Table: Contains payment details, including payment methods, sequential installments, and amounts.
            Order Reviews Table: Holds customer feedback with review scores, titles, messages, and review timestamps.
            Orders Table: Tracks each order’s status, timestamps for order and delivery events, and links to customer IDs.
            Products Table: Includes product dimensions, weight, and category names.
            Sellers Table: Provides seller details, including location (city and state) and zip code.
            Geolocation Table: Maps Brazilian zip codes to geographical coordinates, allowing for geographic-based queries and analyses.
            Each table was created with primary keys and relevant constraints to maintain data integrity and support efficient querying.

#Data Loading Process
Once the database structure was in place, the cleaned CSV files were imported into their respective tables in MySQL using the LOAD DATA INFILE command. Below are the main steps followed:

#File Loading Path
The LOAD DATA INFILE command was used to load each cleaned CSV file from the designated directory (C:\ProgramData\MySQL\MySQL Server 9.0\Uploads). This directory was chosen to bypass MySQL’s secure-file-priv restriction, allowing direct loading without security issues.

#Field Delimiters and Headers
Each file was loaded with fields delimited by commas, and the first line (header) was ignored to avoid loading column names as data.

#Table-by-Table Loading
Data was loaded sequentially into each table:

        Customers: Customer data with location information.
        Geolocation: Geographic coordinates for zip codes.
        Order Items: Details on items within orders, including pricing and shipping deadlines.
        Orders: General order details, including status and timestamps.
        Payments: Payment methods and amounts for each order.
        Products: Dimensions, weight, and category of each product.
        Sellers: Seller location data, including city and state.
        Order Reviews: Customer reviews, scores, and messages associated with each order.


#Final Notes
This database structure provides an organized and efficient way to analyze e-commerce transactions in the Brazilian market. The following are a few key considerations for future work:

Indexing: Adding indexes on frequently queried columns, such as customer_id and order_id, can enhance performance.
Marketing Funnel: Incorporating the Marketing Funnel dataset by Olist would allow for additional insights into the sales and marketing aspects of customer behavior.