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


# insert/count/find/remove document
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

> db.users.remove({});
WriteResult({ "nRemoved" : 12 })

> db.users.find();

> db.users.count();
0
```

# search document
```
> db.users.insert({name: "hogeta", score: 52, team: "team-1"});
WriteResult({ "nInserted" : 1 })
> db.users.insert({name: "fugao", score: 82, team: "team-2"});
WriteResult({ "nInserted" : 1 })
> db.users.insert({name: "tapiyo", score: 66, team: "team-3"});
WriteResult({ "nInserted" : 1 })
> db.users.insert({name: "tofoo", score: 26, team: "team-1"});
WriteResult({ "nInserted" : 1 })
> db.users.insert({name: "barri", score: 29, team: "team-2"});
WriteResult({ "nInserted" : 1 })
>
>
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 29, "team" : "team-2" }


> db.users.find({team: "team-1"});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
>
> db.users.find({score: {$gte: 50}});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
>
> // $gte $gt $lte $lt
> // $eq $ne
>
> db.users.find({team: {$eq: "team-1"}});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
>
> db.users.find({name: /t/});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
>
> db.users.find({name: /^t/});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
>
> db.users.distinct("team");
[ "team-1", "team-2", "team-3" ]


> db.users.find({name:/i/, score:{$gte:50}});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
>
> db.users.find({$or: [{name:/i/}, {score:{$gte:50}}]});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 29, "team" : "team-2" }
>
> db.users.find({score: {$in: [52, 66]}});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
>
> db.users.insert({name:"tanaka", score:52, age:23});
WriteResult({ "nInserted" : 1 })
>
> db.users.find({age: {$exists: true}});
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }

```

# select field
```
> db.users.find({}, {name: true, score: 1});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 82 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 29 }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52 }
>
> db.users.find({}, {score: 0});
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "age" : 23 }
>
> db.users.find({}, {score: 0, name: 1});
Error: error: {
	"ok" : 0,
	"errmsg" : "Projection cannot have a mix of inclusion and exclusion.",
	"code" : 2,
	"codeName" : "BadValue"
}
>
> db.users.find({}, {score: 1, _id: 0});
{ "score" : 52 }
{ "score" : 82 }
{ "score" : 66 }
{ "score" : 26 }
{ "score" : 29 }
{ "score" : 52 }
```

# sort/limit/skip document
```
> db.users.find({}, {_id: 0}).sort({score: 1});
{ "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "name" : "barri", "score" : 29, "team" : "team-2" }
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "name" : "tanaka", "score" : 52, "age" : 23 }
{ "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "name" : "fugao", "score" : 82, "team" : "team-2" }
>
> db.users.find({}, {_id: 0}).sort({score: -1});
{ "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "name" : "tanaka", "score" : 52, "age" : 23 }
{ "name" : "barri", "score" : 29, "team" : "team-2" }
{ "name" : "tofoo", "score" : 26, "team" : "team-1" }
>
> db.users.find({}, {_id: 0}).limit(3);
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "name" : "tapiyo", "score" : 66, "team" : "team-3" }
>
> db.users.find({}, {_id: 0}).sort({score: -1}).limit(3);
{ "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }
>
> db.users.findOne({}, {_id: 0});
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }
>
> db.users.find({}, {_id: 0});
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "name" : "barri", "score" : 29, "team" : "team-2" }
{ "name" : "tanaka", "score" : 52, "age" : 23 }
>
> db.users.find({}, {_id: 0}).skip(2);
{ "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "name" : "barri", "score" : 29, "team" : "team-2" }
{ "name" : "tanaka", "score" : 52, "age" : 23 }
```

# update document

```
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 52, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 29, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }

> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 52, "team" : "team-1" }

> db.users.update({name:"hogeta"}, {$set: {score: 80}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 80, "team" : "team-1" }

> db.users.update({name:"hogeta"}, {$set: {score: 90, team:"team-2"}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 90, "team" : "team-2" }


> db.users.update({name:"hogeta"}, {name:"hogeta",score: 40});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 40 }

> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 40 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 82, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 29, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }

> db.users.update({team:"team-2"}, {$set: {score: 0}}, {multi: true});
WriteResult({ "nMatched" : 2, "nUpserted" : 0, "nModified" : 2 })
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "score" : 40 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }
```


