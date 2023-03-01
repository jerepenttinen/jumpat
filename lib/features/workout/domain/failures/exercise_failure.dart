import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_failure.freezed.dart';

@freezed
abstract class ExerciseFailure with _$ExerciseFailure {
  const factory ExerciseFailure.unexpected() = Unexpected;
  const factory ExerciseFailure.notFound() = NotFound;
}
