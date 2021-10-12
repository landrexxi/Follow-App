// import 'package:flutter/material.dart';
// import 'package:follow_app/models/students_list.dart';
// import 'package:follow_app/services/api_manager.dart';
// import 'package:follow_app/teacher/listof_students.dart';
// import 'package:follow_app/teacher/navbar_teacher.dart';
// import 'package:follow_app/teacher/refer_stud.dart';

// class ListofStud extends StatefulWidget {
//   @override
//   _ListofStudState createState() => _ListofStudState();
// }

// class _ListofStudState extends State<ListofStud> {
//   late Future<CounselorList> _studentslist;
//   String lastname = '20191';
//   @override
//   void initState() {
//     _studentslist = API_Manager().getStudentsList(lastname);
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF98b4ac),
//         title: Text('List of Students'),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 color: Colors.grey[300],
//                 height: 500,
//                 child: FutureBuilder<CounselorList>(
//                   future: _studentslist,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                           itemCount: snapshot.data!.counselors.length,
//                           itemBuilder: (context, index) {
//                             var stud = snapshot.data!.counselors[index];
//                             return GestureDetector(
//                               onTap: () {},
//                               child: Padding(
//                                 padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
//                                 child: Card(
//                                   child: Container(
//                                     height: 100,
//                                     margin: const EdgeInsets.all(8),
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(width: 16),
//                                         Flexible(
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 70),
//                                                 child: Text(
//                                                   stud.employeeid,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 70),
//                                                 child: Text(
//                                                   stud.firstname,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 70),
//                                                 child: Text(
//                                                   stud.lastname,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           });
//                     } else
//                       // return Column(children: [Text(snapshot.toString())]);
//                       return Container();
//                   },
//                 ),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }
