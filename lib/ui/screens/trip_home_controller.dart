import 'package:flutter/material.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:transan_app/ui/screens/trip_state_screen.dart';
import '../generic_widgets/NavigationBar/navegation_bar.dart';


class TripHomeController extends StatefulWidget {
  String clientId;
  TripHomeController({Key? key, required this.clientId}) : super(key: key);
  @override
  _TripHomeControllerState createState() => _TripHomeControllerState();
}

class _TripHomeControllerState extends State<TripHomeController> {
  int navegationOption=0;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
                color: lightGrey,
                child: Stack(
                  children: [
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child:  SizedBox(
                            width: double.infinity,
                            child: screensController(),
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                            child:  Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 90,
                                width: screenSize.width/1.08,
                                padding: const EdgeInsets.only(
                                    bottom: 20
                                ),
                                child: NavegationBar(
                                  onTapFirst: (){
                                    setState(() {navegationOption=0;});
                                  },
                                  onTapSecond: (){
                                    setState(() {navegationOption=1;});
                                  },
                                  onTapThird: (){
                                    setState(() {navegationOption=2;});
                                  },
                                  onTapFourth: (){
                                    setState(() {navegationOption=3;});
                                  },
                                  selectedOption: navegationOption,
                                ),
                              ),
                            )
                        ),
                      ],
                    )
                  ],
                )
            )
        )
    );
  }


  Widget screensController(){
    if(navegationOption==0){
      return const TripState();
    }else if(navegationOption==1){
      return Container(color: Colors.red,);
    }else if(navegationOption==2){
      return Container(color: Colors.blue,);
    }else{
      return Container(color: Colors.yellowAccent,);
    }
  }
}
