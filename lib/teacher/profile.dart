import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfState createState() => _ProfState();
}

class _ProfState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    ));
  }
}
