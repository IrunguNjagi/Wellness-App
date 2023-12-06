import 'dart:async';

import 'package:flutter/material.dart';


class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  int _selectedTimeInMinutes = 15; // Initial time in minutes
  int _currentTimeInSeconds = 15 * 60; // Initial time in seconds

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(minutes: _selectedTimeInMinutes),
    );

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_currentTimeInSeconds > 0) {
        setState(() {
          _currentTimeInSeconds--;
        });
      } else {
        _timer.cancel();
        _animationController.stop();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _animationController.forward();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_currentTimeInSeconds > 0) {
        setState(() {
          _currentTimeInSeconds--;
        });
      } else {
        _timer.cancel();
        _animationController.stop();
      }
    });
  }

  void _resetTimer() {
    _timer.cancel();
    _animationController.reset();
    setState(() {
      _currentTimeInSeconds = _selectedTimeInMinutes * 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _currentTimeInSeconds ~/ 60; // Convert seconds to minutes
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Page'),
      ),
      backgroundColor: const Color(0XFFF4EDE1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 1 - (_currentTimeInSeconds / (_selectedTimeInMinutes * 60)),
                  color: Colors.blue,
                ),
                Text(
                  '$minutes', // Display only minutes
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigate back to the homepage or any desired page
              Navigator.pop(context);
            },
            child: Text('Done'),
          ),
        ),
      ),
    );
  }
}
