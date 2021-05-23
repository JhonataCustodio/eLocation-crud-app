import 'dart:async';
import 'package:eLocations_app/models/estabelecimentos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbEstabelecimentos {
  Database database;

  Future initDB() async {
    if (database != null) {
      return database;
    }

    String databasesPath = await getDatabasesPath();

    database = await openDatabase(
      join(databasesPath, 'estabelecimentos.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE estabelecimentos(id INTEGER PRIMARY KEY, titulo TEXT, descricao TEXT, endereco TEXT, cidade TEXT, estado TEXT, categoria TEXT, imagem TEXT)",
        );
      },
      version: 1,
    );

    return database;
  }


  Future<Estabelecimentos> insertEstabelecimentos(Estabelecimentos estabelecimentos) async {
    final Database db = await database;

    await db.insert(
      'estabelecimentos',
      estabelecimentos.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Estabelecimentos>> estabelecimentos() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('estabelecimentos');

    return List.generate(maps.length, (i) {
      return Estabelecimentos(
        id: maps[i]['id'],
        titulo: maps[i]['titulo'],
        descricao: maps[i]['descricao'],
        endereco: maps[i]['endereco'],
        cidade: maps[i]['cidade'],
        estado: maps[i]['estado'],
        categoria: maps[i]['categoria'],
        imagem: maps[i]['imagem'],
      );
    });
  }

  Future<void> updateEstabelecimentos(Estabelecimentos estabelecimentos) async {
    final db = await database;

    await db.update(
      'estabelecimentos',
      estabelecimentos.toMap(),
      where: "id = ?",
      whereArgs: [estabelecimentos.id],
    );
  }

  Future<void> deleteEstabelecimentos(int id) async {
    final db = await database;

    await db.delete(
      'estabelecimentos',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
