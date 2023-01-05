import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CenteredSvgIcon extends StatelessWidget {
  final String iconName;
  final Color color;

  const CenteredSvgIcon({
    super.key,
    required this.iconName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = iconName.endsWith('.svg');
    final factor = isSvg ? 0.5 : 0.6;
    return FractionallySizedBox(
      widthFactor: factor,
      heightFactor: factor,
      child: isSvg
          ? SvgPicture.asset(
              iconName,
              color: color,
            )
          : FittedBox(
              child: Text(
                iconName.substring(0, 1),
                style: TextStyle(color: color),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
