import 'package:flutter/material.dart';
import 'package:habit_tracker_app/src/core/core.dart';
import 'package:habit_tracker_app/src/ui/ui.dart';

class AnimatedTask extends StatefulWidget {
  final String iconName;
  const AnimatedTask({
    super.key,
    required this.iconName,
  });

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin<AnimatedTask> {
  late final AnimationController _animationController;
  late final Animation<double> _cureAnimation;
  bool _showCheckIcon = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _animationController.addStatusListener(_checkStatusUpdates);
    _cureAnimation = _animationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_checkStatusUpdates);
    _animationController.dispose();
    super.dispose();
  }

  void _checkStatusUpdates(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() => _showCheckIcon = true);
      Future.delayed(Duration(seconds: 1), () {
        setState((() => _showCheckIcon = false));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handlePanDown,
      onTapUp: _handleTapUp,
      onPanEnd: (_) {},
      child: AnimatedBuilder(
          animation: _cureAnimation,
          builder: (context, child) {
            final themeData = AppTheme.of(context);
            final progress = _animationController.value;
            final hasCompleted = progress == 1.0;
            return Stack(
              children: [
                TaskCompletionRing(
                  progress: progress,
                ),
                Positioned.fill(
                  child: CenteredSvgIcon(
                    iconName: hasCompleted && _showCheckIcon
                        ? AppAssets.check
                        : widget.iconName,
                    color: progress != 1.0
                        ? themeData.taskIcon
                        : themeData.accentNegative,
                  ),
                ),
              ],
            );
          }),
    );
  }

  void _handlePanDown(TapDownDetails? tapDownDetails) {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.forward();
    } else {
      _animationController.value = 0.0;
    }
  }

  void _handleTapUp(TapUpDetails? tapUpDetails) {
    if (_animationController.value != 1.0) {
      _animationController.reverse();
    }
  }
}
