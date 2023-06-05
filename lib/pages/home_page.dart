import 'package:dribble_ui/util/activity_tiles.dart';
import 'package:dribble_ui/util/emoticons.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.8),
      bottomNavigationBar: const GNav(
        backgroundColor: Colors.white,
         activeColor: Colors.black,
         tabBackgroundColor: Colors.white,
         tabs: [
           GButton(icon: Icons.home),
           GButton(icon: Icons.search),
           GButton(icon: Icons.phishing),
      ],

      ),
      body:  SafeArea(
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     //Text
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text('Hello Bandz',style: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                           fontSize: 24.0,
                         ),
                         ),
                         const SizedBox(height: 8.0,),
                         Text("05 Jun 2023",style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           color: Colors.blue[100],
                         ))
                       ],
                     ),
                     //Notification Icon
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12.0),
                           color: Colors.blue[600]
                       ),
                       padding: const EdgeInsets.all(25.0),
                       child: const Icon(
                         Icons.notifications,
                         color: Colors.white,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 20.0),
                 Container(
                   decoration: BoxDecoration(
                     color: Colors.blue[600],
                     borderRadius: BorderRadius.circular(12.0),
                   ),
                   padding: const EdgeInsets.all(12.0),
                   child: const Row(
                     children: [
                       Icon(Icons.search,color: Colors.white),
                       SizedBox(width:5.0),
                       Text("Search",style: TextStyle(
                         color: Colors.white,
                       ),)
                     ],
                   ),
                 ),
                 const SizedBox(
                   height: 25.0,
                 ),
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('How do you feel?',style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       fontSize: 24.0,
                     ),
                     ),
                     Icon(Icons.more_horiz, color: Colors.white,)
                   ],
                 ),
                 const SizedBox(
                     height: 25.0
                 ),
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     //sad
                     Column(
                       children: [
                         EmojiFaces(emojiFace: "😩",),
                         SizedBox(height: 8.0,),
                         Text("Sad",style: TextStyle(
                           color: Colors.white,
                         )),
                       ],
                     ),
                     //fine
                     Column(
                       children: [
                         EmojiFaces(emojiFace: "🙂",),
                         SizedBox(height: 8.0,),
                         Text("Fine",style: TextStyle(
                           color: Colors.white,
                         )),
                       ],
                     ),
                     //well
                     Column(
                       children: [
                         EmojiFaces(emojiFace: "😄",),
                         SizedBox(height: 8.0,),
                         Text("Well",style: TextStyle(
                           color: Colors.white,
                         )),
                       ],
                     ),
                     //excellent
                     Column(
                       children: [
                         EmojiFaces(emojiFace: "😁",),
                         SizedBox(height: 8.0,),
                         Text("Excellent",style: TextStyle(
                           color: Colors.white,
                         ),
                         ),
                       ],
                     ),
                   ],

                 ),
               ],
             ),
           ),
            const SizedBox(height: 25.0,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft:Radius.circular(30.0), ),
                ),
               child:  Column(
                 children: [
                   const Padding(
                     padding: EdgeInsets.only(top: 20.0),
                     child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Exercises",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold)),
                           Icon(Icons.more_horiz),
                         ],
                     ),
                   ),
                   const SizedBox(height: 20.0),
                    Expanded(
                      child: ListView(
                       children: const [
                         ExerciseTiles(
                             icon: Icons.favorite,
                             exerciseName: "Mediate",
                             numberOfExercise: 10
                         ),
                         ExerciseTiles(
                             icon: Icons.accessibility_new,
                             exerciseName: "Active Yoga",
                             numberOfExercise: 20
                         ),
                         ExerciseTiles(
                             icon: Icons.book,
                             exerciseName: "Read a Book",
                             numberOfExercise: 15
                         ),
                         ExerciseTiles(
                             icon: Icons.phone_in_talk,
                             exerciseName: "Call Therapist",
                             numberOfExercise: 20
                         ),
                       ],
                   ),
                    )
                 ],
               ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

