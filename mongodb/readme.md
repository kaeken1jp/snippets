[The most popular database for modern apps | MongoDB](https://www.mongodb.com/)


# concept

![](https://i.gyazo.com/0faa8222efd17ed826895dcad8c4fbd0.png)

# install(Mac/HomeBrew)

```sh
sudo chown -R $(whoami) /usr/local/Cellar

brew update

brew tap mongodb/brew

brew install mongodb-community

$ mongo --version
MongoDB shell version v4.2.2
git version: xxxxxxx
allocator: system
modules: none
build environment:
    distarch: x86_64
    target_arch: x86_64
```

# start
```sh
# start
brew services start mongodb-community

# start
mongo
```

# show db
```
> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
```

# use/drop db
```
> use mydb;
switched to db mydb

> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB

> db.createCollection("users");
{ "ok" : 1 }

> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
mydb    0.000GB

> db.stats();
{
	"db" : "mydb",
	"collections" : 1,
	"views" : 0,
	"objects" : 0,
	"avgObjSize" : 0,
	"dataSize" : 0,
	"storageSize" : 4096,
	"numExtents" : 0,
	"indexes" : 1,
	"indexSize" : 4096,
	"scaleFactor" : 1,
	"fsUsedSize" : 239249063936,
	"fsTotalSize" : 499963174912,
	"ok" : 1
}

> db.dropDatabase();
{ "dropped" : "mydb", "ok" : 1 }
> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
```

# create/rename/drop collection
```
> use mydb;
switched to db mydb

> db.createCollection("users");
{ "ok" : 1 }
> show collections;
users

> db.users.renameCollection("customers");
{ "ok" : 1 }
> show collections;
customers

> db.customers.drop();
true
> show collections;
```




