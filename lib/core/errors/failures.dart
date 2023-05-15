abstract class Failures {}

class GetGenreListFailure extends Failures {
  final String message;

  GetGenreListFailure({required this.message});
}

class GetGenreDetailsFailure extends Failures {
  final String message;

  GetGenreDetailsFailure({required this.message});
}
