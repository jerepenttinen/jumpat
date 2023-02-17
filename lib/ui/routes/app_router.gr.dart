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
    WorkoutsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const WorkoutsPage()),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          WorkoutsPageRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [WorkoutsPage]
class WorkoutsPageRoute extends PageRouteInfo<void> {
  const WorkoutsPageRoute()
      : super(
          WorkoutsPageRoute.name,
          path: '/',
        );

  static const String name = 'WorkoutsPageRoute';
}
