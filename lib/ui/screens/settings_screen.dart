import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constant/strings.dart';
import '../../../services/auth_service.dart';
import '../../../themes/colors.dart';
import '../generic_widgets/configuration_option.dart';


class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final authService= Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: lightGrey,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: lightGrey,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: 10,
                                right: 15,
                                bottom:15
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Center(
                                    child: Text(
                                      Strings.settingsTitle,
                                      style: GoogleFonts.poppins(
                                          fontSize: 30,
                                          color: darkBlue,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                )
                              ],
                            )
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10,
                      right: 10
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ConfigurationOption(
                            title: Strings.profileTitle,
                            titleColor: Colors.grey,
                            icon: Icons.arrow_forward,
                            onTap: (){

                            },
                          )
                      ),


                      Expanded(
                          flex: 1,
                          child: ConfigurationOption(
                            title: Strings.tcTitle,
                            titleColor: Colors.grey,
                            icon: Icons.arrow_forward,
                            onTap: (){

                            },
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: ConfigurationOption(
                            title: Strings.logoutText,
                            icon: Icons.logout,
                            titleColor: Colors.redAccent,
                            onTap: ()async{
                              await authService.signOut();
                              Navigator.pop(context);
                            },
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  //color: Colors.orange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}