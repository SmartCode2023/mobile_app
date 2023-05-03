import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:transan_app/ui/screens/admin_screen.dart';
import 'package:transan_app/ui/screens/operario_home_screen.dart';
import 'package:transan_app/ui/screens/representante_home_screen.dart';
import 'package:transan_app/ui/screens/welcome_screen.dart';
import '../../../services/auth_service.dart';
import 'home_screen.dart';



class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {


  @override
  Widget build(BuildContext context) {
    final authService= Provider.of<AuthService>(context);
    return StreamBuilder(
      stream: authService.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError){
          Logger().i("Usuario no ha iniciado sesión");
          return const WelcomeScreen();
        }
        else{
          Logger().i("Inicio de sesión exitoso, correo: ${snapshot.data.email}");
          if(snapshot.data.email.toString().contains("conductor")){
            return Home(clientId: snapshot.data.uid);
          }else if (snapshot.data.email.toString().contains("operario")){
            return OperarioHome();
          }else if (snapshot.data.email.toString().contains("representante")){
            return const RepresentanteHome();
          }else if (snapshot.data.email.toString().contains("admin")){
            return AdminHome();
          }else{
            return Home(clientId: snapshot.data.uid);
          }

        }
      },
    );
  }
}

