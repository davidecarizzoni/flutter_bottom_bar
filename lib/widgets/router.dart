import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit/screens/onboarding/register_screen.dart';
import 'package:starter_kit/screens/onboarding/splash_screen.dart';
import 'package:starter_kit/widgets/bottom_navigation_bar.dart';
import 'package:starter_kit/widgets/screen_container.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
          child: ScaffoldWithNavBar(
            location: state.matchedLocation,
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ScreenContainer(
                child: Column(
                  children: [
                    const Text("Home"),
                    ElevatedButton(
                      onPressed: () {
                        context.pushNamed('detail'); // your named path
                      },
                      child: const Text('go to detail'),
                    ),
                  ],
                ),
              ),
            );
          },
          routes: [
            GoRoute(
              path: 'detail',
              name: 'detail',
              builder: (context, state) => const ScreenContainer(
                title: 'Detail',
                child: Column(
                  children: [Text('detail')],
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/discover',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ScreenContainer(
              child: Text("Discover"),
            ),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/shop',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: Scaffold(
                body: Column(
                  children: [
                    const Text("Shop"),
                    ElevatedButton(
                      onPressed: () {
                        context.replaceNamed('login'); // your named path
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashScreen(),
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
