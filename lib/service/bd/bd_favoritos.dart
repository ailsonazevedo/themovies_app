import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class BdFavorito {
  Future<Box> openHiveBox(String boxName) async {
    var caminhoDB = await getApplicationDocumentsDirectory();
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init(caminhoDB.path);
    }

    return await Hive.openBox(boxName);
  }

  void adicionaFavorito(int id) async {
    var db = await openHiveBox('favoritos');
    await db.put(id, 1);
  }

  void removeFavorito(int id) async {
    var db = await openHiveBox('favoritos');
    await db.delete(id);
  }

  Future<List> obterFavoritos() async {
    var db = await openHiveBox('favoritos');
    return db.keys.toList();
  }

  Future<bool> ehFavorito(int id) async {
    var db = await openHiveBox('favoritos');
    return db.keys.contains(id);
  }
}
