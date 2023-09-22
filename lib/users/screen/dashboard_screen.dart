import 'dart:ffi';

import 'package:clothes_app/users/screen/favorites_screen.dart';
import 'package:clothes_app/users/screen/home_screen.dart';
import 'package:clothes_app/users/screen/order_screen.dart';
import 'package:clothes_app/users/screen/profile_screen.dart';
import 'package:clothes_app/users/userPreferences/current_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  CurrentUser rememberCurrentUser = Get.put(CurrentUser());

  List<Widget> fragmentScreen = [
    HomeScreen(),
    FavoritesScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  List _navigationButtons = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home"
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites"
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "Orders"
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Profile"
    }
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState){
        rememberCurrentUser.getUserInfo();
      },
      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
              child: Obx(() => fragmentScreen[_indexNumber.value]),
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: List.generate(4, (index) {
              var navBtnProperty = _navigationButtons[index];
              return BottomNavigationBarItem(
                icon: Icon(navBtnProperty['non_active_icon']),
                activeIcon: Icon(navBtnProperty['active_icon']),
                label: navBtnProperty['label'],
                backgroundColor: Colors.black
              );
            }),
            currentIndex: _indexNumber.value,
            onTap: (value){
              _indexNumber.value = value;
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white24,
          ),
          ),
        );
      }
    );
  }
}
