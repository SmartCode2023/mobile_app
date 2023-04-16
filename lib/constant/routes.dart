import 'package:flutter/cupertino.dart';
import '../ui/screens/logIn_screen.dart';
import '../ui/screens/sign_up_screen.dart';
import '../ui/screens/start_screen.dart';


class Routes{
  static String startScreen= "StartScreen";
  static String loginScreen= "loginScreen";
  static String signUpScreen ="signUpScreen";


  Map<String, WidgetBuilder> routes(){
    return {
      loginScreen: (context) => const LoginScreen(),
      startScreen: (context) => const StartScreen(),
      signUpScreen: (context) => const SignUpScreen(),
    };
  }



}