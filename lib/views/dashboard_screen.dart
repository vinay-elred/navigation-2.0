import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_2/views/home_screen.dart';
import 'package:navigation_2/views/products_list_screen.dart';
import 'package:navigation_2/views/profile_screen.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const route = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                ProfileScreen.route,
                pathParameters: {"username": "vinay"},
              );
            },
            child: const Text('Profile'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthViewModel>().logOut();
              context.goNamed(HomeScreen.route);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () => context.goNamed(
                ProductListScreen.route,
                queryParameters: {"page": "1"},
              ),
              child: const Text('Your Products'),
            ),
          ],
        ),
      ),
    );
  }
}
