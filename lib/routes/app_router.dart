import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_2/view_model/auth_view_model.dart';
import 'package:navigation_2/views/dashboard_screen.dart';
import 'package:navigation_2/views/product_screen.dart';
import 'package:navigation_2/views/profile_screen.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../views/home_screen.dart';
import '../views/products_list_screen.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    redirect: (context, state) {
      final isLogged = context.read<AuthViewModel>().loggedIn;
      if (!isLogged) return '/';
      if (state.fullPath == '/') {
        return state.namedLocation(DashboardScreen.route);
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.route,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/dashboard',
        name: DashboardScreen.route,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
            path: 'profile/:username',
            name: ProfileScreen.route,
            builder: (context, state) {
              final userName = state.pathParameters["username"] ?? "null";
              return ProfileScreen(userName: userName);
            },
          ),
          GoRoute(
            path: 'product-list',
            name: ProductListScreen.route,
            builder: (context, state) {
              final page = int.parse(state.uri.queryParameters["page"] ?? "1");
              return ProductListScreen(page: page);
            },
            routes: [
              GoRoute(
                path: ':id',
                name: ProductScreen.route,
                builder: (context, state) {
                  final details = state.extra as ProductModel;
                  return ProductScreen(details: details);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
