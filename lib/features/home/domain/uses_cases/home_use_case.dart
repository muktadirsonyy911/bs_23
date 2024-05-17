import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:bs_23/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  final HomeRepository homeRepository;
  HomeUseCase({required this.homeRepository});

  Future<Either<Failure, List<GitRepoEntity>>> getRepoFromRemote({required int page}) async {
    final Either<Failure, List<GitRepoEntity>> result = await homeRepository.getGitRepoFromRemoteDataSource(page: page);
    return result.fold((Failure l) {
      return Left(l);
    }, (List<GitRepoEntity> r) async {
      return Right(r);
    });
  }

  Future<Either<Failure, List<GitRepoEntity>>> getRepoFromLocal() {
    return homeRepository.getGitRepoFromLocalDatasource();
  }
}
