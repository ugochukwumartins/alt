import 'package:altinvestv2/styles/app_colors.dart';
import 'package:altinvestv2/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

customNavBar(BuildContext context,
    {required void Function(int) onItemTapped, required int selectedIndex}) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical

    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: AppColors.creamWhite,
          ),
          accountName: const Text(
            'Drawer Header',
            style: TextStyle(color: AppColors.black),
          ),
          accountEmail: const Text(
            '',
            style: TextStyle(color: AppColors.black),
          ),
          currentAccountPicture: SvgPicture.asset(
            logo,
            color: AppColors.primary,
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(
            home,
            color: AppColors.primary,
          ),
          title: const Text('Home'),
          selected: selectedIndex == 0,
          onTap: () {
            // Update the state of the app
            print(selectedIndex);
            onItemTapped(0);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            portfolio,
            color: AppColors.primary,
          ),
          title: const Text('Portfolio'),
          selected: selectedIndex == 1,
          onTap: () {
            // Update the state of the app
            print(selectedIndex);
            onItemTapped(1);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            notification,
            color: AppColors.primary,
          ),
          title: const Text('Notifications'),
          selected: selectedIndex == 2,
          onTap: () {
            // Update the state of the app
            print(selectedIndex);
            onItemTapped(2);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            setting,
            color: AppColors.primary,
          ),
          title: const Text('Settings'),
          selected: selectedIndex == 3,
          onTap: () {
            // Update the state of the app
            print(selectedIndex);
            onItemTapped(3);
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}


  //  drawer: Drawer(
  //       child: ListView(
  //         // Important: Remove any padding from the ListView.
  //         padding: EdgeInsets.zero,
  //         children: [
  //           const DrawerHeader(
  //             decoration: BoxDecoration(
  //               color: Colors.blue,
  //             ),
  //             child: Text('Drawer Header'),
  //           ),
  //           ListTile(
  //             leading: Icon(
  //               Icons.home,
  //             ),
  //             title: const Text('Page 1'),
  //             onTap: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ListTile(
  //             leading: Icon(
  //               Icons.train,
  //             ),
  //             title: const Text('Page 2'),
  //             onTap: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),