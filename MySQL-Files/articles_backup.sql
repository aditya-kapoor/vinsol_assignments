/* Backing Up Database */
mysqldump -u root vinsol_assignments > vinsol_assignments_backup.sql
/*Restoring From the SQL File */
mysqldump -u root vinsol_assignments < vinsol_assignments_backup.sql
