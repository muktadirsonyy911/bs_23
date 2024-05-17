import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRepository{
   Future<Either<Failure, GitRepoModel>> getGitRepo();
}