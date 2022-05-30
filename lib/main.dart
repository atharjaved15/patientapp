import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/Views/Login/login_main.dart';
import 'package:patientapp/Views/splash.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "XXX",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "XXX",
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const splash();
  }
}

