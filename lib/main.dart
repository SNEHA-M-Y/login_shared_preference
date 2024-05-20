import 'package:flutter/material.dart';
import 'package:login_shared_preference/splashscreen.dart';

const SAVE_KEY_NAME = "UserLoggedIn";
const USER_NAME = "UserName";
const PASSWORD = "PassWord";

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscrn(),
    ),
  );
}
