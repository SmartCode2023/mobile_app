import 'package:flutter/cupertino.dart';
import '../ui/screens/logIn_screen.dart';
import '../ui/screens/sign_up_screen.dart';
import '../ui/screens/start_screen.dart';
import '../ui/screens/info_carga.dart';


class Routes{
  static String startScreen= "StartScreen";
  static String loginScreen= "loginScreen";
  static String signUpScreen ="signUpScreen";
  static String infoCargaRoute = 'InfoCargaScreen';



  Map<String, WidgetBuilder> routes(){
    return {
      loginScreen: (context) => const LoginScreen(),
      startScreen: (context) => const StartScreen(),
      signUpScreen: (context) => const SignUpScreen(),
      infoCargaRoute:(context) => const InfoCarga(),
    };
  }



}