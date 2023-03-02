import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';

class RepetitionCount extends ValueObject<int> {
  factory RepetitionCount(int count) {
    return RepetitionCount._(Right(count));
  }
  const RepetitionCount._(this.value);

  @override
  final Either<ValueFailure<int>, int> value;
}
