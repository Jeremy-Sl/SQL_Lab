# Week 3 - Backup & Restore Fundamentals

## 🗓️ Week Summary

**Objective:**  
- Understand SQL Server backup types and recovery models  
- Configure InventoryDB for FULL recovery  
- Perform full, differential, and transaction log backups  
- Simulate and recover from data loss  
- Document all backup/restore operations

---

## 🏢 Environment

**Database:** `InventoryDB`  
**Recovery Model:** FULL  
**Backup Folder:** `C:\Backups\InventoryDB\`  
**Host:** `SOR-SQL01` (SQL Server 2022 on Windows Server 2022)

---

## 🔁 Recovery Model

**Initial Recovery Model:** `[Simple / Full / Other]`  
**Changed To:** `Full`  

**Command Used:**

`ALTER DATABASE InventoryDB SET RECOVERY FULL;`  

Screenshot: Select_RecoveryModel.png

## 🗄️ Backup Types
|Type	|Purpose	|Notes|
|-----|---------|-----|
|Full|	Complete backup of the entire database|	Required before differential or t-log backups|
|Differential|	Backs up changes since the last full backup|	Smaller and faster than full backups|
|Transaction Log|	Captures log activity since last t-log backup|	Needed for point-in-time recovery|

## 📦 Backup Tasks
✅ Full Backup

`BACKUP DATABASE InventoryDB`  
`TO DISK = 'C:\Backups\InventoryDB_Full.bak';`  

Screenshot: Backup_Full.png

✅ Differential Backup

`BACKUP DATABASE InventoryDB`  
`TO DISK = 'C:\Backups\InventoryDB_Diff.bak'`   
`WITH DIFFERENTIAL;`  

Screenshot: Backup_Diff.png

✅ Transaction Log Backup  

`BACKUP LOG InventoryDB`  
`TO DISK = 'C:\Backups\InventoryDB_Log.trn';`  

Screenshot: Backup_Log.png  

## 🔄 Restore Simulation  
✅ Step 1: Insert test data

`INSERT INTO Servers (Hostname, OS, InstalledDate)`   
`VALUES ('DELETED-SVR', 'Windows Server 2016', '2024-05-01');`  

✅ Step 2: Take a log backup before delete

`BACKUP LOG InventoryDB`   
`TO DISK = 'C:\Backups\InventoryDB_LogBeforeDelete.trn';`  

✅ Step 3: Simulate data loss

`DELETE FROM Servers`   
`WHERE Hostname = 'DELETED-SVR';`  

✅ Step 4: Restore sequence  
Restore full backup:

`RESTORE DATABASE InventoryDB`   
`FROM DISK = 'C:\Backups\InventoryDB_Full.bak'`   
`WITH NORECOVERY;`  

✅ Step 5: Restore differential backup:


`RESTORE DATABASE InventoryDB`   
`FROM DISK = 'C:\Backups\InventoryDB_Diff.bak'`   
`WITH NORECOVERY;`  

✅ Step 6: Restore transaction log backup:

`RESTORE LOG InventoryDB`   
`FROM DISK = 'C:\Backups\InventoryDB_LogBeforeDelete.trn'`   
`WITH RECOVERY;`  

Screenshots:

- Restore_Database_Full.png  
- Restore_Database_Diff.png  
- Restore_Database_Log.png  

## 📝 Notes & Reflections  
This week I learned how SQL Server handles backup strategies and how recovery models influence what backup types are possible. Setting the recovery model to FULL allowed me to take a full backup, followed by differential and transaction log backups. I simulated a data loss event and successfully restored the database using a combination of backups.

Key takeaways:

- FULL recovery model is required for point-in-time recovery.  
- Transaction log backups are only possible when recovery model is FULL.  
- RESTORE operations require correct use of WITH NORECOVERY and WITH RECOVERY to chain backups correctly.  
- Testing restore procedures is just as important as taking backups — a backup is useless if it can't be restored.

## 🔗 Files in this folder
- Week3_Backup_Notes.md  
- Week3_Backup_Scripts.sql  
- Screenshots/
