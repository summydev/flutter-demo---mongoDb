import 'dart:developer';
import 'constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    collection.insertMany([
      {
        "username": "test02",
        "email": "password@gmail.com",
        "name": "Random Hello"
      },
      {
        "username": "test03",
        "email": "password3@gmail.com",
        "name": "Random Hello3"
      },
      {
        "username": "test04",
        "email": "password04@gmail.com",
        "name": "Random Hello4"
      }
    ]);
    print(await collection.find().toList());
    print('hello');

    await collection.update(where.eq("username", "test02"),
        modify.set("name", "updated succesfully"));
    await collection.deleteMany({"username": "test02"});
  }
}
