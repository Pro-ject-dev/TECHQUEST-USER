import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/homepage.dart';

class wait extends StatefulWidget {
  const wait({super.key});

  @override
  State<wait> createState() => _waitState();
}

class _waitState extends State<wait> {
  late Timer _timer;
  final StreamController _streamController = StreamController();

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        get_status();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              if (status.length != 0) {
                if (status[status.length - 1]["status"] == "1") {
                  _timer.cancel();
                  _streamController.close();
                  return homepage();
                } else {
                  return Center(
                    child: Text("Please Wait for confirmation.....",
                        style:
                            GoogleFonts.aleo(color: Colors.red, fontSize: 24)),
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }));
  }
}
