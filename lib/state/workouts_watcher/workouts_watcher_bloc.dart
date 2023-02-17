import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/data/workout.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workouts_watcher_event.dart';
part 'workouts_watcher_state.dart';

part 'workouts_watcher_bloc.freezed.dart';

@injectable
class WorkoutsWatcherBloc
    extends Bloc<WorkoutsWatcherEvent, WorkoutsWatcherState> {
  WorkoutsWatcherBloc({required this.isar})
      : super(const WorkoutsWatcherState.initial()) {
    on<WorkoutsWatcherEvent>((event, emit) async {
      await event.map(
        watchWorkouts: (e) async {
          await emit.forEach(
            isar.workouts.where().sortByDateDesc().watch(fireImmediately: true),
            onData: (data) => WorkoutsWatcherState.loaded(data),
          );
        },
      );
    });
  }

  final Isar isar;
}
