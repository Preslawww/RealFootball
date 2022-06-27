import 'package:flutter/material.dart';
import 'package:real_football/style/theme.dart' as Style;

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Style.Colors.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Style.Colors.background,
          title: const Text('About the Developer'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              title: Text(
                "Preslav Donchev",
                style: TextStyle(
                    color: const Color.fromARGB(255, 49, 217, 7), fontSize: 20),
              ),
              subtitle: Text(
                "Another football enthusiast and flutter rookie. Feel free to contact me at preslaw.donchev@gmail.com for collaboration.",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/img/74af635895f2ad5937e6db1426ca11ca.png")),
            ),
          ],
        ),
      ),
    );
  }
}
