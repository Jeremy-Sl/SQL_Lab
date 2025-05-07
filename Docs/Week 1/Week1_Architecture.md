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
_Paste or summarize the output here_

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
_Paste result or describe the output_

---

## 💡 Additional System Info (Optional)

**Query:** CPU & Memory info  
`SELECT cpu_count, physical_memory_kb / 1024 AS Memory_MB FROM sys.dm_os_sys_info;`

**Result:**  
_Paste the output here_

---

## 📸 Screenshots

1. SQL Server version query result (`@@VERSION`)  
2. Recovery models query result (`sys.databases`)  
3. `SELECT * FROM HelloWorld` result



---

## 📝 Notes & Reflections

- Your thoughts about learning SQL Server so far  
- Anything interesting or challenging you encountered

---

## 🔗 Files in this folder

- `Week1_initial_queries.sql`  
- `Week1_Architecture.md`  
- `screenshots/`



