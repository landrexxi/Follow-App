import 'package:flutter/material.dart';
import 'package:follow_app/services/api_manager.dart';
import 'package:follow_app/teacher/list_of_stud.dart';
import 'package:follow_app/teacher/listof_students.dart';
import 'package:follow_app/teacher/navbar_teacher.dart';
import 'package:follow_app/teacher/refer_stud.dart';

import 'package:carousel_slider/carousel_slider.dart';

class LandingPageTeach extends StatefulWidget {
  @override
  _LandingPageTeachState createState() => _LandingPageTeachState();
}

class _LandingPageTeachState extends State<LandingPageTeach> {
  // late Future<CounselorList> _studentslist;
  String lastname = 'Benarao';
  late final int itemNo;

  @override
  // void initState() {
  //   _studentslist = API_Manager().getStudentsList(lastname);
  //   super.initState();
  //   print('yawa');
  //   print(_studentslist.toString());
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: NavBarTeach(),
      appBar: AppBar(
        // toolbarHeight: 150,
        backgroundColor: Color(0xFF98b4ac),
        title: Text('Follow App'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Hi Mother Fucker,',
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 45,
              //           fontFamily: 'DancingScript',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // CAROSEL
              SizedBox(height: 5),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://blogimage.vantagecircle.com/vcblogimages/2020/06/how-to-conduct-a-proper-employee-counseling-2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://st4.depositphotos.com/18280834/23742/v/600/depositphotos_237428130-stock-illustration-patients-reception-psychotherapies-woman-talking.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://thumbs.dreamstime.com/b/group-therapy-people-collective-psychotherapy-counseling-mental-health-support-addiction-psychologist-help-session-206923236.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Course Cards',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  // onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ListofStud()),
                  //     ),
                  child: Container(
                alignment: Alignment.center,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF98b4ac),
                          Color(0xFF98b4ac), // nude
                          Color(0xFF98b4ac),

                          // Color(0xFF1569C7),
                          // Color(0xFFE94057),
                          // Color(0xFFF27121),
                        ])),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )),
            ],
          )),
    );
  }
}
