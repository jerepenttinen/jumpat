import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';

class ExerciseName extends ValueObject<String> {
  factory ExerciseName(String name) {
    return ExerciseName._(Right(name));
  }
  const ExerciseName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
