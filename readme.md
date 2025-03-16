# Database
This files are meant to create and seed a postgres database for use within a docker container. When this folder is bound to the `docker-entrypoint-initdb.d` folder in the postgres container, these scripts (both sql and bash) will be run in alphabetical order.

The initial create/seed process only happens if the database is empty. If you want to re-run the scripts, you will need to delete the database and start over. Updates should be handled with migrations.

**hint** use your alias `rmpostgres` (`rm -rf $USERPROFILE/data/pgdata`) to delete the database and start over

Manually connect to the db from the host machine (note does not use conventional port 5432):
```
	psql -h localhost -p 5433 -U postgres -d checklist
```

## Resources
* [Remember how psql do](https://www.tutorialspoint.com/postgresql/postgresql_insert_query.htm)
* [mapping PascalCase to snake_case](https://github.com/efcore/EFCore.NamingConventions)
