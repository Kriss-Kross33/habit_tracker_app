import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class AppThemeData {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color accentNegative;
  final Color taskRing;
  final Color taskIcon;
  final Color settingsText;
  final Color settingsLable;
  final Color settingsCta;
  final Color settingsListIconBackround;
  final Color settingsInactiveIconBackground;
  final Color inactiveThemePanelRing;
  final SystemUiOverlayStyle overlayStyle;

  AppThemeData({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.accentNegative,
    required this.taskRing,
    required this.taskIcon,
    required this.settingsText,
    required this.settingsLable,
    required this.settingsCta,
    required this.settingsListIconBackround,
    required this.settingsInactiveIconBackground,
    required this.inactiveThemePanelRing,
    required this.overlayStyle,
  });

  factory AppThemeData.defaultWithSwatch(List<Color> swatch) {
    return AppThemeData(
      primary: swatch[0],
      secondary: swatch[1],
      accent: AppColors.white,
      accentNegative: AppColors.black,
      taskRing: swatch[4],
      taskIcon: AppColors.white,
      settingsText: AppColors.white,
      settingsLable: AppColors.white60,
      settingsCta: swatch[3],
      settingsListIconBackround: swatch[2],
      settingsInactiveIconBackground: swatch[2],
      inactiveThemePanelRing: AppColors.grey,
      overlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
