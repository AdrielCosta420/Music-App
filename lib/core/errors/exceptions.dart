// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiExceptions implements Exception {
  final String message;
  final String? statuscode;
  ApiExceptions({
    required this.message,
    this.statuscode,
  });
}

class GeneralException implements Exception {
  final String message;
  GeneralException({
    this.message = 'Ocorreu um erro. Tente novamente.',
  });
}

class AudioPlayerExceptions implements Exception {
  final String message;

  AudioPlayerExceptions({required this.message});
}
