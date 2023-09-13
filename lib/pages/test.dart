import 'package:flutter/material.dart';
import 'dart:async';

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  Timer? _timer;
  int _elapsedMilliseconds = 0;

  void startTimer() {
    const oneMillisecond = Duration(milliseconds: 1);

    _timer = Timer.periodic(oneMillisecond, (timer) {
      setState(() {
        _elapsedMilliseconds += 1;
      });
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _elapsedMilliseconds = 0;
    });
  }

  String formatTimer(int milliseconds) {
    int seconds = (milliseconds ~/ 1000) % 60;
    int remainingMilliseconds = milliseconds % 1000;

    String secondsStr = seconds.toString().padLeft(2, '0');
    String millisecondsStr = remainingMilliseconds.toString().padLeft(3, '0');

    return '$secondsStr:$millisecondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Indicator Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              value: _elapsedMilliseconds /
                  60000.0, // 60,000 milliseconds in a minute
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              formatTimer(_elapsedMilliseconds),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    stopTimer();
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}
