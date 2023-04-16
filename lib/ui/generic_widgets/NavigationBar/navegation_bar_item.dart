import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transan_app/themes/colors.dart';






class NavegationBarItem extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;
  int selectedOption;
  int navegationOption;
  NavegationBarItem({Key? key, required this.onTap,
    required this.title,
    required this.icon,
    required this.navegationOption,
    required this.selectedOption});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    icon,
                    color: navegationOption==selectedOption ? midGreen:Colors.grey,
                    size: 25,
                  ),
                )
            ),
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: navegationOption==selectedOption ? midGreen:Colors.grey,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
