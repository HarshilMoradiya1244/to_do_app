import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_app/screen/home/model/home_model.dart';

class DBHelper {
  Database? dataBase;

  final String DB_NAME = "db_name";

  Future<Database> checkDb() async {
    if (dataBase != null) {
      return dataBase!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String todoTable =
            "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT,description TEXT, category TEXT)";

        db.execute(todoTable);
      },
    );
  }

  Future<void> insertDB(DBModel dbModel) async {
    dataBase = await checkDb();

    dataBase!.insert("todo", {
      "title": dbModel.title,
      "description": dbModel.description,
      "category": dbModel.category,
    });
  }

  Future<List<DBModel>> readDB(DBModel dbModel) async {
    dataBase = await checkDb();
    String query = "SELECT * FROM todo";
    List<Map> data = await dataBase!.rawQuery(query, null);
    List<DBModel> modelList = data.map((e) => DBModel.mapToModel(e)).toList();
    return modelList;
  }

  Future<void> deleteDB({required String id}) async {
    dataBase = await checkDb();
    dataBase!.delete("todo", where: "id=?", whereArgs: [id]);
  }

  Future<void> updateDB(DBModel dbModel) async {
    dataBase = await checkDb();
    dataBase!.update("todo", {
      "title":dbModel.title,
      "description":dbModel.description,
      "category":dbModel.category,
    },where: "id=?",whereArgs: [dbModel.id]);
  }
}
