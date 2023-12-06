import 'dart:math';

import 'package:dribble_ui/screens/breathing_exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaveAnimation extends StatelessWidget {
  final double value;
  final Color color;

  WaveAnimation({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter(value: value, color: color),
      child: Container(),
    );
  }
}

class WavePainter extends CustomPainter {
  final double value;
  final Color color;

  WavePainter({required this.value, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.shortestSide / 3;
    final double strokeWidth = 2.0;

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double progress = value / 100;

    for (int i = 0; i < 5; i++) {
      double scale = 1 + i * 0.2;
      double circleRadius = radius * scale;

      Path path = Path()
        ..addOval(Rect.fromCircle(
            center: Offset(centerX, centerY), radius: circleRadius));

      double waveAmplitude = 10.0;
      double waveFrequency = 2.0;
      double waveOffset =
          sin(progress * 2 * pi * waveFrequency + i) * waveAmplitude;

      path = path.shift(Offset(0, waveOffset));

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MoodSlider extends StatefulWidget {
  const MoodSlider({Key? key}) : super(key: key);

  @override
  State<MoodSlider> createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  //Initial value for the slider
  double _currentValue = 50.0;

  List<String> moodLabels = [
    'Very Unpleasant',
    'Unpleasant',
    'Slightly Unpleasant',
    'Neutral',
    'Slightly Pleasant',
    'Pleasant',
    'Very Pleasant',
  ];

  @override
  Widget build(BuildContext context) {
    //Calculate background gradient based on slider value
    Color backgroundColor = Color.lerp(
      Color.fromRGBO(128, 0, 128, 0.2), // Purple
      Color.fromRGBO(255, 165, 0, 0.7), // Orange
      _currentValue / 100,
    )!;
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Mood Slider'),
      ),*/
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor.withOpacity(0.5),
              // Adjust gradient opacity as needed
              backgroundColor.withOpacity(0.8),
            ],
            stops: [0.2, 1.0], // Adjust stops for color transitions
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel',
                        style: GoogleFonts.ptSans(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Text(
                'Choose how you\'re feeling',
                style: GoogleFonts.ptSans(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'right now',
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 60),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                child: WaveAnimation(
                  value: _currentValue,
                  color: backgroundColor,
                ),
              ),
            ),
            /*AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 100.0 + (_currentValue - 50).abs(),
              width: 100.0 + (_currentValue - 50).abs(),
              decoration: BoxDecoration(
                color: _currentValue < 50 ? Colors.blue : Colors.yellow,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),*/
            const SizedBox(height: 60.0),
            Text(
              moodLabels[(_currentValue / 100 * 6).round()],
              style: GoogleFonts.ptSans(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.grey.withOpacity(0.2),
                inactiveTrackColor: Colors.grey.withOpacity(0.2),
                trackHeight: 35.0,
                thumbColor: Colors.white,
                overlayColor: Colors.blue.withOpacity(0.3),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 25.0),
              ),
              child: Slider(
                value: _currentValue,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('VERY UNPLEASANT'),
                  Text('VERY PLEASANT'),
                ],
              ),
            ),
            SizedBox(height: 70.0),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BreathingExerciseScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: backgroundColor,
                ),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
