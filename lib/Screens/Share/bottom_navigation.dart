import 'package:flutter/material.dart';

import '../../Constant/images.dart';
import '../news_feed.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const NewsFeedScreen(),
    Container(
      color: Colors.white,
      child: const Center(child: Text('Search')),
    ),
    Container(
      color: Colors.white,
      child: const Center(child: Text('Add')),
    ),
    Container(
      color: Colors.white,
      child: const Center(child: Text('Profile')),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(40, 42, 58, 1),
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Color.fromRGBO(129, 53, 249, 1),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(40, 42, 58, 1),
              ),
              label: 'Search',
              activeIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(129, 53, 249, 1),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Color.fromRGBO(40, 42, 58, 1),
              ),
              label: 'Add',
              activeIcon: Icon(
                Icons.add,
                color: Color.fromRGBO(129, 53, 249, 1),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(dummyProfile),
                //color: Color.fromRGBO(40, 42, 58, 1),
              ),
              label: 'Profile',
              // activeIcon: Icon(
              //   Icons.add,
              //   color: Color.fromRGBO(129, 53, 249, 1),
              // ),
            ),
          ],
        ));
  }
}
