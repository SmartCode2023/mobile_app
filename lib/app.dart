import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transan_app/themes/ownTheme.dart';
import 'constant/routes.dart';




class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
    ));

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TranSanTheme.defaultTheme,
      routes: Routes().routes(),
      initialRoute: Routes.startScreen,
    );
  }
}