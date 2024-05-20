import 'package:flutter/material.dart';
import 'package:login_shared_preference/homescreen.dart';
import 'package:login_shared_preference/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        leading: const Icon(
          Icons.account_balance_outlined,
          color: Colors.blueGrey,
          size: 30,
        ),
        backgroundColor: Colors.white,
      ),
      // backgroundColor: Colors.blueAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 146, 167, 178),
              Color.fromARGB(255, 242, 192, 209)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "User Name",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: usernamecontroller,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: passwordcontroller,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final _sharedPref = await SharedPreferences.getInstance();
                    await _sharedPref.setString(USER_NAME, "Joe");
                    await _sharedPref.setString(PASSWORD, "Joe123");
                    if (usernamecontroller.text ==
                            _sharedPref.getString(USER_NAME) &&
                        passwordcontroller.text ==
                            _sharedPref.getString(PASSWORD)) {
                      await _sharedPref.setBool(SAVE_KEY_NAME, true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    } else if (usernamecontroller.text.isEmpty ||
                        passwordcontroller.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text("Please Fill The Required Fields"),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text("Invalid Entries"),
                        ),
                      );
                    }
                  },
                  child: const Text("Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    fixedSize: const Size(150, 50),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    usernamecontroller.clear();
                    passwordcontroller.clear();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(150, 50),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
