import 'package:bs_23/features/home/data/models/git_repo_model.dart';

abstract interface class HomeLocalDatasource {
  Future<List<GitRepoModel>> getAllRepoListFromLocalDB();
  Future<List<GitRepoModel>> saveRepoToLocalDB(GitRepoModel gitRepoModel);
  Future<List<GitRepoModel>> updateRepoFromLocalDB(GitRepoModel gitRepoModel);
  Future<List<GitRepoModel>> deleteRepoListFromLocalDB();
}