import 'package:altinvestv2/Onboarding/landingPagescreen.dart';
import 'package:altinvestv2/ReuasbleWidget/appBar.dart';
import 'package:altinvestv2/ReuasbleWidget/nav_%20bar.dart';
import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    LandingPagescreen(),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
    const Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        showBackButton: false,
      ),
      drawer: customNavBar(context,
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          backgroundColor: AppColors.creamWhite,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                home,
                color: AppColors.gray3,
              ),
              activeIcon: SvgPicture.asset(
                home,
                color: AppColors.primary,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(portfolio),
              activeIcon: SvgPicture.asset(
                portfolio,
                color: AppColors.primary,
              ),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(notification),
              label: 'Notifications',
              activeIcon: SvgPicture.asset(
                notification,
                color: AppColors.primary,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(setting),
              label: 'Settings',
              activeIcon: SvgPicture.asset(
                setting,
                color: AppColors.primary,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
