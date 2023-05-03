import 'package:flutter/material.dart';
import 'package:transan_app/ui/screens/upload_file_screen.dart';
import '../../constant/strings.dart';
import '../../themes/colors.dart';


class ViaticosScreen extends StatefulWidget {
  const ViaticosScreen({Key? key}) : super(key: key);
  @override
  State<ViaticosScreen> createState() => _ViaticosScreen();
}

class _ViaticosScreen extends State<ViaticosScreen> {
  late String selectedOption = "Peaje";
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  List<Map<String, dynamic>> files=[];

  void addFile() async{
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          content: Builder(
            builder: (context) {
              return SizedBox(
                width: 400,
                height: 200,
                child: UploadFileScreen(
                  onFilesUploaded: (List<Map<String, dynamic>> uploadedFiles) {
                    files= uploadedFiles;
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }


    @override
  void dispose() {
    descripcionController.dispose();
    valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.viaticosTitle,
              style:  Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Text(
              Strings.viaticosName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              hint: Text('Selecciona una opción'),
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: <String>['Peaje', 'Gasolina', 'Mantenimiento (especificar)']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkBlue)
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              Strings.viaticosDescription,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(
                hintText: 'Ingresa la descripción',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              Strings.viaticosValue,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa el valor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Container(
                color: Colors.white,
                width: double.infinity,
                height: 90,
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: (){
                    addFile();
                  },
                  child: Row(
                    children:  [
                      Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:Text(
                                Strings.uploadFilesTitle,
                                style:  TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          )
                      ),
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.upload,
                          color: darkBlue,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                )
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes realizar la acción de guardar
                },
                child: Text(
                  Strings.viaticosSave,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ), 
    );
  }
}