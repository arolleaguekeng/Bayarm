import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_compass/flutter_compass.dart';

class OrientationExample extends StatefulWidget {
  @override
  _OrientationExampleState createState() => _OrientationExampleState();
}

class _OrientationExampleState extends State<OrientationExample> {
   double _orientation=0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _getOrientation();
  }

  void _getOrientation() async {
    FlutterCompass.events!.listen((CompassEvent event) {
      setState(() {
        _orientation = event.heading!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _orientation != null
              ? _orientation.toStringAsFixed(2) + "°"
              : "Loading orientation...",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}