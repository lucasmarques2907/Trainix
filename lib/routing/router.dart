import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trainix/features/home/views/home_page.dart';
import 'package:trainix/features/profile/views/profile_page.dart';
import 'package:trainix/features/splash/views/splash_page.dart';
import 'package:trainix/features/tabs/views/tabs_page.dart';
import 'package:trainix/features/training/views/training_page.dart';
import 'package:trainix/routing/router_helper.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/',
        builder: (context, state) => const TabsPage(),
        routes: [
          GoRoute(
            path: '/teste',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
  );
});
