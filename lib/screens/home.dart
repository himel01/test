import 'package:flutter/material.dart';
import 'package:untitled_test/screens/bottom_navigation_screens/add_user.dart';
import 'package:untitled_test/screens/bottom_navigation_screens/profile.dart';
import 'package:untitled_test/screens/bottom_navigation_screens/user_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [AddUser(), Profile(), UserList()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        //elevation: 50.0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add User"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: "User List"),
        ],
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          color: Colors.white30,
        ),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
      ),
    );
  }
}
