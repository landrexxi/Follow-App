import 'package:flutter/material.dart';
import 'package:follow_app/teacher/landingpage_teacher.dart';
import 'package:follow_app/teacher/notifs.dart';
import 'package:follow_app/teacher/profile.dart';
import 'package:follow_app/teacher/refer_stud.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class NavBarAdmin extends StatelessWidget {
  const NavBarAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: MultiLevelDrawer(
        backgroundColor: Colors.white,
        rippleColor: Colors.white,
        subMenuBackgroundColor: Colors.grey.shade100,
        header: Container(
          // Header for Drawer

          child: Center(
            // child: Container(
            //   padding: EdgeInsets.only(top: 30),
            //   child: Column(
            //     children: [
            //       Image.asset(
            //         'assets/user.png',
            //         height: 150,
            //         width: 150,
            //       ),
            //       SizedBox(
            //         height: 5,
            //       ),
            //       Text('Username'),
            //     ],
            //   ),
            // ),
            child: UserAccountsDrawerHeader(
              accountName: Text("Carmel Tejana",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              accountEmail: Text("CICCT - Faculty",
                  style: TextStyle(
                    color: Colors.black,
                  )),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://www.pngjoy.com/pngm/129/2615577_teacher-icon-downy-transparent-png.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                // image: DecorationImage(
                //   image: NetworkImage(
                //       'https://blogimage.vantagecircle.com/vcblogimages/2020/06/how-to-conduct-a-proper-employee-counseling-2.png'),
                //   fit: BoxFit.cover,
                // )
              ),
            ),
          ),
        ),
        children: [
          // Child Elements for Each Drawer Item
          MLMenuItem(
              leading: Icon(Icons.upload),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "Upload",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subMenuItems: [
                MLSubmenu(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Referral()),
                      );
                    },
                    submenuContent: Text("Upload Teachers Load")),
                MLSubmenu(
                    onClick: () {},
                    submenuContent: Text("Upload Subject Offered")),
                MLSubmenu(
                    onClick: () {},
                    submenuContent: Text("Upload Faculty Load")),
                MLSubmenu(
                    onClick: () {},
                    submenuContent: Text("Upload Students Load")),
              ],
              onClick: () {}),
          MLMenuItem(
              leading: Icon(Icons.download_sharp),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "Export",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onClick: () {},
              subMenuItems: [
                MLSubmenu(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Referral()),
                      );
                    },
                    submenuContent: Text("Export Teachers Load")),
                MLSubmenu(
                    onClick: () {},
                    submenuContent: Text("Export Subject Offered")),
                MLSubmenu(
                    onClick: () {},
                    submenuContent: Text("Export Faculty Load")),
              ]),
          MLMenuItem(
            leading: Icon(Icons.notifications),
            content: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
