import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class web extends StatelessWidget {
  const web({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("web",
          style: TextStyle(
              color: Color.fromARGB(255, 211, 207, 207), fontSize: 100)),
    );
  }
}
