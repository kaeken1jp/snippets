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

> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 40 }
>
> db.users.update({name: "hogeta"}, {$inc: {score: 5}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 45 }
>
> db.users.update({name: "hogeta"}, {$mul: {score: 2}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "score" : 90 }
>
> db.users.update({name: "hogeta"}, {$rename: {score: "point"}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "point" : 90 }
>
> db.users.update({name: "hogeta"}, {$set: {team: "team-4"}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "point" : 90, "team" : "team-4" }
>
> db.users.update({name: "hogeta"}, {$unset: {team: ""}});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({name:"hogeta"}, {_id:0});
{ "name" : "hogeta", "point" : 90 }
```

# update & insert document
```
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "point" : 90 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }
>
> db.users.update({name: "kato"}, {name: "kato", score: 48}, {upsert: true});
WriteResult({
	"nMatched" : 0,
	"nUpserted" : 1,
	"nModified" : 0,
	"_id" : ObjectId("5e188a91b2e63729a50353ae")
})
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "point" : 90 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }
{ "_id" : ObjectId("5e188a91b2e63729a50353ae"), "name" : "kato", "score" : 48 }
>
> db.users.update({name: "kato"}, {name: "kato", score: 99}, {upsert: true});
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "point" : 90 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }
{ "_id" : ObjectId("5e188a91b2e63729a50353ae"), "name" : "kato", "score" : 99 }
>
> db.users.remove({name: "kato"});
WriteResult({ "nRemoved" : 1 })
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "point" : 90 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }
```

# index
```
> db.users.getIndexes();
[
	{
		"v" : 2,
		"key" : {
			"_id" : 1
		},
		"name" : "_id_",
		"ns" : "mydb.users"
	}
]
> db.users.createIndex({score: -1});
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"ok" : 1
}
> db.users.getIndexes();
[
	{
		"v" : 2,
		"key" : {
			"_id" : 1
		},
		"name" : "_id_",
		"ns" : "mydb.users"
	},
	{
		"v" : 2,
		"key" : {
			"score" : -1
		},
		"name" : "score_-1",
		"ns" : "mydb.users"
	}
]
>
> db.users.dropIndex("score_-1");
{ "nIndexesWas" : 2, "ok" : 1 }
> db.users.getIndexes();
[
	{
		"v" : 2,
		"key" : {
			"_id" : 1
		},
		"name" : "_id_",
		"ns" : "mydb.users"
	}
]
>
> db.users.createIndex({name: 1}, {unique: true});
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"ok" : 1
}
> db.users.getIndexes();
[
	{
		"v" : 2,
		"key" : {
			"_id" : 1
		},
		"name" : "_id_",
		"ns" : "mydb.users"
	},
	{
		"v" : 2,
		"unique" : true,
		"key" : {
			"name" : 1
		},
		"name" : "name_1",
		"ns" : "mydb.users"
	}
]
> db.users.insert({name: "hogeta"});
WriteResult({
	"nInserted" : 0,
	"writeError" : {
		"code" : 11000,
		"errmsg" : "E11000 duplicate key error collection: mydb.users index: name_1 dup key: { name: \"hogeta\" }"
	}
})
```

# dump & restore
```
> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
mydb    0.000GB
> exit
bye


$ mongodump -d mydb
2020-01-10T21:45:08.164+0700	writing mydb.users to
2020-01-10T21:45:08.179+0700	done dumping mydb.users (6 documents)

$ ls
dump

$ ls dump/
mydb

$ mongo mydb
MongoDB shell version v4.2.2
...

> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "point" : 90 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }

> db.users.remove({name: "hogeta"});
WriteResult({ "nRemoved" : 1 })
> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }

> exit
$ mongorestore --drop
2020-01-10T21:45:50.002+0700	using default 'dump' directory
2020-01-10T21:45:50.002+0700	preparing collections to restore from
2020-01-10T21:45:50.026+0700	reading metadata for mydb.users from dump/mydb/users.metadata.json
2020-01-10T21:45:50.049+0700	restoring mydb.users from dump/mydb/users.bson
2020-01-10T21:45:50.050+0700	restoring indexes for collection mydb.users from metadata
2020-01-10T21:45:50.101+0700	finished restoring mydb.users (6 documents, 0 failures)
2020-01-10T21:45:50.101+0700	6 document(s) restored successfully. 0 document(s) failed to restore.

$ mongo mydb
MongoDB shell version v4.2.2
...

