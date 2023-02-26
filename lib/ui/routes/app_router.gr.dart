// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WorkoutsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WorkoutsPage(),
      );
    },
    EditWorkoutRoute.name: (routeData) {
      final args = routeData.argsAs<EditWorkoutRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditWorkoutPage(
          workout: args.workout,
          key: args.key,
        ),
      );
    },
    EditMovementRoute.name: (routeData) {
      final args = routeData.argsAs<EditMovementRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditMovementPage(
          movement: args.movement,
          key: args.key,
        ),
      );
    },
    ExerciseHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseHistoryRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ExerciseHistoryPage(
          exercise: args.exercise,
          key: args.key,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    ExercisesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ExercisesPage(),
      );
    },
    TemplatesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TemplatesPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          WorkoutsRoute.name,
          path: '/',
        ),
        RouteConfig(
          EditWorkoutRoute.name,
          path: '/edit-workout-page',
        ),
        RouteConfig(
          EditMovementRoute.name,
          path: '/edit-movement-page',
        ),
        RouteConfig(
          ExerciseHistoryRoute.name,
          path: '/exercise-history-page',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings-page',
        ),
        RouteConfig(
          ExercisesRoute.name,
          path: '/exercises-page',
        ),
        RouteConfig(
          TemplatesRoute.name,
          path: '/templates-page',
        ),
      ];
}

/// generated route for
/// [WorkoutsPage]
class WorkoutsRoute extends PageRouteInfo<void> {
  const WorkoutsRoute()
      : super(
          WorkoutsRoute.name,
          path: '/',
        );

  static const String name = 'WorkoutsRoute';
}

/// generated route for
/// [EditWorkoutPage]
class EditWorkoutRoute extends PageRouteInfo<EditWorkoutRouteArgs> {
  EditWorkoutRoute({
    required WorkoutEntity workout,
    Key? key,
  }) : super(
          EditWorkoutRoute.name,
          path: '/edit-workout-page',
          args: EditWorkoutRouteArgs(
            workout: workout,
            key: key,
          ),
        );

  static const String name = 'EditWorkoutRoute';
}

class EditWorkoutRouteArgs {
  const EditWorkoutRouteArgs({
    required this.workout,
    this.key,
  });

  final WorkoutEntity workout;

  final Key? key;

  @override
  String toString() {
    return 'EditWorkoutRouteArgs{workout: $workout, key: $key}';
  }
}

/// generated route for
/// [EditMovementPage]
class EditMovementRoute extends PageRouteInfo<EditMovementRouteArgs> {
  EditMovementRoute({
    required Movement movement,
    Key? key,
  }) : super(
          EditMovementRoute.name,
          path: '/edit-movement-page',
          args: EditMovementRouteArgs(
            movement: movement,
            key: key,
          ),
        );

  static const String name = 'EditMovementRoute';
}

class EditMovementRouteArgs {
  const EditMovementRouteArgs({
    required this.movement,
    this.key,
  });

  final Movement movement;

  final Key? key;

  @override
  String toString() {
    return 'EditMovementRouteArgs{movement: $movement, key: $key}';
  }
}

/// generated route for
/// [ExerciseHistoryPage]
class ExerciseHistoryRoute extends PageRouteInfo<ExerciseHistoryRouteArgs> {
  ExerciseHistoryRoute({
    required Exercise exercise,
    Key? key,
  }) : super(
          ExerciseHistoryRoute.name,
          path: '/exercise-history-page',
          args: ExerciseHistoryRouteArgs(
            exercise: exercise,
            key: key,
          ),
        );

  static const String name = 'ExerciseHistoryRoute';
}

class ExerciseHistoryRouteArgs {
  const ExerciseHistoryRouteArgs({
    required this.exercise,
    this.key,
  });

  final Exercise exercise;

  final Key? key;

  @override
  String toString() {
    return 'ExerciseHistoryRouteArgs{exercise: $exercise, key: $key}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [ExercisesPage]
class ExercisesRoute extends PageRouteInfo<void> {
  const ExercisesRoute()
      : super(
          ExercisesRoute.name,
          path: '/exercises-page',
        );

  static const String name = 'ExercisesRoute';
}

/// generated route for
/// [TemplatesPage]
class TemplatesRoute extends PageRouteInfo<void> {
  const TemplatesRoute()
      : super(
          TemplatesRoute.name,
          path: '/templates-page',
        );

  static const String name = 'TemplatesRoute';
}
