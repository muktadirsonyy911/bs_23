import 'package:bs_23/core/network/error/exceptions.dart';
import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:bs_23/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<GitRepoModel>>> getGitRepo() async {
    try {
      final  List<GitRepoModel> result = await homeRemoteDataSource.getGitRepo();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
