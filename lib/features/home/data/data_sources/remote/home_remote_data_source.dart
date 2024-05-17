import 'package:bs_23/core/network/error/dio_error_handler.dart';
import 'package:bs_23/core/network/error/exceptions.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:dio/dio.dart';

abstract interface class HomeRemoteDataSource{
  Future<GitRepoModel> getGitRepo();
}