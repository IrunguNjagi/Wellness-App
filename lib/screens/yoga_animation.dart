import 'package:dribble_ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../models/yoga_pose.dart';

class YogaAnime extends StatefulWidget {
  const YogaAnime({Key? key}) : super(key: key);

  @override
  State<YogaAnime> createState() => _YogaAnimeState();
}

class _YogaAnimeState extends State<YogaAnime> {
  /*Here ive just created a list that stores the
  yoga animations and descriptions for better handling
   */
  final List<YogaPose> yogaPoses = [
    YogaPose(
      name: 'Anjaneysana',
      description:
          'The Low Lunge Pose, also known as Anjaneyasana, combines strength and flexibility.Stretches the hips, thighs, and groin, while simultaneously building strength in the legs and core.',
      animationFile: 'assets/images/split_pose.json',
    ),
    YogaPose(
      name: 'Boat Pose',
      description:
          'The Low Lunge Pose, also known as Anjaneyasana, combines strength and flexibility.Stretches the hips, thighs, and groin, while simultaneously building strength in the legs and core.',
      animationFile: 'assets/images/boat_pose.json',
    ),
    YogaPose(
      name: 'Core Pose',
      description:
          'The Low Lunge Pose, also known as Anjaneyasana, combines strength and flexibility.Stretches the hips, thighs, and groin, while simultaneously building strength in the legs and core.',
      animationFile: 'assets/images/core_pose.json',
    ),
  ];
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4EDE1),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
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
                  'Yoga Poses',
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
            Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: yogaPoses.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return buildYogaPose(yogaPoses[index]);
                  },
            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildYogaPose(YogaPose yogaPose) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          child: Lottie.asset(yogaPose.animationFile),
        ),
        const SizedBox(height: 20.0),
        Text(
          yogaPose.name,
          style: GoogleFonts.poppins(
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
          ),
        ),
          const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            yogaPose.description,
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: Text('Complete ',style: GoogleFonts.poppins(fontSize: 16.0),),
        ),
      ],
    );
  }
}
