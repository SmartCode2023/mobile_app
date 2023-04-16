import 'package:flutter/material.dart';
import 'package:transan_app/themes/colors.dart';


class NumericInput extends StatelessWidget {

  TextEditingController? controller;
  Color backgroudColor;
  Color shadowColor;
  String title;
  bool enable;
  bool autofocus;


  NumericInput({Key? key, required this.controller,
    required this.backgroudColor,required this.shadowColor,
    required this.title,
    required this.enable,
    this.autofocus=false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
          padding: const EdgeInsets.all(5),
          child: TextFormField(
            keyboardType: TextInputType.number,
            autofocus: autofocus,
            enabled: enable,
            controller: controller,
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold
            ),
            cursorColor: lightGreen,
            decoration: InputDecoration(
              hintText: title,
              hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey
              ),
              enabledBorder:  const UnderlineInputBorder(
                borderSide: BorderSide(color: darkBlue),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: darkBlue),
              ),
            ),
          )
      ),
    );

  }

}
