import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dtos.freezed.dart';

@freezed
class WorkoutDto with _$WorkoutDto {
  const factory WorkoutDto({
    required int id,
    required DateTime date,
    required TemplateDto? template,
  }) = _WorkoutDto;
}

@freezed
class ExerciseDto with _$ExerciseDto {
  const factory ExerciseDto({
    required int id,
    required String name,
  }) = _ExerciseDto;
}

@freezed
class MovementDto with _$MovementDto {
  const factory MovementDto({
    required int id,
    required double weight,
    required IList<MovementSetDto> sets,
    required WorkoutDto workout,
    required ExerciseDto exercise,
  }) = _MovementDto;
}

@freezed
class MovementSetDto with _$MovementSetDto {
  const factory MovementSetDto({
    required int id,
    required int count,
  }) = _MovementSetDto;
}

@freezed
class TemplateDto with _$TemplateDto {
  const factory TemplateDto({
    required int id,
    required String name,
    required int color,
    required IList<ExerciseDto> exercises,
  }) = _TemplateDto;
}
