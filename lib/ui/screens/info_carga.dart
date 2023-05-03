import 'package:flutter/material.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:transan_app/ui/screens/lista_inventario_screen.dart';

class InfoCarga extends StatefulWidget {
  const InfoCarga({ Key? key }) : super(key: key);

  @override
  _InfoCargaState createState() => _InfoCargaState();
}

class _InfoCargaState extends State<InfoCarga> {
  @override
  Widget build(BuildContext context) {
    final cargasItem = ModalRoute.of(context)?.settings.arguments as Cargas?;
    final id = cargasItem!.cargaId;
    final nombre = cargasItem!.nombre;
    final sku = cargasItem!.sku;
    final largo = cargasItem!.largo;
    final ancho = cargasItem!.ancho;
    final alto = cargasItem!.alto;
    final peso = cargasItem!.peso;
    final tipoCarga = cargasItem!.tipoDeCargaId;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        automaticallyImplyLeading: false,
        title: Text(Strings.viewInventory,
          style: TextStyle( color: Colors.black,),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Container(
                height: 50,
                color: Color.fromARGB(255, 16, 20, 76),
                child: Center(
                  child: Text(
                    'Id: ${id.toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.lightGreen
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("ID del envío:", style: TextStyle(fontSize: 16)),
                  Text("12345", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text("Informacion:", style: TextStyle(fontSize: 16)),
                  Column(
                    children:  [
                      Text("Nombre: ${nombre.toString()} ", style: TextStyle(fontSize: 16)),
                      Text("Sku: ${sku.toString()}", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text("Tipo de carga:", style: TextStyle(fontSize: 16)),
                  Text("${tipoCarga.toString()}", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Dimensiones de la carga:", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Peso de la carga", style: TextStyle(fontSize: 16)),
                  Text('${peso.toString()} kg', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ancho", style: TextStyle(fontSize: 16)),
                  Text("${ancho.toString()}m", style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Largo", style: TextStyle(fontSize: 16)),
                  Text("${largo.toString()}m", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Alto", style: TextStyle(fontSize: 16)),
                  Text("${alto.toString()}m", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}