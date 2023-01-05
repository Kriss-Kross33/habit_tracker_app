import 'package:flutter/material.dart';
import 'package:habit_tracker_app/src/core/themes/themes.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;
  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  static AppThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme != null) {
      return theme.data;
    }
    throw StateError('Could not find ancestor widget of type `AppTheme`');
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => data != oldWidget.data;
}
