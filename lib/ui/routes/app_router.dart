import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:jumpat/ui/workouts_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: WorkoutsPage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
