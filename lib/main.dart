import 'package:flutter/material.dart';
import 'package:movie_app/screens/forget_password/forget_password.dart';
import 'package:movie_app/screens/intro/intro_screen.dart';
import 'package:movie_app/screens/login/login_screen.dart';
import 'package:movie_app/screens/register/register_screen.dart';
import 'package:movie_app/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        IntroScreen.routeName: (_) => IntroScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        ForgetPassword.routeName: (_) => ForgetPassword(),
      },
    );
  }
}
