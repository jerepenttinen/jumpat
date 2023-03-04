import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/infrastructure/drift.dart';

part 'aggregates.freezed.dart';

@freezed
class WorkoutAggregate with _$WorkoutAggregate {
  const factory WorkoutAggregate({
    required Workout workout,
    required TemplateAggregate? template,
  }) = _WorkoutAggregate;
}

@freezed
class MovementAggregate with _$MovementAggregate {
  const factory MovementAggregate({
    required Movement movement,
    required IList<MovementSet> sets,
    required WorkoutAggregate workout,
    required Exercise exercise,
  }) = _MovementAggregate;
}

@freezed
class TemplateAggregate with _$TemplateAggregate {
  const factory TemplateAggregate({
    required Template template,
    required IList<Exercise> exercises,
  }) = _TemplateAggregate;
}
