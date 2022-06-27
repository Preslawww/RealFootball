import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_football/screens/LeagueScreen.dart';
import 'package:real_football/screens/main_screen.dart';
import 'package:real_football/screens/tabs/matches.dart';
import 'package:real_football/screens/tabs/search_screen.dart';
//import 'package:instagram_clone_flutter/screens/add_post_screen.dart';
//import 'package:instagram_clone_flutter/screens/feed_screen.dart';
//import 'package:real_football/screens/profile_screen.dart';
//import 'package:real_football/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  MainScreen(),
  SearchScreen(),
  SoccerApp(),
  LeagueScreen(),
  Text('profile'),
];
