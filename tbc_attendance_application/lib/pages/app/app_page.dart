import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tbc_attendance_application/pages/app/feedback/feedback.dart';
import 'package:tbc_attendance_application/pages/app/history/history.dart';
import 'package:tbc_attendance_application/pages/app/home/home.dart';

class Application extends StatefulWidget {
  const Application({Key key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
/* -------------------------------------------------------------------------- */
/*                                  Variable                                  */
/* -------------------------------------------------------------------------- */

  int _selectedIndex = 0;

/* -------------------------------------------------------------------------- */
/*                                  Function                                  */
/* -------------------------------------------------------------------------- */
  onChangePage() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return HistoryPage();
      case 2:
        return FeedbackPage();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.mail),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.feedback), label: "Feedback")
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.verified_user)),
                  Text('Manager'),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.settings)),
                  Text('Setting'),
                ],
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.logout)),
                  Text('Logout'),
                ],
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: onChangePage(),
    );
  }
}
