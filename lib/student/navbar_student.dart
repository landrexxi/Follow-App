import 'package:flutter/material.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:follow_app/teacher/notifs.dart';
import 'package:follow_app/teacher/profile.dart';
import 'package:follow_app/teacher/refer_stud.dart';

class NavBarStud extends StatelessWidget {
  const NavBarStud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Reciousa Piffy",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
              "Master in Information Technology",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://mpng.subpng.com/20180603/jx/kisspng-user-interface-design-computer-icons-default-stephen-salazar-photography-5b1462e1b19d70.1261504615280626897275.jpg",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF98b4ac),
              // image: DecorationImage(
              //   image: NetworkImage(
              //       'https://wallpaperaccess.com/full/2069464.jpg'),
              //   fit: BoxFit.cover,
              // )
            ),
          ),
          SizedBox(
            height: 23,
          ),
          ListTile(
              leading: Icon(
                Icons.notifications,
                size: 25,
                color: Colors.black,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notif()),
                );
              }),
          SizedBox(
            height: 10,
          ),
          ListTile(
              leading: Icon(
                Icons.logout,
                size: 25,
                color: Colors.black,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notif()),
                );
              }),
        ],
      ),
    );
  }
}
