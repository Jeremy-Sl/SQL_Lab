# Week 2 - Schema Design, CRUD Operations, and Query Fundamentals

## 🗓️ Week Summary

**Objective:**  
- Design a small inventory and maintenance schema  
- Create relational tables with primary and foreign keys  
- Insert sample data  
- Write SELECT queries, including JOINs  
- Document schema and query results

---

## 🏢 Architecture  

**Database:** InventoryDB  
**Tables:** Servers, MaintenanceRecords  
**Host:** SOR-SQL01 (SQL Server 2022 on Windows Server 2022)

---

## 🗄️ Schema Overview

| Table | Description |
|-------|-------------|
| Servers | Stores information about servers including Hostname, OS, and InstalledDate |
| MaintenanceRecords | Logs maintenance events for servers, including date, performed by, and notes |

---

## 🔎 Tables and Keys

**Servers Table**  
- ServerID (Primary Key, Identity)  
- Hostname (nvarchar)  
- OS (nvarchar)  
- InstalledDate (date)

**MaintenanceRecords Table**  
- RecordID (Primary Key, Identity)  
- ServerID (Foreign Key referencing Servers.ServerID)  
- MaintenanceDate (date)  
- PerformedBy (nvarchar)  
- Notes (nvarchar)

**Notes:**  
- Primary keys ensure unique identification of each row.  
- Foreign key links maintenance records to the appropriate server.

---

## 📝 Queries

**Basic Queries**  
- SELECT all servers  
- SELECT all maintenance records

**Join Queries**  
- List all servers with their latest maintenance date using a LEFT JOIN and GROUP BY.
- List all servers with maintenance records using INNER JOIN
- List all servers without maintenance using LEFT JOIN with WHERE M.MaintenanceDate IS NULL

---

## 🔎 Query Results

**Servers Table Result:**  
SQL_Select_Servers.png

**MaintenanceRecords Table Result:**  
SQL_Select_MaintenanceRecords.png

**Left Join Query Result:**  
SQL_LeftJoin.png

**Inner Join Query Result:**  
SQL_InnerJoin.png

**Left Join NULL Query Result:**  
SQL_LeftJoinNULL.png

---

## 📝 Notes & Reflections

This week, I designed a relational database schema reflecting real-world systems engineering concepts. I practiced creating tables with primary and foreign keys, inserting data, and running SELECT queries including JOINs to combine data from related tables.

Key takeaways:
- Primary keys and identity columns simplify managing unique records.
- Foreign keys enforce referential integrity, preventing orphaned records.
- JOIN queries are essential for retrieving related data across tables.
- You can't use <=> with Null as it is not a value, you must instead use <IS>

I also learned about the Logical Processing Order of an SQL query, and how it affects aliases being declared:

|Step	| Clause|  
|-----|-------|
|1 | FROM and JOIN (aliases declared here)|  
|2 | WHERE|  
|3 | GROUP BY|  
|4 | HAVING|  
|5 | SELECT|  
|6 | ORDER BY|  

And about JOIN types:

|Type|	Description|
|-----|------------|
|INNER JOIN|	Only shows rows with matches on both sides.|
|LEFT JOIN|	Shows all rows from the left table, and matching rows from the right — returns NULLs for right-side columns when there is no match.|
|RIGHT JOIN|	Shows all rows from the right table, with matches from the left. (Rarely used)|
|FULL JOIN|	Shows all rows from both sides — matches where it can, NULLs where it can’t. (Also rare)|

---

## 🔗 Files in this folder

- Week2_schema_and_queries.sql  
- Week2_Design.md  
- Screenshots/

