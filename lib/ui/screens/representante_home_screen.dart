import 'package:flutter/material.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transan_app/constant/assetImages.dart';

class RepresentanteHome extends StatefulWidget {
  const RepresentanteHome({Key? key}) : super(key: key);

  @override
  _RepresentanteHomeState createState() => _RepresentanteHomeState();
}

class _RepresentanteHomeState extends State<RepresentanteHome> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        automaticallyImplyLeading: false,
        title: Text(Strings.tranSan),
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


              optionWidget(Strings.envios, screenSize.width, AssetImages.miViajeImage,(){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> TripHomeController(clientId: widget.clientId,)));
              }),
            ],
          ),
         ),
      ),
    );
  }

  Widget optionWidget(String title, double screenWidth,String imagePath, VoidCallback onTap){
    return Container(
      margin: const EdgeInsets.only(top: 30),
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