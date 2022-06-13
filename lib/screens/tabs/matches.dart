import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:real_football/bloc/search_bloc.dart';
import 'package:real_football/elements/loader.dart';
import 'package:real_football/model/article.dart';
import 'package:real_football/model/article_response.dart';
import 'package:real_football/pagerbody.dart';
import 'package:real_football/style/theme.dart' as Style;
import 'package:timeago/timeago.dart' as timeago;
import '../../api_manager.dart';
import '../news_detail.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:real_football/soccermodel.dart';

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  int currentIndex = 0;
  void onClick(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //now we have finished the api service let's call it
      //Now befo re we create Our layout let's create our API service
      body: FutureBuilder<Iterable>(
        future: SoccerApi()
            .getAllMatches(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            var length;
            print((snapshot.data)?.length);
            return PageBody(List<SoccerMatch>.from(snapshot.data!));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}
