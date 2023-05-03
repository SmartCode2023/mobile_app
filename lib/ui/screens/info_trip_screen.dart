import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/strings.dart';
import '../../themes/colors.dart';

class InfoTripScreen extends StatefulWidget {
  const InfoTripScreen({Key? key}) : super(key: key);

  @override
  State<InfoTripScreen> createState() => _InfoTripScreenState();
}

class _InfoTripScreenState extends State<InfoTripScreen> {

  dynamic envio;

  Future<void> _fetchData() async {
    final jsonData = await rootBundle.loadString('assets/files/data_env.json');
    setState(() {
      envio = json.decode(jsonData)['envios'][0];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }



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
              Strings.infoTripTitle,
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: darkBlue,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),



          Container(
            margin: const EdgeInsets.only(
              top: 30
            ),
            height: 60,
            width: screenSize.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    Strings.tripIdTitle,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: lightGreen,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${envio["id"]}",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: darkBlue,
                    ),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),



          Container(
            margin: const EdgeInsets.only(
                top: 10
            ),
            height: 80,
              width: screenSize.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        Strings.outDateTitle,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: lightGreen,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${envio["marcaDeTiempoInicio"]}",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: darkBlue,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        Strings.endDateTitle,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: lightGreen,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${envio["marcaDeTiempoFin"]}",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: darkBlue,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ],
            )
          ),


          Container(
              margin: const EdgeInsets.only(
                  top: 10
              ),
              height: 140,
              width: screenSize.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          Strings.startAddress,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: lightGreen,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${envio["direccionOrigenId"]}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: darkBlue,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          Strings.endAddress,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: lightGreen,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${envio["direccionDestinoId"]}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: darkBlue,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ],
              )
          ),


          Container(
              margin: const EdgeInsets.only(
                  top: 10
              ),
              height: 120,
              width: screenSize.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          Strings.otherInfoTitle,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: lightGreen,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          Strings.kmRecorridos,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${envio["km_recoridos"]}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: darkBlue,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          Strings.tripState,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${envio["estadoDeEnvioId"]}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: darkBlue,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ],
              )
          ),


        ],
      ),
    );
  }





}
