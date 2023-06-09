import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/assetImages.dart';
import '../../constant/strings.dart';
import '../../themes/colors.dart';

class TripState extends StatefulWidget {
  const TripState({Key? key}) : super(key: key);

  @override
  State<TripState> createState() => _TripStateState();
}

class _TripStateState extends State<TripState> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              Strings.settingsTitle,
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: darkBlue,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),


          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(
                bottom: 20,
                top: 20
              ),
              child: Text(
                Strings.chooseTripStateTitle,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: darkBlue,
                ),
              ),
            )
          ),

          stateOptionWidget(Strings.receivedPackage, screenSize.width,Icons.call_received,(){

          }),

          stateOptionWidget(Strings.onTheWay, screenSize.width, Icons.rocket_launch,(){

          }),

          stateOptionWidget(Strings.rest, screenSize.width,Icons.coffee,(){

          }),

          stateOptionWidget(Strings.delivered, screenSize.width, Icons.check_box,(){

          }),
        ],
      ),
    );
  }



  Widget stateOptionWidget(String title, double screenWidth,IconData icon, VoidCallback onTap){
    return Container(
        margin: const EdgeInsets.all(15),
        height: 100,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: darkBlue,width: 1.5)
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:  const TextStyle(
                  fontSize: 24,
                  color: darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20
                ),
                child:  Icon(
                  icon,
                  size: 40,
                  color: darkBlue,
                ),
              )
            ],
          ),
        )
    );
  }


}
