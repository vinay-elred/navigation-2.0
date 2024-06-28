import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.userName});
  final String userName;

  static const route = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile $userName",
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
