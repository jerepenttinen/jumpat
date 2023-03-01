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
          workoutId: args.workoutId,
          key: args.key,
        ),
      );
    },
    EditMovementRoute.name: (routeData) {
      final args = routeData.argsAs<EditMovementRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditMovementPage(
          movementId: args.movementId,
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
    required UniqueId workoutId,
    Key? key,
  }) : super(
          EditWorkoutRoute.name,
          path: '/edit-workout-page',
          args: EditWorkoutRouteArgs(
            workoutId: workoutId,
            key: key,
          ),
        );

  static const String name = 'EditWorkoutRoute';
}

class EditWorkoutRouteArgs {
  const EditWorkoutRouteArgs({
    required this.workoutId,
    this.key,
  });

  final UniqueId workoutId;

  final Key? key;

  @override
  String toString() {
    return 'EditWorkoutRouteArgs{workoutId: $workoutId, key: $key}';
  }
}

/// generated route for
/// [EditMovementPage]
class EditMovementRoute extends PageRouteInfo<EditMovementRouteArgs> {
  EditMovementRoute({
    required UniqueId movementId,
    Key? key,
  }) : super(
          EditMovementRoute.name,
          path: '/edit-movement-page',
          args: EditMovementRouteArgs(
            movementId: movementId,
            key: key,
          ),
        );

  static const String name = 'EditMovementRoute';
}

class EditMovementRouteArgs {
  const EditMovementRouteArgs({
    required this.movementId,
    this.key,
  });

  final UniqueId movementId;

  final Key? key;

  @override
  String toString() {
    return 'EditMovementRouteArgs{movementId: $movementId, key: $key}';
  }
}

/// generated route for
/// [ExerciseHistoryPage]
class ExerciseHistoryRoute extends PageRouteInfo<ExerciseHistoryRouteArgs> {
  ExerciseHistoryRoute({
    required ExerciseEntity exercise,
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

  final ExerciseEntity exercise;

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
