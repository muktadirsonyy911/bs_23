import 'package:bs_23/core/services/common_data_session_service.dart';
import 'package:bs_23/core/values/git_repo_database_fields.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/git_repo_model.dart';

class GitRepoDatabase {
  static final GitRepoDatabase gitRepoDbSource = GitRepoDatabase._internal();

  static Database? _database;

  GitRepoDatabase._internal();
  static const String _databaseName = "database.db";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    return await openDatabase(path, version: 1, onCreate: _createDatabase, singleInstance: true);
  }

  Future<void> _createDatabase(Database database, int version) async {
    try {
      await database.execute("""
      CREATE TABLE ${GitRepoDatabaseFields.tableName} (
        ${GitRepoDatabaseFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${GitRepoDatabaseFields.name} TEXT NOT NULL,
        ${GitRepoDatabaseFields.ownerName} TEXT NOT NULL,
        ${GitRepoDatabaseFields.ownerPhoto} TEXT NOT NULL,
        ${GitRepoDatabaseFields.starCount} INTEGER NOT NULL,
       ${GitRepoDatabaseFields.description} LONGTEXT NOT NULL,
       ${GitRepoDatabaseFields.gitLink} TEXT NOT NULL,
        ${GitRepoDatabaseFields.ownerGit} TEXT NOT NULL,
        ${GitRepoDatabaseFields.updatedAt} LONGTEXT NOT NULL
        
      )
    """);
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }

  Future<int> createItem(GitRepoModel gitRepoModel) async {
    try {
      final db = await gitRepoDbSource.database;
      final id = await db.insert(GitRepoDatabaseFields.tableName, gitRepoModel.toJson());
      return id;
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }

  Future<List<GitRepoModel>> updateOrInsertItem(GitRepoModel gitRepoModel) async {
    List<GitRepoModel> gitRepoList = [];

    try {
      String filterOption=Get.find<CommonDataSessionService>().sortingOption.value;
      final db = await gitRepoDbSource.database;
      int id = gitRepoModel.id;
      List<Map<String, dynamic>> existingItem = await db.query(GitRepoDatabaseFields.tableName, where: 'id = ?', whereArgs: [id]);

      if (existingItem.isNotEmpty) {
        await db.update(GitRepoDatabaseFields.tableName, gitRepoModel.toJson(), where: 'id = ?', whereArgs: [id]);
      } else {
        await db.insert(GitRepoDatabaseFields.tableName, gitRepoModel.toJson());
      }

      final result = await db.query(GitRepoDatabaseFields.tableName,
          orderBy: '$filterOption DESC'
      );
      gitRepoList = result.map((json) => GitRepoModel.fromLocal(json)).toList();
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
    return gitRepoList;
  }

  Future<List<GitRepoModel>> readAll() async {
    try {
      String filterOption=Get.find<CommonDataSessionService>().sortingOption.value;
      final db = await gitRepoDbSource.database;
      final result = await db.query(GitRepoDatabaseFields.tableName,
          orderBy: '$filterOption DESC'
      );
      return result.map((json) => GitRepoModel.fromLocal(json)).toList();
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }

  Future<int> update(GitRepoModel gitRepoModel) async {
    final db = await gitRepoDbSource.database;
    return db.update(
      GitRepoDatabaseFields.tableName,
      gitRepoModel.toJson(),
      where: '${GitRepoDatabaseFields.id} = ?',
      whereArgs: [GitRepoDatabaseFields.id],
    );
  }

  Future close() async {
    final db = await gitRepoDbSource.database;
    db.close();
  }
}
