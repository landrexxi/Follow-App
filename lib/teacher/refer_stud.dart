import 'package:flutter/material.dart';
import 'package:follow_app/login_newpass.dart';

class Referral extends StatefulWidget {
  @override
  _RefState createState() => _RefState();
}

class _RefState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF98b4ac),
        title: Text('Refferal'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // height: 470,
                // width: 325,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFd8c090),
                          Color(0xFFd8c090), // nude
                          Color(0xFFd8c090),

                          // Color(0xFF1569C7),
                          // Color(0xFFE94057),
                          // Color(0xFFF27121),
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Hello',
                      style: TextStyle(
                          color: Color(0xFF48444c),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Input here to Reffer a Student',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF48444c),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Input Student ID',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.perm_identity,
                              size: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'First Name',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.info_outline,
                              size: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Last Name',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.info_outline,
                              size: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Input Degree Program',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.dashboard,
                              size: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Input Subject Referred',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.book,
                              size: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        maxLength: 1000,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Reasons:',
                            fillColor: Color(0xFF48444c),
                            suffixIcon: Icon(
                              Icons.info_outline,
                              size: 17,
                            )),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      // child: TextFormField(
                      //   keyboardType: TextInputType.multiline,
                      //   maxLines: 8,
                      //   maxLength: 1000,
                      // ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // GestureDetector(
                    //     onTap: () => Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => LoginNewPass()),
                    //         ),
                    //     child: Container(
                    //       alignment: Alignment.center,
                    //       width: 250,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           gradient: LinearGradient(
                    //               begin: Alignment.centerLeft,
                    //               end: Alignment.centerRight,
                    //               colors: [
                    //                 Color(0xFF98b4ac),
                    //                 Color(0xFF98b4ac), // nude
                    //                 Color(0xFF98b4ac),

                    //                 // Color(0xFF1569C7),
                    //                 // Color(0xFFE94057),
                    //                 // Color(0xFFF27121),
                    //               ])),
                    //       child: Padding(
                    //         padding: EdgeInsets.all(12.0),
                    //         child: Text('Submit',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 20,
                    //               fontWeight: FontWeight.bold,
                    //             )),
                    //       ),
                    //     ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
