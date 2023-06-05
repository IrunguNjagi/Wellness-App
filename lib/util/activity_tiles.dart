import 'package:flutter/material.dart';

class ExerciseTiles extends StatefulWidget {
  final IconData icon;
  final String exerciseName;
  final int numberOfExercise;

  const ExerciseTiles({
    Key? key,
    required this.icon,
    required this.exerciseName,
    required this.numberOfExercise,
  }) : super(key: key);

  @override
  State<ExerciseTiles> createState() => _ExerciseTilesState();
}

class _ExerciseTilesState extends State<ExerciseTiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.all(25.0),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(widget.icon),
          ),
          title: Text(
            widget.exerciseName,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.numberOfExercise.toString() + " minutes",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
