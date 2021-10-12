import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Notification'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Joy sends a feedback',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Guidance Counselor',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    // itemCount: myList.length,
                  ),
                ),
              ],
            )));
  }
}
