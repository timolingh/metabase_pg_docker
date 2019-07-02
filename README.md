# metabase_pg_docker <!-- omit in toc --> 
This set up is verified to work.  It configures an instance of Metabase with Postgres as an application database and launches it via `docker-compose`.  It is pretty much a clone of:  https://github.com/thiras/metabase-docker-compose


# Table of Contents <!-- omit in toc --> 
- [Prepering](#prepering)
- [Run](#run)


## Prepering
First, you need to create `.env` file;
```
cp .env.example .env
```

Then, you need to change passwords at `.env` file. Do not forget adjust `JAVA_TIMEZONE` environment according to your timezone. You should also adjust `PGADMIN_DEFAULT_EMAIL` variable with your email.

## Run
```
docker-compose up -d
```

and then point to `localhost:3000`. It may take couple of minutes to get a response until containers are up and running. You may use PgAdmin4 in case needed from `localhots:3001`.

