import 'package:get/get.dart';

mixin ScreenLoadingAndErrorMixin {
  final RxBool _isLoading = true.obs;

  void setLoadingToTrue() => _isLoading.value = true;

  bool get getIsLoading => _isLoading.value;

  final RxnString _error = RxnString();

  void setError(String? errorString) => _error.value = errorString;

  String? get getError => _error.value;
}
