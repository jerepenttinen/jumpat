import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/edit_movement_page.dart';
import 'package:jumpat/ui/edit_workout_page.dart';
import 'package:jumpat/ui/exercise_history_page.dart';
import 'package:jumpat/ui/workouts_page.dart';
import 'package:jumpat/data/workout.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: WorkoutsPage, initial: true),
    AutoRoute(page: EditWorkoutPage),
    AutoRoute(page: EditMovementPage),
    AutoRoute(page: ExerciseHistoryPage),
  ],
)
class AppRouter extends _$AppRouter {}
