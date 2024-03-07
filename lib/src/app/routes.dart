import 'package:coffee_house/src/pages/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Routes {
  const Routes._();

  static const mainRoute = '/main';

  static CustomTransitionPage _buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    fullscreenDialog = false,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      fullscreenDialog: fullscreenDialog,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        animation = CurvedAnimation(curve: Curves.easeInOut, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Page<dynamic> Function(BuildContext, GoRouterState)
      _defaultPageBuilder<T>(Widget child) => (context, state) {
            return _buildPageWithDefaultTransition<T>(
              context: context,
              state: state,
              child: child,
            );
          };

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    initialLocation: mainRoute,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: mainRoute,
        pageBuilder: _defaultPageBuilder(const MainScreen()),
      ),
    ],
  );
}
