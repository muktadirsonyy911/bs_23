import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRepository {
   Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromRemoteDataSource({int page=1});
   Future<List<GitRepoEntity>> saveRepoDataLocally(List<GitRepoEntity> repos);
   Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromLocalDatasource();
}