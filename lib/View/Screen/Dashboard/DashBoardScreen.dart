import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';
import 'Profile/ProfileScreen.dart';
import 'Wallet/WalletScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  static List<Widget> _screens = [
    HomeScreen(),
    WalletScreen(),
    ProfileScreen(false),
  ];

  static const List<String> _selectedAssets = [
    'assets/images/home.svg',
    'assets/images/chat.svg',
    'assets/images/profile.svg',
  ];
  static const List<String> _unselectedAssets = [
    'assets/images/home_unselect.svg',
    'assets/images/chat_unselect.svg',
    'assets/images/profile_unselect.svg',
  ];
  static const List<String> _labels = [
    'Home',
    'Wallet',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false; // Prevent app from closing
        }
        return true; // Let the app handle back button press normally
      },
      child: Scaffold(
        body: Center(
          child: _screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Color(0xFF0971CC)),
          child: BottomNavigationBar(
            items: List.generate(
              _selectedAssets.length,
                  (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(_selectedIndex == index
                    ? _selectedAssets[index]
                    : _unselectedAssets[index]), // Switch between assets based on selected index
                label: _labels[index], // Empty label to hide text
              ),
            ),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white, // Customize selected item color
            unselectedItemColor: Colors.grey, // Customize unselected item color
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
