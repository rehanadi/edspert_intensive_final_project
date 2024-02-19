import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:edspert_intensive_final_project/screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'NONTON·ID',
      theme: ThemeData(
        scaffoldBackgroundColor: EdspertColor.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: EdspertColor.primaryColor,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.openSans(textStyle: textTheme.bodyMedium),
        ),
      ),
      // home: const SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: EdspertNavigation.routes,
      navigatorKey: EdspertNavigation.navigatorKey,
    );
  }
}
