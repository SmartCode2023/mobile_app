import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transan_app/services/auth_service.dart';
import 'package:transan_app/services/permission_service.dart';
import 'package:transan_app/services/storage_service.dart';
import 'app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (context)=>AuthService()),
        Provider<PermissionService>(create: (context)=>PermissionService()),
        Provider<StorageService>(create: (context)=>StorageService()),
      ],
      child: const App(),
    ),
  );
}