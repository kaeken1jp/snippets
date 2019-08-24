# postgres snippets

## install
```bash
$ brew install postgresql # mac
$ yum install postgresql # linux

$ which psql
/usr/local/bin/psql
```

## login
```bash
$ export PGPASSWORD=<PASSWORD>
$ psql -h <HOSTNAME> \
  -U <USER_NAME> \
  -d <DB_NAME>
```

## logut
```
=> \q
```

## list db
```
=> \l
```

## list table
```
=> \dt
```

## desc table
```
=> \d+ TABLE_NAME
```
