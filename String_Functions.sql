/* ============================================================================== 
   SQL String Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL string functions, which allow 
   manipulation, transformation, and extraction of text data efficiently.

   Table of Contents:
     1. Manipulations
        - CONCAT
        - LOWER
        - UPPER
	- TRIM
	- REPLACE
     2. Calculation
        - LEN
     3. Substring Extraction
        - LEFT
        - RIGHT
        - SUBSTRING
=================================================================================
*/

/* ============================================================================== 
   CONCAT() - String Concatenation
=============================================================================== */

-- Concatenate first name and country into one column

USE MyDatabase

SELECT 
    first_name,
    country,
    CONCAT(first_name, '-', country) AS full_info,
    LOWER(first_name) AS lower_case_name,
     UPPER(first_name) AS upper_case_name
FROM dbo.customers



/* ============================================================================== 
   LOWER() & UPPER() - Case Transformation
=============================================================================== */

-- Convert the first name to lowercase
SELECT 
    LOWER(first_name) AS lower_case_name
FROM dbo.customers

-- Convert the first name to uppercase
SELECT 
    UPPER(first_name) AS upper_case_name
FROM dbo.customers



/* ============================================================================== 
   TRIM() - Remove White Spaces
=============================================================================== */

-- Find customers whose first name contains leading or trailing spaces
SELECT 
    first_name,
	LEN(first_name) len_name,
	LEN(TRIM(first_name)) len_trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) flag
FROM dbo.customers
WHERE LEN(first_name)  != LEN(TRIM(first_name))
-- WHERE first_name != TRIM(first_name)



/* ============================================================================== 
   REPLACE() - Replace or Remove old value with new one
=============================================================================== */
-- Remove dashes (-) from a phone number
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '/') AS clean_phone

-- Replace File Extence from txt to csv
SELECT
'report.txt' AS old_filename,
REPLACE('report.txt', '.txt', '.csv') AS new_filename



/* ============================================================================== 
   LEN() - String Length & Trimming
=============================================================================== */

-- Calculate the length of each customer's first name
SELECT 
    first_name, 
    LEN(first_name) AS name_length
FROM dbo.customers



/* ============================================================================== 
   LEFT() & RIGHT() - Substring Extraction
=============================================================================== */

-- Retrieve the first two characters of each first name
SELECT 
    first_name,
    LEFT(TRIM(first_name), 2) AS first_2_chars
FROM dbo.customers

-- Retrieve the last two characters of each first name
SELECT 
    first_name,
    RIGHT(first_name, 2) AS last_2_chars
FROM dbo.customers


/* ============================================================================== 
   SUBSTRING() - Extracting Substrings
=============================================================================== */

-- Retrieve a list of customers' first names after removing the first character
SELECT 
    first_name,
    SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS trimmed_name
FROM dbo.customers	
	
