abstract class Failure {
  final String errorMessage;
  Failure({
    required this.errorMessage,
  });

  Future<void>? showError();
}

class CachedFailure extends Failure {
  CachedFailure({required super.errorMessage});

  @override
  Future<void>? showError() {
    throw UnimplementedError();
  }
}
