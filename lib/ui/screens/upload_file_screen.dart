import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../constant/strings.dart';
import '../generic_widgets/loading_widget.dart';



class UploadFileScreen extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onFilesUploaded;
  UploadFileScreen({Key? key, required this.onFilesUploaded}) : super(key: key);

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  String? selectedType;
  bool loading = false;
  List<Map<String, dynamic>> files=[];


  Future<List<FilePickerResult>?> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,withData: true);
    if (result != null) {
      setState(() {
        for (var element in result.files) {
          files.add( {"filePath":element.path,"FileBytes":element.bytes} );
        }
      });
    }else{
      throw Exception("Archivos no seleccionados.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child:  Text(
                    files.isEmpty
                        ?  Strings.completeUpload
                        : Strings.chooseFile,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  child:  ElevatedButton(
                    onPressed: ()async{
                      setState(() {loading=true;});
                      try {
                        await _pickFiles();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              Strings.completeUpload,
                            ),
                          ),
                        );
                        setState(() {
                          loading = false;
                        });
                        widget.onFilesUploaded(files);
                      } catch (e) {
                        Logger().e("The error is: $e");
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              Strings.filePickError,
                            ),
                          ),
                        );
                      }

                    },
                    child: const Icon(
                      Icons.upload,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),

          Positioned(
            child: loading
                ? LoadingWidget()
                : Container(),
          ),
        ],
      )
    );
  }
}
