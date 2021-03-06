if in the same dir as the scripts: 

supervisorctl stop termserver

./snowowl_migration_4.6_to_4.7_phase_1_table_creation.sh admin snomed
./snowowl_migration_4.6_to_4.7_phase_2_table_population.sh admin snomed SNOMEDCT sct
./snowowl_migration_4.6_to_4.7_phase_3_old_table_deletion.sh admin snomed

supervisorctl start termserver


change admin to relevant admin/root password

https://github.com/b2ihealthcare/snow-owl/blob/5.x/documentation/src/main/asciidoc/migration_guide.adoc#470

4.7.0

There are two ways to migrate data from 4.6 to 4.7. Either run the provided SQL statements against the database or use the shell scripts which migrate the data in three steps.

SQL

The migration_4.6_to_4.7/snowowl_migration_4.6_to_4.7_terminology_snomed.sql file contains the necessary SQL statements for the migration. Execute each SQL statement against the database to migrate your data.

Shell scripts

The migration_4.6_to_4.7 folder contains three shell scripts for the migration.

The first script snowowl_migration_4.6_to_4.7_phase_1_table_creation.sh creates the new Code System tables for the given terminology. Use the following command to run the script:

./migration_4.6_to_4.7/snowowl_migration_4.6_to_4.7_phase_1_table_creation.sh admin snomed
The second script snowowl_migration_4.6_to_4.7_phase_2_table_population.sh populates the previously created tables with the necessary data. Use the following command to run the script:

./migration_4.6_to_4.7/snowowl_migration_4.6_to_4.7_phase_2_table_population.sh admin snomed SNOMEDCT sct
The third script snowowl_migration_4.6_to_4.7_phase_3_old_table_deletion.sh deletes the old Code System tables which are no longer needed. Use the following command to run the script:

./migration_4.6_to_4.7/snowowl_migration_4.6_to_4.7_phase_3_old_table_deletion.sh admin snomed
Index update

After the database migration, Code System and Code System Version indexes must be updated. In order to do this, start the terminology server with the -Dsnowowl.reindex=true VM argument. If the reindex argument is missing or false, the index update process is skipped.

