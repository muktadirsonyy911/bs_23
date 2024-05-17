import 'package:bs_23/core/network/error/dio_error_handler.dart';
import 'package:bs_23/core/network/error/exceptions.dart';
import 'package:bs_23/core/utils/constants/network_constant.dart';
import 'package:bs_23/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:bs_23/features/home/data/models/git_repo_model.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  CancelToken cancelToken = CancelToken();

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<GitRepoModel>> getGitRepo({int page=1}) async {
    try {
      final Response response = await dio.get(NetworkConstant.getRepoList(page: page));
      if (response.data == null) {
        throw ServerException("Unknown Error", response.statusCode);
      }
      return List.from(response.data['items'].map((item) => GitRepoModel.fromJson(item)));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
