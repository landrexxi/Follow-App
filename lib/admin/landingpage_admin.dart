import 'package:flutter/material.dart';
import 'package:follow_app/admin/navbar_admin.dart';
import 'package:follow_app/student/navbar_student.dart';
import 'package:follow_app/teacher/navbar_teacher.dart';
import 'package:follow_app/teacher/refer_stud.dart';

class LPageAdmin extends StatefulWidget {
  @override
  _LPageAdminState createState() => _LPageAdminState();
}

class _LPageAdminState extends State<LPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarAdmin(),
      appBar: AppBar(
        title: Text('Follow App'),
        // leading: Image.asset('assets/images/logo.png'),
        backgroundColor: Colors.blue[100],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://blogimage.vantagecircle.com/vcblogimages/2020/06/how-to-conduct-a-proper-employee-counseling-2.png'),
                fit: BoxFit.cover,
              )),
              height: MediaQuery.of(context).size.height / 5.5,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Course Cards',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              )
            ]),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Referral()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Text(
                                  '11065 - Capstone 2',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        blurRadius: 11.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          7.0, // Move to right 10  horizontally
                          7.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
