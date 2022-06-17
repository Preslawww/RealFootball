import 'package:flutter/material.dart';
import 'package:real_football/reusable_widget/reusable_widget.dart';

import '../reusable_widget.dart/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();
TextEditingController _userNameTextController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF212121),
            Color.fromARGB(223, 3, 143, 8),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                  child: Column(children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline,
                        false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline,
                        false, _emailTextController),
                    signInSignUpButton(context, false, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    })
                  ])))),
    );
  }
}
