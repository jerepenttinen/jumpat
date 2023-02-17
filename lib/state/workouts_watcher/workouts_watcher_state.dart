part of 'workouts_watcher_bloc.dart';

@freezed
class WorkoutsWatcherState with _$WorkoutsWatcherState {
  const factory WorkoutsWatcherState.initial() = Initial;
  const factory WorkoutsWatcherState.loaded(List<Workout> workouts) =
      LoadSuccess;
}
