import 'package:flutter/material.dart';
import 'package:transan_app/themes/colors.dart';



class PasswordInput extends StatefulWidget {
  TextEditingController controllerEmail;
  Color backgroudColor;
  String title;
  Color shadowColor;
  bool seePassword;
  bool autofocus;

  PasswordInput({Key? key, required this.controllerEmail,
    required this.backgroudColor,
    required this.shadowColor,
    required this.seePassword,
    required this.title,
    this.autofocus=false
  });

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroudColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
          padding: const EdgeInsets.all(5),
          //color: Colors.blue,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  autofocus: widget.autofocus,
                  controller: widget.controllerEmail,
                  obscureText: widget.seePassword,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold
                  ),
                  cursorColor: lightGreen,
                  decoration: InputDecoration(
                      hintText: widget.title,
                      hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                     enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBlue),
                    ),
                    focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBlue),
                    ),
                    border:  UnderlineInputBorder(
                      borderSide: BorderSide(color: darkBlue),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(
                        widget.seePassword ? Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                        color: lightGreen,
                        size: 30),
                      onPressed: (){
                          setState(() {
                            if(widget.seePassword){widget.seePassword=false;}
                            else{widget.seePassword=true;}
                          });
                      })
              )
            ],
          )
      ),
    );

  }
}
