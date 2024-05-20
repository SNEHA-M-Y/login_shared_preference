import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:login_shared_preference/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_balance_outlined,
          color: Color.fromARGB(255, 4, 154, 9),
        ),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final _sharedPref = await SharedPreferences.getInstance();
                await _sharedPref.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false);
              },
              icon: const Icon(
                Icons.logout_sharp,
                color: Color.fromARGB(255, 4, 154, 9),
              ))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 240, 228, 228),
      body: Center(
        child: ClipPath(
          clipper: WavyCircleClipper(20),
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 56, 56, 56),
              Color.fromARGB(255, 250, 218, 78)
            ])),
            child: Icon(
              Icons.home,
              color: const Color.fromARGB(255, 45, 98, 46),
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}
