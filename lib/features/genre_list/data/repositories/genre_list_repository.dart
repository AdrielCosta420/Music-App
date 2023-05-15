// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:musicapp/core/app/services/api/api_service.dart';
import 'package:musicapp/core/errors/exceptions.dart';
import 'package:musicapp/core/errors/failures.dart';
import 'package:musicapp/shared/models/genre_model.dart';

class GenreListRepository {
  final ApiService _apiService;

  GenreListRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  Future<Either<Failures, List<GenreModel>>> getGenreList() async {
    try {
      final genres = await _apiService.getGenres();
      return Right(genres);
    } on ApiExceptions catch (apiException) {
      return Left(GetGenreListFailure(message: apiException.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreListFailure(message: generalException.message));
    }
  }
}
