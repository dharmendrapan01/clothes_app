import 'package:clothes_app/users/authontication/login_screen.dart';
import 'package:clothes_app/users/screen/dashboard_screen.dart';
import 'package:clothes_app/users/userPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothes Store App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
          future: UserPreferences.readUserInfo(),
          builder: (context, dataSnapShot) {
            if(dataSnapShot.data == null){
              return const LoginScreen();
            }else{
              return DashboardScreen();
            }
          }
      ),
    );
  }
}
