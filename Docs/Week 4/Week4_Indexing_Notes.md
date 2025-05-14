# Week 4 - Indexing & Performance Tuning

## 🗓️ Week Summary

**Objective:**  
- Learn how indexes affect query performance  
- Understand clustered, non-clustered, and composite indexes  
- Identify slow queries and test indexing impact  
- Measure performance using execution plans, IO, and timing stats  
- Document indexing strategies and before/after improvements

---

## 🏢 Environment

**Database:** `InventoryDB`  
**Tables:** `Servers`, `MaintenanceRecords`  
**Host:** `SOR-SQL01` (SQL Server 2022 on Windows Server 2022)  
**Indexing Tools:** Execution Plans, `SET STATISTICS IO / TIME`

---

## 🧱 Indexing Concepts

| Index Type         | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| Clustered Index     | Determines the physical order of data in the table (only one per table)     |
| Non-Clustered Index | Separate structure with a pointer to the data row                           |
| Unique Index        | Prevents duplicate values in the indexed column(s)                          |
| Composite Index     | Index on two or more columns, used for multi-column filter/sort operations |

---

## 🔎 Baseline Query Performance

### Sample Query (Before Indexing)

```
SELECT S.Hostname, COUNT(M.RecordID)
FROM Servers S
LEFT JOIN MaintenanceRecords M ON S.ServerID = M.ServerID
GROUP BY S.Hostname;
```
Output:

- Execution Plan: `NoIndex_ExecutionPlan.png`
- Statistics IO & TIME: `Statistics_IO_Time_Before.png`

## 🛠️ Index Creation  
Index 1: Non-clustered index on MaintenanceRecords.ServerID
```
CREATE NONCLUSTERED INDEX IX_Maintenance_ServerID
ON MaintenanceRecords (ServerID);
```

## 🔁 Post-Index Query Performance  
Re-run the same query after index creation.

Output:
- Execution Plan: WithIndex_ExecutionPlan.png
- Statistics IO & TIME: Statistics_IO_Time_After.png

## 📊 Performance Comparison  
|Metric	|Before Index	|After Index|
|------|-----------|-------------|
|Logical Reads	|9 (MaintenanceRecords), 2 (Servers)	|9 (MaintenanceRecords), 2 (Servers)|
|Elapsed Time (ms)	|0-1ms	|0-25ms|
|Execution Plan Observation	|Clustered Index Scan|	NonClustered Index Scan|

## 📝 Notes & Reflections  
This week I explored how indexes influence SQL Server performance. I learned how to read execution plans, use SET STATISTICS IO and SET STATISTICS TIME, and apply indexing strategies to reduce resource usage and improve response times.

Key takeaways:

- Clustered indexes define row order and improve PK lookups  
- Non-clustered indexes boost performance on filterable/joinable columns  
- Composite indexes are powerful for multi-column queries  
- Indexing transforms costly table scans into efficient index seeks

  Although the index was created and used in the execution plan, performance metrics did not significantly improve. This is expected with small tables, where SQL Server may still prefer scans. In larger datasets, the benefits of indexing would become much more apparent. This exercise helped reinforce how indexing decisions depend heavily on data volume and query patterns.

## 🔗 Files in this folder
- Week4_Indexing_Notes.md
- Week4_Indexing_Scripts.sql
- Screenshots/








