import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';


class StorageService {

  final Reference _storageReference=FirebaseStorage.instance.ref();
  String folderName = "Archivos";

  Future<List<String>> uploadFilesToFirebaseStorage(List<Map<String, dynamic>> files,String uid) async {
    List<String> downloadUrls = [];
    for (Map<String, dynamic> file in files) {
      print("File name: ${file["filePath"]}");
      String fileName = file["filePath"]!.split('/').last;
      Uint8List fileBytes = file["FileBytes"];
      Reference storageReference = _storageReference.child('$folderName/$uid/$fileName');
        UploadTask uploadTask = storageReference.putData(fileBytes);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }
    return downloadUrls;
  }

}