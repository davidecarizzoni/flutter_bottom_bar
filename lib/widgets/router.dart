import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit/screens/home/home_screen.dart';
import 'package:starter_kit/screens/onboarding/login_screen.dart';
import 'package:starter_kit/screens/onboarding/register_screen.dart';
import 'package:starter_kit/screens/profile/change_password_screen.dart';
import 'package:starter_kit/screens/profile/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeTabNavigatorKey = GlobalKey<NavigatorState>();
final _profileTabNavigatorKey = GlobalKey<NavigatorState>();

// on boarding
const loginPath = '/login';
const registerPath = '/register';

// profile
const profilePath = '/profile';
const profileChangePasswordPath = '/change-password';

// home
const homePath = '/home';

Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}

final router = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: homePath,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomeScreen(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileTabNavigatorKey,
          routes: [
            GoRoute(
              path: profilePath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const ProfileScreen(),
                  state: state,
                );
              },
            ),
            GoRoute(
              path: profileChangePasswordPath,
              pageBuilder: (context, state) {
                return getPage(
                  child: const ChangePasswordScreen(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ],
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return getPage(
          child: BottomNavigationPage(
            child: navigationShell,
          ),
          state: state,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: loginPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: registerPath,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
