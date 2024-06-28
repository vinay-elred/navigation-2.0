import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_2/view_model/auth_view_model.dart';
import 'package:navigation_2/views/dashboard_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const route = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                context.read<AuthViewModel>().login();
                context.goNamed(DashboardScreen.route);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
