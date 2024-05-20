import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_shared_preference/homescreen.dart';
import 'package:login_shared_preference/loginpage.dart';
import 'package:login_shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscrn extends StatefulWidget {
  const splashscrn({super.key});

  @override
  State<splashscrn> createState() => _splashscrnState();
}

class _splashscrnState extends State<splashscrn>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Icon(
          Icons.account_balance_outlined,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      },
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPref = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPref.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      log('${_sharedPref.getBool(SAVE_KEY_NAME)}');

      gotoLogin();
    } else {
      log('${_sharedPref.getBool(SAVE_KEY_NAME)}');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }
  }
}
