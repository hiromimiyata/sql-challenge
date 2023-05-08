# sql-challenge
Goal: Design tables to hold data from 6 CSV files of employee data and perform data modeling, data engineering, and data analysis. 

Part 1: Data Modeling

I created an Entity Relationship Diagram (ERD) of the tables based on the provided CSV files using QuickDBD.

Part 2: Data Engineering

Using the provided information, I created a table schema for each of the six CSV files. For each table, I specified the data types, primary keys, foreign keys, and other constraints.
I ensured that the primary keys were unique, and I created composite keys where necessary to uniquely identify a row. I also created the tables in the correct order to handle the foreign keys.
After creating the table schemas, I imported each CSV file into its corresponding SQL table.

Part 3: Data Analysis
Listed the employee number, last name, first name, sex, and salary of each employee.
Listed the first name, last name, and hire date for the employees who were hired in 1986.
Listed the manager of each department along with their department number, department name, employee number, last name, and first name.
Listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Listed first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Listed each employee in the Sales department, including their employee number, last name, and first name.
Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Listed the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
