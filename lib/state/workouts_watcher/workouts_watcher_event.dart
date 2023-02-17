part of 'workouts_watcher_bloc.dart';

@freezed
class WorkoutsWatcherEvent with _$WorkoutsWatcherEvent {
  const factory WorkoutsWatcherEvent.watchWorkouts() = _WatchWorkouts;
}
