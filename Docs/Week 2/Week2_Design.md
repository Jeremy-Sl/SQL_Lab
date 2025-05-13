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

**Join Query**  
- List all servers with their latest maintenance date using a LEFT JOIN and GROUP BY.

---

## 🔎 Query Results

**Servers Table Result:**  
_(Add table or screenshot reference here)_

**MaintenanceRecords Table Result:**  
_(Add table or screenshot reference here)_

**Join Query Result:**  
_(Add table or screenshot reference here)_

---

## 📸 Screenshots

1. Servers_Select.png  
2. MaintenanceRecords_Select.png  
3. Join_Query.png

(Saved in Week2/Screenshots/)

---

## 📝 Notes & Reflections

This week, I designed a relational database schema reflecting real-world systems engineering concepts. I practiced creating tables with primary and foreign keys, inserting data, and running SELECT queries including JOINs to combine data from related tables.

Key takeaways:
- Primary keys and identity columns simplify managing unique records.
- Foreign keys enforce referential integrity, preventing orphaned records.
- JOIN queries are essential for retrieving related data across tables.
- Writing T-SQL queries for data retrieval became more comfortable with practice.

I encountered minor challenges understanding JOIN syntax at first, but working through examples helped clarify how LEFT JOIN and GROUP BY work together to summarize data.

---

## 🔗 Files in this folder

- Week2_schema_and_queries.sql  
- Week2_Design.md  
- Screenshots/

