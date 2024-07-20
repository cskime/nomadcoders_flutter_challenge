import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/custom_paint_pomotimer/widgets/control/control_button.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/custom_paint_pomotimer/widgets/control/control_button_style.dart';
import 'package:nomadcoders_flutter_challenge/flutter_animations_masterclass_challenge/custom_paint_pomotimer/widgets/timer/timer_view.dart';

void main() => runApp(const CustomPaintPomoTimerApp());

class CustomPaintPomoTimerApp extends StatefulWidget {
  const CustomPaintPomoTimerApp({super.key});

  @override
  State<CustomPaintPomoTimerApp> createState() =>
      _CustomPaintPomoTimerAppState();
}

class _CustomPaintPomoTimerAppState extends State<CustomPaintPomoTimerApp>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  final _runningTime = const Duration(minutes: 1);
  late var _currentTime = _runningTime;

  var _isPlaying = false;

  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.elasticOut,
  );

  double get _progressEnd =>
      max(0.005, _runningTime.inSeconds - _currentTime.inSeconds) /
      _runningTime.inSeconds;

  late var _progress = Tween(
    begin: 0.005,
    end: _progressEnd,
  ).animate(_animation);

  @override
  void dispose() {
    _resetTimer();
    super.dispose();
  }

  void _timerCallback(Timer timer) {
    setState(() {
      final prevProgressEnd = _progressEnd;
      _currentTime -= const Duration(seconds: 1);
      _playAnimation(begin: prevProgressEnd, end: _progressEnd);

      if (_currentTime == Duration.zero) {
        _resetTimer();
      }
    });
  }

  void _playAnimation({
    required double begin,
    required double end,
  }) {
    _animationController.reset();
    _progress = Tween(
      begin: begin,
      end: end,
    ).animate(_animation);
    _animationController.forward();
  }

  void _resetTimer() {
    _timer?.cancel();
    _timer = null;
    _currentTime = _runningTime;
    _isPlaying = false;
    _resetAnimation();
  }

  void _resetAnimation() {
    _progress = Tween(
      begin: 0.005,
      end: _progressEnd,
    ).animate(_animation);
    _animationController.reset();
  }

  void _onReset() {
    setState(() {
      _resetTimer();
    });
  }

  void _onPlay() {
    setState(() {
      _isPlaying = true;
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        _timerCallback,
      );
    });
  }

  void _onPause() {
    setState(() {
      _isPlaying = false;
      _timer?.cancel();
    });
  }

  void _onStop() {
    setState(() {
      _resetTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              AnimatedBuilder(
                animation: _progress,
                builder: (context, child) => TimerView(
                  time: _currentTime,
                  progress: _progress.value,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ControlButton(
                      onPressed: _onReset,
                      iconData: Icons.repeat,
                      style: ControlButtonStyle.secondary,
                    ),
                    const SizedBox(width: 16),
                    ControlButton(
                      onPressed: _isPlaying ? _onPause : _onPlay,
                      iconData: _isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      style: ControlButtonStyle.primary,
                    ),
                    const SizedBox(width: 16),
                    ControlButton(
                      onPressed: _onStop,
                      iconData: Icons.stop,
                      style: ControlButtonStyle.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
