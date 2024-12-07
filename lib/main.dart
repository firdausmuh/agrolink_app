import 'package:agrolink/screens/auth/login_screen.dart';
import 'package:agrolink/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  bool _isFirstLaunch = true;

  @override
  void initState() {
    super.initState();
    checkFirstLaunch();
    checkLoginStatus();
  }

  void checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstLaunch = prefs.getBool('firstLaunch');
    if (firstLaunch != null && !firstLaunch) {
      setState(() {
        _isFirstLaunch = false;
      });
    }
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Setting the primary color
        primaryColor: Color(0xFF2ECC71), // You can change this to any color
        // Define other theme properties
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green, // Setting secondary (accent) color
        ),
      ),
      home: _isFirstLaunch
          ? WelcomeScreen()

          : _isLoggedIn
              ? MainScreen()
              : LoginScreen(),
    );
  }
}
