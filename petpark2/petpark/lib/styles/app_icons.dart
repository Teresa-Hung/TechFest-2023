import 'package:flutter/material.dart';

class AppIcons {
  static final challenge = CircleAvatar(
    backgroundColor: Colors.white.withOpacity(0.8),
    radius: 40,
    child: Image.asset(
      'assets/icon_challenge.png',
      fit: BoxFit.contain,
    ),
  );
}
