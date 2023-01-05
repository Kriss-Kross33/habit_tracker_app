import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: Center(
        child: SizedBox(
          width: 240,
          child: AnimatedTask(
            iconName: AppAssets.carrot,
          ),
        ),
      ),
    );
  }
}
