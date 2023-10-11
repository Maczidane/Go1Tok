import 'dart:ui';

import 'package:flutter/material.dart';

class AllSnackBars {
  AllSnackBars._();

  static buildErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        
      ),
    );
  }
}
