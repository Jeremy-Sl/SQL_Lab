# Week 1 - SQL Server Architecture & Basic Queries

## 🗓️ Week Summary

**Objective:**  
- Explore SQL Server architecture and system databases  
- Connect to SQL Server using SSMS  
- Run basic queries and create the first test database/table

---

## 🏢 Architecture  

**SOR-SQL01**  
CPU- 4vCPU  
RAM- 8GB  
Disks- 32GB OS SSD, 30GB Data SSD  
Host- ProxMox Node 1  

---

## 🔎 SQL Server Version

**Server Version Query:**  
`SELECT @@VERSION;`

**Result:**  
Microsoft SQL Server 2022 (RTM) - 16.0.1000.6 (X64)   Oct  8 2022 05:58:25   Copyright (C) 2022 Microsoft Corporation  Developer Edition (64-bit) on Windows Server 2022 Standard Evaluation 10.0 <X64> (Build 20348: ) (Hypervisor) 

---

## 🗄️ System Databases Overview

| Database | Purpose | Notes |
|----------|---------|--------|
| master   | Stores instance-wide metadata (logins, linked servers, records of databases in the instance) |Breaking this could cause the instance itself to fail|
| model    | The database template used when creating new databases|Any new database copies this structure. If you want to change how new DBs are created, edit this|
| msdb     | Manages jobs, alerts and backups|Important for anything related to Automation and Monitoring|
| tempdb   | Stores temporary tables, result sets, and sorting operations |Resets every time the instance is restarted, so no long-term storage|

---

## 📝 Basic Queries

**Query:** List of databases and recovery models  
`SELECT name, recovery_model_desc FROM sys.databases;`

**Result:**  
master- Simple  
tempdb- Simple  
model- Full  
msdb- Simple  

**Recovery Types**  
Recovery models control how SQL Server handles transaction logs, defining how much data can be recovered after a failure, and what kind of backups are possible.

**Simple**- Some changes are logged, but log file is truncated. Only full and differential backups, no t-log backups.  
**Full**- Every change is fully logged, can restore any point in time. Requires regular full, differential and t-log backups.    
**Bulk Logged**- Like Full, but certain operations (bulk inserts, index rebuilds) are minimally logged for better performance. Transaction log backups still possible, but point-in-time recovery is limited.

---

## 🔨 First Test Database and Table

**Database Created:** `TestDB`  
**Table Created:** `HelloWorld`

**Key Script Summary:**  
- Created database TestDB  
- Created table HelloWorld with ID and Message columns  
- Inserted a test record ('Hello, SQL Server!')  
- Ran SELECT * to verify data

**Query Result:**  
ID = 1
Message = "Hello, SQL Server!"

---

## 💡 Additional System Info (Optional)

**Query:** CPU & Memory info  
`SELECT cpu_count, physical_memory_kb / 1024 AS Memory_MB FROM sys.dm_os_sys_info;`

**Result:**  
cpu_count = 4  
Memory_MB = 8170  
(SQL_CPU_Memory.png)

---

## 📸 Screenshots

1. SQL_Version.png- SQL Server version query result (`@@VERSION`)  
2. SQL_Recovery.png- Recovery models query result (`sys.databases`)
3. SQL_CPU_Memory.png- Hardware specs query result (`sys.dm_os_sys_info`)
4. SQL_SELECT.png- `SELECT * FROM HelloWorld` result



---

## 📝 Notes & Reflections

This week, I set up my SQL Server environment and connected using SQL Server Management Studio (SSMS) for the first time. I explored the system databases (master, model, msdb, tempdb) and learned their different roles in managing the SQL Server instance.

I ran my first T-SQL queries to:
- Check the SQL Server version.
- List all existing databases and their recovery models.
- View the server’s CPU and memory resources.

Then I created my first database (`TestDB`) and table (`HelloWorld`). I inserted data into the table and successfully queried it, which helped me understand how SQL Server stores and retrieves data.

Key takeaways:
- System databases each have specific roles and are essential for SQL Server’s operation.
- The recovery model of a database determines what kinds of backups and restores are possible.
- Using the `IDENTITY` and `PRIMARY KEY` constraints simplifies managing unique row identifiers.
- SSMS makes it easy to run queries, create databases, and browse data.

At first, opening a query window and writing SQL felt unfamiliar, but after running a few commands, I became more comfortable. The ability to create databases and tables using scripts was a big milestone. I now feel more confident working with SQL Server and look forward to diving deeper in Week 2!

---

## 🔗 Files in this folder

- `Week1_initial_queries.sql`  
- `Week1_Architecture.md`  
- `screenshots/`



