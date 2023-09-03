abstract class Result {
  Future<void>? onSuccess();
}

class DefaultResult extends Result {
  @override
  Future<void>? onSuccess() => null;
}
