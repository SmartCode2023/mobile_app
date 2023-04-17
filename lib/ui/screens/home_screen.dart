import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transan_app/constant/assetImages.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/ui/screens/settings_screen.dart';
import 'package:transan_app/ui/screens/trip_home_controller.dart';
import '../../themes/colors.dart';
import 'history_screen.dart';




class Home extends StatefulWidget {
  String clientId;
  Home({Key? key, required this.clientId}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navegationOption = 0;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: lightGreen,
            automaticallyImplyLeading: false,
            title: Text(Strings.tranSan),
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
                       /*child:  Text(
                           Strings.homeWelcomeTitle,
                           style: GoogleFonts.poppins(
                           fontSize: 30,
                           color: darkBlue,
                           fontWeight: FontWeight.bold
                       )
                       ),*/
                     ),

                    optionWidget(Strings.myTrip, screenSize.width, AssetImages.miViajeImage,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> TripHomeController(clientId: widget.clientId,)));
                    }),

                    optionWidget(Strings.myHistory, screenSize.width, AssetImages.historialImage, (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryScreen()));
                    }),
                    ],
                  ),
                )
            )
        ),
      );
    }


  Widget optionWidget(String title, double screenWidth,String imagePath, VoidCallback onTap){
    return Container(
      margin: const EdgeInsets.only(top: 50),
      height: 250,
      width: screenWidth,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.fill,
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