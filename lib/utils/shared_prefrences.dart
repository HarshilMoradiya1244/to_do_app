import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ShareHelper {
  static Future<void> saveLikedToDo(Map<String, dynamic> todo) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    List<String>? likedToDos = shr.getStringList('likedToDos') ?? [];
    likedToDos.add(jsonEncode(todo));
    await shr.setStringList('likedToDos', likedToDos);
  }

  static Future<List<Map<String, dynamic>>> getLikedToDos() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    List<String>? likedToDos = shr.getStringList('likedToDos') ?? [];
    return likedToDos.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  static Future<void> deleteLikedToDo(String id) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    List<String>? likedToDos = shr.getStringList('likedToDos') ?? [];
    likedToDos.removeWhere((item) {
      Map<String, dynamic> todo = jsonDecode(item);
      return todo['id'] == id;
    });
    await shr.setStringList('likedToDos', likedToDos);
  }
}
