import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/app_module.dart';
import 'package:smash_app/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Configuração para rodar Firebase Firestore Emulator
  // FirebaseFirestore.instance.settings = const Settings(
  //   persistenceEnabled: true,
  //   host: "10.0.2.2:5002",
  //   sslEnabled: false,
  // );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
