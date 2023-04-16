import 'package:flutter/material.dart';
import '../../../themes/colors.dart';
import 'navegation_bar_item.dart';



class NavegationBar extends StatefulWidget {
  VoidCallback onTapFirst;
  VoidCallback onTapSecond;
  VoidCallback onTapThird;
  VoidCallback onTapFourth;
  int selectedOption;

  NavegationBar({Key? key,
    required this.onTapFirst,
    required this.onTapSecond,
    required this.onTapThird,
    required this.onTapFourth,
    required this.selectedOption});
  @override
  _NavegationBarState createState() => _NavegationBarState();
}


class _NavegationBarState extends State<NavegationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: darkBlue.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: Icons.directions_bus_rounded,
                title: "Estado Viaje",
                onTap: widget.onTapFirst,
                navegationOption: 0,
                selectedOption: widget.selectedOption,
              ),
            ),
            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: Icons.insert_drive_file_outlined,
                title: "Info viaje",
                onTap: widget.onTapSecond,
                navegationOption: 1,
                selectedOption: widget.selectedOption,
              ),
            ),
            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: Icons.map,
                title: "Mapa",
                onTap: widget.onTapThird,
                navegationOption: 2,
                selectedOption: widget.selectedOption,
              ),
            ),

            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: Icons.monetization_on,
                title: "Viáticos",
                onTap: widget.onTapFourth,
                navegationOption: 3,
                selectedOption: widget.selectedOption,
              ),
            ),

          ],
        ),
      )
    );
  }
}
