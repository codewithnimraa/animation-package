/// Demonstrates how to create a custom controller to change the speed of an
/// animation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SpeedyAnimation extends StatefulWidget {
  const SpeedyAnimation({super.key});

  @override
  State<SpeedyAnimation> createState() => _SpeedyAnimationState();
}

class _SpeedyAnimationState extends State<SpeedyAnimation> {
  bool _enable = false;

  Timer? _timer;
  int _secs = 0;
  SMIInput<double>? isGrow;

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_secs >= 20) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _enable = true;
          _secs++;

          isGrow?.value += 5;
        });
      }
    });
  }

  void _pause() {
    setState(() {
      _enable = false;
      _timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Controller - Speed'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 0),
            height: 400,
            child: RiveAnimation.asset(
              'assets/vehicles.riv',
              fit: BoxFit.cover,
              animations: const ['idle'],
              controllers: [SpeedController('curves', speedMultiplier: 1)],
            ),
          ),
          Text(
            '00:${_secs.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 40),
          ),
          _enable
              ? IconButton(
                  onPressed: _pause,
                  icon: Icon(
                    _enable ? Icons.pause_circle : Icons.play_circle,
                    size: 60,
                    color: Colors.black,
                  ))
              : IconButton(
                  onPressed: _startTimer,
                  icon: Icon(
                    _enable ? Icons.pause_circle : Icons.play_circle,
                    size: 60,
                    color: Colors.black,
                  ))
        ],
      ),
      //  Center(
      //   child: RiveAnimation.asset(
      //     'assets/vehicles.riv',
      //     fit: BoxFit.cover,
      //     animations: const ['idle'],
      //     controllers: [SpeedController('curves', speedMultiplier: 1)],
      //   ),
      // ),
    );
  }
}

class SpeedController extends SimpleAnimation {
  final double speedMultiplier;

  SpeedController(
    String animationName, {
    double mix = 1,
    this.speedMultiplier = 1,
  }) : super(animationName, mix: mix);

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null || !instance!.keepGoing) {
      isActive = false;
    }
    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds * speedMultiplier);
  }
}
