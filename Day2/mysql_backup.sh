#!/bin/bash
DATE=$(date +%F)
mysqldump -u maha -p'yourpassword' my_database > /home/azureuser/backups/my_database_$DATE.sql

# Upload to Azure Blob (replace with your values)
az storage blob upload \
  --account-name <yourstorageaccount> \
  --container-name <yourcontainer> \
  --name my_database_$DATE.sql \
  --file /home/azureuser/backups/my_database_$DATE.sql \
  --auth-mode login
