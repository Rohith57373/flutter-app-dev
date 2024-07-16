import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './routes.dart';
// import './pages/login_page.dart';
// import 'package:final_pro/pages/login_page.dart';
// import 'package:final_pro/utlities/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageurl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmrBbQETZuM-oThkfQ6rVOmlodWrfi20d6CECp5WzBjA6KDb4KENysIt-USwkzmReTMRw&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  accountName: Text(
                    "Rohith R ",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    "secondaryemail@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  // decoration:
                  //     BoxDecoration(color: Color.fromARGB(255, 214, 9, 9)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                  )),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text("Home",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                  title: Text("Profile",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings_solid,
                color: Colors.white,
              ),
              title: Text("Settings",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 355,
            ),
            Expanded(
              child: ListTile(
                trailing: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  " \t Logout",
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
