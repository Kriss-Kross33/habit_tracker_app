import 'package:flutter/material.dart';
import 'package:habit_tracker_app/src/ui/task/task.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask({super.key});

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin<AnimatedTask> {
  late final AnimationController _animationController;
  late final Animation<double> _cureAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _cureAnimation = _animationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            return TaskCompletionRing(
              progress: _cureAnimation.value,
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
