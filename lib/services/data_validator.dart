import 'package:transan_app/util/text_utils.dart';
import '../model/Exception/wrong_input_exception.dart';

class DataValidator{


  static validateEmailPassword(String email, String password){
    if(email.isEmpty || email.isEmail()==false){
      throw WrongInputException(message:"Ingresa un email válido.");
    }else if(password.isEmpty || password.length<8){
      throw WrongInputException(message:"Ingresa una contraseña válida. (Min:8 caracteres).");
    }
  }

  static validateSignUpData(String name, String phone,List<Map<String, dynamic>> files,String? type, ){
    if(name.isEmpty){
      throw WrongInputException(message: "Ingresa un nombre válido.");
    }if(phone.isEmpty){
      throw WrongInputException(message:"Ingresa un teléfono válido.");
    }if(type==null){
      throw WrongInputException(message:"Ingresa un tipo válido.");
    }if(files.isEmpty){
      throw WrongInputException(message:"Elige por lo menos un archivo.");
    }
  }

  static validatePasswordsMatch(String password, String repeatPassword){
    if(password.isEmpty || password.length<8 ){
      throw WrongInputException(message: "Ingresa una contraseña válida. (Min:8 caracteres).");
    }else if(password!=repeatPassword){
      throw WrongInputException(message: "Las contraseñas no coinciden.");
    }
  }



}