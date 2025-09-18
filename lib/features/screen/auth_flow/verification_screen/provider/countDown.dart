import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef TimerFinishedCallback = void Function();

class CountdownTimerNotifier extends StateNotifier<String> {
  Timer? _timer;
  int _remainingSeconds;
  final int initialSeconds;
  final TimerFinishedCallback? onFinished;

  CountdownTimerNotifier(this.initialSeconds, {this.onFinished})
      : _remainingSeconds = initialSeconds,
        super(_formatTime(initialSeconds)) {
    _startTimer();
  }

  static String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        state = _formatTime(_remainingSeconds);
      } else {
        _timer?.cancel();
        if (onFinished != null) {
          onFinished!();
        }
      }
    });
  }

  void reset([int? seconds]) {
    _timer?.cancel();
    _remainingSeconds = seconds ?? initialSeconds;
    state = _formatTime(_remainingSeconds);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}



final countdownTimerProvider = StateNotifierProvider<CountdownTimerNotifier, String>((ref) {
  return CountdownTimerNotifier(119, onFinished: () {
    ref.read(countDownFinished.notifier).state = true;
  });
});

final countDownFinished = StateProvider<bool>((ref)=>false);