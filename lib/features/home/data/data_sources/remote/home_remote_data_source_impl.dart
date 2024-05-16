import 'package:bs_23/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final Dio dio;

  CancelToken cancelToken = CancelToken();

  HomeRemoteDataSourceImpl({required this.dio});


/* Future<ApiResponse<List<ArticleModel>>> getArticles() async {
    try {
      final result = (await dio.get(
        getArticlePath(params.period),
      ));
      if (result.data == null)
        throw ServerException("Unknown Error", result.statusCode);

      return ApiResponse.fromJson<List<ArticleModel>>(
          result.data, ArticleModel.fromJsonList);
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
  }*/
}