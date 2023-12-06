import 'package:dribble_ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final TextEditingController _nameController = TextEditingController();

  void navigateToHome(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(userName: _nameController.text,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: GoogleFonts.poppins(
              fontSize: 36.0,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Enter your name'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () {
                navigateToHome();
              },
              child: Text(
                'Get Started',
              ),
          ),
        ],
      ),
    );
  }
}
