part of 'workouts_actor_bloc.dart';

@freezed
class WorkoutsActorEvent with _$WorkoutsActorEvent {
  const factory WorkoutsActorEvent.delete(Workout workout) = _Delete;
}
