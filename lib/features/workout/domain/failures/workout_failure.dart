import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_failure.freezed.dart';

@freezed
abstract class WorkoutFailure with _$WorkoutFailure {
  const factory WorkoutFailure.unexpected() = Unexpected;
}
