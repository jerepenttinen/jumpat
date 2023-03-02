import 'package:fpdart/fpdart.dart';
import 'package:jumpat/features/core/domain/common_interfaces.dart';
import 'package:jumpat/features/core/domain/errors.dart';
import 'package:jumpat/features/core/domain/failures.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  T getOrElse(T dflt) {
    return value.getOrElse((l) => dflt);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(left, (r) => right(unit));
  }

  @override
  bool isValid() {
    return value.isRight();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
