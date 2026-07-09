# /*

# Create Database and Schemas

Purpose:
This script creates a database named 'DataWarehouse'.

```
- If the database already exists, it will be deleted first.
- A new 'DataWarehouse' database will then be created.
- After that, three schemas will be created:
    • bronze
    • silver
    • gold
```

Note:
If the 'DataWarehouse' database already exists, it will be dropped before creating a new one.
This will permanently remove all existing data, so make sure to back up anything important before running this script.
*/
USE master;

GO
  
-- Drop and recreate the 'DataWarehouse' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')

BEGIN

    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;

END;

GO

-- Create the 'DataWarehouse' database

CREATE DATABASE DataWarehouse;

GO
  
USE DataWarehouse;

GO

-- Create Schemas

CREATE SCHEMA bronze;

GO



CREATE SCHEMA silver;

GO



CREATE SCHEMA gold;

GO
