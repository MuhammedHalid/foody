import 'package:flutter/material.dart';
import 'package:foody/home.dart';
import 'package:foody/navigation/navbar_bottom.dart';
import 'package:foody/otp_page.dart';
import 'package:foody/profile.dart';
import 'package:foody/profile_two.dart';
import 'package:foody/setting_page2.dart';
import 'package:foody/settings.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();
  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorSetting =
      GlobalKey<NavigatorState>(debugLabel: 'shellSetting');
  static final _shellNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
  static final GoRouter router = GoRouter(
    initialLocation: '/otpPage',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MyNavBar(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSetting,
            routes: [
              GoRoute(
                  path: '/setting',
                  builder: (context, state) => const SettingPage(),
                  routes: [
                    GoRoute(
                      path: 'settingTwo',
                      builder: (context, state) => const SettingTwo(),
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(navigatorKey: _shellNavigatorProfile, routes: [
            GoRoute(
                path: '/profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const Profile(),
                routes: [
                  GoRoute(
                    path: 'profileTwo',
                    builder: (context, state) => const ProfileTwo(),
                  )
                ]),
          ])
        ],
      ),
      GoRoute(
        path: '/otpPage',
        builder: (context, state) {
          return const OtpPage();
        },
      )
    ],
  );
}
