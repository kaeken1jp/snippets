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


# insert/count/find document
```
> use mydb;
switched to db mydb

> db.users.insert(
... {
... name: "hoge",
... score: 30
... }
... );
WriteResult({ "nInserted" : 1 })

> show collections;
users

> db.users.insert({ name: "fuga", score: 50, tag: ["web", "mobile"]});
WriteResult({ "nInserted" : 1 })

> db.users.count();
2

> db.users.find();
{ "_id" : ObjectId("5e172a79a3b01a7b8d4f41a5"), "name" : "hoge", "score" : 30 }
{ "_id" : ObjectId("5e172ab5a3b01a7b8d4f41a6"), "name" : "fuga", "score" : 50, "tag" : [ "web", "mobile" ] }

> for (var i = 0; i < 10; i++) {
... db.users.insert({score: Math.random()});}
WriteResult({ "nInserted" : 1 })

> db.users.count();
12

> db.users.find();
{ "_id" : ObjectId("5e172a79a3b01a7b8d4f41a5"), "name" : "hoge", "score" : 30 }
{ "_id" : ObjectId("5e172ab5a3b01a7b8d4f41a6"), "name" : "fuga", "score" : 50, "tag" : [ "web", "mobile" ] }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41a7"), "score" : 0.2898016761772906 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41a8"), "score" : 0.3749281662647115 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41a9"), "score" : 0.4215328478896615 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41aa"), "score" : 0.5305842352556581 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41ab"), "score" : 0.28976023620569147 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41ac"), "score" : 0.66404725426431 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41ad"), "score" : 0.412046409348093 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41ae"), "score" : 0.4589595417035396 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41af"), "score" : 0.3417647155688526 }
{ "_id" : ObjectId("5e172b18a3b01a7b8d4f41b0"), "score" : 0.2724930450442212 }
```




