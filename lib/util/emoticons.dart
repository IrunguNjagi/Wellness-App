import 'package:flutter/material.dart';

class EmojiFaces extends StatelessWidget {

  final String emojiFace;

  const EmojiFaces({Key? key,
    required this.emojiFace })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.blue[600],
      ),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(emojiFace,
          style: TextStyle(
          fontSize: 28.0
        ),
        ),
      ),
    );
  }
}
