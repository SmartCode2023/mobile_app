import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:transan_app/services/auth_service.dart';
import 'package:transan_app/services/data_validator.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:transan_app/ui/generic_widgets/numeric_input_widget.dart';
import 'package:transan_app/ui/screens/upload_file_screen.dart';
import '../../../constant/strings.dart';
import '../../model/Exception/credentials_exception.dart';
import '../../model/Exception/existing_user_exception.dart';
import '../../model/Exception/wrong_input_exception.dart';
import '../../services/permission_service.dart';
import '../../services/storage_service.dart';
import '../generic_widgets/generic_input_widget.dart';
import '../generic_widgets/loading_widget.dart';
import '../generic_widgets/password_input.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controllerPassword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerName = TextEditingController();
  final controllerTelefono = TextEditingController();
  List<Map<String, dynamic>> files=[];
  bool loading=false;
  String? selectedType;

  List<String> types=["Conductor TranSan","Conductor Independiente","Operario Bodega"];

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerEmail.dispose();
    controllerRepeatPassword.dispose();
    controllerName.dispose();
    controllerTelefono.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final authService= Provider.of<AuthService>(context);
    var screenSize = MediaQuery.of(context).size;
    final storageService= Provider.of<StorageService>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor:lightGrey,
        ),
        body: Stack(
          children: [
           SingleChildScrollView(
             child:  Column(
               children: [
                 Container(
                   padding: const EdgeInsets.only(
                     bottom: 15
                   ),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                       Strings.registerText,
                       style:  Theme.of(context).textTheme.headlineMedium,
                     ),
                   ),
                 ),

                 SizedBox(
                   width: double.infinity,
                   child: GenericInput(controller: controllerName,backgroudColor: Colors.white,shadowColor: Colors.grey,title: Strings.nameTitle,enable: true, autofocus: true,),
                 ),

                 const Divider(
                   color: lightGrey,
                 ),

                 SizedBox(
                   width: screenSize.width,
                   child: Row(
                     children: [
                       Expanded(
                         flex: 1,
                         child: GenericInput(controller: controllerEmail,backgroudColor: Colors.white,shadowColor: Colors.grey,title: Strings.emailTitle,enable: true, autofocus: true,),
                       ),

                       const VerticalDivider(
                         color: lightGrey,
                       ),

                       Expanded(
                         flex: 1,
                         child: NumericInput(controller: controllerTelefono,backgroudColor: Colors.white,shadowColor: Colors.grey,title: Strings.telefonoTitle,enable: true, autofocus: true,),
                       )
                     ],
                   )
                 ),

                 const Divider(
                   color: lightGrey,
                 ),



                 SizedBox(
                     width: double.infinity,
                     child: PasswordInput(controllerEmail: controllerPassword,backgroudColor: Colors.white,shadowColor: Colors.grey,seePassword: true,autofocus: true,title: Strings.passwordTitle)
                 ),

                 const Divider(
                   color: lightGrey,
                 ),

                 SizedBox(
                     width: double.infinity,
                     child: PasswordInput(controllerEmail: controllerRepeatPassword,backgroudColor: Colors.white,shadowColor: Colors.grey,seePassword: true,autofocus: true,title: Strings.repeatPasswordTitle)
                 ),

                 const Divider(
                   color: lightGrey,
                 ),

                 Row(
                   children: [
                     Expanded(
                       flex: 2,
                       child: Container(
                           color: Colors.white,
                           width: double.infinity,
                           height: 90,
                           padding: const EdgeInsets.all(20),
                           child: InkWell(
                             onTap: (){
                               addFile();
                             },
                             child: Row(
                               children:  [
                                 Expanded(
                                     flex: 4,
                                     child: Align(
                                       alignment: Alignment.centerLeft,
                                       child:Text(
                                           Strings.uploadFilesTitle,
                                           style:  TextStyle(
                                               fontSize: 18,
                                               color: Colors.grey[400],
                                               fontWeight: FontWeight.bold
                                           )
                                       ),
                                     )
                                 ),
                                 const Expanded(
                                   flex: 1,
                                   child: Icon(
                                     Icons.upload,
                                     color: darkBlue,
                                     size: 30,
                                   ),
                                 ),
                               ],
                             ),
                           )
                       ),
                     ),

                     const VerticalDivider(
                       color: lightGrey,
                     ),

                     Expanded(
                       flex: 3,
                       child: Container(
                           color: Colors.white,
                           width: double.infinity,
                            height: 90,
                           padding: const EdgeInsets.all(20),
                         child: DropdownButton<String>(
                             hint:  Text(Strings.typeTitle, style: const TextStyle(
                               fontSize: 14,
                               color: Colors.grey,
                             )),
                             value: selectedType,
                             onChanged: (type) {
                               setState(() {
                                 selectedType = type!;
                               });
                             },
                             items: types.map((String typ) {
                               return DropdownMenuItem<String>(
                                   value: typ,
                                   child: Text(
                                     typ,
                                     style: const TextStyle(
                                         fontSize: 14,
                                         color: Colors.black
                                     ),
                                   ));
                             }).toList()
                         ),
                       ),
                     ),


                   ],
                 )
               ],
             ),
           ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 10
                    ),
                    color: Colors.white,
                    width: double.infinity,
                    height: screenSize.height/9,
                    child: Center(
                      child: FractionallySizedBox(
                        heightFactor: 0.6,
                        widthFactor: 0.9,
                        child: ElevatedButton(
                            onPressed: ()async{
                              try{
                                setState(() {loading=true;});
                                DataValidator.validateSignUpData(controllerName.text, controllerTelefono.text, files, selectedType);
                                DataValidator.validatePasswordsMatch(controllerPassword.text, controllerRepeatPassword.text);
                                String uid = await authService.signUp(controllerEmail.text, controllerPassword.text);
                                bool exists= !(await authService.authStatus.isEmpty);
                                if(exists)List<String> urls= await storageService.uploadFilesToFirebaseStorage(files, uid);
                                setState(() {loading=false;});
                                if (!mounted) return;
                                Navigator.pop(context);
                              }catch (e){
                                setState(() {loading=false;});
                                if(e is WrongInputException || e is ExistingUserException || e is CredentialsException){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.toString()),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  Logger().e(' Error: ${e.toString()}');
                                }else{
                                  Logger().e('Other Error: ${e.toString()}');
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                Strings.signUpText,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                              ),
                            )
                        ),
                      ),
                    )
                ),
              ),

            Positioned(
              child: loading
                  ? LoadingWidget()
                  : Container(),
            ),
          ],
        ),
    );
  }

  void addFile() async{
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          content: Builder(
            builder: (context) {
              return SizedBox(
                width: 400,
                height: 200,
                child: UploadFileScreen(
                  onFilesUploaded: (List<Map<String, dynamic>> uploadedFiles) {
                    files= uploadedFiles;
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }



}
