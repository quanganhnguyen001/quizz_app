// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'params.dart';
import 'result.dart';

abstract class UseCase<Type extends Result,
    UsecaseParams extends DefaultParams> {
  Future<Either<Failure, Type>> call(UsecaseParams params);
}
