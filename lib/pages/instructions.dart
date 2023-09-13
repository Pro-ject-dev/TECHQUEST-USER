import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class instructions extends StatefulWidget {
  const instructions({super.key});

  @override
  State<instructions> createState() => _instructionsState();
}

class _instructionsState extends State<instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instructions")),
    );
  }
}
