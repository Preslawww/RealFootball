// import 'package:flutter/material.dart';
// import 'package:real_football/api_manager.dart';
// import 'package:real_football/pagerbody.dart';
// import 'package:real_football/soccermodel.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SoccerApp(),
//     );
//   }
// }

// class SoccerApp extends StatefulWidget {
//   @override
//   _SoccerAppState createState() => _SoccerAppState();
// }

// class _SoccerAppState extends State<SoccerApp> {
//   int currentIndex = 0;
//   void onClick(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF212121),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF212121),
//         elevation: 0.0,
//         title: Text(
//           "SOCCERBOARD",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       //now we have finished the api service let's call it
//       //Now befo re we create Our layout let's create our API service
//       body: FutureBuilder<Iterable>(
//         future: SoccerApi()
//             .getAllMatches(), //Here we will call our getData() method,
//         builder: (context, snapshot) {
//           //the future builder is very intersting to use when you work with api
//           if (snapshot.hasData) {
//             var length;
//             print((snapshot.data)?.length);
//             return PageBody(List<SoccerMatch>.from(snapshot.data!));
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         }, // here we will buil the app layout
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedItemColor: Colors.white,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: onClick,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.sports_soccer),
//             label: 'Matches',
//             backgroundColor: Colors.green,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.newspaper_rounded),
//             label: 'News',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         fixedColor: Colors.green,
//         backgroundColor: Color(0xFF212121),
//       ),
//     );
//   }
// }

//So as we can see w got our matches data,
// the data size depend on the date and the time so
// you can get as many data as many matches are curetly playing
//Now let's try to get data by seasons and leagues

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_football/providers/user_provider.dart';
import 'package:real_football/responsive/mobile_screen_layout.dart';
import 'package:real_football/responsive/responsive_layout.dart';
import 'package:real_football/responsive/web_screen_layout.dart';
import 'package:real_football/screens/home_screen.dart';
import 'package:real_football/screens/login_screen.dart';
import 'package:real_football/screens/main_screen.dart';
import 'package:http_parser/http_parser.dart';
import 'package:real_football/screens/sign_up_screen.dart';
import 'package:real_football/screens/signin_screen.dart';
import 'package:real_football/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RealFootball',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error}',
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }

            return LoginScreen();
          },
        ),
      ),
    );
  }
}
