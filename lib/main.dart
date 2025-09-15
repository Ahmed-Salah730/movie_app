import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/screens/home/profile_tab/profile_tab.dart';
import 'package:movies_app/screens/intro/intro_screen.dart';
import 'package:movies_app/screens/login/login_screen.dart';
import 'package:movies_app/screens/register/register_screen.dart';
import 'package:movies_app/screens/splash/splash_screen.dart';
import 'package:movies_app/screens/update_profile/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        UpdateProfile.routeName: (_) => const UpdateProfile(),
        ProfileTab.routeName: (_) => const ProfileTab(),
      },
    );
  }
}
