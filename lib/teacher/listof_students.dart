import 'package:flutter/material.dart';

class ListOfStudents extends StatefulWidget {
  @override
  _ListOfStudentsState createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('List of Students'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Text('Precious Gift Canovas'),
              ),
              Card(
                child: Text('Becs Evangelista'),
              ),
              Card(
                child: Text('Epiffy Villaro'),
              ),
              Card(
                child: Text('Double Kent Kent'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
