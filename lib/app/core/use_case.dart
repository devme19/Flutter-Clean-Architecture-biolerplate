import 'package:flutter_clean_architecture/app/core/either.dart';
import 'package:flutter_clean_architecture/app/core/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}

class Params {
  final bool? boolValue;
  final String? value;
  final String? title;
  final Map<String, dynamic>? body;
  Params({this.value, this.title, this.body,this.boolValue});
}
