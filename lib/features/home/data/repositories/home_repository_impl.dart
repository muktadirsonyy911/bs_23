import 'package:bs_23/core/extensions/git_repo_entity_extension.dart';
import 'package:bs_23/core/network/error/exceptions.dart';
import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/features/home/data/data_sources/local/ds_interface/home_local_data_source.dart';
import 'package:bs_23/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:bs_23/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDatasource homeLocalDatasource;
  HomeRepositoryImpl({required this.homeRemoteDataSource, required this.homeLocalDatasource});

  @override
  Future<Either<Failure, List<GitRepoModel>>> getGitRepoFromRemoteDataSource({int page=1}) async {
    try {
      final  List<GitRepoModel> result = await homeRemoteDataSource.getGitRepo();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<GitRepoEntity>>> getGitRepoFromLocalDatasource() async {
    try {
      List<GitRepoEntity> gitReposList = await homeLocalDatasource.getAllRepoListFromLocalDB();
      return right(gitReposList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<List<GitRepoEntity>> saveRepoDataLocally(List<GitRepoEntity> repos) async {
    List<GitRepoEntity> repoList=[];
    for(GitRepoEntity item in repos){
      repoList= await homeLocalDatasource.saveRepoToLocalDB(item.toModel());
    }
    return repoList;
  }
}
