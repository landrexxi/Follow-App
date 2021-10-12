import 'package:flutter/material.dart';
import 'package:follow_app/admin/navbar_admin.dart';
import 'package:follow_app/councilor/navbar_councilor.dart';
import 'package:follow_app/student/navbar_student.dart';
import 'package:follow_app/teacher/navbar_teacher.dart';

class LPageCouncil extends StatefulWidget {
  @override
  _LPageCouncilState createState() => _LPageCouncilState();
}

class _LPageCouncilState extends State<LPageCouncil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarCouncilor(),
      appBar: AppBar(
        title: Text('Follow App'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      // child: AspectRatio(
                      //     aspectRatio: 1,
                      //     child: Image.network(
                      //       cat.strCategoryThumb,
                      //       fit: BoxFit.cover,
                      //     )),
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(
                              'Rawr',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Text(
                          //   cat.strCategoryDescription,
                          //   maxLines: 3,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
