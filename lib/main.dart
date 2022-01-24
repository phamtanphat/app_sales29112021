import 'package:app_sales29112021/presentation/features/home/home_screen.dart';
import 'package:app_sales29112021/presentation/features/sign_in/sign_in_screen.dart';
import 'package:app_sales29112021/presentation/features/sign_up/sign_up_screen.dart';
import 'package:app_sales29112021/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/sign-in" : (context) => SignInScreen(),
        "/sign-up" : (context) => SignUpScreen(),
        "/home" : (context) => HomeScreen(),
        "/splash" : (context) => SplashScreen(),
      },
      initialRoute: "/splash",
    );
  }
}
