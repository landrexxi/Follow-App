import 'package:flutter/material.dart';
import 'package:follow_app/student/navbar_student.dart';
import 'package:follow_app/teacher/list_of_stud.dart';
import 'package:follow_app/teacher/navbar_teacher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPageStud extends StatefulWidget {
  @override
  _LandingPageStudState createState() => _LandingPageStudState();
}

class _LandingPageStudState extends State<LandingPageStud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarStud(),
      appBar: AppBar(
        // toolbarHeight: 150,
        backgroundColor: Color(0xFF98b4ac),
        title: Text('Follow App'),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Mother Fucker,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontFamily: 'DancingScript',
                        ),
                      ),
                    ],
                  ),
                ),
                // CAROSEL
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
                GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(40, (index) {
                    return Card(
                      child: Image.network("https://robohash.org/$index"),
                    ); //robohash.org api provide you different images for any number you are giving
                  }),
                ),
              ],
            )),
      ),
    );
  }
}
