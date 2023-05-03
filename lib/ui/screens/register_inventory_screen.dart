import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class RegisterInventoryScreen extends StatefulWidget {
  const RegisterInventoryScreen({ Key? key }) : super(key: key);

  @override
  _RegisterInventoryScreenState createState() => _RegisterInventoryScreenState();
}

class _RegisterInventoryScreenState extends State<RegisterInventoryScreen> {
final GlobalKey<FormState> _formKey = GlobalKey();
  int idCarga = 0;
  String nombre = "";
  String sku = "";
  int unidadesPesoId = 0;
  int ancho = 0;
  int largo = 0;
  int alto = 0;
  int peso = 0;
  int unidadesDimId = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        iconTheme: IconThemeData(
          color: Colors.white, // set the color of the arrow to white
        ),
        title: Text(Strings.tranSan,
        style: TextStyle( color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Id carga',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                        style: TextStyle(color: Colors.black),
                    onFieldSubmitted: (value) {
                      setState(() {
                        idCarga = int.parse(value);
                        print(idCarga);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        idCarga = int.parse(value);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Nombre',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                        style: TextStyle(color: Colors.black),
                    onFieldSubmitted: (value) {
                      setState(() {
                        nombre = value.toString();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        nombre = value.toString();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Sku',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    onFieldSubmitted: (value) {
                      setState(() {
                        sku = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        sku = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Estante',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    onFieldSubmitted: (value) {
                      setState(() {
                        unidadesPesoId = int.parse(value);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        unidadesPesoId = int.parse(value);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Ancho',
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          onFieldSubmitted: (value) {
                            setState(() {
                              ancho = int.parse(value);
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              ancho = int.parse(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Largo',
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          onFieldSubmitted: (value) {
                            setState(() {
                              largo = int.parse(value);
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              largo = int.parse(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Alto',
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          onFieldSubmitted: (value) {
                            setState(() {
                              alto = int.parse(value);
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              alto = int.parse(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Peso',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    onFieldSubmitted: (value) {
                      setState(() {
                        peso = int.parse(value);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        peso = int.parse(value);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Unidades Dimensiones Id',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 50),
                    ),  
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    onFieldSubmitted: (value) {
                      setState(() {
                       unidadesDimId = int.parse(value);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                       unidadesDimId = int.parse(value);
                      });
                    },
                  ),
  
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStateProperty.all<Color>(lightGreen.withOpacity(0.95))),
                    onPressed: () {
                      print('idCarga ${idCarga}');
                      print('nombre ${nombre}');
                      print('sku ${sku}');
                      print('estante ${unidadesPesoId}');
                      print('ancho ${ancho}');
                      print('largo ${largo}');
                      print('alto ${alto}');
                      print('peso ${peso}');
                      print('unidadesDID ${unidadesDimId}');
                      sendData();
                    },
                    child: const Text("Registrar inventario"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendData() async{
    var url = Uri.parse('http://localhost:8090/api/warehouse/CrearCargaBod');

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode( 
        {
          "nombre": nombre,
          "sku": sku,
          "largo": largo,
          "ancho": ancho,
          "alto": alto,
          "peso": peso,
          "TipoDeCargaId": idCarga,
          "UnidadesPesosId": unidadesPesoId,
          "UnidadesDimensionesId": unidadesDimId
        })
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}