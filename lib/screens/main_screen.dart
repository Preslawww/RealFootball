import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:real_football/bloc/bottom_navbar_bloc.dart';
import 'package:real_football/screens/LeagueScreen.dart';
import 'package:real_football/screens/about_us.dart';
import 'package:real_football/screens/add_post_screen.dart';
import 'package:real_football/screens/feed_screen.dart';
import 'package:real_football/screens/signin_screen.dart';
import 'package:real_football/screens/tabs/matches.dart';
import 'package:real_football/screens/tabs/profile_screen.dart';
import 'package:real_football/style/theme.dart' as Style;

import 'home_screen.dart';
import 'tabs/home_screen.dart';
import 'tabs/search_screen.dart';
import 'tabs/sources_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BottomNavBarBloc _bottomNavBarBloc;
  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Style.Colors.mainColor,
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              uid: FirebaseAuth.instance.currentUser!.uid,
                            )),
                  );
                },
              ),
            ],
          ),
          title: Text(
            "RFN",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.left,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.dashboard_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FeedScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.table_chart_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LeagueScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data!) {
              case NavBarItem.HOME:
                return HomeScreen();
              case NavBarItem.SOURCES:
                return SourceScreen();
              case NavBarItem.SEARCH:
                return SearchScreen();
              case NavBarItem.MATCHES:
                return SoccerApp();
              case NavBarItem.POST:
                return AddPostScreen();

                // TODO: Handle this case.
                break;
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Style.Colors.BottomNavbackground_,
                iconSize: 20,
                unselectedItemColor: Style.Colors.titleColor,
                unselectedFontSize: 8.5,
                selectedFontSize: 8.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: Style.Colors.grey,
                currentIndex: snapshot.data!.index,
                onTap: _bottomNavBarBloc.pickItem,
                items: [
                  BottomNavigationBarItem(
                    label: "News",
                    icon: Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Sources",
                    icon: Icon(EvaIcons.gridOutline),
                    activeIcon: Icon(EvaIcons.grid),
                  ),
                  BottomNavigationBarItem(
                    label: "Search",
                    icon: Icon(EvaIcons.searchOutline),
                    activeIcon: Icon(EvaIcons.search),
                  ),
                  BottomNavigationBarItem(
                    label: "Matches",
                    icon: Icon(Icons.sports_soccer_outlined),
                    activeIcon: Icon(EvaIcons.globe),
                  ),
                  BottomNavigationBarItem(
                    label: "Post",
                    icon: Icon(EvaIcons.plusCircleOutline),
                    activeIcon: Icon(EvaIcons.plusCircle),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
