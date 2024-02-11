import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/screen/auth/login_screen.dart';
import 'package:edspert_intensive_final_project/utils/image_dir.dart';
import 'package:edspert_intensive_final_project/utils/widgets/edspert_text_nonton_id.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      /*
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
      */
      // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      EdspertNavigation().pushReplacementNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(ImageDir.splashIllustration),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 148),
            child: EdspertNontonId.apply(),
          ),
        ],
      ),
    );
  }
}
