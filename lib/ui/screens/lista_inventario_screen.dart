import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:transan_app/constant/routes.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:transan_app/ui/screens/info_carga.dart';
import 'package:http/http.dart' as http;

class ListaInventarioScreen extends StatefulWidget {
  const ListaInventarioScreen({ Key? key }) : super(key: key);

  @override
  _ListaInventarioScreenState createState() => _ListaInventarioScreenState();
}

class Cargas {
  int moviminetoId;
  int cargaId;
  String nombre;
  String sku;
  double largo;
  double ancho;
  double alto;
  double peso;
  String tipoDeCargaId;
  Cargas(this.cargaId, this.moviminetoId, this.alto, this.ancho, this.largo, this.nombre, this.peso, this.sku, this.tipoDeCargaId);
}

List<Cargas> _cargasList = [];

//widget de la tabla 


class _ListaInventarioScreenState extends State<ListaInventarioScreen> {

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://localhost:8090/api/warehouse/ConsultarCargaBod'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // En este punto, jsonData es un objeto de Dart que contiene la respuesta del servidor.

      // Para acceder a las propiedades del objeto resultante, puedes hacer algo como esto:
      for (final carga in jsonData) {
        final id = carga['idCargasEnBodegas'];
        final nombre = carga['nombre'];
        final sku = carga['sku'];
        final largo = carga['largo'];
        final ancho = carga['ancho'];
        final alto = carga['alto'];
        final peso = carga['peso'];
        // ignore: prefer_typing_uninitialized_variables
        final tipoDeCargaId;
        if(carga['TipoDeCargaId'] == null){
          tipoDeCargaId = "0";
        }
        else{
          tipoDeCargaId = carga['TipoDeCargaId'];
        }
        final unidadesPesosId = carga['UnidadesPesosId'];
        final unidadesDimensionesId = carga['UnidadesDimensionesId'];
        _cargasList.add(Cargas(id, 0, alto, ancho, largo, nombre, peso, sku, tipoDeCargaId));
        
        // Haz algo con los datos, como imprimirlos en la consola.
        print('$id - $sku - $largo - $ancho - $alto - $peso - $tipoDeCargaId - $unidadesPesosId - $unidadesDimensionesId');
      }
      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        automaticallyImplyLeading: false,
        title: Text(Strings.viewInventory,
        style: TextStyle( color: Colors.black,),
        ),
      ),
      body: SafeArea(
        child: _buildTable(sortAscending: true),
      )
    );
  }

  Widget _buildTable({bool sortAscending = true}){
  return DataTable(
    sortColumnIndex: 0,
    sortAscending: sortAscending,
    //onSelectAll: (bool value) {},
    columns: const <DataColumn> [
      DataColumn(
        label: Text(" "),
        numeric: true,
      ),
      DataColumn(
        label: Text(" "),
        tooltip: 'Id envio',
        numeric: true, 
      ),
    ], 
    rows: _cargasList.map<DataRow>((Cargas cargasItem){
      return DataRow(
        key: ValueKey(cargasItem),
        //onSelectChanged: (isSelected) {},
        cells: <DataCell>[
          DataCell(
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(width: 8.0),
                Text('Id de la carga: ${cargasItem.cargaId}'),
              ],
            ),
          ),
          DataCell(
            Row(
              children: [
                Text('Id tipo: ${cargasItem.moviminetoId}'),
                SizedBox(width: 8.0),
                //Icon(Icons.arrow_forward),
              ],
            ),
            //showEditIcon: true,
            onTap: () {
              print('Fila seleccionada: ${cargasItem.cargaId} ${cargasItem.moviminetoId}');
              Navigator.pushNamed(context,Routes.infoCargaRoute, arguments: cargasItem,);
            },
          ),
        ],
      );
    }
    ).toList(),
  );
}
}