> db.users.find();
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b1"), "name" : "hogeta", "point" : 90 }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b2"), "name" : "fugao", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b3"), "name" : "tapiyo", "score" : 66, "team" : "team-3" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b4"), "name" : "tofoo", "score" : 26, "team" : "team-1" }
{ "_id" : ObjectId("5e172c5ca3b01a7b8d4f41b5"), "name" : "barri", "score" : 0, "team" : "team-2" }
{ "_id" : ObjectId("5e172e1da3b01a7b8d4f41b6"), "name" : "tanaka", "score" : 52, "age" : 23 }
> exit
bye
```

# mongodump help
```
$ mongodump --help
Usage:
  mongodump <options>

Export the content of a running server into .bson files.

Specify a database with -d and a collection with -c to only dump that database or collection.

See http://docs.mongodb.org/manual/reference/program/mongodump/ for more information.

general options:
      --help                                                print usage
      --version                                             print the tool version and exit

verbosity options:
  -v, --verbose=<level>                                     more detailed log output (include multiple times
                                                            for more verbosity, e.g. -vvvvv, or specify a
                                                            numeric value, e.g. --verbose=N)
      --quiet                                               hide all log output

connection options:
  -h, --host=<hostname>                                     mongodb host to connect to (setname/host1,host2
                                                            for replica sets)
      --port=<port>                                         server port (can also use --host hostname:port)

ssl options:
      --ssl                                                 connect to a mongod or mongos that has ssl
                                                            enabled
      --sslCAFile=<filename>                                the .pem file containing the root certificate
                                                            chain from the certificate authority
      --sslPEMKeyFile=<filename>                            the .pem file containing the certificate and key
      --sslPEMKeyPassword=<password>                        the password to decrypt the sslPEMKeyFile, if
                                                            necessary
      --sslCRLFile=<filename>                               the .pem file containing the certificate
                                                            revocation list
      --sslAllowInvalidCertificates                         bypass the validation for server certificates
      --sslAllowInvalidHostnames                            bypass the validation for server name
      --sslFIPSMode                                         use FIPS mode of the installed openssl library

authentication options:
  -u, --username=<username>                                 username for authentication
  -p, --password=<password>                                 password for authentication
      --authenticationDatabase=<database-name>              database that holds the user's credentials
      --authenticationMechanism=<mechanism>                 authentication mechanism to use

kerberos options:
      --gssapiServiceName=<service-name>                    service name to use when authenticating using
                                                            GSSAPI/Kerberos (default: mongodb)
      --gssapiHostName=<host-name>                          hostname to use when authenticating using
                                                            GSSAPI/Kerberos (default: <remote server's
                                                            address>)

namespace options:
  -d, --db=<database-name>                                  database to use
  -c, --collection=<collection-name>                        collection to use

uri options:
      --uri=mongodb-uri                                     mongodb uri connection string

query options:
  -q, --query=                                              query filter, as a v2 Extended JSON string,
                                                            e.g., '{"x":{"$gt":1}}'
      --queryFile=                                          path to a file containing a query filter (v2
                                                            Extended JSON)
      --readPreference=<string>|<json>                      specify either a preference mode (e.g.
                                                            'nearest') or a preference json object (e.g.
                                                            '{mode: "nearest", tagSets: [{a: "b"}],
                                                            maxStalenessSeconds: 123}')
      --forceTableScan                                      force a table scan

output options:
  -o, --out=<directory-path>                                output directory, or '-' for stdout (defaults to
                                                            'dump')
      --gzip                                                compress archive our collection output with Gzip
      --oplog                                               use oplog for taking a point-in-time snapshot
      --archive=<file-path>                                 dump as an archive to the specified path. If
                                                            flag is specified without a value, archive is
                                                            written to stdout
      --dumpDbUsersAndRoles                                 dump user and role definitions for the specified
                                                            database
      --excludeCollection=<collection-name>                 collection to exclude from the dump (may be
                                                            specified multiple times to exclude additional
                                                            collections)
      --excludeCollectionsWithPrefix=<collection-prefix>    exclude all collections from the dump that have
                                                            the given prefix (may be specified multiple
                                                            times to exclude additional prefixes)
  -j, --numParallelCollections=                             number of collections to dump in parallel (4 by
                                                            default) (default: 4)
      --viewsAsCollections                                  dump views as normal collections with their
                                                            produced data, omitting standard collections
```



```


