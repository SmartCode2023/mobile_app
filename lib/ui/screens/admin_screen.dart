import 'package:flutter/material.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transan_app/constant/assetImages.dart';
import 'package:transan_app/ui/screens/agenda_screen.dart';
import 'package:transan_app/ui/screens/lista_inventario_screen.dart';
import 'package:transan_app/ui/screens/register_inventory_screen.dart';
import 'package:transan_app/ui/screens/settings_screen.dart';
import 'package:transan_app/ui/screens/sign_up_screen.dart';




class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        automaticallyImplyLeading: false,
        title: Text(Strings.tranSan,
          style: TextStyle( color: Colors.black,),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: lightGrey,size: 30,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen()));
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: lightGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child:  Text(
                    Strings.homeWelcomeTitle,
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: darkBlue,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),


              optionWidget(Strings.addUserTitle, screenSize.width, AssetImages.miAgendaImage,(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
              })



            ],
          ),
        ),
      ),
    );
  }

  Widget optionWidget(String title, double screenWidth,String imagePath, VoidCallback onTap){
    return Container(
        margin: const EdgeInsets.only(top: 30),
        height: 150,
        width: screenWidth,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
