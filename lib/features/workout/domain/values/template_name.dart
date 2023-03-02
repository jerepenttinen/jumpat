import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';

class TemplateName extends ValueObject<String> {
  factory TemplateName(String name) {
    return TemplateName._(Right(name));
  }
  const TemplateName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
