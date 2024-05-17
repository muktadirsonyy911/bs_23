import 'package:bs_23/features/home/data/data_sources/local/database_service/git_repo_db.dart';
import 'package:bs_23/features/home/data/data_sources/local/ds_interface/home_local_data_source.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class HomeLocalDataSourceImpl implements HomeLocalDatasource {
  @override
  Future<List<GitRepoModel>> saveRepoToLocalDB(GitRepoModel gitRepoModel) async {
    // TODO: implement addToCartRepoFromLocalDB
    List<GitRepoModel> gitRepoList = [];

    try {
      gitRepoList = await GitRepoDatabase.gitRepoDbSource.updateOrInsertItem(gitRepoModel);
    } on DatabaseException catch (e) {
      rethrow;
    }
    return gitRepoList;
  }

  @override
  Future<List<GitRepoModel>> deleteRepoListFromLocalDB() {
    // TODO: implement deleteFromRepoListFromLocalDB
    throw UnimplementedError();
  }

  @override
  Future<List<GitRepoModel>> getAllRepoListFromLocalDB() async {
    // TODO: implement getAllRepoListFromLocalDB
    List<GitRepoModel> gitRepoList = [];

    try {
      gitRepoList = await GitRepoDatabase.gitRepoDbSource.readAll();
    } catch (e) {
      // TODO

      debugPrint('error during getting repo from database: $e');
      rethrow;
    }
    return gitRepoList;
  }

  @override
  Future<List<GitRepoModel>> updateRepoFromLocalDB(GitRepoModel gitRepoModel) {
    // TODO: implement updateCartRepoFromLocalDB
    throw UnimplementedError();
  }
}
