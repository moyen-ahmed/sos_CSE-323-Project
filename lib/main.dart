import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sos_app/child/bottom_page.dart';
import 'package:sos_app/child/bottom_screens/homeSceendemo.dart';
import 'package:sos_app/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_app/child/child_login_screen.dart';
import 'package:sos_app/parents/parent_home_screen.dart';
import 'package:sos_app/utils/color_const.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'db/sharepreferench.dart';

void main() async {
  // This ensures Flutter is properly initialized before using plugins
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  // Set the database factory
  databaseFactory = databaseFactoryFfi;
  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize SharedPreferences
  await MySharedPrefference.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder(
          future: MySharedPrefference.getUserType(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == "") {
              return LoginScreen();
            }
            if (snapshot.data == "child") {
              return BottomPage();
            }
            if (snapshot.data == "parent") {
              return ParentHomeScreen();
            }
            return progressIndicator(context);
          }),
    );
  }
}




// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:sos_app/child/bottom_page.dart';
// import 'package:sos_app/child/bottom_screens/homeSceendemo.dart';
// import 'package:sos_app/home_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sos_app/child/child_login_screen.dart';
// import 'package:sos_app/parents/parent_home_screen.dart';
// import 'package:sos_app/utils/color_const.dart';
//
// import 'db/sharepreferench.dart';
//
// void main()
// async
// {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await MySharedPrefference.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(), // ✅ Use Google Fonts
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       // home:HomeScreen(),
//      // home:LoginScreen(),
//       home:FutureBuilder(
//           future: MySharedPrefference.getUserType(),
//           builder: (BuildContext context,AsyncSnapshot snapshot){
//             if(snapshot.data==""){
//               return LoginScreen();
//             }
//             if(snapshot.data=="child"){
//               return BottomPage();
//             }
//             if(snapshot.data=="parent"){
//               return ParentHomeScreen();
//             }
//             return progressIndicator(context);
//           }),
//
//     );
//   }
// }