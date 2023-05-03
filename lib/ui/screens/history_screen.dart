import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<dynamic> envios = [];
  Future<void> _fetchData() async {
    final jsonData = await rootBundle.loadString('assets/files/data_env.json');
    setState(() {
      envios = json.decode(jsonData)['envios'];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

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
                  child: envios.isEmpty
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    itemCount: envios.length,
                    itemBuilder: (context, index) {
                      final envio = envios[index];
                      return  Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Origen -->  ${envio["direccionOrigenId"]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: darkBlue,
                              ),
                            ),
                            Text(
                              "Destino --> ${envio["direccionDestinoId"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              "Hora inicio --> ${envio["marcaDeTiempoInicio"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: midGreen,
                              ),
                            ),
                            Text(
                              "Hora Entrega --> ${envio["marcaDeTiempoFin"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: midGreen,
                              ),
                            ),
                            Text(
                              "Estado --> ${envio["estadoDeEnvioId"]}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: midGreen,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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