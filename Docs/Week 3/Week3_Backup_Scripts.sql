-- Week 3 - Backup & Restore Scripts
-- Author: Jeremy
-- Target Database: InventoryDB

-- Step 1: Set recovery model to FULL
ALTER DATABASE InventoryDB SET RECOVERY FULL;

-- Step 2: Full Backup
BACKUP DATABASE InventoryDB
TO DISK = 'F:\Backups\InventoryDB_Full.bak';

-- Step 3: Differential Backup
BACKUP DATABASE InventoryDB
TO DISK = 'F:\Backups\InventoryDB_Diff.bak'
WITH DIFFERENTIAL;

-- Step 4: Transaction Log Backup
BACKUP LOG InventoryDB
TO DISK = 'F:\Backups\InventoryDB_Log.trn';

-- Step 5: Insert test data before simulating data loss
INSERT INTO Servers (Hostname, OS, InstalledDate)
VALUES ('DELETED-SVR', 'Windows Server 2016', '2024-05-01');

-- Step 6: Log Backup before deletion
BACKUP LOG InventoryDB
TO DISK = 'F:\Backups\InventoryDB_LogBeforeDelete.trn';

-- Step 7: Simulate data loss
DELETE FROM Servers
WHERE Hostname = 'DELETED-SVR';

-- Step 8: RESTORE - Full backup (with NORECOVERY)
RESTORE DATABASE InventoryDB
FROM DISK = 'F:\Backups\InventoryDB_Full.bak'
WITH NORECOVERY;

-- Step 9: RESTORE - Differential backup (with NORECOVERY)
RESTORE DATABASE InventoryDB
FROM DISK = 'F:\Backups\InventoryDB_Diff.bak'
WITH NORECOVERY;

-- Step 10: RESTORE - Transaction log backup (with RECOVERY)
RESTORE LOG InventoryDB
FROM DISK = 'F:\Backups\InventoryDB_LogBeforeDelete.trn'
WITH RECOVERY;

