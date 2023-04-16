import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constant/strings.dart';
import '../../../services/auth_service.dart';
import '../../../themes/colors.dart';



class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

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
                                      Strings.myHistory,
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
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10,
                      right: 10
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}