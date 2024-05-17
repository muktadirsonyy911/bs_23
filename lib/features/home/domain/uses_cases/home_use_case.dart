import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:bs_23/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase {
  final HomeRepository homeRepository;
  HomeUseCase({required this.homeRepository});

  Future<Either<Failure, List<GitRepoEntity>>> call() async {
    final result = await homeRepository.getGitRepo();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
