import 'package:flutter/material.dart';
import 'package:kbc/screens/home_page.dart';
import 'package:kbc/screens/profile_detail_screen.dart';
import 'package:kbc/utility/app_theme.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: '',
            activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppTheme.instance.colorLightGreen,
                    shape: BoxShape.circle),
                child: const Padding(
                    padding: EdgeInsets.all(8), child: Icon(Icons.home))),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: '',
            activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppTheme.instance.colorLightGreen,
                    shape: BoxShape.circle),
                child: const Padding(
                    padding: EdgeInsets.all(8), child: Icon(Icons.feed))),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: '',
            activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppTheme.instance.colorLightGreen,
                    shape: BoxShape.circle),
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.calendar_month_sharp))),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_outlined),
            label: '',
            activeIcon: Container(
                decoration: BoxDecoration(
                    color: AppTheme.instance.colorLightGreen,
                    shape: BoxShape.circle),
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.notification_add_outlined))),
          ),
        ],
      ),
    );
  }
}
