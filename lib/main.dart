// ignore: unused_import
import 'package:dunu_app_2b_may/pages/home_page.dart';
// ignore: unused_import
import 'package:dunu_app_2b_may/screen/login/startup_screen.dart';
import 'package:dunu_app_2b_may/screen/startup_screen.dart';
import 'package:flutter/material.dart';

//Inicializacion firebase
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura que los widgets estén listos antes de la inicialización
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Usamos la configuración para la plataforma actual
  );
  runApp(MyApp()); // Ahora que Firebase está inicializado, ejecutamos la app
}

class DefaultFirebaseOptions {
  // ignore: prefer_typing_uninitialized_variables
  static var currentPlatform;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartUpScreen(),

      //home: const HomePage(),
    );
  }
}
