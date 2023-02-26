import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:jumpat/features/core/domain/value_object.dart';

class MovementWeight extends ValueObject<double> {
  factory MovementWeight(double weight) {
    return MovementWeight._(Right(weight));
  }
  const MovementWeight._(this.value);

  @override
  final Either<ValueFailure<double>, double> value;
}
