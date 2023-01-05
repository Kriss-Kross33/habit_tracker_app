import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/core.dart';

class TaskCompletionRing extends StatelessWidget {
  final double progress;
  const TaskCompletionRing({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          taskCompletedColor: themeData.accent,
          taskNotCompletedColor: themeData.taskRing,
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;
  final Color taskCompletedColor;
  final Color taskNotCompletedColor;

  RingPainter({
    required this.progress,
    required this.taskCompletedColor,
    required this.taskNotCompletedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2.0, size.height / 2.0);
    final notCompleted = progress < 1.0;
    final radius =
        notCompleted ? (size.width - strokeWidth) / 2.0 : size.width / 2.0;

    if (notCompleted) {
      final backgroundPaint = Paint()
        ..isAntiAlias = true
        ..color = taskNotCompletedColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }
    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..color = taskCompletedColor
      ..strokeWidth = strokeWidth
      ..style = notCompleted ? PaintingStyle.stroke : PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
