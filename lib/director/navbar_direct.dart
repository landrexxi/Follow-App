import 'package:flutter/material.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:follow_app/teacher/notifs.dart';
import 'package:follow_app/teacher/profile.dart';
import 'package:follow_app/teacher/refer_stud.dart';

class NavBarDirect extends StatelessWidget {
  const NavBarDirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Carmel Tejana"),
            accountEmail: Text("CICCT - Faculty"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://pbs.twimg.com/profile_images/1409901056155213824/axsG7qly.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://wallpaperaccess.com/full/2069464.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notif()),
                );
              }),
          ListTile(
              leading: Icon(Icons.note),
              title: Text('Schedule'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Referral()),
                );
              }),
          ListTile(
              leading: Icon(Icons.note),
              title: Text('List of Referred Students'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Referral()),
                );
              }),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }),
        ],
      ),
    );
  }
}
