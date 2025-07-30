import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saasapp/firebase_options.dart';
import 'package:saasapp/pages/main_screen_page.dart';
import 'package:saasapp/pages/screens/home_page.dart';
import 'package:saasapp/util/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: mainColor, elevation: 5),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
              side: BorderSide(color: const Color.fromARGB(255, 17, 49, 209)),

              
            ),
            backgroundColor: mainColor,
           

          ),
        ),
      ),

      debugShowCheckedModeBanner: false,

      home: MainScreenPage(),
    );
  }
}
