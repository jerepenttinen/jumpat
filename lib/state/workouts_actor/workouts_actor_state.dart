part of 'workouts_actor_bloc.dart';

@freezed
class WorkoutsActorState with _$WorkoutsActorState {
  const factory WorkoutsActorState.initial() = Initial;
  const factory WorkoutsActorState.deleteSuccess() = DeleteSuccess;
}
