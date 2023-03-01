import 'package:freezed_annotation/freezed_annotation.dart';

part 'movement_failure.freezed.dart';

@freezed
abstract class MovementFailure with _$MovementFailure {
  const factory MovementFailure.unexpected() = Unexpected;
  const factory MovementFailure.unableToDelete() = UnableToDelete;
}
