import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jumpat/features/core/domain/entity.dart';
import 'package:jumpat/features/core/domain/unique_id.dart';
import 'package:jumpat/features/workout/domain/entities/template_entity.dart';

part 'workout_entity.freezed.dart';

@freezed
class WorkoutEntity with _$WorkoutEntity implements IEntity {
  const factory WorkoutEntity({
    required UniqueId id,
    required DateTime date,
    required Option<TemplateEntity> template,
  }) = _WorkoutEntity;

  factory WorkoutEntity.empty() => WorkoutEntity(
        id: UniqueId(),
        date: DateTime.now(),
        template: const None(),
      );

  factory WorkoutEntity.withDate({required DateTime date}) => WorkoutEntity(
        id: UniqueId(),
        date: date,
        template: const None(),
      );

  factory WorkoutEntity.template({required TemplateEntity template}) =>
      WorkoutEntity(
        id: UniqueId(),
        date: DateTime.now(),
        template: some(template),
      );

  factory WorkoutEntity.templateWithDate({
    required TemplateEntity template,
    required DateTime date,
  }) =>
      WorkoutEntity(
        id: UniqueId(),
        date: date,
        template: some(template),
      );
}

int workoutEntityComparator(WorkoutEntity w1, WorkoutEntity w2) {
  return w2.date.compareTo(w1.date);
}
