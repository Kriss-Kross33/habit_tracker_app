import 'package:flutter/material.dart';
import 'package:habit_tracker_app/src/ui/ui.dart';

import '../../core/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: Center(
        child: SizedBox(
          width: 240,
          child: AnimatedTask(),
        ),
      ),
    );
  }
}
