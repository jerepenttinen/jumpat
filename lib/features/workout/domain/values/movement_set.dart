import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';

class MovementSet extends ValueObject<int> {
  factory MovementSet(int count) {
    return MovementSet._(Right(count));
  }
  const MovementSet._(this.value);

  @override
  final Either<ValueFailure<int>, int> value;
}
