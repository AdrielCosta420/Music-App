import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:musicapp/core/errors/exceptions.dart';
import 'package:musicapp/shared/models/genre_details_model.dart';
import 'package:musicapp/shared/models/genre_model.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endPoint = '/genres';

      final Response response = await get(endPoint);

      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } on DioError catch (dioError) {
      log(
        'Erro ao fazer o get dos genÊros musicais',
        error: dioError,
        stackTrace: dioError.stackTrace,
      );
      throw ApiExceptions(
          message: 'Erro ao carregar genÊros',
          statuscode: dioError.response?.statusCode.toString());
    } catch (error) {
      log('Erro ao fazer get dos gêneros musicais');
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = '/genres/$genre';

      final Response response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);
    } on DioError catch (dioError) {
      log(
        'Erro ao fazer o get dos detalhes do genêros musicais',
        error: dioError,
        stackTrace: dioError.stackTrace,
      );
      throw ApiExceptions(
          message: 'Erro ao fazer o get dos detalhes do genêros musicais',
          statuscode: dioError.response?.statusCode.toString());
    } catch (error) {
      log('Erro ao fazer get dos detalhes do gêneros musicais');
    }
    throw GeneralException();
  }
}
