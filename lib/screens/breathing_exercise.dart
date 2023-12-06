import 'package:dribble_ui/screens/home_page.dart';
import 'package:dribble_ui/screens/quotes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BreathingExerciseScreen extends StatefulWidget {
  const BreathingExerciseScreen({super.key});

  @override
  _BreathingExerciseScreenState createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with TickerProviderStateMixin {
  late AnimationController _breathController;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _breathController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _textAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_breathController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _breathController.dispose();
    super.dispose();
  }

  //So we can use this method if we only want one button to start and stop the animation
  /*void toggleBreathing() {
    if (_isBreathing) {
      _breathController.stop();
    } else {
      _breathController.repeat(reverse: true);
    }

    setState(() {
      _isBreathing = !_isBreathing;
    });
  }*/
  void startBreathing() {
    _breathController.repeat(reverse: true);
  }

  void stopBreathing() {
    _breathController.stop();
    setState(() {
    });
  }

  void restartBreathing() {
    _breathController.reset();
    _breathController.repeat(reverse: true);
    setState(() {
    });
  }

  String getBreathingText() {
    if (_breathController.status == AnimationStatus.forward) {
      return 'Breathe In';
    } else {
      return 'Breathe Out';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4EDE1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 38.0,
            right: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                      )),
                  Text(
                    'Meditate',
                    style: GoogleFonts.ptSans(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      )),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.3),
                height: 1,
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Benefits:',
                          style: GoogleFonts.ptSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Reduced Anxiety',
                          style: GoogleFonts.ptSans(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.pinkAccent.withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 30.0,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/meditation.png',
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                getBreathingText(),
                style:
                    GoogleFonts.poppins(fontSize: 30.0 * _textAnimation.value),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              ModernBreathingAnimation(controller: _breathController),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      startBreathing();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.0),
                        color: Colors.grey.withOpacity(0.1),
                        border: Border.all(
                            color: Colors.grey.withOpacity(
                              0.1,
                            )),
                      ),
                      child: Text('Start breathing'),
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  GestureDetector(
                    onTap: () {
                      stopBreathing();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.0),
                        color: Colors.grey.withOpacity(0.1),
                        border: Border.all(
                            color: Colors.grey.withOpacity(
                          0.1,
                        )),
                      ),
                      child: Text('Stop breathing'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35.0),
              GestureDetector(
                onTap: () {
                  restartBreathing();
                },
                child: Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color(0XFF89A597),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Icon(
                          Icons.restart_alt,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 47),
                      Text(
                        'Restart Exercise',
                        style: GoogleFonts.ptSans(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    color: const Color(0XFF89A597),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    'Complete Exercise',
                    style: GoogleFonts.ptSans(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              /*GestureDetector(
                onTap: () {
                  toggleBreathing();
                },
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Icon(
                      _isBreathing ? Icons.stop : Icons.play_arrow,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class ModernBreathingAnimation extends StatelessWidget {
  final AnimationController controller;

  ModernBreathingAnimation({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.pinkAccent.withOpacity(0.6),
                Colors.pinkAccent.withOpacity(0.2),
              ],
            ),
          ),
          child: Center(
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: controller,
                curve: Curves.easeInOutSine,
              ),
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pinkAccent.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.6),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
