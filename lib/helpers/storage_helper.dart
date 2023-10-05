import 'package:blog_explorer/models/blog_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageHelper {
  static const String _boxName = 'myBox';

  static Future<Box> openBox() async {
    return await Hive.openBox(_boxName);
  }

  static Future<void> saveList(List<BlogData> myList) async {
    final box = await openBox();
    await box.clear();
    await box.put('myList', myList);
  }

  static Future<List<dynamic>> loadList() async {
    final box = await openBox();
    return box.get('myList', defaultValue: <dynamic>[]);
  }
}
