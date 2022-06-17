import 'package:flutter/material.dart';
import 'package:real_football/screens/signin_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        },
      )),
    );
  }
}
