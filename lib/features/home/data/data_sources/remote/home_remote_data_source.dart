import 'package:bs_23/features/home/data/models/git_repo_model.dart';

abstract interface class HomeRemoteDataSource{
  Future<List<GitRepoModel>> getGitRepo({int page=1});
}