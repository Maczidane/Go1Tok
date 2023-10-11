import 'package:Go1Tok/src/features/authentication/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
   Dashboard({super.key});

  final controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        leading: IconButton(
          onPressed: () => controller.logOut(),
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
