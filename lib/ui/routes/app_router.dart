import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/pages/edit_movement_page.dart';
import 'package:jumpat/ui/pages/edit_workout_page.dart';
import 'package:jumpat/ui/pages/exercise_history_page.dart';
import 'package:jumpat/ui/pages/exercises_page.dart';
import 'package:jumpat/ui/pages/settings_page.dart';
import 'package:jumpat/ui/pages/workouts_page.dart';
import 'package:jumpat/ui/pages/templates_page.dart';
import 'package:jumpat/data/tables.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: WorkoutsPage, initial: true),
    AutoRoute(page: EditWorkoutPage),
    AutoRoute(page: EditMovementPage),
    AutoRoute(page: ExerciseHistoryPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: ExercisesPage),
    AutoRoute(page: TemplatesPage),
  ],
)
class AppRouter extends _$AppRouter {}
