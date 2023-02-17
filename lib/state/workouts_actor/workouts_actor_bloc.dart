import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:jumpat/data/workout.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workouts_actor_event.dart';
part 'workouts_actor_state.dart';

part 'workouts_actor_bloc.freezed.dart';

@injectable
class WorkoutsActorBloc extends Bloc<WorkoutsActorEvent, WorkoutsActorState> {
  WorkoutsActorBloc({required this.isar})
      : super(const WorkoutsActorState.initial()) {
    on<WorkoutsActorEvent>((event, emit) async {
      await event.map(
        delete: (e) async {
          await isar.workouts.delete(e.workout.id!);
        },
      );
    });
  }

  final Isar isar;
}
