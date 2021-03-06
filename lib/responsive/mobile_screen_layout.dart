import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_football/screens/main_screen.dart';
import 'package:real_football/utils/colors.dart';
import 'package:real_football/utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // int _page = 0;
  // late PageController pageController; // for tabs animation

  // @override
  // void initState() {
  //   super.initState();
  //   pageController = PageController();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   pageController.dispose();
  // }

  // void onPageChanged(int page) {
  //   setState(() {
  //     _page = page;
  //   });
  // }

  // void navigationTapped(int page) {
  //   //Animating Page
  //   pageController.jumpToPage(page);
  // }

  // void navigateToMainScreen() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => MainScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        //physics: NeverScrollableScrollPhysics(),
        //controller: pageController,
        //onPageChanged: onPageChanged,
      ),
    );
  }
}
      

          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.search,
          //     color: _page == 1 ? primaryColor : secondaryColor,
          //   ),
          //   label: '',
          //   backgroundColor: primaryColor,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.add_circle,
          //     color: _page == 2 ? primaryColor : secondaryColor,
          //   ),
          //   label: '',
          //   backgroundColor: primaryColor,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.favorite,
          //     color: _page == 3 ? primaryColor : secondaryColor,
          //   ),
          //   label: '',
          //   backgroundColor: primaryColor,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.person,
          //     color: _page == 4 ? primaryColor : secondaryColor,
          //   ),
          //   label: '',
          //   backgroundColor: primaryColor,
          // ),
        
        //onTap: navigationTapped),
      
  

