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
    required Workout workout,
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

  final Workout workout;

  final Key? key;

  @override
  String toString() {
    return 'EditWorkoutRouteArgs{workout: $workout, key: $key}';
  }
}
